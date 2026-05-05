#import "@preview/touying:0.7.3": *
#import "@preview/conch:0.1.0": system, terminal,terminal-frame, render-ansi
#import "@preview/theorion:0.6.0": *
#import themes.university: *
#import "@preview/showybox:2.0.4": showybox
#import "@preview/codelst:2.0.2": sourcecode

#set heading(numbering: "1.a")

#show: university-theme.with(
    align: horizon,
    config-info(
      title: [Introducción a git],
      subtitle: [Tutorial práctico],
      author: [María Luz Stewart Harris],
      // date: datetime.today(),
      institution: [Instituto Balseiro],
      contact: "maria.stewart@ib.edu.ar",
      // logo: emoji.school,
    ),
    config-common(
      new-section-slide-fn: new-section-slide.with(numbered: true,),
      // new-subsection-slide-fn: new-section-slide.with(level: 2, numbered: false),
    ),
  )

#let todo(msg) = box(fill: red, width: 100%, height: 100%)[#msg]
#let code(c) = highlight(fill: rgb("dddddd"))[
  #raw(c)
]

//[#text(font: "Lucida Console", c)]
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


#let file(title, code, lang: auto) = showybox(
  title: title,
  frame: (
    border-color: orange,
    title-color: orange.lighten(30%),
    body-color: orange.lighten(95%),
    footer-color: orange.lighten(80%)
  ),
)[
  #sourcecode(lang: lang)[
    #code
  ]
]


#title-slide()


_Tutorial basado en https://git-scm.com/book/en/v2/ _

= ¿Qué es git?

 - Es un sistema de control de versiones (VCS)
#pause
 - Es un software libre y gratis (*"free as in speech _and_ as in beer"*)

#pagebreak()
== ¿Qué ventajas tiene git por sobre otros VCS?
  #pause
 - Es rápido
  #pause
 - Tiene un diseño simple
  #pause
 - Soporta extremadamente bien el desarrollo no lineal (miles de ramas paralelas)
  #pause
 - Es distribuido
  #pause
 - Tiene buena performance incluso para proyectos muy grandes, como el kernel de Linux (de hecho, ahí fue donde nació!)

  #pause
  _Mas información: https://git-scm.com/book/en/v2/Getting-Started-A-Short-History-of-Git _

#pagebreak()
== ¿Cómo guarda todas las versiones de un proyecto?

#figure(
  image("assets/snapshots.png", width: 80%),
  caption: [
    Almacenamiento de información.
  ],
)

#pagebreak()
== ¿Dónde guarda todas las versiones de un proyecto?

#pause
  - (Casi) todas las operaciones son locales!
#pause
  - A diferencia de otros VCS, _toda_ la historia del repositorio se almacena localmente. Se puede trabajar en el repositorio local sin conexión a servidores remotos.
#pause
  - Además, git cuenta con herramientas para sincronizar repositorios locales con repositorios remotos (pero no es _necesario_ para trabajar localmente). #pause
    - Beneficios: 
      - backup de información 
      - trabajo colaborativo

#pagebreak()
== ¿Cómo es la estructura de un repositorio?

#figure(
  image("assets/branching.svg", height: 70%),
  caption: [
    Ejemplo de repositorio. Cada círculo representa una versión diferente del repositorio.
  ],
)

#pagebreak()
== Áreas de trabajo

#figure(
  image("assets/areas.png", width: 80%),
  caption: [
    "Áreas" de trabajo.
  ],
)

#pagebreak()
== Estados de un archivo

#figure(
  image("assets/lifecycle.png", height: 60%),
  caption: [Estados de un archivo]
)

#alternatives[][
  / Untracked: git todavía no lo commiteó (registró) nunca.
][
  / Unmodified / Commited: la versión en el working directory no tiene cambios respecto a la versión del repositorio.
][
  / Modified: la versión del working directory tiene diferencias respecto a la versión del repositorio.
][
  / Staged: tiene cambios respecto a la versión del repositorio y estos cambios fueron agregados al área del stage.
]
#pagebreak()

= Trabajo en repositorio local

== Inicializar un repositorio nuevo
#bash_snippet("01_create_new_repo_00_out.txt")

#pagebreak()

#figure(
  image("assets/capturas_vscode/01_create_new_repo_A.PNG", height: 80%),
)

#figure(
  image("assets/capturas_vscode/01_create_new_repo_B.PNG", height: 80%),
)


== Agregar archivos nuevos al repositorio

#figure(
  image("assets/areas.png", width: 80%),
)

