$ErrorActionPreference = "Stop"

git config user.name "werti"
git config user.email "dcgb716@gmail.com"

# Reto 1
Out-File -FilePath tarea.txt -Encoding utf8 -InputObject "Tarea principal: implementar login."
git add tarea.txt
git commit -m "Define tarea principal de login"

Out-File -FilePath tarea.txt -Encoding utf8 -Append -InputObject "Paso 1: crear formulario de login."
Out-File -FilePath tarea.txt -Encoding utf8 -Append -InputObject "Paso 2: validar credenciales."

$status1 = git status | Out-String
Out-File -FilePath cp1-estado-inicial.txt -Encoding utf8 -InputObject "$status1`nNo quiero hacer commit todavía porque son solo notas a medias y la funcionalidad de login está completamente rota aún."

# Reto 2
git stash push -m "WIP login pasos 1 y 2"
git checkout -b hotfix
Out-File -FilePath hotfix.txt -Encoding utf8 -InputObject "Hotfix urgente aplicado."
git add hotfix.txt
git commit -m "Aplica hotfix urgente"
git checkout main
$list2 = git stash list | Out-String
$log2 = git log --oneline --all | Out-String
Out-File -FilePath cp2-stash-list.txt -Encoding utf8 -InputObject "List:`n$list2`nLog:`n$log2`nExplicacion: Mis cambios a medias fueron guardados en una caja fuerte (stash) temporal para dejarme trabajar en el bug, por lo que desaparecieron a la vista pero siguen seguros en Git."

# Reto 3
$listAntes3 = git stash list | Out-String
git stash apply
$listMedio3 = git stash list | Out-String
git checkout tarea.txt # deshacer cambios para repopular
git stash pop
$listDespues3 = git stash list | Out-String
Out-File -FilePath cp3-apply-vs-pop.txt -Encoding utf8 -InputObject "Antes:`n$listAntes3`nDespues del pop:`n$listDespues3`nDiferencia: 'apply' te devuelve el código pero DEJA la copia en el stash (por si quieres aplicarla de nuevo en otras ramas). 'pop' te devuelve el código y BORRA el stash para no dejar basura."

git commit -am "Termina login basico"

# Reto 4
Out-File -FilePath tarea.txt -Encoding utf8 -Append -InputObject "Paso 3: mostrar mensaje de error."
git stash push -m "WIP login paso 3"

Out-File -FilePath tarea.txt -Encoding utf8 -Append -InputObject "Paso 4: recordar usuario."
git stash push -m "WIP login paso 4"

$list4 = git stash list | Out-String
git stash apply stash@{1}
$cat4 = cat tarea.txt | Out-String
Out-File -FilePath cp4-multiples-stash.txt -Encoding utf8 -InputObject "List de stashes:`n$list4`nComando para aplicar este específico:`ngit stash apply stash@{1}`n`nLos mensajes descriptivos son clave porque sin el -m todos los stashes se llaman igual (WIP on main...) y sería muy difícil distinguirlos después."

# Reto 5
Out-File -FilePath notas-temporales.txt -Encoding utf8 -InputObject "Notas temporales"
git stash -u -m "Incluye archivo no trackeado"
$list5 = git stash list | Out-String
git stash pop
Out-File -FilePath cp5-untracked.txt -Encoding utf8 -InputObject "Comandos usados: git stash -u -m 'test', seguido de git stash pop. `nDiferencia: Un git stash normal ignora tus archivos recién creados que aún no tenían 'git add'. Poniéndole el -u te incluye hasta todo lo que es nuevo y suelto en el stash."

# Limpiar repo para el estado final y añadir todo
git add .
git commit -m "Entrega completada de actividad 6.7 sobre git stash"
git push
