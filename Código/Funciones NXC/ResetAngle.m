function ResetAngle()
%RESETANGLE Vuelve a 0 el valor del angulo girado del sensor giroscopico
%   RESETANGLE() resetea el valor del sensor giroscopico del modo de angulo
%
%   See also SETSENSORHTGYRO, SENSORHTGYRO, SENSORANGLE

    ev3 = evalin('caller','ev3'); % Se recoge el manejador de ev3 del 
                                  % espacio de trabajo
    ev3.callFunction('ResetGyroA', [],[],[],[], 0);
    % Envia la información al simulador
end