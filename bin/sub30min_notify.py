#!/usr/bin/python

# import Tkinter as tk
import time
import logging
import os
import subprocess

from gi.repository import Notify


def setup_logging():
    log_file = os.path.abspath("/home/laydros/.log/30min.log")
    level = logging.DEBUG

    log_format = "%(levelname)s | %(asctime)s | [%(name)s] | %(message)s"

    logging.basicConfig(filename=log_file, level=level, format=log_format)


def time_str():
    return time.strftime("%H:%M:%S")


def main():
    setup_logging()

    logging.info('Starting 60 min notifier')
    Notify.init('Check Tasks')

    notify_body = "eventually this will pull from org agenda"
    # Hello = Notify.Notification.new('Task Check', notify_body, 'alert.xpm')
    # show for 5 minutes
    # Hello.set_timeout(100000)
    while True:
        logging.info('Start of while true loop')
        to_sleep = 3600 - time.time() % 3600
        logging.debug('Sleep time is ' + str(to_sleep))
        # sleep for the remaining seconds until the half hour
        time.sleep(to_sleep)
        logging.info('Showing notification')
        args = ['uclock']
        out_bytes = subprocess.check_output(args)
        out_text = out_bytes.decode('utf-8')
        logging.debug(out_text)
        # alert_window()
        # Hello.show()

    logging.error('Somehow left while true loop')

main()
