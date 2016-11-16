function rotation  = MotorRotationCount(motor, varargin)
%MOTORROTATIONCOUNT Devuelve la rotacion en angulos del sensor rotacional indicado
%   MOTORROTATIONCOUNT(motor) devuelve la rotacion en grados del motor
%   "motor". Las constantes de motores que se pueden usar son las siguientes: 
%
%   * OUT_A: puerto A de actuadores (motor A)
%   * OUT_C: puerto C de actuadores (motor C)
%   
%   See also RESETROTATIONCOUNT, ONFWD, ONREV, OFF

    input = inputname(1) ; % se secoge el nombre del parametro de la funcion
    pattern = '^OUT_(A|C)$'; % creamos un patrón de expresión regular
    if(isempty(regexp(input, pattern, 'match'))) % se comprueba si el nombre
        error('constante de motor erronea')      % del motor 
                                                 % y el patrón coinciden
    end
    
    ev3 = evalin('caller','ev3'); % se recoje el manejador de ev3 del 
                                  % espacio de trabajo
    if(motor == 1) % si es el motor B
        rotation = ev3.callFunction('MotorRotationCountB',motor,[],[],[], 1);
        % se cuentan sus rotaciones
    elseif(motor == 2) % si es el motor C
        rotation = ev3.callFunction('MotorRotationCountC',motor,[],[],[], 1);
        % se cuentan sus rotaciones
    else % si es otra constante se notifica con error
        error('la constante introducida no es correcta')
    end
end