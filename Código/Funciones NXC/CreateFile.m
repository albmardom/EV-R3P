function returnCode = CreateFile(nombre, tamTotal, ~)
%CREATEFILE Crea un archivo para su escritura, si este existe se elimina
%   returnCode = CREATEFILE(nombre, tamTotal, handle) crea un fichero con nombre "name",
%   con el tamaño "tamTotal" y devuelve "handle" inicializado asociado al
%   archivo. returnCode es el valor devuelto por la función que indica si se
%   ha producido un error en la creación del archivo (valores menores que
%   0).
%
%   See also WRITELNSTRING, CLOSEFILE, DELETEFILE, OPENFILEREAD,
%   READLNSTRING
    
    [file, returnCode] = fopen(nombre, 'w'); %creamos un fichero nuevo con el nombre
    if(isempty(returnCode)) % si no ha habido un error
        archivo = struct('handle', file ,'nombre', nombre, 'tamTotal', tamTotal); %creamos el objeto del nuevo fichero
        assignin('caller', inputname(3), archivo); % actualizamos la variable handle en el espacio de trabajo
        returnCode = 1; % devolvemos 1
    else
        returnCode = -1;
    end
end