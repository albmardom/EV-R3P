function pressed = ButtonPressed( button, varargin)
%BUTTONPRESSED Comprueba el botón presionado del ladrillo
%   pressed = BUTTONPRESSED(button) el valor de "pressed" será 1 si "button"
%   ha sido presionado. Las constantes de botones que se pueden usar son
%   las siguientes:
%   
%   * BTNEXIT: Botón inferior
%   * BTNRIGHT: Botón derecho
%   * BTNLEFT: Botón izquierdo
%   * BTNCENTER: Botón central
%
%   See also NUMOUT, CLEARSCREEN, TEXTOUT
    
    input = inputname(1) ; % se secoge el nombre del parametro de la funcion
    pattern = '^BTN(EXIT|RIGHT|LEFT|CENTER)$'; % creamos un patrón de expresión regular
    if(isempty(regexp(input, pattern, 'match'))) % se comprueba si el nombre
        error('constante de botón erronea')      % del botón
                                                 % y el patrón coinciden
    end
    if(button < 1 || button > 4) % si no está en el rango de botones lanzamos error
        error('el valor de "button" no se reconoce');
    end
    
    ev3 = evalin('caller','ev3'); % Se recoge el manejador de ev3 del 
                                    % espacio de trabajo
    
    % Preparamos la señal para la recepción del dato
    % returnCode = ev3.commands.simxGetIntegerSignal(ev3.clientId, buttonPressed, ev3.commands.simx_opmode_streaming);
    % vrepError(returnCode);
    % Recibimos el dato
    % [returnCode, resButton] = ev3.commands.simxGetIntegerSignal(ev3.clientId, buttonPressed, ev3.commands.simx_opmode_buffer);
    % vrepError(returnCode);
    
    resButton = ev3.callFunction('ButtonPressed', [], [], [], [], 1);
    
    % Devolvemos si el botón se ha presionado
    pressed = (button==resButton);
end

