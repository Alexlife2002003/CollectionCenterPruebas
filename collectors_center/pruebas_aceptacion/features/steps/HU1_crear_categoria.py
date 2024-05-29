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

# GIVEN
@given(u'persiono el botón de Ingresar')
def step_impl(context):
  context.driver.hide_keyboard()
  WebDriverWait(context.driver, 30).until(EC.element_to_be_clickable((AppiumBy.ACCESSIBILITY_ID, 'Ingresar'))).click()


@given(u'doy click en el boton de 3 líneas')
def step_impl(context):
  boton = WebDriverWait(context.driver, 30).until(
    EC.presence_of_element_located((AppiumBy.XPATH, '//android.widget.Button[@content-desc="Open navigation menu"]'))
  )
  boton.click()
  time.sleep(4)

@given(u'doy click en el boton de categorías')
def step_impl(context):
    WebDriverWait(context.driver, 30).until(EC.element_to_be_clickable((AppiumBy.ACCESSIBILITY_ID, 'Categorías'))).click()


@given(u'doy clic en el boton de un mas')
def step_impl(context):
    boton = WebDriverWait(context.driver, 30).until(
        EC.presence_of_element_located((AppiumBy.XPATH, '//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.Button[2]')))
    boton.click()


@given(u'ingreso el nombre de la categoría "{categoria}"')
def step_impl(context, categoria):
    nombre = WebDriverWait(context.driver, 30).until(
        EC.presence_of_element_located((AppiumBy.XPATH, '//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.widget.EditText[1]'))
    )
    nombre.clear()
    nombre.click()
    time.sleep(4)
    success=send_keys_with_retry(nombre, categoria)
    assert success, "Failed to input text in the field"


@given(u'luego ingreso la descripción de la categoria "{descripcion}"')
def step_impl(context, descripcion):
    descr = WebDriverWait(context.driver, 30).until(
        EC.presence_of_element_located((AppiumBy.XPATH, '//android.widget.ScrollView/android.widget.EditText[2]'))
    )
    descr.clear()
    descr.click()
    time.sleep(4)
    success=send_keys_with_retry(descr, descripcion)
    assert success, "Failed to input text in the field"

# WHEN
@when(u'presiono el botón de Guardar')
def step_impl(context):
    context.driver.hide_keyboard()
    WebDriverWait(context.driver, 30).until(EC.element_to_be_clickable((AppiumBy.ACCESSIBILITY_ID, 'Guardar'))).click()