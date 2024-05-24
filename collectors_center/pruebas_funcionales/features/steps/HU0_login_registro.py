from behave import given, when, then
from appium import webdriver
from appium.webdriver.common.appiumby import AppiumBy
from appium.options.android import UiAutomator2Options
import time
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC


@given(u'que abro la aplicación')
def step_impl(context):
    pass



@given(u'doy click en el boton Registrarse')
def step_impl(context):
    context.driver.find_element(by=AppiumBy.ACCESSIBILITY_ID, value='Registrarse').click()
    time.sleep(5)


@given(u'en la pantalla de registro ingreso mi usuario "{usuario}" ,correo "{correo}", contraseña "{contra}" y confirmo contraseña "{confcontra}"')
def step_impl(context,usuario,correo,contra,confcontra):
    time.sleep(2)
    username = context.driver.find_element(by=AppiumBy.XPATH, value='//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.EditText[1]')
    username.clear()
    username.click()
    time.sleep(1) ### después del click requiere algo te tiempo, para empezar a escribir
    username.send_keys(usuario)
    time.sleep(2)
    
    email = context.driver.find_element(by=AppiumBy.XPATH, value='//android.widget.ScrollView/android.widget.EditText[2]')
    email.clear()
    email.click()
    time.sleep(2) ### después del click requiere algo te tiempo, para empezar a escribir
    email.send_keys(correo)

    password = context.driver.find_element(by=AppiumBy.XPATH , value='//android.widget.ScrollView/android.widget.EditText[3]')
    password.clear()
    password.click() ### importante dar click en la caja de texto para que tenga el foco
    time.sleep(2) ### después del click requiere algo te tiempo, para empezar a escribir
    password.send_keys(contra)

    confpassword = context.driver.find_element(by=AppiumBy.XPATH , value='//android.widget.ScrollView/android.widget.EditText[4]')
    confpassword.clear()
    confpassword.click() ### importante dar click en la caja de texto para que tenga el foco
    time.sleep(2) ### después del click requiere algo te tiempo, para empezar a escribir
    confpassword.send_keys(confcontra)
    context.driver.hide_keyboard()
    time.sleep(2)


@when(u'presiono el botón Registrar')
def step_impl(context):
    context.driver.find_element(by=AppiumBy.ACCESSIBILITY_ID, value='Registrar').click()
    time.sleep(2)


@then(u'puedo ver la pantalla de Bienvenido')
def step_impl(context):
    time.sleep(3)
    welcome_screen_element = context.driver.find_element(by=AppiumBy.XPATH, value='//android.view.View[contains(@content-desc, "Bienvenido")]')
    assert welcome_screen_element.is_displayed(), "No se encontró la pantalla de Bienvenido"

@then(u'puedo ver el mensaje "{mensaje}"')
def step_impl(context, mensaje):
    message = context.driver.find_element(by=AppiumBy.XPATH, value=f'//android.view.View[contains(@content-desc, "{mensaje}")]')
    assert message.is_displayed(), f"No se encontró el mensaje '{mensaje}' en la pantalla"

#//android.view.View[@content-desc="Usuario ya se encuentra en uso "]

