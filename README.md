# Ansible My Butt Version 2

## Why this name?
1. For historical reasons, as these scripts were originally written in Ansible.
2. Because it's Ansible My Butt. 😘


## Why this at all?
Ansible is great, but it's me who overcomplicated it by choosing Ansible for 
this job. It was fun when I first wrote this many years ago, but every time I 
have to do a clean install, rather than having this script automate itself to 
prepare the new system for me, I have to automate my butt to prepare the new 
system for this Ansible script before it can proceed with the actual 
installation.

So it's time to translate all those scripts back into good old basic bash shell 
scripts.

## What to do next?
1. Run `./pre.sh`
2. Then sign in with `gh`.
3. `./do.sh`.
4. Then this 
```bash
env RCRC=$HOME/dotfiles/rcrc rcup
```
5. Log out and log back in.
6. Don't forget this. It's install the tmux plugins.
```bash
# when in tmux...
Prefix+I
```
4. `./post.sh`.

When everything is done, you can proceed with `rustic restore`.

## Don't forget these...

### keyd
https://github.com/rvaiya/keyd

### vimium
- [install](https://github.com/philc/vimium/blob/master/CONTRIBUTING.md#installing-from-source)

### Keyboard Settings
I prefer to add bounce keys to the keyboard. I'm not sure what value is best.
These are the values I found in my last setup, which do not correspond to my
original [settings](https://gist.github.com/lngsx/d486ad4aba9e47170d3e5a271f483aba).

```bash
gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 30
gsettings set org.gnome.desktop.peripherals.keyboard delay 300
```

## Gnome Settings
I prefer to disable the `Ctrl + P` shortcut on the Gnome desktop. I can do
this by using `gconf-editor`. It has already been added to the dnf manager. 
Go ahead and do it. From this [stranger](https://unix.stackexchange.com/a/400098/477456)

Go to this

```bash
/org/gnome/mutter/keybindings/switch-monitor
```

And then disable `use default value`, then delete: `'<Super>p',`
