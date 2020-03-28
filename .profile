if [ -f /skel/profile.modules ]
then
	. /skel/profile.modules
# put your own module loads here
	module load null
fi
# default applications
export EDITOR=/usr/bin/vim
export TERMINAL=/usr/bin/st
export BROWSER=/usr/bin/firefox
export QT_QPA_PLATFORMTHEME="qt5ct"
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

# exporting some default directory
#
#
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

