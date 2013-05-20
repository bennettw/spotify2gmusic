Spotify to Google Music
==============================

This is a simple attempt to export Spotify playlists to JSON and then import them into Google Music.

As of now, only the Spotify export is "working" but needs some cleaning up.

The next step is to write some javascript that can read the JSON files and create the necessary playlists in the Google Music UI.

Prerequisites
---------------
* A premium Spotify account with an API key
* An unlimited Google Music account

Setup
--------
```
bundle install
mv environement.rb.sample environment.rb
```

Either fill in your Spotify username and password in ```environment.rb``` or leave the fields empty to have the script prompt you for your credentials.  It will not store these fields on disk anywhere if you leave them blank.

Exporting Playlists
---------------------
```
./fetch.rb
```

This will create an ```out/``` folder, and then drop all of your playlists into *.json files in this folder.

TODO
------
* A lot of things.
* Modularize fetch.rb and allow customizing the fields that are exported
* Create a Greasemonkey usersript or a Chrome extension to read the *.json playlist files. This would require a "live" import in the browser.
* A better solution would be to use Mechanize to create the playlists from the commandline.
