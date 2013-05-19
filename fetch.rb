#!/usr/bin/env ruby

require 'json'
require 'hallon'
require './environment.rb'
require './example_support.rb'

def process_playlist(playlist, playlist_name=nil)
  playlist_json = Hash.new
  #puts "#{playlist.name} - #{playlist.class.name}"
  playlist_json[:playlist_name] = playlist_name || playlist.name
  playlist_json[:song_count] = playlist.size
  playlist_json[:spotify_uri] = playlist.to_link.to_str if playlist.to_link

  tracks = playlist.tracks
  tracks_json = {}
  tracks.each do |track|
    #puts "  #{track.artist.name} - #{track.album.name} (#{track.album.release_year}) - #{track.name}"
    tracks_json[track.to_link.to_str] = [:index => track.index, :title => track.name, :artist => track.artist.name, :album => track.album.name, :date_added => track.added_at]
  end

  playlist_json[:tracks] = tracks_json
  #puts JSON.pretty_generate playlist_json
  filename = playlist_name || playlist.name.gsub('/', '-')
  File.open("out/#{filename}.json", "w") do |file|
    file.write JSON.pretty_generate playlist_json
  end
  puts "#{playlist.name}"
end

puts "Logged in as #{@session.user.display_name}"

playlists = @session.container.contents

playlists.each do |playlist|
  next if playlist.instance_of? Hallon::PlaylistContainer::Folder
  process_playlist playlist if playlist
end

puts "Processing Starred playist"
process_playlist @session.starred, "Starred"


