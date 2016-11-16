function Wait(time)
%WAIT Realiza una espera
%   WAIT(time) Realiza una pausa de "time" milisegundos.
%
%   See also CURRENTTICK

    ev3 = evalin('caller','ev3');% Se recoge el manejador de vrep del 
                                   % espacio de trabajo
    ev3.wait(time/1000);    
end

