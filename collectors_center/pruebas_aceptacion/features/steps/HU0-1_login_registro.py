from behave import given, when, then
from appium import webdriver
from appium.webdriver.common.appiumby import AppiumBy
from appium.options.android import UiAutomator2Options
import time
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

@given(u'en la pantalla de registro ingreso mi usuario "{usuario}", contraseña "{contra}" y confirmo contraseña "{confcontra}"')
def step_impl(context,usuario,contra,confcontra):
    username = context.driver.find_element(by=AppiumBy.XPATH, value='//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.EditText[1]')
    username.clear()
    username.click()
    username.send_keys(usuario)

    password = context.driver.find_element(by=AppiumBy.XPATH , value='//android.widget.ScrollView/android.widget.EditText[3]')
    password.clear()
    password.click() ### importante dar click en la caja de texto para que tenga el foco
    password.send_keys(contra)

    confpassword = context.driver.find_element(by=AppiumBy.XPATH , value='//android.widget.ScrollView/android.widget.EditText[4]')
    confpassword.clear()
    confpassword.click() ### importante dar click en la caja de texto para que tenga el foco
    confpassword.send_keys(confcontra)
    context.driver.hide_keyboard()


@given(u'en la pantalla de registro ingreso mi usuario "{usuario}" ,correo "{correo}", contraseña "{contra}"')
def step_impl(context,usuario,correo,contra):
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
    context.driver.hide_keyboard()


@given(u'doy click en el boton Acceder')
def step_impl(context):
    context.driver.find_element(by=AppiumBy.ACCESSIBILITY_ID, value='Acceder').click()


@given(u'en la pantalla de login ingreso mi correo "{correo}" y contraseña "{contra}"')
def step_impl(context,correo,contra):
    email = context.driver.find_element(by=AppiumBy.XPATH, value='//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.EditText[1]')
    email.clear()
    email.click()
    email.send_keys(correo)

    password = context.driver.find_element(by=AppiumBy.XPATH, value='//android.widget.ScrollView/android.widget.EditText[2]')
    password.clear()
    password.click()
    password.send_keys(contra)
    context.driver.hide_keyboard()


@when(u'presiono el botón Ingresar')
def step_impl(context):
    context.driver.find_element(by=AppiumBy.ACCESSIBILITY_ID, value='Ingresar').click()

    
@given(u'en la pantalla de login ingreso mi correo "" y contraseña "{contra}"')
def step_impl(context,contra):
    password = context.driver.find_element(by=AppiumBy.XPATH, value='//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.EditText[2]')
    password.clear()
    password.click()
    password.send_keys(contra)
    context.driver.hide_keyboard()


@given(u'en la pantalla de login ingreso mi correo "{correo}" y contraseña ""')
def step_impl(context,correo):
    email = context.driver.find_element(by=AppiumBy.XPATH, value='//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.EditText[1]')
    email.clear()
    email.click()
    email.send_keys(correo)
    context.driver.hide_keyboard()
