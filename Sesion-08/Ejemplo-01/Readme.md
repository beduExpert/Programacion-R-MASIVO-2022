# Ejemplo 01. Git y Github

#### Objetivo

- Crear una cuenta en Github y aprender a crear repositorios
- Entender los comandos básicos de Git y su uso para el control de versiones

#### Requisitos
- Tener una cuenta de Github
- Tener instalado Git o tener una cuenta de RStudioCloud

#### Desarollo

Github es un repositorio gratuito en línea que permite gestionar proyectos y versionar el desarrolo de código y aplicaciones. Esta interfaz fue desarrollada por Microsoft, quien se encarga de su mantenimiento. 

Por otro lado, Git es un software de control de versiones distribuido de código abierto desarrollado y mantenido Linux.

Git y Github se complementan para brindar una programa y plataforma muy poderoso para el desarrollo de proyectos de código y aplicaciones, a tal grado que millones de empresas alrededor del mundo lo utilizan como parte fundamental del control y administración de su quehacer tecnológico y de datos.

Comándos básicos de Git:
- Clonar respositorio desde Github: git clone [github_url.git] 
- Crear una nueva rama: git branch [branch-name]
- Enlistar todas las ramas: git branch -a / --all
- Cambiarse a otra rama: git checkout [branch-name]
- Revisar el área de preparación: git status
- Agregar archivos modificados al área de preparación: git add [file_name]/--all
- Confirmar archivos modificados: git commit -m "Mensaje"
- Revisar repositorio remoto: git remote -v
- Agregar repositorio remoto: git remote add remote-name url
- Enviar archivos al repositorio remoto: git push remote-name branch-name
- Fusionar una branch con otro (usualmente main): git merge rama-fuente rama-destino
- Actualizar branch local con cambios en repositorio remoto: git pull remote-name branch-name
