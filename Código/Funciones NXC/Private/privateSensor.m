function sensor = privateSensor( input, ev3 )
%PRIVATESENSOR Se encarga se extraer los datos para el sensor de luz y
%táctil
%   sensor = PRIVATESENSOR(input, ev3) Función privada que mediante la entrada
%   indicada y el manejador de EV3 devuelve los datos relativos a los
%   sensores de luz o táctil, dependiendo del contenido de la entrada
%   indicada. Llamada por SENSOR(input) y SENSOR_[1-4]. 
%       PrivateSensor(input, ev3)
%           input: puerto de entrada.
%           ev3: objeto ev3RemoteApi para la comunicación.
%   
%   ADVERTENCIA: esta función es privada y se desaconseja su uso, excepto
%   si se va a hacer una ampliación de la toolbox.
%   
%   See also SENSOR, SENSOR_1, SENSOR_2, SENSOR_3, SENSOR_4

    switch (input)% dependiendo del tipo de sensor que esta conectado
                  % se devuelven los datos
        case 0 % sensor táctil
            sensor = ev3.callFunction('SensorTouch', [],[],[],[], 1); 
        case 1 % sensor de color (modo luz)
            sensor = ev3.callFunction('SensorLight',[],[],[],[], 1);
        otherwise
            error('la entrada del sensor es erronea o no se ha indicado el puerto del sensor')
    end
end

