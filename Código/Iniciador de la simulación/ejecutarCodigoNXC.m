function ejecutarCodigoNXC(script, log, name)
% EJECUTARCODIGOEV3 Ejecuta un script para el robot LEGO Mindstorms EV3 en
% V-REP
%   EJECUTARCODIGOEV3(script) Ejecuta el script "script" en el simulador.
%   
%   EJECUTARCODIGOEV3(script, log) Ejecuta el script "script" y si "log"
%   es 1, guarda la consola del script en un archivo ".txt" con el nombre
%   del script.
%
%   EJECUTARCODIGOEV3(script, log, name) Ejecuta el script "script" y si
%   "log" es 1, guarda la consola del script en un archovo ".txt" con el
%   nombre "name"
%   
%   See also INITCONSTANTS, CLEARCONSTANTS, VREPREMOTEAPI, RVR

    InitNXC; % inicializa las constantes e inicia la simulación
    disp(' ');
    disp('***Ejecutando el programa...***');
    disp('--------CONSOLA DEL SCRIPT--------');
    
    if(nargin > 1 && log) % creación de log
        if(nargin > 2)
            diary([name '.txt']);
        else
            diary([script '.txt']);
        end
    end
    
    try
        run(script); % ejecución del script
    catch ME
        beep
        disp('Se ha producido un error:'); % muestreo de la excepción
        disp(' ');
        disp(getReport(ME, 'extended'));
    end
    
    if(nargin > 1 && diar) % cerrar el fichero de log
        diary off
    end
    
    disp('------FIN CONSOLA DEL SCRIPT------');
    ClearNXC; %finaliza la simulación y limpia el espacio de trabajo
end