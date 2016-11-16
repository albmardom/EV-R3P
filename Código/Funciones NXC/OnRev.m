function OnRev(motor, velocity, varargin)
%ONREV Le da una velocidad al motor indicado invirtiendo el sentido
%   ONREV(motor, velocity) activa el motor "motor" a una velocidad
%   "velocity" indicada entre -100 y 100 invirtiendo el sentido (siendo el 
%   porcentaje de velocidad a partir de la velocidad máxima). Las
%   constantes de motores que se pueden usar son las siguientes:
%
%   * OUT_A: puerto A de actuadores (motor A)
%   * OUT_C: puerto C de actuadores (motor C)
%   * OUT_AC: puertos A y C de actuadores (ambos motores)
%
%   See also ONFWD, OFF, MOTORROTATIONCOUNT, RESETROTATIONCOUNT

    input = inputname(1) ; % se secoge el nombre del parametro de la funcion
    pattern = '^OUT_(AC?|C)$'; % creamos un patrón de expresión regular
    if(isempty(regexp(input, pattern, 'match'))) % se comprueba si el nombre
        error('constante de motor erronea')      % del motor 
                                                 % y el patrón coinciden
    end
    
    if(~sum(motor == 1:3)) %si no es ninguno de los tres motores, lanzamos un error
        error('la constante introducida no es correcta')
    end

    ev3 = evalin('caller','ev3'); %recoge el objeto ev3 para la comunicación con el robot
    MAX_SPEED = 18.326; %velocidad máxima
    
	target = -(MAX_SPEED * velocity/100); %aplicamos la fórmula y cambiamos el sentido de la velocidad
    ev3.callFunction('On',[motor target],[],[],[], 0); %llamamos a la función de activación
end
