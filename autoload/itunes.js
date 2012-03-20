/*
 * FILE: itunes.js
 * AUTHOR: Masahiro Kimoto <masahiro.kimoto@gmail.com>
 * Last Modified: 2012 Mar 20
 * Version: 0.1
 */

var ITPlaylistRepeatModeOff = 0;
var ITPlaylistRepeatModeOne = 1;
var ITPlaylistRepeatModeAll = 2;

var itunes = WScript.CreateObject('iTunes.Application');
var commands = {
  'play' :  function(){
              itunes.play();
            },
  'stop' :  function(){
              itunes.stop();
            },
  'next' :  function(){
              itunes.nextTrack();
            },
  'prev' :  function(){
              itunes.previousTrack();
            },
  'pause':  function(){
              itunes.playPause();
            },
  'repeat': function(){
              itunes.currentPlaylist.songRepeat = ITPlaylistRepeatModeOne;
            },
  'loop' :  function(){
              itunes.currentPlaylist.songRepeat = ITPlaylistRepeatModeAll;
            }
};
var args = WScript.Arguments;
if(args.length == 1 && commands[args(0)]){
  commands[args(0)]();
}
