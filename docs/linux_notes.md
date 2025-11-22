
# Linux (on WSL)

## PowerShell
to...

- list the available linux distros
	wsl --list
	
- launch Ubuntu
	wsl -d Ubuntu-24.04

- kill the running distro
	wsl --shutdown # on another powershell instance

- copy something from the Windows PC to the target SSH session
	`scp <file> <username@hostname>:<location>` 

Windows path on WSL:
	/mnt/c/...

Fonts for Nevim:
	Download the nerd font (Caskadya or JetBrains!)
	Install it using Windows font manager
	Update the terminal settings for Ubuntu to use this font


## Unix/Shell 

### Generic 

- restart the shell during an ssh session:
	exec bash

- use the result of a previous command as a parameter of a new command:
    <package1> "$(<package2>)"
    
    example:
        nvim "$(fzf)"

### Package Manager

Ubuntu uses "apt" for package management
	
```bash
	sudo apt install <package>	# to install something
	sudo apt update	            # to update packages
	sudo apt search <keyword>	# searches for package to install
	sudo apt remove <package>	# removes a package
	apt search <package>	    # searches for package
	dpkg -L <package>	        # lists all the locations where this package is found
	sudo apt update             # Fetches the latestes packets
	sudo apt upgrade -y         # installs the latest packages
```

### Directory/File Operations

```bash
	pwd	                        # show current working dir
	ls	                        # list current directory content
	ls -l	                    # detailed list
	cd <path>	                # chage directory
	cd ..	                    # goes up one level
	mkdir <path>	            # creates a directory
	mkdir -p <path>	            # creates all directories and subdirectories
	cp <origin> <destination>	# copies origin to destination
	mv <origin> <destination>	# moves origin to destination or rename a file
	rm <path>	                # removes a file or dir
	rm -r <path>	            # deletes recursively
	rm -rf <folder path>        # deletes the whole tree
```

### Important Locations

- home directory:
```bash
	/home/<username>    # home folder for the username
	~                   # same as above (link)
	/usr/share/fonts    # fonts for all users. Run `fc-cache -fv` after installing new fonts
``` 
## Apps

### text editing

- nano: default text editor
- nvim: vim text editor with custom configs to serve as IDE.
	Check the nvim repository on github to get the latest configuration then set the `NVIM_APPNAME` variable to match the folder name in `./config`

### Terminal and Shell

#### zsh: alternative to bash

```bash
	sudo apt install zsh    # installs zsh
	which zsh               # returns the install dir for zsh
	sudo nvim /etc/shells   # open the etc/shells config file
	# update the opened file adding the path from "which zsh"
	chsh -s $(which zsh)	# set zsh as default
```
#### tmux: terminal window manager

```bash
    sudo apt install tmux	# installs Tmux
    tmux ls			# lists sessions
    tmux new -s <name>		# creates a new session named <name>
    tmux attach -t <name>	# attaches back to an open session named <name>
```

- Hierarchy:    
	Sessions -> Windows -> Panes
	A session can have many windows and a window can own many panes
	
	Sessions
	to terminate, close the terminal instance (Ctrl+d or exit)


- Prefix key shortcuts (C-<prefix>):
	c > creates a new window/shell
	<index number> > goes to the selected terminal window
	<n | p> > switches between the terminal windows
	<left | right arrow> > switches between the panes in the window
	% > splits terminals horizontally (adds a column)
	" > splits terminals vertically (adds a row)
	d > detaches from the current session
	s > display current sessions
	$ > renames a session
	& > kill current window
	, > renames a window
	t > displays the time in the pane
	z > zoom in and out of the selected pane
	w > session explorer
	! > break out pane into new window
	? > available keymaps
	
	custom mappings (defined at .tmux.conf):
	T > renumber the windows below

	: > command mode
		new-window > creates a new window
		split-window > splits vertically
		new-session > creates a new session
		move-window -r > renumbers the windows in the session


#### git: version control

```bash
	sudo apt install git
	git config --global user.name ""
	git config --global user.email ""
```

#### tree: prints the tree for the selected dir

```bash
		sudo apt install tree
		tree -a			# lists a tree of files and directories from the current folder
		tree -L <number>	# prints the tree with the selected depth level
```

#### unzip: handles zipped files

```bash
	sudo apt install unzip
	unzip FILE -d DESTINATION # unzips a file into the destination
	unzip FILE -l # lists the file contents
```

#### fzf: file indexer with fuzzy finding

```bash
        sudo apt isntall fzf
        fzf
```

#### ripgrep: searches for text in the files of cwd

```bash
        sudo apt install ripgrep
        rg '<search_expression>'
```

#### netcat-openbsd: allow for network port scan
```bash
	sudo apt install netcat-openbsd
	nc -zv <ip> <port> -w <timeout>
```

### Other Notes

#### SSH Authentication 

- to make sure you can connect with git via ssh:
	ssh-keygen -t ed25519 -C "your_email@example.com"
- generate the ssh.priv key at ~/.ssh/
- enter the default passphrase
- add the generated key to GitHub (https://github.com/settings/keys)
- edit ~/.bashrc
	nvim ~/.bashrc
- add this at the end:
	```bash
		# Auto-start SSH agent
		eval "$(ssh-agent -s)"
		eval "$(ssh-add ~/.ssh/ssh.priv)"
	```

