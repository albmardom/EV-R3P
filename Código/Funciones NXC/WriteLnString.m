function returnCode = WriteLnString( file,  texto, ~)
%WRITELNSTRING Escribe una linea en fichero
%   returnCode = WRITELNSTRING(handle, texto, bytesWriten) Escribe "texto" en el fichero con el
%   manejador "handle" y devuelve los bytes escritos en "bytesWriten". 
%   Devuelve "returnCode", si este valor es menor que cero se ha producido un error.
%
%   See also CREATEFILE, DELETEFILE, CLOSEFILE, OPENFILEREAD, READLNSTRING
    
    if ~isFileNXC(file) % si no es de la clase FileNXC lanzamos error
        error('Handle no valido');
    end

    if((file.tamTotal-numel(texto)) >= 0) % si la capacidad restante del fichero
                                          % es superior a la cantidad de
                                          % caracteres
        f = dir(file.nombre); % recogemos las especificaciones del fichero con el nombre
        sf = f.bytes;         % recogemos los bytes en el fichero
        if(sf == 0) % si está vacío es la primera línea que escribimos
            nbytes = fprintf(file.handle, '%s', texto);
        else % si no, pasamos a la siguiente línea y escribimos
            nbytes = fprintf(file.handle, '\n%s', texto);
        end
        % guardamos en el espacio de trabajo
        assignin('caller', inputname(3), nbytes);
        % restamos los bytes al espacio restante del fichero
        file.tamTotal = file.tamTotal-nbytes;
        returnCode = 0; % devolvemos 0
    else % si la capacidad se excede mandamos error
        error('Se ha excedido la longitud del archivo');
    end
end

