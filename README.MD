a script that can play any audio or video file from your computer by just searching it fro the terminal

## USAGE

just clone this [repo](https://github.com/ghalib5000/audio-player-script) and add souce to the vlc_player.sh file in your .bshrc/.zshrc file

then add your audio folders in the location files, it also supports vlc playlists and has a seperate function for that too called `playlist`. to run it simply then type the command "play" along with the song you wanna find for example

```play eminem```

which results the output
![alt text](./images/example1.png?raw=true)

now just press the file number you want to play and press enter. that's it.

you cal also just enter `play` or `playlist` and it will print **ALL** files it will find in the folders!

It can also run the audio file automatically without any input when it detects that there's only one audio file detected

![alt text](./images/example2.png?raw=true)

OR you can manually add the number when specifying the audio file name like

```play eminem 2```

![alt text](./images/example3.png?raw=true)
