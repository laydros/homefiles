#!/usr/bin/python

# import Tkinter as tk
import time
import logging
import os

from gi.repository import Notify


def setup_logging():
    log_file = os.path.abspath("/home/laydros/.log/30min.log")
    level = logging.DEBUG

    log_format = "%(levelname)s | %(asctime)s | [%(name)s] | %(message)s"

    logging.basicConfig(filename=log_file, level=level, format=log_format)


def time_str():
    return time.strftime("%H:%M:%S")

# def alert_window():
#     timeout = 60
#     main_window = Tk()
#     main_label = Label(main_window, text="Task Check. The time is now: ")
#     main_label.grid(row=0, column=0)
#     time_label = Label(main_window, text=time_str())
#     time_label.grid(row=0, column=1)
#     quit_button = Button(main_window, text="Q", command=main_window.destroy)
#     quit_button.grid(row=3, column=0)
#     logging.info('Window built, starting mainloop')
#     mainloop()
#     # close after 10 minutes
#     logging.info('Now sleeping for ' + timeout + ' seconds before timeout')
#     time.sleep(str(timeout))
#     if main_window is not None:
#         logging.info('Main Window open for 10 minutes, closing')
#         main_window.destroy()


def main():
    setup_logging()

    logging.info('Starting 30 min notifier')
    Notify.init('Check Tasks')

    notify_body = "eventually this will pull from org agenda"
    Hello = Notify.Notification.new('Task Check', notify_body, 'alert.xpm')
    # show for 5 minutes
    Hello.set_timeout(100000)
    while True:
        logging.info('Start of while true loop')
        to_sleep = 1800 - time.time() % 1800
        logging.debug('Sleep time is ' + str(to_sleep))
        # sleep for the remaining seconds until the half hour
        time.sleep(to_sleep)
        logging.info('Showing notification')
        # alert_window()
        Hello.show()

    logging.info('Showing notification')
    Hello.show()
    logging.info('Finishing 30 min notifier')

main()
