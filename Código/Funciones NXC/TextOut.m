function TextOut(x, y, string)
%TEXTOUT añade texto en la pantalla del EV3
%   TEXTOUT(x,y,string) escribe el texto "string" en la pantalla del EV3 comenzando
%   en la posición "x" e "y" (para la posición consultar las constantes de
%   linea de pantalla). Donde "y" solo pueden ser las siguientes constantes:
%   
%   * LCD_LINE1: linea 1 de la pantalla de ev3
%   * LCD_LINE2: linea 2 de la pantalla de ev3
%   * LCD_LINE3: linea 3 de la pantalla de ev3
%   * LCD_LINE4: linea 4 de la pantalla de ev3
%   * LCD_LINE5: linea 5 de la pantalla de ev3
%   * LCD_LINE6: linea 6 de la pantalla de ev3
%   * LCD_LINE7: linea 7 de la pantalla de ev3
%   * LCD_LINE8: linea 8 de la pantalla de ev3
%
%   See also NUMOUT, CLEARSCREEN, BUTTONPRESSED
    
    input = inputname(2) ; % se secoge el nombre del parametro de la funcion
    pattern = '^LCD_LINE[1-8]$'; % creamos un patrón de expresión regular
    if(isempty(regexp(input, pattern, 'match'))) % se comprueba si el nombre
        error('constante de motor erronea')      % de la linea de pantalla 
                                                 % y el patrón coinciden
    end
    
    if(y < 1 || y > 8)
        error('el valor de "y" tiene que estar comprendido entre 1 y 8 (usa las constantes de lineas)');
    end
    
    ev3 = evalin('caller','ev3'); % Se recoge el manejador de ev3 del 
                                    % espacio de trabajo
    
    espacios(1,1:floor(x/4)) = ' '; % se añaden los espacios para la posición x
    mensaje = [espacios string]; % se concatena con el mensaje
    ev3.callFunction('TextOut',y,[],mensaje,[], 0); % se recorta el mensaje
end