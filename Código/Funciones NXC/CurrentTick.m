function time = CurrentTick()
% CURRENTTICK Devuelve el tiempo de ejecución en milisegundos (el tiempo
% devuelto es el tiempo de simulación, no el real)
%
% See also WAIT

    ev3 = evalin('caller','ev3');  %recoge la constante de vrep para la comunicación con el simulador
    time = ev3.callFunction('CurrentTick',[],[],[],[], 1)*1000; % se llama a la función en V-REP
end