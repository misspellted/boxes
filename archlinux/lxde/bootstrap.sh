# Update installed packages
yes | pacman -Syu

# Install the Linux headers for VirtualBox
yes | pacman -S linux-headers

# Assist in locating additional packages
yes | pacman -S pacman-contrib

# Use a simple desktop environment
# Since pacman allows for custom installation of a group,
#   the default is what we want (for now), and the input
#   is not a simple 'y', we're using the --noconfirm flag.
pacman -S --noconfirm lxde

# Configure the desktop environment to run
sudo systemctl start lxdm.service
sudo systemctl enable lxdm.service

# Replace virtualbox-guest-utils-nox
yes | pacman -S virtualbox-guest-utils --overwrite "*"

# Refresh VirtualBox
VBoxClient-all

echo "Finished bootstrapping!"
