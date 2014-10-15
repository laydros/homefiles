import Tkinter as tk
import time

# from gi.repository import Notify


class App():
    def __init__(self):
        print('start of init')
        self.window = tk.Tk()
        self.root = tk.Frame(self.window, height=20, width=100)
        self.root.grid()
        # self.root.pack_propagate()
        self.time_label = tk.Label(text="")
        self.time_label.grid(row=0, column=0)
        self.window.title('Timer')
        self.update_clock()
        self.root.mainloop()

    def update_clock(self):
        now = time.strftime("%H:%M:%S")
        current_minute = int(time.strftime("%M"))
        if current_minute % 5 == 0:
            print('current_min is mod 5 and is: ' + str(current_minute))
        self.time_label.configure(text=now)
        self.root.after(1000, self.update_clock)


app = App()

app.mainloop()
