%CLEARNXC Elimina las constantes creadas de NXC, detiene la simulación,
%destruye los objetos manejadores del cliente (de la simulación y del robot
%EV3) y limpia el espacio de trabajo.
%
%   Usar como comando para eliminar las constantes en caso de error en la 
%   ejecucion de un código o para finalizar un programa en un script y
%   limpiar el espacio de trabajo de matlab. En el caso de que no funcione
%   aplicar las funciones "delete" manualmente; si esto no funcionara,
%   reiniciar Matlab.
%
%   See also INITCONSTANTS, VREPREMOTEAPI, EJECUTARCODIGOEV3, RVR

disp('***Parando la simulación...***');
disp(' ');
ev3.setStreaming(0);
ev3.removeBuffer;
pause(5);
vrep.simStop();
disp('***Destruyendo el cliente de api remota de EV3...***');
delete(ev3);
disp(' ');
disp('***Destruyendo el cliente de api remota de V-REP...***');
delete(vrep);
disp(' ');
disp('***Limpiando memoria...***');
clear variables