#figure(
  image("assets/lifecycle.png", width: 80%),
)

#emph-block[
  *Paso manual:*
  - Crear un nuevo archivo con el nombre #code("README.md") en el directorio raíz del repositorio. Contenido sugerido:

#file("README.md", lang:"markdown")[```
# My New Repository
In this repository I will put all the code for my project
```]

]


#pagebreak()
Luego, para verificar que se creó correctamente, correr:
#bash_snippet("10_add_file_to_repo_01_out.txt")
#pagebreak()
#bash_snippet("10_add_file_to_repo_02_out.txt", expl: [git detecta un nuevo archivo que no tiene registrado ("Untracked")])

#pagebreak()
#figure(
  image("assets/capturas_vscode/10_add_file_to_repo_A_untracked.PNG", height: 100%),
)

#pagebreak()
#bash_snippet("10_add_file_to_repo_03_out.txt", expl: [Al hacer #code("git add README.md"), el nuevo archivo README.md pasa al área de stage.])
#pagebreak()
#figure(
  image("assets/capturas_vscode/10_add_file_to_repo_B_about_to_stage.PNG", height: 100%),
)
#pagebreak()
#figure(
  image("assets/capturas_vscode/10_add_file_to_repo_C_staged.PNG", height: 100%),
)



#pagebreak()
Al hacer #code("git commit -m \'Added README\'"), el nuevo archivo es "commiteado" (o registrado) en un nuevo commit del repositorio.
#bash_snippet("10_add_file_to_repo_04_out.txt", expl: [ El archivo pasa de "staged" a "unmodified".])


#pagebreak()
#figure(
  grid(columns: (1fr,1fr), align: horizon)[#image("assets/capturas_vscode/10_add_file_to_repo_D_about_to_commit.PNG", height: 100%)][#image("assets/capturas_vscode/10_add_file_to_repo_E_commited.PNG", height: 100%)]
)

#pagebreak()
Para ver el commit recién creado, ejecutar #code("git log"):
#bash_snippet("10_add_file_to_repo_05_out.txt", expl: [El comando #code("git log") muestra el hisorial de commits.])

#pagebreak()
#figure(
  image("assets/capturas_vscode/10_add_file_to_repo_F_git_graph.PNG", width: 90%),
)


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
  - Modificar el archivo #code("README.md"). Sugerencia: agregar una línea que defina quienes son los mantainers del repositorio:

#file("README.md", lang:"markdown")[```
# My New Repository
In this repository I will put all the code for my project
Repo mantainer: Malu
```]

]

#pagebreak()
#bash_snippet("11_modify_file_01_out.txt", )

#pagebreak()
#figure(
  image("assets/capturas_vscode/11_modify_file_A_modifies_state.PNG", height: 80%)
)

#pagebreak()
#figure(
  image("assets/capturas_vscode/11_modify_file_B_diff_view.PNG", width: 100%)
)


#pagebreak()
#bash_snippet("11_modify_file_02_out.txt")

#pagebreak()
#figure(
  image("assets/capturas_vscode/11_modify_file_C_git_graph_after_commit.PNG", height: 80%)
)


=== ¿Qué pasa si se modifica un archivo que está en stage?

#warning-block([
Al hacer #code("git add file1"), se pasa *la versión actual* de `file1` a stage. 

Si se hacen nuevas modificaciones al archivo, *estas no se pasan automaticamente a stage*.
])

#pagebreak()

#emph-block[
  *Paso manual:*
  - Crear un nuevo archivo con el nombre `main.py` en el directorio raíz del repositorio. Contenido sugerido:
#file("main.py", lang:"python")[```
print("Hola mundo")
```]
]

// #pagebreak()
// #bash_snippet("11_modify_file_03_out.txt")
#pagebreak()
Pasamos #code("main.py") a stage:
#bash_snippet("11_modify_file_04_out.txt")
#pagebreak()
#emph-block[
  *Paso manual:*
  - Agregar contenido al archivo `main.py`. Contenido sugerido:
#file("main.py", lang:"python")[```
import numpy as np

