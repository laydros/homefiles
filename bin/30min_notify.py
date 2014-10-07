#!/usr/bin/python
import time
from gi.repository import Notify
Notify.init('Check Tasks')
notify_body = "eventually this will pull from org agenda"
Hello=Notify.Notification.new('Task Check', notify_body, 'task-due')
# show for 5 minutes
Hello.set_timeout(500000)
while True:
    # sleep for the remaining seconds until the half hour
    time.sleep(1800-time.time()%1800)
    Hello.show()
