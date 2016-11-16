function distance = SensorUS(input)
%SENSORUS Devuelve el valor de la distancia del sensor ultrasonico
%   SENSORUS(input) retorna el valor del sensor ultrasonico "input" (consultar las
%   constantes de sensores) Las constantes que se pueden usar en "input" son
%   las siguientes: 
%   
%   * IN_1: puerto 1 de sensores
%   * IN_2: puerto 2 de sensores
%   * IN_3: puerto 3 de sensores
%   * IN_4: puerto 4 de sensores
%
%   See also SETSENSORUS
    
    in = inputname(1) ; % se secoge el nombre del parametro de la funcion
    pattern = '^IN_[1-4]$'; % creamos un patrón de expresión regular
    if(isempty(regexp(in, pattern, 'match'))) % se comprueba si el nombre
        error('entrada erronea')                 % de la entrada de la función
                                                 % y el patrón coinciden
    end
    
    if(input ~= 4) % se comprueba si la entrada es correcta
         error('la entrada es erronea o no se ha indicado el puerto del sensor')
    end
    ev3 = evalin('caller','ev3'); % Se recoge el manejador de ev3 del 
                                    % espacio de trabajo
    [~, distance] = ev3.callFunction('SensorSonar',[],[],[],[], 1);
    % se recogen los datos del simulador
end

