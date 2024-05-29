from behave import given, when, then
from appium import webdriver
from appium.webdriver.common.appiumby import AppiumBy
from appium.options.android import UiAutomator2Options
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import time


@given(u'selecciono la primera imagen')
def step_impl(context):
    time.sleep(5)
    imagen = WebDriverWait(context.driver, 30).until(
        EC.element_to_be_clickable((AppiumBy.XPATH, '//android.widget.LinearLayout[@content-desc="IMG_20240528_215708.jpg, 123 kB, May 28"]/android.widget.RelativeLayout/android.widget.FrameLayout[2]'))
    )
    imagen.click()


@given(u'selecciono a la imagen')
def step_impl(context):
    WebDriverWait(context.driver, 30).until(
        EC.element_to_be_clickable((AppiumBy.XPATH, "//android.widget.ImageView[@bounds='[265,636][815,1186]']"))
    ).click()


# //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View
# //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]
