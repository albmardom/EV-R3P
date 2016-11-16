function Off(motor, varargin)
%OFF Detiene el motor indicado
%   OFF(motor) detiene el motor "motor". Las constantes de motores que se
%   pueden usar son las siguientes:
%
%   * OUT_A: puerto A de actuadores (motor A)
%   * OUT_C: puerto C de actuadores (motor C)
%   * OUT_AC: puertos A y C de actuadores (ambos motores)
%   
%   See also ONFWD, ONREV, RESETROTATIONCOUNT, MOTORROTATIONCOUNT
    
    input = inputname(1) ; % se secoge el nombre del parametro de la funcion
    pattern = '^OUT_(AC?|C)$'; % creamos un patrón de expresión regular
    if(isempty(regexp(input, pattern, 'match'))) % se comprueba si el nombre
        error('constante de motor erronea')      % del motor 
                                                 % y el patrón coinciden
    end
    if(~sum(motor == 13:15)) %si no es ninguno de los tres motores, lanzamos un error
        error('la constante introducida no es correcta')
    end

    ev3 = evalin('caller','ev3'); %recoge el objeto ev3 para la comunicación con el robot
    
    %llamamos a la función de parada de motores
    ev3.callFunction('Off',motor,[],[],[], 0);
end

