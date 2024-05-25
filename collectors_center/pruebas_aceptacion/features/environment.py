from behave import fixture, use_fixture
from appium import webdriver
from appium.webdriver.common.appiumby import AppiumBy
from appium.options.android import UiAutomator2Options
import logging
import time

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

  # "appium:appPackage":"com.android.settings", # inicia la app de settings del SO
    # "appium:appPackage":"com.google.android.apps.nexuslauncher",
    # "appium:appActivity":".Settings",
    
    # "appium:appPackage": "com.example.hola_mundo2", # Inicia la app pero ya instalada en el dispositivo
    # "appium:appActivity": ".MainActivity", # Inicia el activity principal de la app
    
capabilities = {
    "platformName":"Android",
    "appium:automationName":"uiautomator2",
    "appium:deviceName":"emulator-5554",
  
    "appium:app":"/home/alexia/Documents/projects/Flutter/collection_Center_pruebas/collectors_center/build/app/outputs/flutter-apk/app-debug.apk",
    
    "language":"en",
    "locale":"US"
}
appium_server_url = 'http://localhost:4723'
capabilities_options = UiAutomator2Options().load_capabilities(capabilities)
logger.info("Appium driver initialized successfully.")


# @fixture
# def before_all(context):
#     context.driver = webdriver.Remote(command_executor=appium_server_url,options=capabilities_options)
    
def before_scenario(context, scenario):
    context.driver = webdriver.Remote(command_executor=appium_server_url,options=capabilities_options)
   
    

def after_all(context):
    context.driver.quit()
    