function angle = SensorAngle()
%SENSORANGLE Devuelve el valor del angulo girado en grados del sensor giroscopico
%   angle = SENSORANGLE() retorna el valor del sensor giroscopico del modo
%   de angulo
%
%   See also RESETANGLE, SETSENSORHTGYRO, SENSORHTGYRO

    ev3 = evalin('caller','ev3'); % Se recoge el manejador de ev3 del 
                                  % espacio de trabajo
    angle = ev3.callFunction('SensorGyroA', [],[],[],[], 1);
    % se recogen los datos del simulador
end