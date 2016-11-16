function res = isFileNXC( fileNXC )
%ISFILENXC comprueba si el manejador de ficheros es apto para usar
%funciones de NXC para el uso de ficheros
    
    nombres = strjoin(fieldnames(fileNXC),'');
    array = [isstruct(fileNXC)
             strcmp(nombres, 'handlenombretamTotal')
             isa(fileNXC.handle, 'double')
             isa(fileNXC.tamTotal, 'double')
             isa(fileNXC.nombre, 'char')]';
     res = all(array);
end

