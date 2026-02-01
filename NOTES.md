## Polybar
# launch.sh
- I was not able to start polybar on i3 exec_always, because of file permissions

https://discourse.nixos.org/t/how-to-make-scripts-imported-via-home-manager-executable/41909

- I had to make the source file in the directory executable so 

## Multiple desktop environemnts

# Code splitting
- The base logic is that the nixos system itself contains multiple desktop environments / window managers.
- The desktop environment / window manager should have all the necessary programs on its own to function as a working desktop.
- This means that the programs like bar, clipboard, application launcher should all be downloaded using system wide config.
- On the other hand, all the configuration for the specific desktop environment should be handled in the home manager, in mind with
the provided programs from the desktop.
- The home manager configuration for a user should be desktop specific. This means that there will be one user used for this specific desktop.

### Reading mode
Shader taken from, all credits go to hum
https://github.com/snes19xx/surface-dots?tab=readme-ov-file#reading-mode
