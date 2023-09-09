import subprocess
import os
import platform

print("Enter your username: ")
user = input()

print("Enter your enviroment (kde/hypr): ")
envi = input()

def link_to_dot_config(app):
    if os.path.exists(f"/home/{user}/.config/{app}"):
        subprocess.run(f"sudo rm -R /home/{user}/.config/{app}", shell=True)
    
    subprocess.run(f"sudo ln -s /home/{user}/dotfiles/{app} /home/{user}/.config/{app}", shell=True)

# ----------------- ALL CONFINGS THAT NEED TO GO TO .CONFIG FOLDER ----------------
apps_for_dot_config_hypr = ["alacritty", "dunst", "fish", "hypr", "starship.toml", "wofi", "eww", "nvim"]
apps_for_dot_config_kde = ["alacritty", "fish", "nvim", "starship.toml"]

if platform.system() == "Linux":
    if envi == "hypr":
        for i in apps_for_dot_config_hypr:
            link_to_dot_config(i)
    elif envi == "kde":
        for i in apps_for_dot_config_kde:
            link_to_dot_config(i)
    
