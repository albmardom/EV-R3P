classdef vrepRemoteApi < superRemoteApi
%VREPREMOTEAPI inicia el cliente de api remota para el control de la
%simulación (hereda de la clase superRemoteApi)
%   
%   See also VREPREMOTEAPI.VREPREMOTEAPI (constructor),
%   VREPREMOTEAPI.SIMSTART, VREPREMOTEAPI.SIMSPAUSE, 
%   VREPREMOTEAPI.SIMSTOP(métodos), VREPREMOTEAPI.DELETE (destructor).
%   EV3REMOTEAPI, SUPERREMOTEAPI, REMAPI.
    
    properties
    end
    
    methods
        
        function vrep = vrepRemoteApi(varargin)
            % vrepRemoteApi Constructor de la clase vrepRemoteApi
            %   * vrepRemoteApi() Establece la comunicación con V-REP mediante ip localhost y el puerto
            %     19997
            %
            %   * vrepRemoteApi(ip) Establece la comunicación con V-REP mediante la ip "ip" en formato
            %     de cadena de caracteres y el puerto 19997
            %
            %   * vrepRemoteApi(port) Establece la comunicación con V-REP mediante la ip localhost y
            %     el puerto "port" en formato numerico
            %
            %   * vrepRemoteApi(ip, port) Establece la comunicación con V-REP mediante la ip "ip" en
            %     formato de cadena de caracteres y el puerto "port" en formato numerico
            %
            %   * vrepRemoteApi(port, ip) Lo mismo que el punto anterior
            
            ip='127.0.0.1';
            port=19997;  
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
            
            vrep@superRemoteApi(ip, port);
        end
        
        function simStart(vrep)
            % simStart Arranca la simulación en V-REP
            rc = vrep.commands.simxStartSimulation(vrep.clientId, vrep.commands.simx_opmode_blocking);
            vrep.error(rc);
        end
        
        function simStop(vrep)
            % simStop Detiene la simulación en V-REP
            rc = vrep.commands.simxStopSimulation(vrep.clientId, vrep.commands.simx_opmode_oneshot);
            vrep.error(rc);
        end
        
        function simPause(vrep)
            % simPause Pausa la simulación en V-REP
            rc = vrep.commands.simxPauseSimulation(vrep.clientId, vrep.commands.simx_opmode_blocking);
            vrep.error(rc);
        end
    end
    
end

