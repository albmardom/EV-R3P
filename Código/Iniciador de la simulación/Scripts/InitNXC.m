%INITNXC  Inicializa las constantes de NXC, los manejadores y la simulación
%   Llamar antes de usar cualquier funcion de la toolbox por primera vez.
%
%   ADVERTENCIA: nunca usar la función CLEAR all con el espacio de trabajo
%   generado por esta función, ya que dejaría el manejador de la api remota
%   de V-REP y del EV3 en memoria y no finalizaría la conexión con este, lo que 
%   provocaría que no se volvieran a ejecutar programas. La solución, en el
%   caso de que esto ocurra, es reiniciar Matlab.
%
%   ADVERTENCIA 2: No modificar bajo ningún concepto el valor de la
%   variables, a excepción de las instancias vrep y ev3 mediante sus
%   constructores y métodos.
%
%   * LCD_LINE1: linea 1 de la pantalla de ev3
%   * LCD_LINE2: linea 2 de la pantalla de ev3
%   * LCD_LINE3: linea 3 de la pantalla de ev3
%   * LCD_LINE4: linea 4 de la pantalla de ev3
%   * LCD_LINE5: linea 5 de la pantalla de ev3
%   * LCD_LINE6: linea 6 de la pantalla de ev3
%   * LCD_LINE7: linea 7 de la pantalla de ev3
%   * LCD_LINE8: linea 8 de la pantalla de ev3
%   * BTNEXIT: botón salida del ev3
%   * BTNRIGHT: botón derecha del ev3
%   * BTNLEFT: botón izquierda del ev3
%   * BTNCENTER: botón central del ev3
%   * IN_1: puerto 1 de sensores
%   * IN_2: puerto 2 de sensores
%   * IN_3: puerto 3 de sensores
%   * IN_4: puerto 4 de sensores
%   * OUT_A: puerto A de actuadores (motor A)
%   * OUT_C: puerto C de actuadores (motor C)
%   * OUT_AC: puertos A y C de actuadores (ambos motores)
%   * vrep: manejador del cliente de API remota para controlar la
%           simulación en V-REP.
%   * ev3: manejador del cliente de API remota para el control del robot
%          EV3
%
%   See also CLEARCONSTANTS, VREPREMOTEAPI, EJECUTARCODIGOEV3, RVR

LCD_LINE1 = 1;
LCD_LINE2 = 2;
LCD_LINE3 = 3;
LCD_LINE4 = 4;
LCD_LINE5 = 5;
LCD_LINE6 = 6;
LCD_LINE7 = 7;
LCD_LINE8 = 8;
BTNEXIT = 1;
BTNRIGHT = 2;
BTNLEFT  = 3;
BTNCENTER = 4;
IN_1 = -1;
IN_2 = -1;
IN_3 = -1;
IN_4 = -1;
OUT_A = 1;
OUT_C = 2;
OUT_AC = 3;
disp('***Creando el cliente de api remota de V-REP...***');
vrep = vrepRemoteApi;
disp(' ');
disp('***Iniciando la simulación...***');
vrep.simStart();
disp(' ');
disp('***Creando el cliente de api remota de EV3...***');
ev3 = ev3RemoteApi;
ev3.setStreaming(1);
pause(5);


