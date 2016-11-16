function sensorData = Sensor( input, varargin )
%SENSOR Devuelve el valor de un sensor (Utilizar para el sensor de luz y táctil)
%   SENSOR(input) retorna el valor del sensor "input". Las constantes de
%   puertos de entrada que se pueden utilizar son las siguientes: 
%
%   * IN_1: puerto 1 de sensores
%   * IN_2: puerto 2 de sensores
%   * IN_3: puerto 3 de sensores
%   * IN_4: puerto 4 de sensores
%
%   See also SENSOR_1, SENSOR_2, SENSOR_3, SENSOR_4, SETSENSORLIGHT,
%   SETSENSORTOUCH, SENSORCOLOR.
    
    in = inputname(1) ; % se secoge el nombre del parametro de la funcion
    pattern = '^IN_[1-4]$'; % creamos un patrón de expresión regular
    if(isempty(regexp(in, pattern, 'match'))) % se comprueba si el nombre
        error('entrada erronea')                 % de la entrada de la función
                                                 % y el patrón coinciden
    end
    ev3 = evalin('caller','ev3'); % Se recoge el manejador de ev3 del 
                                    % espacio de trabajo
    sensorData = privateSensor(input, ev3); % llamamos a la función privada que recoge los datos
end

