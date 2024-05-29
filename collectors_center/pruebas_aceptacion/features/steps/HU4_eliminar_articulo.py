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


# WHEN
@when(u'presiono el boton Eliminar de la ventana emergente')
def step_impl(context):
  WebDriverWait(context.driver, 30).until(EC.element_to_be_clickable((AppiumBy.ACCESSIBILITY_ID, 'Eliminar'))).click()