#!/usr/bin/python
import time
from gi.repository import Notify
Notify.init('Hello World')
Hello=Notify.Notification.new('Helloooooo World','this is an example notification', 'dialog-information')
Hello.set_timeout(20000)
while True:
    # sleep for the remaining seconds until the hour
    # time.sleep(900-time.time()%900)
    time.sleep(60)
    Hello.show()
