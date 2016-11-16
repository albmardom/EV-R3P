function sensor = SENSOR_1(varargin)
%SENSOR_1 devuelve el valor de un sensor conectado al puerto 1 (usar para
%el sensor tactil y de luz)
%
%   See also SENSOR, SENSOR_2, SENSOR_3, SENSOR_4, SETSENSORLIGHT,
%   SETSENSORTOUCH, SENSORCOLOR.
    
    input = evalin('caller', 'IN_1'); % Se recoge el puerto del sensor
    ev3 = evalin('caller','ev3'); % Se recoge el manejador de ev3 del 
                                    % espacio de trabajo
    sensor = privateSensor(input, ev3); % llamamos a la función privada que recoge los datos
end

