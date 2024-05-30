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

# GIVEN
@given(u'presiono el boton de editar al lado del nombre')
def step_impl(context):
    WebDriverWait(context.driver, 30).until(
       EC.element_to_be_clickable((AppiumBy.ANDROID_UIAUTOMATOR, 'new UiSelector().className("android.widget.Button").instance(2)'))
    ).click()


@given(u'cambio el nombre "{nombre_anterior}" a "{nombre_nuevo}"')
def step_impl(context, nombre_anterior, nombre_nuevo):
  name = WebDriverWait(context.driver, 30).until(
     EC.presence_of_element_located((AppiumBy.XPATH, '//android.widget.ScrollView/android.widget.EditText[1]'))
  )
  success=send_keys_with_retry(name, nombre_nuevo)
  context.driver.hide_keyboard()
  assert success, "Failed to input text in the field"


# WHEN
@when(u'presiono el icono de palomita')
def step_impl(context):
  WebDriverWait(context.driver, 30).until(
       EC.element_to_be_clickable((AppiumBy.XPATH, 'new//android.widget.ScrollView/android.widget.Button[1] '))
  ).click()