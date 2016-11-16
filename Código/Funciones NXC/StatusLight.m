function StatusLight( color, blinking )
%STATUSLIGHT Enciende o apaga las luces de estado del robot EV3 y si estas 
%parpadean o no.
%   STATUSLIGHT(color, blinking) enciende (o apaga) el led del ladrillo con
%   el color "color"; si "blinking" est� a 1 comenzar� a parpadear. Los
%   colores que se pueden introducir son: 
%   
%   * 0: color verde.
%   * 1: color �mbar.
%   * 2: color rojo.
%   * 3: led apagado.
%   
%   See also BUTTONPRESSED

    ev3 = evalin('caller','ev3'); %recoge la constante de ev3 para la comunicaci�n con el simulador.
    ev3.callFunction('StatusLight',[color+1, blinking],[],[],[], 0); %llama a la funci�n de asignar color de led.

end

