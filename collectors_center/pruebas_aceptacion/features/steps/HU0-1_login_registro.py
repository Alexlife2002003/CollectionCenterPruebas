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


@given(u'doy click en el boton Acceder')
def step_impl(context):
    WebDriverWait(context.driver, 30).until(
        EC.element_to_be_clickable((AppiumBy.ACCESSIBILITY_ID, 'Acceder'))
    ).click()

@when(u'presiono el botón Ingresar')
def step_impl(context):
    context.driver.hide_keyboard()
    WebDriverWait(context.driver, 30).until(
        EC.element_to_be_clickable((AppiumBy.ACCESSIBILITY_ID, 'Ingresar'))
    ).click()
    
@given(u'en login ingreso mi correo "{correo}"')
def step_impl(context,correo):
    email = WebDriverWait(context.driver, 30).until(
        EC.presence_of_element_located((AppiumBy.XPATH, '//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.EditText[1]'))
    )
    email.clear()
    email.click()
    success=send_keys_with_retry(email,correo)
    assert success, "Failed to input text in the field"

@given(u'luego en login ingreso mi contraseña "{contra}"')
def step_impl(context,contra):
    password = WebDriverWait(context.driver, 30).until(
        EC.presence_of_element_located((AppiumBy.XPATH, '//android.widget.ScrollView/android.widget.EditText[2]'))
    )
    password.clear()
    password.click()
    success = send_keys_with_retry(password,contra)
    assert success, "Failed to input text in the field"


@given(u'en login ingreso mi contraseña "{contra}"')
def step_impl(context,contra):
    password = WebDriverWait(context.driver, 30).until(
        EC.presence_of_element_located((AppiumBy.XPATH, '//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.EditText[2]'))
    )
    password.clear()
    password.click()
    success = send_keys_with_retry(password,contra)
    assert success, "Failed to input text in the field"





