function ClearScreen()
%CLEARSCREEN Limpia la pantalla del ladrillo del EV3
%   
%   See also TEXTOUT, NUMOUT, BUTTONPRESSED

    ev3 = evalin('caller','ev3'); %recoge la constante de vrep para la comunicaci�n con el simulador.
    ev3.callFunction('ClearScreen',[],[],[],[], 0); %llama a la funci�n de limpiar la pantalla.
end

