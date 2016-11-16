function time = CurrentTick()
% CURRENTTICK Devuelve el tiempo de ejecuci�n en milisegundos (el tiempo
% devuelto es el tiempo de simulaci�n, no el real)
%
% See also WAIT

    ev3 = evalin('caller','ev3');  %recoge la constante de vrep para la comunicaci�n con el simulador
    time = ev3.callFunction('CurrentTick',[],[],[],[], 1)*1000; % se llama a la funci�n en V-REP
end