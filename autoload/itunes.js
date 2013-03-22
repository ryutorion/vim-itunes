/*
 * FILE: itunes.js
 * AUTHOR: Masahiro Kimoto <masahiro.kimoto@gmail.com>
 * Last Modified: 2013 Mar 22
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
            },
  'volume_up'  : function(value){
              itunes.SoundVolume += value;
            },
  'volume_down': function(value){
              itunes.SoundVolume -= value;
            }
};
var args = WScript.Arguments;
if(args.length == 1 && commands[args(0)]){
  commands[args(0)]();
}
if(args.length == 2 && commands[args(0)]){
  commands[args(0)](Number(args(1)));
}

