function color = SensorColor()
%SENSORCOLOR Reconoce el color que pasa por el sensor (7 colores + 1 sin color)
%
%   color = SENSORCOLOR() Devuelve el código de color que detecta el sensor,
%   el valor de "color" puede ser uno de los siguientes:
% 
%   * 0 = Sin color
%   * 1 = Negro
%   * 2 = Azul
%   * 3 = Verde
%   * 4 = Amarillo
%   * 5 = Rojo
%   * 6 = Blanco
%   * 7 = Marrón
%
%   See also SETSENSORLIGHT, SENSOR, SENSOR_1, SENSOR_2, SENSOR_3, SENSOR_4

    ev3 = evalin('caller','ev3'); % Se recoge el manejador de vrep del 
                                    % espacio de trabajo
    [~,auxData] = ev3.callFunction('SensorColor',[],[],[],[], 1); %recogemos los rgb medios
    rgb(:,:,1) = auxData(1); % adaptamos a formato rgb de Matlab
    rgb(:,:,2) = auxData(2);
    rgb(:,:,3) = auxData(3);
    hsv = rgb2hsv(rgb); %transformamos a hsv y transponemos
    hsv = hsv(:)';
    if(auxData(4) < 0.98) % si está dentro del rango de detección
        % se realiza el reconocimiento de colores
        if(hsv(3)<=0.19) % rango de negro
            color = 1;
        elseif(hsv(3)>= 0.85 && hsv(2)<=0.09) % rango de Blanco
            color = 6;
        elseif (hsv(3)>=0.2 && hsv(3)<=0.5 && hsv(2)>=0.5 && hsv(2)<=1 && hsv(1)>=0 && hsv(1)<=0.15) % rango de marrón
            color = 7;
        elseif(hsv(3)>=0.85 && hsv(2)>=0.5) 
            if((hsv(1)<=0.0556 && hsv(1)<=0) || (hsv(1)<=1 && hsv(1)>=0.9278)) %rango de rojo
                color = 5;
            elseif(hsv(1)<=0.7278 && hsv(1)>=0.525) % rango de azul
                color = 2;
            elseif(hsv(1)<=0.4444 && hsv(1)>=0.2361) % rango de verde
                color = 3;
            elseif(hsv(1)<=0.2111 && hsv(1)>=0.1333) % rango de amarillo
                color = 4;
            else % fuera de rango
                color = 0;
            end
        else % fuera de rango
            color = 0;
        end
    else % fuera de rango
        color = 0;
    end
end