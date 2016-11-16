function rate = SensorHtGyro( input , offset )
%SENSORHTGYRO Devuelve el valor de la velocidad angular del sensor giroscopico
%
%   rate = SENSORHTGYRO(input, offset) retorna el valor del sensor giroscopico "input"
%   con un relleno "offset". Las constantes que se pueden usar en "input" son
%   las siguientes: 
%   
%   * IN_1: puerto 1 de sensores
%   * IN_2: puerto 2 de sensores
%   * IN_3: puerto 3 de sensores
%   * IN_4: puerto 4 de sensores
%
%   See also SETSENSORHTGYRO, RESETANGLE, SENSORANGLE

    in = inputname(1) ; % se secoge el nombre del parametro de la función
    pattern = '^IN_[1-4]$'; % creamos un patrón de expresión regular
    if(isempty(regexp(in, pattern, 'match'))) % se comprueba si el nombre
        error('entrada erronea')                 % de la entrada de la función
                                                 % y el patrón coinciden
    end
    
    if(input ~= 3) % se comprueba si la entrada es correcta
         error('la entrada es erronea o no se ha indicado el puerto del sensor')
    end
    ev3 = evalin('caller','ev3'); % Se recoge el manejador de ev3 del 
                                    % espacio de trabajo
    rate = ev3.callFunction('SensorGyroVA', [],[],[],[], 1) + offset;
    % se recogen los datos del simulador
end