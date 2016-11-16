function ResetRotationCount(motor, varargin)
%RESETROTATIONCOUNT Resetea el conteo de vueltas del sensor rotacional indicado
%   RESETROTATIONCOUNT(motor) inicializa a 0 el sensor rotacional "motor". Las
%   constantes de motores que se pueden usar son las siguientes:
%
%   * OUT_A: puerto A de actuadores (motor A)
%   * OUT_C: puerto C de actuadores (motor C)
%
%   See also MOTORROTATIONCOUNT, ONFWD, ONREV, OFF
    
    input = inputname(1) ; % se secoge el nombre del parametro de la funcion
    pattern = '^OUT_(A|C)$'; % creamos un patrón de expresión regular
    if(isempty(regexp(input, pattern, 'match'))) % se comprueba si el nombre
        error('constante de motor erronea')      % del motor 
                                                 % y el patrón coinciden
    end
    
    ev3 = evalin('caller','ev3'); % Se recoge el manejador de ev3 del 
                                  % espacio de trabajo
    if(sum(motor == 1:3)) %si el valor corresponde con uno de los motores
        ev3.callFunction('ResetRotationCount',motor,[],[],[], 0); %reseteamos el motor
    else %en otro caso lanzamos el error
        error('la constante introducida no es correcta')
    end
     
end