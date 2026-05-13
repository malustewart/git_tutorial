# Setup en github

## Creación de cuenta
Seguir [la sección _Signing up for a new personal account_ de esta guía](https://docs.github.com/en/get-started/start-your-journey/creating-an-account-on-github#signing-up-for-a-new-personal-account) para hacerse una cuenta en github.

## Configuración de comunicación por HTTPS

Para comunicarse por HTTPS, dependiendo de la red en la que se esta conectado, puede ser necesario configurar un proxy. En caso de requerir proxy, ejecutar:

```
git config --global http.proxy <url de proxy>:<puerto de proxy>
git config --global https.proxy <url de proxy>:<puerto de proxy>
```

```
git config --global --unset http.proxy
git config --global --unset https.proxy
```

## Configuración de comunicación por SSH (opcional)

La comunicación por SSH permite interactuar con el servidor sin tener que hacer una autenticación manual cada vez que se quiere mandar o recibir cambios. Se marca como opcional porque puede ser más difícil de configurar que la comunicacion por HTTPS.

Seguir [esta guía (windows)](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account) o [esta guía (Linux)](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account?platform=linux) para configurar la conexión entre una computadora y github. Este proceso se tiene que repetir siempre que se utilice una computadora nueva o un usuario nuevo.

 > Nota: mantener el tipo de key como Authentication Key.

 > Nota 2: En caso de usar Windows con wsl (Linux), para github la parte Windows es una computadora separada de la parte de wsl. En caso de querer acceder a github tanto desde Windows como desde wsl, es necesario configurar la comunicación SSH en ambos sistemas operativos.

Por último, en caso de utilizar un proxy, se lo debe especificar en el archivo de configuración de la comunicación ssh. Para activarlo para github:

 - Abrir el archivo de configuración de SSH llamad `config`, o crearlo si no existe.
   - En Windows se encuentra ubicado en `C:/Users/<usuario>/.ssh/config` (reemplaar `<usuario>` por el nombre de usuario de Windows).
   - En Linux/wsl se encuentra ubicado en `/home/<usuario>/.ssh/config`(reemplaar `<usuario>` por el nombre de usuario de Linux/wsl).

 > Nota: el nombre del archivo debe ser simplemente `config` sin ninguna extensión (por ejemplo, no debe llamarse `config.txt`).

 - Copiar el siguiente contenido al archivo `config`:
Para Windows:
```
//TODO: completar este contenido
```

Para Linux/wsl:
```
//TODO: completar este contenido
```


## Clonar un repositorio

Una vez configurada la nueva cuenta en github y la comunicación (ya sea por HTTP o SSH), es posible clonar repositorios por SSH. 

### Por HTTPS
Para clonar un repositorio por HTTPS, correr:
```
git clone https:github.com/<usuario>/<nombre del repositorio remoto>.git <nombre del respositorio local>
```
Por ejemplo, para clonar el repositorio listo para hacer el merge con conflicto del ejercicio visto en clase, correr:
```
https://github.com/malustewart/git-tutorial-merge-example.git mynewrepo
```

Esto debería clonar el repositorio llamado `git-tutorial-merge-example` de la usuaria `malustewart`, y guardarlo en una carpeta llamada `mynewrepo`.


### Por SSH
Para clonar un repositorio por SSH, correr:
```
git clone git@github.com:<usuario>/<nombre del repositorio remoto>.git <nombre del respositorio local>
```
Por ejemplo, para clonar el repositorio listo para hacer el merge con conflicto del ejercicio visto en clase, correr:
```
git clone git@github.com:malustewart/git-tutorial-merge-example.git mynewrepo
```

Esto debería clonar el repositorio llamado `git-tutorial-merge-example` de la usuaria `malustewart`, y guardarlo en una carpeta llamada `mynewrepo`.

### ¿Qué hacer si tengo errores al intentar clonar?

 - Revisar que se haya configurado correctamente el proxy en caso de estar en una red que lo utilice, o de haberlo desconfigurado en caso de haberse cambiado a una red que no lo utilice.

 - [Guía de github con problemas comunes a la hora de clonar](https://docs.github.com/en/repositories/creating-and-managing-repositories/troubleshooting-cloning-errors)

# Ejercicio merge con resolución manual de conflictos

La sección 3.b ("Merge con conflictos") de la presentación tiene el paso a paso de un ejercicio para resolver un merge con conflictos, tanto por línea de comandos como por interfaz gráfica de vscode.

 - Opción A) resolver todos los pasos de la sección 3.b. Estos pasos incluyen:
    - Hacer commits y ramas para preparar el repositorio para hacer un merge con conflictos (sección 3.b.a. de la presentación)
    - Hacer un merge con conflictos (sección 3.b.b. de la presentación)

 - Opción B) adelantar todos los pasos de preparación de repositorio clonando un repositorio existente y solo hacer el merge con conflicto. Esto incluye:
    - Clonar el repositorio llamado `git-tutorial-merge-example` de la usuaria `malustewart` (requiere completar la sección [Setup en Github](#setup-en-github) explicada previamente).
    - Acceder al repositorio clonado y hacer un merge con conflictos (sección 3.b.b de la presentación). La única diferencia es que algunas ramas apareceran con el nombre `origin/<nombre de rama>` en vez de `<nombre de rama>` (por ejemplo, `origin/iss53` en lugar de `iss53`) pero el instructivo puede seguirse igualmente.



