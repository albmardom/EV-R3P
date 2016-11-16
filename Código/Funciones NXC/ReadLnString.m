function returnCode = ReadLnString(file,~)
%READLNSTRING Devuelve la siguiente línea de un archivo leido
%   returnCode = READLNSTRING(file, string) devuelve una línea del archivo
%   "file" en la variable "string", por lo que esta última debe de ser una
%   variable, nunca una constante. "returnCode" es el valor devuelto de la
%   función, donde, si este tiene un valor mayor que 0, el fichero tiene
%   más caracteres para leer, en caso contrario, se ha llegado al final del
%   fichero (en NXC usar las constantes correspondientes para validar esto)
%
%   See also WRITELNSTRING, CLOSEFILE, DELETEFILE, OPENFILEREAD, CREATEFILE
    
    if ~isFileNXC(file) % si no es de la clase FileNXC lanzamos error
        error('Handle no valido');
    end
    tline = fgets(file.handle); % recogemos una linea del archivo
    if ischar(tline) % si lo que hemos recogido son caracteres
        tline = sprintf(tline); % formateamos la linea
        newline = sprintf('\n'); % formateamos el salto de linea
        tline = strrep(tline, newline, ''); % eliminamos los saltos de linea
        assignin('caller',inputname(2), tline); % devolvemos el string
        returnCode = 1; % devolvemos que hay mas lineas
    else
        returnCode = 0; % devolvemos que ya se ha llegado al final del fichero
    end
end

