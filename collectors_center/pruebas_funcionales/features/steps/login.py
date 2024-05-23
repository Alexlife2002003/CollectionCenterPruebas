from behave import given, when, then
from appium import webdriver
from appium.webdriver.common.appiumby import AppiumBy
from appium.options.android import UiAutomator2Options
import time


@given(u'que abro la aplicación')
def step_impl(context):
    pass


@given(u'en la pantalla de login ingreso mi usaurio "{usuario}" y contraseña "{contrasena}"')
def step_impl(context, usuario, contrasena):
    username = context.driver.find_element(by=AppiumBy.XPATH, value='//android.widget.EditText[1]')
    username.clear()
    username.click()
    username.send_keys(usuario)
    
    contra = context.driver.find_element(by=AppiumBy.XPATH , value='//android.widget.EditText[2]')
    contra.clear()
    contra.click() ### importante dar click en la caja de texto para que tenga el foco
    time.sleep(1) ### después del click requiere algo te tiempo, para empezar a escribir
    contra.send_keys(contrasena)

@when(u'presiono el botón Ingresar')
def step_impl(context):
    context.driver.find_element(by=AppiumBy.ACCESSIBILITY_ID, value='Ingresar').click()
    time.sleep(1)

@then(u'puedo ver la lista de materias')
def step_impl(context):
    mensaje = context.driver.find_element(by=AppiumBy.ACCESSIBILITY_ID, value="Materias")
    assert mensaje
    time.sleep(2)

@then(u'puedo ver el mensaje "{esperado}"')
def step_impl(context, esperado):
    mensaje = context.driver.find_element(by=AppiumBy.ACCESSIBILITY_ID, value=f"{esperado}")
    assert mensaje, f"Esperado es {esperado}"
    time.sleep(2)
    
    
