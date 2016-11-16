classdef ev3RemoteApi < superRemoteApi
%EV3REMOTEAPI inicia el cliente de api remota para el control del
%robot EV3 (hereda de la clase superRemoteApi)
%
%   See also EV3REMOTEAPI.EV3REMOTEAPI (constructor),
%   EV3REMOTEAPI.TIMESTEP (atributo privado), EV3REMOTEAPI.CALLFUNCTION,
%   EV3REMOTEAPI.SETSTREAMING, EV3REMOTEAPI.REMOVEBUFFER,
%   EV3REMOTEAPI.WAIT (métodos), EV3REMOTEAPI.DELETE (destructor).
%   VREPREMOTEAPI, SUPERREMOTEAPI, REMAPI.
    
    properties (Constant, GetAccess=private)
        FUNCTIONS = {'SensorTouch' % constantes de funciones que devuelven valores
        'SensorSonar'
        'SensorLight'
        'SensorColor'
        'SensorGyroVA'
        'SensorGyroA'
        'CurrentTick'
        'ButtonPressed'
        'MotorRotationCountB'
        'MotorRotationCountC'}; 
    end
    
    properties(GetAccess=private)
        timeStep % tiempo entre pasos de simulación.
    end
    
    methods
        function ev3 = ev3RemoteApi(varargin)
            % ev3RemoteApi Constructor de la clase vrepRemoteApi
            %   * ev3RemoteApi() Establece la comunicación con V-REP mediante ip localhost y el puerto
            %     19997
            %
            %   * ev3RemoteApi(ip) Establece la comunicación con V-REP mediante la ip "ip" en formato
            %     de cadena de caracteres y el puerto 19997
            %
            %   * ev3RemoteApi(port) Establece la comunicación con V-REP mediante la ip localhost y
            %     el puerto "port" en formato numerico
            %
            %   * ev3RemoteApi(ip, port) Establece la comunicación con V-REP mediante la ip "ip" en
            %     formato de cadena de caracteres y el puerto "port" en formato numerico
            %
            %   * ev3RemoteApi(port, ip) Lo mismo que el punto anterior
            ip='127.0.0.1';
            port=20000;  
            if nargin == 1
                if(isnumeric(varargin{1}))
                    port=varargin{1};
                else
                    ip=varargin{1};
                end
            elseif nargin > 1
                if(isnumeric(varargin{1}))
                    port=varargin{1};
                    ip=varargin{2};
                else
                    ip=varargin{1};
                    port=varargin{2};
                end
            end
            
            ev3@superRemoteApi(ip, port);
            [~, ev3.timeStep] = ev3.callFunction('SimulationTimeStep',[],[],[],[],2);
        end
        
        function [outInts, outFloats, outStrings, outBuffer] = callFunction(ev3, funcion, inInts, inFloats, inStrings, inBuffer, opmode)
        %CALLFUNCTION Llama a funciones creadas en el objeto "Funciones" del 
        %robot EV3 en V-REP
        %   [outInts, outFloats, outStrings, outBuffer] = CALLFUNCTION(ev3, funcion, inInts, inFloats, inStrings, inBuffer, opmode)
        %   llama la función "funcion" del robot EV3 en Lua definida en el
        %   script hijo de su elemento "Funciones" con el manejador "ev3"
        %   con la siguiente estructura en el simulador:
        %   
        %   funcion=function(inInts, inFloats, inStrings, inBuffer)
        %       -- Ejecución del la función
        %       return outInts, outFloats, outStrings, outBuffer
        %   end
        %   
        %   Donde:
        %       * inInts: array de parametros de función de enteros
        %       * inFloats: array de parametros de función de flotantes
        %       * inStrings: array de parametros de función de cadenas de caracteres
        %       * inBuffer: array de parametros de función de buffers
        %       * outInts: array de retorno de enteros
        %       * outFloats: array de retorno de flotantes
        %       * outStrings: array de retorno de cadenas de caracteres
        %       * outBuffer: array de retorno de bufers
        %
        %   El parámetro "opmode" será el modo de operación (consultar
        %   documentación de V-REP) representado con números del 0 al 5
        %   donde:
        %       
        %       0: simx_opmode_oneshot
        %       1: simx_opmode_buffer
        %       2: simx_opmode_blocking
        %       3: simx_opmode_streaming
        %       4: simx_opmode_discontinue
        %       5: simx_opmode_remove
        
            OBJETO = 'Funciones';

            switch opmode
                case 0
                    om = ev3.commands.simx_opmode_oneshot;
                case 1
                    om = ev3.commands.simx_opmode_buffer;
                case 2
                    om = ev3.commands.simx_opmode_blocking;
                case 3
                    om = ev3.commands.simx_opmode_streaming;
                case 4
                    om = ev3.commands.simx_opmode_discontinue;
                case 5
                    om = ev3.commands.simx_opmode_remove;
                otherwise
                    error('El modo de operación no se ha especificado correctamente')
            end                

            [res, outInts, outFloats, outStrings, outBuffer] = ...
                ev3.commands.simxCallScriptFunction(ev3.clientId,OBJETO,...
                ev3.commands.sim_scripttype_childscript,funcion,inInts,...
                inFloats, inStrings, inBuffer, om);
            ev3.error(res);
            MAX_ITERATIONS = 5000;
            timeout = 0;
            while(res == ev3.commands.simx_return_novalue_flag && ...
                  om == ev3.commands.simx_opmode_buffer && ...
                  timeout < MAX_ITERATIONS)
                [res, outInts, outFloats, outStrings, outBuffer] = ...
                    ev3.commands.simxCallScriptFunction(ev3.clientId, ...
                    OBJETO,ev3.commands.sim_scripttype_childscript,funcion...
                    ,inInts, inFloats, inStrings, inBuffer, om);
                ev3.error(res);
                timeout = timeout+1;
            end
            
            if(timeout >= MAX_ITERATIONS)
                error('Ha ocurrido un error en la comunicacion (reinicie el cliente de API remota)');
            end
        end

        function setStreaming(ev3,active)
            %setStreaming Activa o desactiva el modo de operación de transmisión de
            %datos para las funciones que tienen que devolver datos a
            %matlab
            %
            %   setStreaming(active) Donde active es una variable booleana
            %   que indica si se activa (1) o se desactiva (0) el modo de
            %   transmisión de datos para las funciones que devuelven datos.
            streaming = 4-active;

            for i=1:numel(ev3.FUNCTIONS)
                ev3.callFunction(ev3.FUNCTIONS{i}, [], [], [], [], streaming);
            end
        end
        
        function removeBuffer(ev3)
            %removeBuffer Limpia los bufferes de entrada de las funciones
            %que utilizan el modo de transmisión de datos (indicado para cuando
            %se desactive este modo)
            opmode = 5;

            for i=1:numel(ev3.FUNCTIONS)
                ev3.callFunction(ev3.FUNCTIONS{i}, [], [], [], [], opmode);
            end
        end
        
        function wait(ev3, tiempo)
            %wait Realiza una espera dado un tiempo en segundos
            %   wait(tiempo) Espera "tiempo" segundos
            llamadas = tiempo/ev3.timeStep;
            contador = 0;
            while contador < llamadas
                ev3.callFunction('EmptyFunction',[],[],[],[],2);
                contador = contador + 1;
            end
        end
    end
end

