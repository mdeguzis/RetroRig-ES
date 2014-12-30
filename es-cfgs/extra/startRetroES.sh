#!/bin/bash
 
# Project RetroRig: https://github.com/ProfessorKaos64/RetroRig
 
# This script launches XBMC, puts it to a predefined position on the desktop, crops its title bar and full-screens it.
# The fullscreening part will only work, if XBMC is configured to run in windowed mode.
# You have to do this one time: Start XBMC, in XBMC go to System > Settings > Video output and configure it for windowed mode
 
# Authors: Jens-Christian, aka beaumanvienna/JC
#	   Michael DeGuzis, aka PK, ProfessorKaos
# Revision: 20140621, initial version
# Revision: 20141229, RetroRig-ES alteration

export HOME=$HOME/.retrorig-es
echo starting RetroRig-ES
emulationstation  &
 
 
status=Running
while [ "$status" == "Running" ]
do
  status=`pgrep emulationstation > /dev/null && echo Running`
  sleep 1
done

