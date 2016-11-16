function Stop(code)
%STOP finaliza la ejecucion del programa
%   STOP(code) finaliza la ejecucion con el codigo de error (en caso de 
%   error) "code"

    ev3 = evalin('caller','ev3'); % Se recoge el manejador de ev3 del 
                                    % espacio de trabajo
    ev3.callFunction('Stop',code,[],[],[], 2); % se llama a la función Stop
end

