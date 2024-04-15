#!/bin/sh
#download loop 
taxa='Pgrayi'

for i in {3..7}
do
mkdir ${taxa}_m$i

scp -o 'ProxyJump sert@orca.nhm.ac.uk' sert@franklin:/mbl/share/workspaces/groups/riesgo/Sergi/Ana-Torriente/Stacks/${taxa}_m$i/population* ${taxa}_m$i/

done 