print("Hola mundo")
```]
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

/ #code("git diff"): muestra la diferencia entre el stage y el working directory.
/ #code("git diff --cached"): muestra la diferencia entre el último commit y el stage (es decir, los cambios que se agregarían al proximo commit si se ejecuta #code("git commit")).

Más información: https://git-scm.com/docs/git-diff

#pagebreak()
#bash_snippet("11_modify_file_07_out.txt", expl:[
  #code("git diff"): stage vs. working directory

  #code("git diff --cached"): último commit vs. stage
])

#pagebreak()

#figure(
  image("assets/capturas_vscode/11_modify_file_D_git_diff_index_vs_working_dir.PNG", width: 80%),
)

#pagebreak()
#bash_snippet("11_modify_file_08_out.txt", expl: [Al hacer un commit de los cambios en stage, no se modifica el estado del working directory])

#pagebreak()
#bash_snippet("11_modify_file_09_out.txt", expl:[
  #code("git diff"): stage vs. working directory

  #code("git diff --cached"): último commit vs. stage]
)

#pagebreak()
#caution-block[Al ejecutar #code("git status"), suele aparecer el siguiente mensaje:

 > #code("(use \"git checkout -- <file>...\" to discard changes in working directory)")
#align(center)[#box(fill: red, inset: 10pt)[#text(weight:"bold", fill: white)[ESTE COMANDO ELIMINA #underline[PERMANENTEMENTE] LOS CAMBIOS DEL WORKING DIRECTORY]]]

Antes de ejecutarlo, estar 100% seguro que se quieren descartar los cambios del archivo

]

#pagebreak()
#figure(
  image("assets/capturas_vscode/11_modify_file_E_discard_warning.PNG", height: 80%),
)

#pagebreak()
#bash_snippet("11_modify_file_10_out.txt")

#pagebreak()

== Ver historial de commits

Para ver el historial de commits, se puede usar el comando #code("git log").

_Para más información: https://git-scm.com/docs/git-log _

#pagebreak()
#bash_snippet("12_view_commit_history_00_out.txt")

#pagebreak()
#figure(
  image("assets/capturas_vscode/11_modify_file_F_second_commit.PNG", height: 80%),
)


#pagebreak()
#bash_snippet("12_view_commit_history_01_out.txt")

#pagebreak()
#bash_snippet("12_view_commit_history_02_out.txt")

#pagebreak()
#bash_snippet("12_view_commit_history_03_out.txt")

#pagebreak()
Combinación muy útil: 

#code("git log --all --decorate --oneline --graph")
#bash_snippet("12_view_commit_history_04_out.txt")

Regla para memorizar: A DOG
 - A: #code("--all")
 - D: #code("--decorate")
 - O: #code("--oneline")
 - G: #code("--graph")

= Branches

== Una rama simple y merge sin conflictos

#figure(
  image("assets/branching.svg", height: 70%),
  caption: [Ejemplo de estructura de versiones de un repositorio.]
)

#pagebreak()
#grid(columns: (2fr, 1fr))[
#figure(
  image("assets/branching.svg", height: 70%)
)][
  Si tengo un historial de versiones así (por ej.: con muchas ramas), cuando agrego un commit, ¿dónde se agrega?
]

#pagebreak()

#emph("HEAD"): 
 - Puntero que apunta a la rama#footnote([_Es posible apuntar a un commit específico y no una rama. En ese caso, git marca su estado como "detached head". No vamos a ver ese caso de uso._]) donde estamos parados actualmente.
 - Al hacer un commit, se agrega luego del último commit de la rama a la que apunta HEAD.

#pagebreak()

El comando #code("git log --decorate") permite visualizar a que rama apunta HEAD. Por ejemplo:
#bash_snippet("12_view_commit_history_04_out.txt")

La indicación #code("(HEAD->master)") indica que ese commit es el último commit de la rama master, y además, que HEAD apunta a esa rama.

#pagebreak()
En Git Graph de vscode, la rama a la cual apunta HEAD aparece en negrita:
#figure(
  image("assets/capturas_vscode/13_handle_branches_AA_check_HEAD.PNG", height: 60%)
)
(_Nota: Cuando se agreguen más ramas se va a ver mejor la diferencia!_)

#pagebreak()
Próximo objetivo: crear una rama nueva llamada _testing_, agregarle cambios, y luego traer esos cambios a la rama master.

#pagebreak()

#bash_snippet("13_handle_branches_00_out.txt", expl: "Se crea una nueva rama llamada testing, pero el puntero HEAD apunta a la rama master.")

#figure(
  image("assets/head_to_master.png", height: 70%)
)


#pagebreak()
#bash_snippet("13_handle_branches_01_out.txt", expl: [Con el comando #code("git checkout testing"), el puntero HEAD pasa a apuntar a la rama testing.])

_Nota: Para cambiar de rama, también se puede ejecutar el comando:_

_#code("git switch testing")_

#figure(
  image("assets/head_to_testing.png", height: 70%)
)

#pagebreak()
Para crear una rama desde vscode:
#figure(
  image("assets/capturas_vscode/13_handle_branches_A_create_new_branch.PNG", height: 80%)
)
#figure(
  image("assets/capturas_vscode/13_handle_branches_A_create_new_branch_bis.PNG")
)

#grid(columns: (2fr,1fr), column-gutter: 10pt)[
#figure(
  image("assets/capturas_vscode/13_handle_branches_B_now_im_in_testing.PNG", width: 100%)
)][La interfaz de vscode muestra que ahora HEAD esta apuntando a la rama testing.]

#grid(columns: (2fr,1fr), column-gutter: 10pt)[
#figure(
  image("assets/capturas_vscode/13_handle_branches_B_now_im_in_testing.PNG", width: 100%)
)][_Nota: Observar que no fue necesario cambiar HEAD de master a testing, sino que al crear la rama nueva, vscode automáticamente mueve HEAD a la rama recién creada._]


// #pagebreak()
// #bash_snippet("13_handle_branches_02_out.txt")

#emph-block[
  *Paso manual:*
  - Crear un nuevo archivo con el nombre #code("tests.m") en el directorio raíz del repositorio. Ejemplo:

#file("tests.m", lang:"matlab")[```
import matlab.unittest.TestCase
tc = TestCase.forInteractiveUse;
tc.verifyEqual(1+1, 2);
```]

]

#pagebreak()
Hacer un commit con el nuevo archivo:
#bash_snippet("13_handle_branches_03_out.txt")

#pagebreak()
Después de hacer un commit en testing, las ramas testing y master ya no apuntan más al mismo commit:
#figure(
  image("assets/advance-testing.png", height: 70%)
)

#pagebreak()
#bash_snippet("13_handle_branches_04_out.txt")

#figure(
  image("assets/capturas_vscode/13_handle_branches_C_new_commit_in_testing.PNG")
)

#pagebreak()
Para incorporar los cambios de la rama testing a la master, primero hay que pararse en la rama master:
#figure(
  image("assets/head-to-master-about-to-merge-testing.png", height: 70%)
)

#bash_snippet("13_handle_branches_05_out.txt")

#figure(
  image("assets/capturas_vscode/13_handle_branches_D_checkout_master.PNG")
)
#figure(
  image("assets/capturas_vscode/13_handle_branches_E_checkout_master_v2.PNG")
)
#figure(
  image("assets/capturas_vscode/13_handle_branches_F_checkout_master_v3.PNG")
)

#pagebreak()
Una vez parados en master, se usa el comando #code("git merge testing") para traer los cambios de la rama testing a la rama master:

#figure(
  image("assets/merge-testing-to-master.png", height: 70%)
)


#bash_snippet("13_handle_branches_06_out.txt")

#figure(
  image("assets/capturas_vscode/13_handle_branches_G_merge_testing_A.PNG")
)
#figure(
  image("assets/capturas_vscode/13_handle_branches_H_merge_testing_B.PNG")
)
#figure(
  image("assets/capturas_vscode/13_handle_branches_I_merge_testing_C.PNG")
)
#figure(
  image("assets/capturas_vscode/13_handle_branches_J_merge_testing_D.PNG")
)


== Merge con conflictos

Crear una nueva rama llamada "iss53"

#bash_snippet("13_handle_merge_conflict_00_out.txt", expl: [El comando #code("git checkout -b <nombre de rama>") permite crear la rama y hacer checkout de la rama nueva en un solo comando.])

#pagebreak()
#bash_snippet("13_handle_merge_conflict_01_out.txt")

#pagebreak()
#bash_snippet("13_handle_merge_conflict_02_out.txt")

#pagebreak()
#bash_snippet("13_handle_merge_conflict_03_out.txt")

#pagebreak()
#bash_snippet("13_handle_merge_conflict_04_out.txt")

#pagebreak()
#bash_snippet("13_handle_merge_conflict_05_out.txt")

#pagebreak()
#bash_snippet("13_handle_merge_conflict_06_out.txt")

#pagebreak()
#bash_snippet("13_handle_merge_conflict_07_out.txt")

#pagebreak()
#bash_snippet("13_handle_merge_conflict_08_out.txt")

// = Trabajo con repositorio remoto
// == Clonar un repositorio remoto existente

// // #bash_snippet("00_clone_existing_repo_0_out.txt")
// #todo[CLONAR REPO REMOTO]

// == Importar nuevos cambios del repositorio remoto

// == Mandar cambios locales al repositorio remoto

// = Submódulos