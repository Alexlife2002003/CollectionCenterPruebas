Característica: Iniciar sesión y registro usuario
    Como joven coleccionista deseo que mis colecciones 
    y datos personales sean privados para que no sean 
    accedidos por terceros no autorizados.

        Escenario: Registro éxitoso
            Dado que abro la aplicación
            Y espero un rato
            Y doy click en el boton Registrarse
            Y espero un rato
            Y ingreso mi usuario "Noexiste"
            Y luego ingreso mi correo "noexiste@gmail.com"
            Y luego ingreso mi contraseña "Test123!"
            Y luego confirmo mi contraseña "Test123!"
            Cuando presiono el botón Registrar
            Entonces puedo ver la pantalla de Bienvenido

        Escenario: Registro sin internet
            Dado que abro la aplicación
            Y espero un rato
            Y doy click en el boton Registrarse
            Y no tengo internet
            Y espero un rato
            Y ingreso mi usuario "Test123"
            Y luego ingreso mi correo "test123@gmail.com"
            Y luego ingreso mi contraseña "Test123!"
            Y luego confirmo mi contraseña "Test123!"
            Cuando presiono el botón Registrar
            Entonces puedo ver el mensaje "Sin conexión a Internet"

       Escenario: Registro duplicado usuario
            Dado que abro la aplicación
            Y espero un rato
            Y conecto la conexión a internet
            Y doy click en el boton Registrarse
            Y espero un rato
            Y ingreso mi usuario "Test123"
            Y luego ingreso mi correo "ale@gmail.com"
            Y luego ingreso mi contraseña "Test123!"
            Y luego confirmo mi contraseña "Test123!"
            Cuando presiono el botón Registrar
            Entonces puedo ver el mensaje de que usuario se encuentra en uso

        Escenario: Registro duplicado correo
            Dado que abro la aplicación
            Y espero un rato
            Y doy click en el boton Registrarse
            Y espero un rato
            Y ingreso mi usuario "ale"
            Y luego ingreso mi correo "test123@gmail.com"
            Y luego ingreso mi contraseña "Test123!"
            Y luego confirmo mi contraseña "Test123!"
            Cuando presiono el botón Registrar
            Entonces puedo ver el mensaje de registro duplicado "Correo ya se encuentra en uso"
        
        Escenario: Registro contraseñas no son iguales
            Dado que abro la aplicación
            Y espero un rato
            Y doy click en el boton Registrarse
            Y espero un rato
            Y ingreso mi usuario "Test123L"
            Y luego ingreso mi correo "test123@gmail.com"
            Y luego ingreso mi contraseña "Tes3!"
            Y luego confirmo mi contraseña "Test123!"
            Cuando presiono el botón Registrar
            Entonces puedo ver el mensaje de que las contraseñas no son iguales
        
        Escenario: Registro sin nombre de usuario
            Dado que abro la aplicación
            Y espero un rato
            Y doy click en el boton Registrarse
            Y ingreso mi correo "test123@gmail.com"
            Y luego ingreso mi contraseña "Test123!"
            Y luego confirmo mi contraseña "Test123!"
            Cuando presiono el botón Registrar
            Entonces puedo ver el mensaje "Ingresa los datos faltantes."

        Escenario: Registro sin correo
            Dado que abro la aplicación
            Y espero un rato
            Y doy click en el boton Registrarse
            Y ingreso mi usuario "Test123"
            Y luego ingreso mi contraseña "Test123!"
            Y luego confirmo mi contraseña "Test123!"
            Cuando presiono el botón Registrar
            Entonces puedo ver el mensaje "Ingresa los datos faltantes."

        Escenario: Registro sin contraseña
            Dado que abro la aplicación
            Y espero un rato
            Y doy click en el boton Registrarse
            Y ingreso mi usuario "Test123"
            Y luego ingreso mi correo "test123@gmail.com"
            Y luego confirmo mi contraseña "Test123!"
            Cuando presiono el botón Registrar
            Entonces puedo ver el mensaje "Ingresa los datos faltantes."