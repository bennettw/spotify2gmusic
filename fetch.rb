#!/usr/bin/env ruby

require 'json'
require 'hallon'
require './environment.rb'
require './example_support.rb'


puts "Logged in as #{@session.user.display_name}"

playlists = @session.container.contents
playlist = playlists.first
#playlists.each do |playlist|

  
  #playlist.load unless playlist.loaded?
  puts "#{playlist.name} - #{playlist.class.name}"
  tracks = playlist.tracks
  tracks.each do |track|
    puts "  #{track.artist.name} - #{track.album.name} (#{track.album.release_year}) - #{track.name}"
  end

#end

@session.logout!
