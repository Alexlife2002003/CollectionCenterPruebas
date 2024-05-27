from behave import given, when, then
from appium import webdriver
from appium.webdriver.common.appiumby import AppiumBy
from appium.options.android import UiAutomator2Options
import time
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import logging
import os

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

def send_keys_with_retry(element, text, retries=10):
    for attempt in range(retries):
        element.clear()
        element.send_keys(text)
        if element.get_attribute('text') == text:
            return True
        time.sleep(3)
    logger.warning(f"Failed to set text '{text}' in element after {retries} retries")
    return False

def disable_wifi():
    os.system("adb shell svc wifi disable")

def enable_wifi():
    os.system("adb shell svc wifi enable")

def disable_data():
    os.system("adb shell svc data disable")

def enable_data():
    os.system("adb shell svc data enable")

@given(u'que abro la aplicación')
def step_impl(context):
    time.sleep(20)
    # Asegúrate de que la aplicación esté abierta
    pass

@given(u'espero un rato')
def step_impl(context):
    pass

@given(u'doy click en el boton Registrarse')
def step_impl(context):
    WebDriverWait(context.driver, 30).until(
        EC.element_to_be_clickable((AppiumBy.ACCESSIBILITY_ID, 'Registrarse'))
    ).click()

@given(u'ingreso mi usuario "{usuario}"')
def step_impl(context, usuario):
    username = WebDriverWait(context.driver, 30).until(
        EC.presence_of_element_located((AppiumBy.XPATH, '//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.EditText[1]'))
    )
    username.clear()
    username.click()
    success=send_keys_with_retry(username,usuario)
    assert success, "Failed to input text in the field"

@given(u'luego ingreso mi correo "{correo}"')
def step_impl(context, correo):
    email = WebDriverWait(context.driver, 30).until(
        EC.presence_of_element_located((AppiumBy.XPATH, '//android.widget.ScrollView/android.widget.EditText[2]'))
    )
    email.clear()
    email.click()
    success=send_keys_with_retry(email,correo)
    assert success, "Failed to input text in the field"

@given(u'luego ingreso mi contraseña "{contra}"')
def step_impl(context, contra):
    password = WebDriverWait(context.driver, 30).until(
        EC.presence_of_element_located((AppiumBy.XPATH, '//android.widget.ScrollView/android.widget.EditText[3]'))
    )
    password.clear()
    password.click()
    password.send_keys(contra)
    success=send_keys_with_retry(password,contra)
    assert success, "Failed to input text in the field"

@given(u'luego confirmo mi contraseña "{confcontra}"')
def step_impl(context, confcontra):
    confpassword = WebDriverWait(context.driver, 30).until(
        EC.presence_of_element_located((AppiumBy.XPATH, '//android.widget.ScrollView/android.widget.EditText[4]'))
    )
    confpassword.clear()
    confpassword.click()
    confpassword.send_keys(confcontra)
    success=send_keys_with_retry(confpassword,confcontra)
    assert success, "Failed to input text in the field"

@when(u'presiono el botón Registrar')
def step_impl(context):
    context.driver.hide_keyboard()
    registrar_button = WebDriverWait(context.driver, 30).until(
        EC.element_to_be_clickable((AppiumBy.ACCESSIBILITY_ID, 'Registrar'))
    )
    registrar_button.click()

@then(u'puedo ver la pantalla de Bienvenido')
def step_impl(context):
    welcome_screen_element = WebDriverWait(context.driver, 30).until(
        EC.presence_of_element_located((AppiumBy.XPATH, '//android.view.View[contains(@content-desc, "Bienvenido")]'))
    )
    assert welcome_screen_element.is_displayed(), "No se encontró la pantalla de Bienvenido"

@then(u'puedo ver el mensaje de que usuario se encuentra en uso')
def step_impl(context):
    message = WebDriverWait(context.driver, 30).until(
        EC.presence_of_element_located((AppiumBy.XPATH, '//android.view.View[@content-desc="Usuario ya se encuentra en uso"]'))
    )
    assert message.is_displayed(), f"No se encontró el mensaje 'Usuario ya se encuentra en uso' en la pantalla"

@then(u'puedo ver el mensaje de registro duplicado "{mensaje}"')
def step_impl(context, mensaje): 
    message = WebDriverWait(context.driver, 30).until(
        EC.presence_of_element_located((AppiumBy.XPATH, f'//android.view.View[@content-desc="{mensaje}"]'))
    )
    assert message.is_displayed(), f"No se encontró el mensaje '{mensaje}' en la pantalla"

@then(u'puedo ver el mensaje de que las contraseñas no son iguales')
def step_impl(context):
    message = WebDriverWait(context.driver, 30).until(
        EC.presence_of_element_located((AppiumBy.XPATH, '//android.view.View[@content-desc="Las contraseñas no son iguales"]'))
    )
    assert message.is_displayed(), f"No se encontró el mensaje 'Las contraseñas no son iguales' en la pantalla"

@given(u'ingreso mi correo "{correo}"')
def step_impl(context,correo):
    email = WebDriverWait(context.driver, 30).until(
        EC.presence_of_element_located((AppiumBy.XPATH, '//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.EditText[2]'))
    )
    email.clear()
    email.click()
    success=send_keys_with_retry(email,correo)
    assert success, "Failed to input text in the field"

@then(u'puedo ver el mensaje "{mensaje}"')
def step_impl(context, mensaje): 
    message = WebDriverWait(context.driver, 30).until(
        EC.presence_of_element_located((AppiumBy.XPATH, f'//android.view.View[@content-desc="{mensaje}"]'))
    )
    assert message.is_displayed(), f"No se encontró el mensaje '{mensaje}' en la pantalla"

@given(u'no tengo internet')
def step_impl(context):
    disable_wifi()
    disable_data()
    time.sleep(3)

@given(u'conecto la conexión a internet')
def step_impl(context):
    enable_wifi()
    enable_data()
    time.sleep(3)