VERSION="version14-64bit"
LIBSPOTIFY_VERSION="12.1.45"
#1. Create the folder where the plugin will be placed
mkdir -p ~/.config/Clementine/spotifyblob/$VERSION
#2. Download the plugin
cd ~/.config/Clementine/spotifyblob/$VERSION
wget http://spotify.clementine-player.org/$VERSION/blob
wget http://spotify.clementine-player.org/$VERSION/libspotify.so.$LIBSPOTIFY_VERSION
#3. Make sure the executable bit is set on the blob
chmod +x blob
#4. The blob was looking for libspotify.12, so we create a symlink
ln -s libspotify.so.$LIBSPOTIFY_VERSION libspotify.so.12
