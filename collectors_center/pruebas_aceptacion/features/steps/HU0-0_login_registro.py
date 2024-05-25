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


@given(u'en la pantalla de registro ingreso mi usuario "{usuario}" ,correo "{correo}", contraseña "{contra}" y confirmo contraseña "{confcontra}"')
def step_impl(context,usuario,correo,contra,confcontra):
    username = context.driver.find_element(by=AppiumBy.XPATH, value='//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.EditText[1]')
    username.clear()
    username.click()
    username.send_keys(usuario)

    email = context.driver.find_element(by=AppiumBy.XPATH, value='//android.widget.ScrollView/android.widget.EditText[2]')
    email.clear()
    email.click()
    email.send_keys(correo)

    password = context.driver.find_element(by=AppiumBy.XPATH , value='//android.widget.ScrollView/android.widget.EditText[3]')
    password.clear()
    password.click() ### importante dar click en la caja de texto para que tenga el foco
    password.send_keys(contra)

    confpassword = context.driver.find_element(by=AppiumBy.XPATH , value='//android.widget.ScrollView/android.widget.EditText[4]')
    confpassword.clear()
    confpassword.click() ### importante dar click en la caja de texto para que tenga el foco
    confpassword.send_keys(confcontra)
    context.driver.hide_keyboard()

@when(u'presiono el botón Registrar')
def step_impl(context):
    context.driver.find_element(by=AppiumBy.ACCESSIBILITY_ID, value='Registrar').click()


@then(u'puedo ver la pantalla de Bienvenido')
def step_impl(context):
    welcome_screen_element = context.driver.find_element(by=AppiumBy.XPATH, value='//android.view.View[contains(@content-desc, "Bienvenido")]')
    assert welcome_screen_element.is_displayed(), "No se encontró la pantalla de Bienvenido"

@then(u'puedo ver el mensaje de registro duplicado "{mensaje}"')
def step_impl(context, mensaje): 
    message = context.driver.find_element(by=AppiumBy.XPATH, value=f'//android.view.View[contains(@content-desc, "{mensaje}")]')
    assert message.is_displayed(), f"No se encontró el mensaje '{mensaje}' en la pantalla"


@then(u'puedo ver el mensaje "{mensaje}"')
def step_impl(context, mensaje): 
    message = context.driver.find_element(by=AppiumBy.XPATH, value=f'//android.view.View[contains(@content-desc, "{mensaje}")]')
    assert message.is_displayed(), f"No se encontró el mensaje '{mensaje}' en la pantalla"


@given(u'en la pantalla de registro ingreso mi correo "{correo}", contraseña "{contra}" y confirmo contraseña "{confcontra}"')
def step_impl(context,correo, contra, confcontra):
    email = context.driver.find_element(by=AppiumBy.XPATH, value='//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.EditText[2]')
    email.clear()
    email.click()
    email.send_keys(correo)

    password = context.driver.find_element(by=AppiumBy.XPATH , value='//android.widget.ScrollView/android.widget.EditText[3]')
    password.clear()
    password.click() ### importante dar click en la caja de texto para que tenga el foco
    password.send_keys(contra)

    confpassword = context.driver.find_element(by=AppiumBy.XPATH , value='//android.widget.ScrollView/android.widget.EditText[4]')
    confpassword.clear()
    confpassword.click() ### importante dar click en la caja de texto para que tenga el foco
    confpassword.send_keys(confcontra)
    context.driver.hide_keyboard()


@given(u'en la pantalla de registro ingreso mi usuario "{usuario}" ,correo "{correo}", y confirmo contraseña "{confcontra}"')
def step_impl(context,usuario,correo,confcontra):
    username = context.driver.find_element(by=AppiumBy.XPATH, value='//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.EditText[1]')
    username.clear()
    username.click()
    username.send_keys(usuario)
    
    email = context.driver.find_element(by=AppiumBy.XPATH, value='//android.widget.ScrollView/android.widget.EditText[2]')
    email.clear()
    email.click()
    email.send_keys(correo)

    confpassword = context.driver.find_element(by=AppiumBy.XPATH , value='//android.widget.ScrollView/android.widget.EditText[4]')
    confpassword.clear()
    confpassword.click() ### importante dar click en la caja de texto para que tenga el foco
    confpassword.send_keys(confcontra)
    context.driver.hide_keyboard()
