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


@given(u'le doy la descripcion "{desc}"')
def step_impl(context, desc):
    try:
        descripcion = WebDriverWait(context.driver, 30).until(
            EC.presence_of_element_located((AppiumBy.ANDROID_UIAUTOMATOR, 'new UiSelector().className("android.widget.EditText").instance(1)'))
        )
        descripcion.clear()
        descripcion.click()
        success = send_keys_with_retry(descripcion, desc)
        context.driver.hide_keyboard()
        assert success, "Failed to input text in the field"
    except Exception as e:
        logger.error(f"Error in 'le doy la descripcion': {e}")
        raise


@given(u'le doy click en el articulo "{numero}"')
def step_impl(context, numero):
    try:
        numero = int(numero)  # Convertir el número a entero
        image = WebDriverWait(context.driver, 10).until(
            EC.presence_of_element_located((AppiumBy.ANDROID_UIAUTOMATOR, f'new UiSelector().className("android.widget.ImageView").instance({numero})'))
        )
        image.click()
    except Exception as e:
        logger.error(f"Error in 'le doy click en el articulo': {e}")
        raise

@given(u'le doy click al boton de editar descripcion')
def step_impl(context):
    try:
        WebDriverWait(context.driver, 30).until(
            EC.element_to_be_clickable((AppiumBy.XPATH, '//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.widget.Button[1]'))
        ).click()
    except Exception as e:
        logger.error(f"Error in 'le doy click al boton de editar descripcion': {e}")
        raise



@given(u'le doy click a la palomita')
def step_impl(context):
    try:
        WebDriverWait(context.driver, 30).until(
            EC.element_to_be_clickable((AppiumBy.XPATH, '//android.widget.ScrollView/android.widget.Button[1]'))
        ).click()
    except Exception as e:
        logger.error(f"Error in 'le doy click a la palomita': {e}")
        raise


@given(u'edito la descripcion "{descActual}" a "{desc}"')
def step_impl(context, descActual, desc):
   
    descripcion = WebDriverWait(context.driver, 30).until(
        EC.presence_of_element_located((AppiumBy.XPATH, '//android.widget.EditText'))
    )
    success=send_keys_with_retry(descripcion,desc)
    context.driver.hide_keyboard()
    assert success, "Failed to input text in the field"