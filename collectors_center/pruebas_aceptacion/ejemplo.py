import unittest
from appium import webdriver
from appium.webdriver.common.appiumby import AppiumBy
from appium.options.android import UiAutomator2Options
import time

# capabilities = dict(
#     platformName='Android',
#     automationName='uiautomator2',
#     deviceName='Android',
#     appPackage='com.android.settings',
#     appActivity='.Settings',
#     language='en',
#     locale='US'
# )



capabilities = {
    "platformName":"Android",
    "appium:automationName":"uiautomator2",
    "deviceName": "device",  # You can specify any name here
    "udid": "TWUGY5QGK76HAI5T",  # UDID of your connected device
    # "appium:appPackage":"com.android.settings",
    # "appium:appPackage":"com.google.android.apps.nexuslauncher",
    # "appium:appActivity":".Settings",
    "appium:app":"/home/alexia/Documents/testing/frameworks2023/flutter/hola_mundo2/build/app/outputs/flutter-apk/app-release.apk",
    "language":"en",
    "locale":"US"
}

appium_server_url = 'http://localhost:4723'
capabilities_options = UiAutomator2Options().load_capabilities(capabilities)

class TestAppium(unittest.TestCase):
    def setUp(self) -> None:
        self.driver = webdriver.Remote(command_executor=appium_server_url,options=capabilities_options)

    def tearDown(self) -> None:
        if self.driver:
            self.driver.quit()

    def test_find_battery(self) -> None:
        ##### En un emulador android abre la app de teléfono y digita un numero para después llamar
        
        # self.driver.find_element(by=AppiumBy.ACCESSIBILITY_ID, value='Phone').click()
        # time.sleep(3)
        
        # self.driver.find_element(by=AppiumBy.ACCESSIBILITY_ID, value='key pad').click()
        # time.sleep(3)
        
        # self.driver.find_element(by=AppiumBy.ACCESSIBILITY_ID, value='4,GHI').click()
        # self.driver.find_element(by=AppiumBy.ACCESSIBILITY_ID, value='9,WXYZ').click()
        # self.driver.find_element(by=AppiumBy.ACCESSIBILITY_ID, value='2,ABC').click()
        # self.driver.find_element(by=AppiumBy.ACCESSIBILITY_ID, value='1,').click()
        # self.driver.find_element(by=AppiumBy.ACCESSIBILITY_ID, value='0').click()
        # self.driver.find_element(by=AppiumBy.ACCESSIBILITY_ID, value='3,DEF').click()
        # self.driver.find_element(by=AppiumBy.ACCESSIBILITY_ID, value='1,').click()
        # self.driver.find_element(by=AppiumBy.ACCESSIBILITY_ID, value='6,MNO').click()
        # self.driver.find_element(by=AppiumBy.ACCESSIBILITY_ID, value='5,JKL').click()
        # self.driver.find_element(by=AppiumBy.ACCESSIBILITY_ID, value='5,JKL').click()
        # self.driver.find_element(by=AppiumBy.ACCESSIBILITY_ID, value='dial').click()
        
        ##########
        
        username = self.driver.find_element(by=AppiumBy.XPATH, value='//android.widget.EditText[1]')
        username.clear()
        username.send_keys('holamundo')
        
        contra = self.driver.find_element(by=AppiumBy.XPATH , value='//android.widget.EditText[2]')
        contra.clear()
        contra.click() ### importante dar click en la caja de texto para que tenga el foco
        time.sleep(1) ### después del click requiere algo te tiempo, para empezar a escribir
        contra.send_keys('admin123')
        
        self.driver.find_element(by=AppiumBy.ACCESSIBILITY_ID, value='Ingresar').click()
        time.sleep(1)
        
        materias = self.driver.find_element(by=AppiumBy.ACCESSIBILITY_ID, value='Materias')
        self.assertTrue(materias)
        time.sleep(3)


if __name__ == '__main__':
    unittest.main()