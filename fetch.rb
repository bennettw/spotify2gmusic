#!/usr/bin/env ruby

require 'json'
require 'hallon'
require './environment.rb'
require './example_support.rb'


puts "Logged in as #{@session.user.display_name}"

playlists = @session.container.contents
playlist = playlists.first
#playlists.each do |playlist|

  playlist_json = Hash.new
  #puts "#{playlist.name} - #{playlist.class.name}"
  playlist_json[:playlist_name] = playlist.name
  playlist_json[:song_count] = playlist.size
  playlist_json[:spotify_uri] = playlist.to_link

  tracks = playlist.tracks
  tracks_json = {}
  tracks.each do |track|
    #puts "  #{track.artist.name} - #{track.album.name} (#{track.album.release_year}) - #{track.name}"
    tracks_json[track.to_link] = [:title => track.name, :artist => track.artist.name, :album => track.album.name]
  end

  playlist_json[:tracks] = tracks_json
  puts JSON.pretty_generate playlist_json

#end

#@session.logout!
