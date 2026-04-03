1. ¿Qué es stash y diferencia con commit?
El stash es como un "borrador" temporal donde escondes cosas que aún no has terminado. Así puedes tener el código limpio sin hacer un commit. El commit sí lo guarda permanentemente en la historia.

2. Situaciones reales:
- Estás haciendo algo pero descubres un error crítico, así que haces stash, cambias de rama, arreglas el bug y luego recuperas tu código con pop.
- Tienes que descargar cambios de tus compañeros (git pull) pero estás a medias y Git no te deja porque hay conflictos. Haces stash, bajas los suyos y luego recuperas los tuyos encima.

3. Riesgos del stash:
Dejar un montón acumulados. Si haces 10 stashes te vas a olvidar de cuál es cuál y perderás tu trabajo o meterás un montón de código basura sin querer. Es para arreglos súper rápidos, si tardas horas mejor abre una rama de prueba y haz un commit.
