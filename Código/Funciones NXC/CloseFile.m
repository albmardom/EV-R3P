function returnCode = CloseFile( file )
%CLOSEFILE  Cierra el fichero
%   CLOSEFILE(handle) cierra el fichero con el manejador indicado
%   (declarado anteriormente). Devuelve "returnCode", si este valor es
%   menor que cero, se ha producido un error.
%   
%   See also CREATEFILE, DELETEFILE, WRITELNSTRING, OPENFILEREAD,
%   READLNSTRING

    if ~isFileNXC(file) % si no es de la clase FileNXC lanzamos error
        error('Handle no valido');
    end
    returnCode = fclose(file.handle); % cerramos el fichero
    if(returnCode >= 0) %si hemos logrado cerrarlo eliminamos el objeto
        assignin('caller', inputname(1), []);
    end
end

