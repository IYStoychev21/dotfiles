import subprocess
import os
import platform

print("Enter your username: ")
user = input()

def link_to_dot_config(app):
    if os.path.exists(f"/home/{user}/.config/{app}"):
        subprocess.run(f"sudo rm -R /home/{user}/.config/{app}", shell=True)
    
    subprocess.run(f"sudo ln -s /home/{user}/dotfiles/{app} /home/{user}/.config/{app}", shell=True)

# ----------------- ALL CONFINGS THAT NEED TO GO TO .CONFIG FOLDER ----------------
apps_for_dot_config = ["alacritty", "dunst", "fish", "hypr", "starship.toml", "wofi", "eww"]

if platform.system() == "Linux":
   for i in apps_for_dot_config:
       link_to_dot_config(i)
    
