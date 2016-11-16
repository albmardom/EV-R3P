# EV-R3P

Aquí se encuentran todos los códigos de matlab y Modelos de V-REP y LeoCAD del trabajo fin de grado "Modelado y Simulación de un Robot LEGO Mindstorms EV3 mediante V-REP y Matlab" realizado por Alberto Martín Domínguez y tutorizado por los doctores Ana María Cruz Martín y Juan Antonio Fernández Madrigal. Adicionalmente, se proporciona un paquete con todo lo necesario para utilizar el trabajo.

## Estructura de directorios

- **Código**. Directorio con todos los fuentes de Matlab de la toolbox desarrollada; se subdivide en:

  - **Clases Manejadoras x64**. Contiene las clases manejadoras para el control de la simulación y el robot EV3 para la arquitectura x64.
  
  - **Clases Manejadoras x86**. Igual que el punto anterior pero para la arquitectura x86.
  
  - **Funciones NXC**. Funciones para controlar el robot basadas, en su mayoria, en el formato de funciones de NXC.
  
  - **Iniciador de la simulación**. Contiene una función de Matlab para iniciar una simulación del robot mediante un script desarrollado con las funciones de NXC valiendose de los scripts que se encuentran en la subcarpeta "Scripts"
  
- **Modelo LeoCAD**. Posee el modelo para el programa de modelado LeoCAD.
  
- **Modelo V-REP**. Contiene los modelos de V-REP del simulador, uno de ellos con colores (versión GROUP) y otro sin colores (versión Merge).

## Como utilizarlo

En este repositorio se encuentra un archivo `.pdf` con las instrucciones necesarias y las funciones para instalar y controlar el robot

## Como clonar el repositorio

Para clonar el repositorio debe de ingresar la siguiente línea de comando en la consola de git:

`git clone https://github.com/albmardom/EV-R3P`
