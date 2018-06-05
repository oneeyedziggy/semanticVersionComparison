#!/usr/bin/env bash
if [ $1 = 'h' ] || [ $1 = '-h' ]; then
  echo 'This utility will accept two semantic version numbers w/ parts less than 1000000 each, and return \'greater\', \'less\', or \'equal\'.'';
  exit;
fi
normalizeVersion () {
  #split into parts
  inputBuffer=$(echo "$1" | tr "." "\\n" );
  inputVersion="";
  #remove leading 0s
  for verPart in $inputBuffer
  do
    printf -v verPart "%06s" $verPart
    inputVersion+=$verPart;
  done;
  #remove leading 0s
  echo $inputVersion;
}
comparedValue=$(normalizeVersion $1)
compareTo=$(normalizeVersion $2)
#echo "$comparedValue";
#echo "$compareTo";
if [ $comparedValue -eq $compareTo ]; then
  echo 'equal'
elif [ $comparedValue -gt $compareTo ]; then
  echo 'greater'
elif [ $comparedValue -lt $compareTo ]; then
  echo 'less'
fi
exit;
