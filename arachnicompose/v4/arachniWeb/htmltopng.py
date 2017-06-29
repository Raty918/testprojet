import sys
import time
from selenium import webdriver
import contextlib

@contextlib.contextmanager
def quitting(thing):
    yield thing
    thing.quit()




caps = webdriver.DesiredCapabilities().FIREFOX
caps["marionette"] = False
driver = webdriver.Firefox(capabilities=caps)
driver.implicitly_wait(20)

driver.get('file:///tmp/'+ sys.argv[1] +'/index.html')
driver.implicitly_wait(10)
time.sleep(5)
driver.get_screenshot_as_file('/home/arachniwebreport/reportpng/'+ sys.argv[1] +'/1.png')

driver.get('file:///tmp/'+ sys.argv[1] +'/index.html?_escaped_fragment_=#!/issues')
driver.get_screenshot_as_file('/home/arachniwebreport/reportpng/'+ sys.argv[1] +'/2.png')

driver.get('file:///tmp/'+ sys.argv[1] +'/index.html?_escaped_fragment_=#!/plugins')
driver.get_screenshot_as_file('/home/arachniwebreport/reportpng/'+ sys.argv[1] +'/3.png')

driver.get('file:///tmp/'+ sys.argv[1] +'/index.html?_escaped_fragment_=#!/sitemap')
driver.get_screenshot_as_file('/home/arachniwebreport/reportpng/'+ sys.argv[1] +'/4.png')


