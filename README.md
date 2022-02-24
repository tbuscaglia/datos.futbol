# Indice de Rendimiento

### Idea General:

Crear un indice que mida el rendimiento de los jugadores en base a sus estadisticas individuales de los jugadores. 

### Planificacion:

1 - Traer las estadisticas de los jugadores para un partido en especifico. 

2 - Definir el puntaje inicial. 

3 - Definir cuanto peso asignarle a cada accion realizada por los jugadores. (Peso segun posicion)

4 - Calcular valor agregado para defensa, pases, ataque y otras estadisticas. 

5 - Al puntaje inicial sumarle y restarle los puntos correspondientes segun el peso asignado anteriormente. 

### Output:

Una tabla con la informacion del jugador (Nombre, Posicion), el puntaje inicial (a definir, ej: 5,00), valor agregado de pases, valor agregado en defensa y ataque, mas otras estadisticas (Tarjetas, etc.) 

| Jugador | Posicion | Puntaje Inicial | Defensa | Pases | Ataque | Otros | Total |
| ------- | -------- | --------------- | ------- | ----- | ------ | ----- | ----- |
| Fulano  | Def.Cen  |      5.00       | + 2.05  | + 0.2 | - 0.41 | - 0.38|  6.46 |