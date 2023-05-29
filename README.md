# Entrevista Practica

## Objetivos a evaluar

- (importante) Agilidad y calidad de código
- (importante) Comunicación al debatir ideas y correcciones
- (importante) Claridad y concisión de PRs
- (importante) Conocimiento basico de Github
- (importante) Aplicacion correcta de Bloc
- (importante) Inferencia adecuada de instrucciones vagas o incompletas; O preguntas de clarificacion.
- (opcional/preferido) Aplicacion correcta de GoRouter

## Tareas

El objetivo principal es expandir la aplicacion basica de Flutter para que muestre varios contadores y graficas simples sobre los datos recopilados.

### 1. Añadir una Gaveta de navegacion

- Gaveta debe tener 2 botones para navegar a "Contador A" y "Contador B"

### 2. Crear pagina para cada contador

- Deben existir 2 paginas diferentes, una para cada contador.
- En cada pagina se debe poder incrementar o disminuir el contador
- Cuando se navegue de una pagina a otra, los contadores deben retener su valor
- Cuando se cierre y se abra la aplicacion, los contadores deben retener su valor

### 3. Crear una 3ra pagina que muestre:
- Una grafica de pastel comparando los valores de cada contador
- Una lista que muestre todos los eventos de suma o resta de cada contador. Cada elemento debe mostrar: 
  - Nombre del contador "A" o "B"
  - Fecha y tiempo cuando se realizo la operacion
  - Accion realizada (suma o resta)
  - Valor nuevo
- La grafica y la lista deben compartir la misma pantalla

### 4. (Extra, Opcional)  Usar GoRouter para la navegacion
### 5. (Extra, Opcional)  Guardar informacion en una base de datos externa (Firebase, PgSQL, etc)
### 6. (Extra, Opcional)  Permitir multiples usuarios
- En este caso no es necesario un Login, simplemente reconozca cada usuario por un ID unico del aparato que use


## Como entregar
- Cree una rama independiente `feat/nombre-apellido`
- Cree un PR contra la rama de `main`
- Añada detalles adecuados al PR. 
  - Tenga en cuenta que un buen PR es consiso y ayuda al revisador a entender los cambios siendo introducidos mediante una descripcion escrita. 
  - Tambien debe mostrar prueba que los cambios introducidos funcionan, por ejemplo una captura de screen o Unittest o Integration test, o una combinacion de esos
- Si usted determina que es mucho codigo y el PR seria muy grande, tiene la opcion de crear multiples PRs (multiples ramas una encima de la otra) para mantener la legiblodad de cada uno.


Cualquier pregunta, email a dev.eriel.mf@gmail.com o mensaje por Telegram. 
No hay limite de tiempo, pero tenga en cuenta que tenemos mas de 10 aplicantes para 2 posiciones, y notificaremos a todos cuando se halla tomado la decision. Igual en el futuro tendremos mas projectos y nos interesaria agrandar el equipo, asi que por favor mantenganse en contacto aunque no sea elegido en este momento. Gracias!
