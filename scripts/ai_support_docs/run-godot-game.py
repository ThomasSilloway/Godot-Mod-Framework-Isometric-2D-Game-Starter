# /// script
# dependencies = [
#   "pywinauto",
# ]
# ///
import subprocess
import time
import sys

if sys.platform == "win32":
    import pywinauto
    from pywinauto import application

def run_godot_game():
    """
    Activates the Godot Engine window and presses F5 to run the game.
    This function is Windows-specific and requires pywinauto.
    """
    if sys.platform != "win32":
        print("This function is only supported on Windows.")
        return

    try:
        app = application.Application().connect(title_re=".*Godot Engine.*")
        godot_window = app.top_window()
        godot_window.set_focus()
        time.sleep(0.5)  # Give the window time to activate

        # Send F5 key press
        godot_window.type_keys("{F5}")
        print("Godot Engine activated and F5 key pressed.")

    except application.ProcessNotFoundError:
        print("Godot Engine is not running.")
    except Exception as e:
        print(f"An error occurred: {e}")

def main():
    run_godot_game() #Call the function to run the Godot game

if __name__ == "__main__":
    main()