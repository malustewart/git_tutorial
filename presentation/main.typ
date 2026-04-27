#import "@preview/touying:0.7.3": *
#import "@preview/conch:0.1.0": system, terminal,terminal-frame, render-ansi
#import "@preview/theorion:0.6.0": *

#import themes.university: *

#show: university-theme.with(
    align: horizon,
  )

#let todo(msg) = box(fill: red, width: 100%, height: 100%)[#msg]
#let code(c) = highlight(fill: rgb("dddddd"))[#text(font: "Lucida Console", c)]
#set terms(separator: [: ])

#let bash_snippet(code, expl: none) = {
  let terminal = {terminal-frame(
      title: "git tutorial",
      font: (
        font: "Lucida Console", size: 14pt
      ),
      theme: "retro",
      chrome: "plain",
      width: 100%
      )[
      #render-ansi(
        read("bash_snippets/" + code).replace(" --no-pager",""),
        theme: "monokai",
      )
    ]
  text(code, size: 10pt)
  }
  if expl == none {
    terminal
  } else {
    cols(columns: (2.5fr, 1fr))[
      #terminal
    ][
      #expl
    ]
  }
}

#title-slide()

= Introducción a git

#figure(
  image("assets/areas.png", width: 80%),
  caption: [
    "Áreas" de trabajo.
  ],
)

#pagebreak()

== Estados de un archivo

#figure(
  image("assets/lifecycle.png", width: 80%),
)

#alternatives[][
  / Untracked: git todavía no lo commiteó (registró) nunca.
][
  / Unmodified / Commited: la versión en el working directory no tiene cambios respecto a la versión del repositorio.
][
  / Modified: la versión del working directory tiene diferencias respecto a la versión del repositorio.
][
  / Staged: tiene cambios respecto al repositorio que fueron agregados al área del stage (listos para incluirse en el próximo commit).
]
#pagebreak()

= Trabajo en repositorio local

== Clonar un repositorio existente

// #bash_snippet("00_clone_existing_repo_0_out.txt")
#todo[CLONAR REPO REMOTO]

== Inicializar un repositorio nuevo
#bash_snippet("01_create_new_repo_00_out.txt")
#bash_snippet("01_create_new_repo_01_out.txt")

== Agregar archivos nuevos al repositorio

#figure(
  image("assets/areas.png", width: 80%),
)

#figure(
  image("assets/lifecycle.png", width: 80%),
)

#emph-block[
  *Paso manual:*
  - Crear un nuevo archivo con el nombre #code[README.md] en el directorio raíz del repositorio. Contenido sugerido:
  ```
# My New Repository
In this repository I will put all the code for my project
  ```
]
#pagebreak()
Luego, para verificar que se creó correctamente, correr:
#bash_snippet("10_add_file_to_repo_01_out.txt")
#pagebreak()
#bash_snippet("10_add_file_to_repo_02_out.txt", expl: [git detecta un nuevo archivo que no tiene registrado ("Untracked")])
#pagebreak()
#bash_snippet("10_add_file_to_repo_03_out.txt", expl: [Al hacer #code[git add README.md], el nuevo archivo README.md pasa al área de stage.])
#pagebreak()
Al hacer #code[git commit -m \'Added README\'], el nuevo archivo es "commiteado" (o registrado) en un nuevo commit del repositorio.
#bash_snippet("10_add_file_to_repo_04_out.txt", expl: [ El archivo pasa de "staged" a "unmodified".])

#pagebreak()
Para ver el commit recién creado, ejecutar #code[git log]:
#bash_snippet("10_add_file_to_repo_05_out.txt", expl: [El comando #code[git log] muestra el hisorial de commits.])

== Agregar cambios de archivos existentes al repositorio

#figure(
  image("assets/lifecycle.png", width: 80%),
)

#figure(
  image("assets/areas.png", width: 80%),
)


#pagebreak()
// #bash_snippet("11_modify_file_00_out.txt")
#emph-block[
  *Paso manual:*
  - Modificar el archivo #code[README.md]. Sugerencia: agregar una línea que defina quienes son los mantainers del repositorio:
```
# My New Repository
In this repository I will put all the code for my project
Repo mantainer: Malu
```
]
#pagebreak()
#bash_snippet("11_modify_file_01_out.txt", )
#pagebreak()
#bash_snippet("11_modify_file_02_out.txt")
#pagebreak()

=== ¿Qué pasa si se modifica un archivo que está en stage?

#warning-block([
Al hacer #code[git add file1], se pasa *la versión actual* de `file1` a stage. 

Si se hacen nuevas modificaciones al archivo, *estas no se pasan automaticamente a stage*.
])

#pagebreak()

#emph-block[
  *Paso manual:*
  - Crear un nuevo archivo con el nombre `main.py` en el directorio raíz del repositorio. Contenido sugerido:
  ```
print('Hello World')
  ```
]
// #pagebreak()
// #bash_snippet("11_modify_file_03_out.txt")
#pagebreak()
Pasamos #code[main.py] a stage:
#bash_snippet("11_modify_file_04_out.txt")
#pagebreak()
#emph-block[
  *Paso manual:*
  - Agregar contenido al archivo `main.py`. Contenido sugerido:
  ```
import numpy as numpy


print('Hello World')
  ```
]

#pagebreak()

#figure(
  image("assets/areas.png", width: 80%),
)

#pagebreak()

#figure(
  image("assets/lifecycle.png", width: 80%),
)
// #bash_snippet("11_modify_file_05_out.txt")
#pagebreak()
#bash_snippet("11_modify_file_06_out.txt")
#pagebreak()

/ #code[git diff]: muestra la diferencia entre el último commit y el working directory.
/ #code[git diff \-\-cached]: muestra la diferencia entre el último commit y el stage (es decir, los cambios que se agregarían al proximo commit si se ejecuta #code[git commit]).

Más información: https://git-scm.com/docs/git-diff

#pagebreak()
#bash_snippet("11_modify_file_07_out.txt")
#pagebreak()



= Branches

= Trabajo con repositorio remoto

= Submódulos