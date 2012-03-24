/*
 * FILE: it_track.js
 * AUTHOR: Masahiro Kimoto <masahiro.kimoto@gmail.com>
 * Last Modified: 2012 Mar 24
 * Version: 0.1
 */

// enum ITPlaylistSearchField
var ITPlaylistSearchFieldAll       = 0;
var ITPlaylistSearchFieldVisible   = 1;
var ITPlaylistSearchFieldArtists   = 2;
var ITPlaylistSearchFieldAlbums    = 3;
var ITPlaylistSearchFieldComposers = 4;
var ITPlaylistSearchFieldSongNames = 5;

if(WScript.Arguments.length == 2){
  var itunes    = WScript.CreateObject('iTunes.Application');
  var library   = itunes.librarySource;
  var playlists = library.playlists;
  var playlist  = playlists.item(2); // Music
  var tracks    = playlist.search(WScript.Arguments(0), ITPlaylistSearchFieldSongNames);
  
  for(var i = 0; i < tracks.count; ++i){
    var track = tracks.item(i + 1);
    if(track.trackID == WScript.Arguments(1)){
      track.play();
      break;
    }
  }
}
