/*
 * FILE: it_track.js
 * AUTHOR: Masahiro Kimoto <masahiro.kimoto@gmail.com>
 * Last Modified: 2012 Mar 22
 * Version: 0.1
 */

var itunes    = WScript.CreateObject('iTunes.Application');
var library   = itunes.librarySource;
var playlists = library.playlists;
var playlist  = playlists.item(2);
var tracks    = playlist.tracks;

for(var i = 1; i <= tracks.count; ++i){
  WScript.Echo(tracks.item(i).name);
}
