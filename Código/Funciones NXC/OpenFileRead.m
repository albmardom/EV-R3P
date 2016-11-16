function returnCode = OpenFileRead(nombre, ~, ~)
%OPENFILEAPPEND abre un archivo para su lectura
%   OPENFILEAPPEND(nombre, tamTotal, handle) abre el fichero "name",
%   devolviendo el tamaño "tamTotal" y el manejador "handle" asociado al
%   archivo, por lo que deben ser variables estas dos últimas. returnCode
%   es el valor devuelto por la funcion que indica si se ha producido un
%   error en la creacion del archivo (valores menores que 0).
%
%   See also WRITELNSTRING, CLOSEFILE, DELETEFILE, READLNSTRING,
%   OPENFILEREAD

    [file, returnCode] = fopen(nombre, 'r'); %abrimos un fichero nuevo con el nombre
    
    if(isempty(returnCode)) % si no ha habido un error
        f = dir(nombre); % recogemos las caracteristicas del fichero
        archivo = struct('handle', file ,'nombre', nombre, 'tamTotal', f.bytes); %creamos la estructura del nuevo fichero
        assignin('caller', inputname(3), archivo); % actualizamos el handler del espacio de trabajo
        assignin('caller', inputname(2), f.bytes); % actualizamos el numero de bytes del spacio de trabajo
    end
end