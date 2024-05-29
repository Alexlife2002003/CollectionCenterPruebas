from behave import given, when, then
from appium import webdriver
from appium.webdriver.common.appiumby import AppiumBy
from appium.options.android import UiAutomator2Options
import time
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import logging

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

@given(u'presiono el botón Ingresar')
def step_impl(context):
    context.driver.hide_keyboard()
    WebDriverWait(context.driver, 30).until(
        EC.element_to_be_clickable((AppiumBy.ACCESSIBILITY_ID, 'Ingresar'))
    ).click()

@given(u'presiono el boton hamburguesa')
def step_impl(context):
    WebDriverWait(context.driver, 30).until(
        EC.element_to_be_clickable((AppiumBy.XPATH, '//android.widget.Button[@content-desc="Open navigation menu"]'))
    ).click()


@given(u'presiono Articulos')
def step_impl(context):
    WebDriverWait(context.driver, 30).until(
        EC.element_to_be_clickable((AppiumBy.XPATH, '//android.widget.ImageView[@content-desc="Artículos"]'))
    ).click()

@given(u'presiono el dropdown de categoria "{categoria}"')
def step_impl(context,categoria):
    WebDriverWait(context.driver, 30).until(
        EC.element_to_be_clickable((AppiumBy.XPATH, f'//android.widget.Button[@content-desc="{categoria}"]'))
    ).click()

@given(u'selecciono la categoria "{categoria}"')
def step_impl(context,categoria):
    WebDriverWait(context.driver, 30).until(
        EC.element_to_be_clickable((AppiumBy.XPATH, f'//android.view.View[@content-desc="{categoria}"]'))
    ).click()

@given(u'le doy click en el boton de mas')
def step_impl(context):
    WebDriverWait(context.driver, 30).until(
        EC.element_to_be_clickable((AppiumBy.XPATH, '//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.Button[2]'))
    ).click()

@given(u'selecciono el icono de imagen')
def step_impl(context):
    WebDriverWait(context.driver, 30).until(
        EC.element_to_be_clickable((AppiumBy.XPATH, '//android.widget.ImageView'))
    ).click()

@given(u'selecciono la opcion de camara')
def step_impl(context):
    WebDriverWait(context.driver, 30).until(
        EC.element_to_be_clickable((AppiumBy.XPATH, '//android.view.View[@content-desc="Camera"]'))
    ).click()


@given(u'tomo la foto')
def step_impl(context):
    WebDriverWait(context.driver, 30).until(
        EC.element_to_be_clickable((AppiumBy.XPATH, '//android.widget.ImageView[@content-desc="Shutter"]'))
    ).click()


@given(u'acepto la foto')
def step_impl(context):
    WebDriverWait(context.driver, 30).until(
        EC.element_to_be_clickable((AppiumBy.XPATH, '//android.widget.ImageButton[@content-desc="Done"]'))
    ).click()


@given(u'le asigno un nombre "{name}"')
def step_impl(context,name):
    nombre = WebDriverWait(context.driver, 30).until(
        EC.presence_of_element_located((AppiumBy.XPATH, '//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.widget.EditText[1]'))
    )
    nombre.clear()
    nombre.click()
    success=send_keys_with_retry(nombre,name)
    context.driver.hide_keyboard()
    assert success, "Failed to input text in the field"


@given(u'presiono Guardar')
def step_impl(context):

    WebDriverWait(context.driver, 30).until(
        EC.element_to_be_clickable((AppiumBy.ACCESSIBILITY_ID, 'Guardar'))
    ).click()





