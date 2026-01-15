#!/usr/bin/env python3

import gi
import urllib.request
import tempfile
import threading
import os
import hashlib
from pathlib import Path

gi.require_version("Playerctl", "2.0")
from gi.repository import Playerctl, GLib
from subprocess import Popen

# Cache directory for album art
CACHE_DIR = Path.home() / ".cache" / "spotify-notify"
CACHE_DIR.mkdir(parents=True, exist_ok=True)


def get_cache_path(url):
    """Generate cache file path from URL hash."""
    url_hash = hashlib.md5(url.encode()).hexdigest()
    return CACHE_DIR / f"{url_hash}.jpg"


def download_and_notify(artist, title, metadata):
    """Download album art (with caching) in background thread and send notification."""
    icon_arg = "spotify"

    try:
        if metadata and "mpris:artUrl" in metadata.keys():
            album_art_url = metadata["mpris:artUrl"]
            if album_art_url:
                cache_path = get_cache_path(album_art_url)

                # Check if already cached
                if cache_path.exists():
                    icon_arg = str(cache_path)
                else:
                    # Download to cache
                    urllib.request.urlretrieve(album_art_url, str(cache_path))
                    icon_arg = str(cache_path)
    except Exception:
        pass

    Popen(["notify-send", "-a", "Spotify", title, artist, "-i", icon_arg])


def on_track_change(player, metadata):
    artist = player.get_artist()
    title = player.get_title()

    # Run download and notification in background thread to avoid blocking
    thread = threading.Thread(
        target=download_and_notify, args=(artist, title, metadata), daemon=True
    )
    thread.start()


def on_player_appeared(manager, player):
    if player.props.player_name == "spotify":
        player.connect("metadata", on_track_change)
        manager.manage_player(player)


def on_player_vanished(manager, player):
    pass  # Player cleanup handled automatically


manager = Playerctl.PlayerManager()
manager.connect(
    "name-appeared",
    lambda m, name: on_player_appeared(m, Playerctl.Player.new_from_name(name)),
)
manager.connect("name-vanished", on_player_vanished)

# Check if Spotify is already running
for name in manager.props.player_names:
    if name.name == "spotify":
        on_player_appeared(manager, Playerctl.Player.new_from_name(name))

GLib.MainLoop().run()
