#!/bin/bash
play()
{
read_locations "./music_location"
find  $val2 | grep -i "${1// /.*}"> "/home/$USER/Documents/temp_file_for_audio"
show_list $2
}
#for playlists
playlist()
{
read_locations "./playlist_location" 
find  $val2 | grep -i "${1// /.*}"> "/home/$USER/Documents/temp_file_for_audio"
show_list $2 
}

#this reads the location from file and add it to array for searshing
read_locations()
{ 
input=$1
val2=("${(f@)mapfile[$input]}")
}


#main function
show_list()
{
    nums=$( < /home/$USER/Documents/temp_file_for_audio wc -l)
    if [[ $nums -lt 1 ]]
    then
        echo "no file found"
    elif [[ $nums -lt 2 ]]
    then
        while read line;  do val="vlc \"$line\" &";  done < "/home/$USER/Documents/temp_file_for_audio"
        echo $val
        vlc_play $val;
        #this is when there are more than one file
    elif [[ $nums -ge 2 ]]
    then
         if [[ $SHELL == "/bin/zsh" ]]
        then #zsh
            myArray=("${(f@)mapfile[/home/$USER/Documents/temp_file_for_audio]}")
        else #bash
            mapfile -t myArray < "/home/$USER/Documents/temp_file_for_audio"
        fi             
        if [[ $1 ]]
        then
            val="${myArray[$1 ]}";
            echo $val >  "/home/$USER/Documents/temp_file_for_audio"
            echo "the file you chose is: "$val
            val="vlc \""${myArray[$1 ]}"\" &";
            vlc_play $val ;
        else
            #1 for zsh and 0 for bash
			#zsh starts array with 1 instead of 0 so this is nescesary to check
            if [[ $SHELL == "/bin/zsh" ]] 
            then
                count=1
				 while  [ $count -le $nums ]
            do
                echo $count "${myArray[$count]}"
                count=$(( $count + 1 ))
            done
            else
                count=0
				while  [ $count -lt $nums ]
            do
                echo $count "${myArray[$count]}"
                count=$(( $count + 1 ))
            done
            fi
           
            echo "Choose which file to play"
            read number
            echo ""
            while  [[ $[$number - 1] -ge $nums ]] ||  [[ $number  -eq 0 ]]
            do
                count2=1
                while  [ $count2 -le $nums ]
                do
                    echo $count2 "${myArray[$count2 - 1]}"
                    count2=$(( $count2 + 1 ))
                done
                echo "Please type a valid number"
                read number
                echo ""
            done
            echo "${myArray[$number]}"
            val="${myArray[$number]}";
            echo $val >  "/home/$USER/Documents/temp_file_for_audio"
            echo "the file you chose is: "$val
            val="vlc \""${myArray[$number]}"\" &";
            vlc_play $val ;
            
        fi
    fi
}



vlc_play()
{
echo $@>"/home/ghalib/Documents/temp_file_for_audio"
source "/home/ghalib/Documents/temp_file_for_audio" && yes | rm "/home/ghalib/Documents/temp_file_for_audio"
}

