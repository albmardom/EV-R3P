classdef superRemoteApi
% SUPERREMOTEAPI Clase que maneja las comunicaciones con V-REP
%
%   See also SUPERREMOTEAPI.SUPERREMOTEAPI (constructor),
%   SUPERREMOTEAPI.COMMANDS, SUPERREMOTEAPI.CLIENTID (atributos),
%   SUPERREMOTEAPI.CHANGECONNECTION, SUPERREMOTEAPI.DISCONNECT (m�todos),
%   SUPERREMOTEAPI.DELETE (destructor). EV3REMOTEAPI, VREPREMOTEAPI, REMAPI.

    
    properties
        commands %Comandos y constantes de la clase remApi (consultar documentaci�n de V-REP)
        clientId %Id cliente de conexi�n con V-REP
    end
    
    methods
        function remoteapi=superRemoteApi(ip, port)
            % superRemoteApi Constructor de la clase superRemoteApi
            %   vrepRemoteApi(ip, port) Establece la comunicaci�n con la ip "ip" en
            %   formato de cadena de caracteres y el puerto "port" en formato numerico
                
            remoteapi.clientId = -1;
            
            remoteapi.commands=remApi('remoteApi'); % crea el objeto remApi
            remoteapi.clientId=remoteapi.commands.simxStart(ip,port,true,false,5000,5);
            % conecta con el servidor de API remota
            
            % comprueba si la conexi�n es correcta
            if (remoteapi.clientId > -1) 
                disp('conexi�n establecida') 
            else
                error('un error ha ocurrido mientras se establec�a la conexi�n')
            end
        end
        
        function changeConnection(remoteapi, ip, port)
            % changeConnection Cambia la conexi�n del manejador
            %   remoteapi.changeConnection(ip, port) Cambia la comunicaci�n con la ip "ip" en
            %   formato de cadena de caracteres y el puerto "port" en formato numerico
            
            remoteapi.commands.simxFinish(remoteapi.clientId);
            remoteapi.clientId=remoteapi.commands.simxStart(ip,port,true,false,5000,5);
            if (remoteapi.clientId > -1) 
                disp('conexi�n establecida') 
            else
                error('un error ha ocurrido mientras se establec�a la conexi�n')
            end
        end
        
        function disconnect(remoteapi)
            % disconnect Desconecta la conexi�n con V-REP
            id = remoteapi.clientId;
            remoteapi.clientId=-1;
            remoteapi.commands.simxFinish(id);
        end
        
        function error(remoteapi, returnValue)
            % funcion que comprueba los codigos devueltos por remApi
            err = '';
            switch returnValue
                case remoteapi.commands.simx_return_timeout_flag
                    err = 'La funci�n a producido un time-out (probablemente no haya red o esta vaya demasiado lenta) (error 2)';
                case remoteapi.commands.simx_return_illegal_opmode_flag
                    err = 'El modo de operaci�n especificado no est� soportado para la funci�n utilizada (error 4)';
                case remoteapi.commands.simx_return_remote_error_flag
                    err = 'La funci�n ha causado un error en el servidor (error 8)';
                case remoteapi.commands.simx_return_split_progress_flag
                    err = 'El thread de la comunicaci�n est� todav�a procesando un comando del mismo tipo (error 16)';
                case remoteapi.commands.simx_return_local_error_flag
                    err = 'La funci�n ha causado un error en el lado del cliente (error 32)';
                case remoteapi.commands.simx_return_initialize_error_flag
                    err = 'simxStart no ha sido llamado antes (error 64)';
            end
            if(~isempty(err))
                [~,messages]=remoteapi.commands.simxGetLastErrors(remoteapi.clientId,vrep.commands.simx_opmode_blocking);
                size = numel(messages);
                if(size > 0)
                    err = [err '\n'];
                    for i=1:size
                        err = [err '\n' messages{i}];
                    end
                end
                error(err);
            end
        end
        
        function delete(remoteapi)
            % delete Destructor de la clase
            remoteapi.commands.simxFinish(remoteapi.clientId);
            remoteapi.clientId = -1;
            delete(remoteapi.commands);
            disp('El objeto RemoteApi se ha eliminado correctamente')
        end
    end
    
end

