function returnCode = DeleteFile( fileName )
%DELETEFILE Elimina un archivo
%   retunrCode = DELETEFILE(fileName) elimina un archivo con nombre "fileName".
%   returCode es el valor devuelto por la funcion que indica si se ha
%   producido un error en la eliminación del archivo (valores menores que 0).
%   
%   See also CLOSEFILE, CREATEFILE, WRITELNSTRING, OPENFILEREAD,
%   READLNSTRING

    file = dir(fileName);
    if(~isempty(file)) % si el fichero existe lo eliminamos y devolvemos cero
        delete(fileName);
        returnCode = 0;
    else % si no, no lo eliminamos y devolvemos -1
        returnCode = -1;
    end
end

