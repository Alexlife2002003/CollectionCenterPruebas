Característica: Iniciar sesión
    Cómo usuario de la app
    quiero iniciar sesión
    para realizar mis actividades dentro de la app

        Escenario: Login éxitoso
            Dado que abro la aplicación
              Y en la pantalla de login ingreso mi usaurio "holamundo" y contraseña "admin123"
             Cuando presiono el botón Ingresar
             Entonces puedo ver la lista de materias

        Escenario: Login no éxitoso
            Dado que abro la aplicación
              Y en la pantalla de login ingreso mi usaurio "holamundos" y contraseña "admin123"
             Cuando presiono el botón Ingresar
             Entonces puedo ver el mensaje "Login fail"
