from behave import given, when, then
from appium import webdriver
from appium.webdriver.common.appiumby import AppiumBy
from appium.options.android import UiAutomator2Options
import time
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

@given(u'en la pantalla de registro ingreso mi usuario "{usuario}", contraseña "{contra}" y confirmo contraseña "{confcontra}"')
def step_impl(context,usuario,contra,confcontra):
    time.sleep(2)
    username = context.driver.find_element(by=AppiumBy.XPATH, value='//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.EditText[1]')
    username.clear()
    username.click()
    time.sleep(1) ### después del click requiere algo te tiempo, para empezar a escribir
    username.send_keys(usuario)
    time.sleep(2)

    password = context.driver.find_element(by=AppiumBy.XPATH , value='//android.widget.ScrollView/android.widget.EditText[3]')
    password.clear()
    password.click() ### importante dar click en la caja de texto para que tenga el foco
    time.sleep(2) ### después del click requiere algo te tiempo, para empezar a escribir
    password.send_keys(contra)

    confpassword = context.driver.find_element(by=AppiumBy.XPATH , value='//android.widget.ScrollView/android.widget.EditText[4]')
    confpassword.clear()
    confpassword.click() ### importante dar click en la caja de texto para que tenga el foco
    time.sleep(2) ### después del click requiere algo te tiempo, para empezar a escribir
    confpassword.send_keys(confcontra)
    context.driver.hide_keyboard()
    time.sleep(2)


@given(u'en la pantalla de registro ingreso mi usuario "{usuario}" ,correo "{correo}", contraseña "{contra}"')
def step_impl(context,usuario,correo,contra):
    time.sleep(2)
    username = context.driver.find_element(by=AppiumBy.XPATH, value='//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.EditText[1]')
    username.clear()
    username.click()
    time.sleep(1) ### después del click requiere algo te tiempo, para empezar a escribir
    username.send_keys(usuario)
    time.sleep(2)
    
    email = context.driver.find_element(by=AppiumBy.XPATH, value='//android.widget.ScrollView/android.widget.EditText[2]')
    email.clear()
    email.click()
    time.sleep(2) ### después del click requiere algo te tiempo, para empezar a escribir
    email.send_keys(correo)

    password = context.driver.find_element(by=AppiumBy.XPATH , value='//android.widget.ScrollView/android.widget.EditText[3]')
    password.clear()
    password.click() ### importante dar click en la caja de texto para que tenga el foco
    time.sleep(2) ### después del click requiere algo te tiempo, para empezar a escribir
    password.send_keys(contra)
    context.driver.hide_keyboard()
    time.sleep(2)


@given(u'doy click en el boton Acceder')
def step_impl(context):
    context.driver.find_element(by=AppiumBy.ACCESSIBILITY_ID, value='Acceder').click()
    time.sleep(2)


@given(u'en la pantalla de login ingreso mi correo "{correo}" y contraseña "{contra}"')
def step_impl(context,correo,contra):
    time.sleep(2)
    email = context.driver.find_element(by=AppiumBy.XPATH, value='//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.EditText[1]')
    email.clear()
    email.click()
    time.sleep(2) ### después del click requiere algo te tiempo, para empezar a escribir
    email.send_keys(correo)

    password = context.driver.find_element(by=AppiumBy.XPATH, value='//android.widget.ScrollView/android.widget.EditText[2]')
    password.clear()
    password.click()
    time.sleep(1) ### después del click requiere algo te tiempo, para empezar a escribir
    password.send_keys(contra)
    context.driver.hide_keyboard()
    time.sleep(2)
    


@when(u'presiono el botón Ingresar')
def step_impl(context):
    context.driver.find_element(by=AppiumBy.ACCESSIBILITY_ID, value='Ingresar').click()
    time.sleep(2)

    
@given(u'en la pantalla de login ingreso mi correo "" y contraseña "{contra}"')
def step_impl(context,contra):
    time.sleep(2)
    password = context.driver.find_element(by=AppiumBy.XPATH, value='//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.EditText[2]')
    password.clear()
    password.click()
    time.sleep(1) ### después del click requiere algo te tiempo, para empezar a escribir
    password.send_keys(contra)
    context.driver.hide_keyboard()
    time.sleep(2)


@given(u'en la pantalla de login ingreso mi correo "{correo}" y contraseña ""')
def step_impl(context,correo):
    time.sleep(2)
    email = context.driver.find_element(by=AppiumBy.XPATH, value='//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.EditText[1]')
    email.clear()
    email.click()
    time.sleep(2) ### después del click requiere algo te tiempo, para empezar a escribir
    email.send_keys(correo)
    context.driver.hide_keyboard()
    time.sleep(2)
    

