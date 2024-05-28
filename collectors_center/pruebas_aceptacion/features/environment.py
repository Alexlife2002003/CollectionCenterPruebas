from behave import fixture, use_fixture
from appium import webdriver
from appium.webdriver.common.appiumby import AppiumBy
from appium.options.android import UiAutomator2Options
import logging
import time

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

capabilities = {
    "platformName": "Android",
    "appium:automationName": "uiautomator2",
    "appium:deviceName": "emulator-5554",
    "appium:app": "/home/alexia/Documents/projects/Flutter/collection_Center_pruebas/collectors_center/build/app/outputs/flutter-apk/app-debug.apk",
    "appium:autoGrantPermissions": True,
    "language": "en",
    "locale": "US",
}

appium_server_url = 'http://localhost:4723'
capabilities_options = UiAutomator2Options().load_capabilities(capabilities)
logger.info("Appium driver initialized successfully.")

@fixture
def appium_driver(context):
    context.driver = webdriver.Remote(command_executor=appium_server_url, options=capabilities_options)
    context.driver.implicitly_wait(30)
    yield context.driver
    context.driver.quit()

def before_scenario(context, scenario):
    use_fixture(appium_driver, context)

