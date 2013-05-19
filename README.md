Spotify to Google Music
==============================

This is a simple attempt to export Spotify playlists to JSON and then import them into Google Music.

As of now, only the Spotify export is "working" but needs some cleaning up.

The next step is to write some javascript that can read the JSON files and create the necessary playlists in the Google Music UI.

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
