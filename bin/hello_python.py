#!/usr/bin/python
from gi.repository import Notify
Notify.init('Hello World')
Hello=Notify.Notification.new('Helloooooo World','this is an example notification', 'dialog-information')
Hello.show()
