function SetSensorLight( ~ )
%SETSENSORLIGHT inicializa el sensor de luz en la entrada indicada
%   SETSENSORLIGHT(input) informa a "input" que el sensor de luz esta
%   conectado a ese puerto. Las constantes que se pueden usar en "input" son
%   las siguientes: 
%   
%   * IN_1: puerto 1 de sensores
%   * IN_2: puerto 2 de sensores
%   * IN_3: puerto 3 de sensores
%   * IN_4: puerto 4 de sensores
%
%   See also SENSOR, SENSOR_1, SENSOR_2, SENSOR_3, SENSOR_4, SENSORCOLOR

   input = inputname(1); % se secoge el nombre del parametro de la funcion
    pattern = '^IN_[1-4]$'; % creamos un patrón de expresión regular
    if(isempty(regexp(input, pattern, 'match')))% se comprueba si el nombre
        error('entrada erronea')                % de la entrada de la función
                                                % y el patrón coinciden
    end
    for i=1:4 % comprobamos si otra constante de entrada tiene el mismo
              % valor.
        in = evalin('caller',['IN_', num2str(i)]);
        % Si es así, le asignamos -1 al la constante que tenga el mismo
        % valor (en este caso 0), para marcarla como desconectada.
        if(in == 1 || in == 2)
            assignin('caller', ['IN_', num2str(i)], -1);
        end
    end
    assignin('caller', input, 1); % asignamos a la constante el sensor
                                  % conectado
end

