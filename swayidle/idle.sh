# Idle Configurationexec
exec swayidle -w \
	timeout 240 '$HOME/.config/swaylock/lock.sh' \
	before-sleep '$HOME/.config/swaylock/lock.sh'
