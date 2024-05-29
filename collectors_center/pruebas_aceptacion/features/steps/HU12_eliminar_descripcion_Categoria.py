
from behave import given, when, then
from appium import webdriver
from appium.webdriver.common.appiumby import AppiumBy
from appium.options.android import UiAutomator2Options
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import time


@given(u'presiono Categorias')
def step_impl(context):
    WebDriverWait(context.driver, 30).until(
        EC.element_to_be_clickable((AppiumBy.XPATH, '//android.widget.ImageView[@content-desc="Categorías"]'))
    ).click()


@given(u'presiono la categoria "{cat}"')
def step_impl(context,cat):
    WebDriverWait(context.driver, 30).until(
        EC.element_to_be_clickable((AppiumBy.XPATH, f'//android.view.View[@content-desc="{cat}"]'))
    ).click()

@given(u'selecciono el icono de eliminar')
def step_impl(context):
    WebDriverWait(context.driver, 30).until(
        EC.element_to_be_clickable((AppiumBy.ANDROID_UIAUTOMATOR, 'new UiSelector().className("android.widget.Button").instance(4)'))
    ).click()


@given(u'presiono el boton eliminar')
def step_impl(context):
    WebDriverWait(context.driver, 30).until(
        EC.element_to_be_clickable((AppiumBy.XPATH, '//android.widget.Button[@content-desc="Eliminar"]'))
    ).click()
