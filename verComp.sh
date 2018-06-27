#!/usr/bin/env bash

if [[ $1 = 'h' ]] || [[ $1 = '-h' ]]; then
  echo 'This utility will accept two semantic version numbers w/ parts less than 1000000 each, and return \'greater\', \'less\', or \'equal\'.'';
  exit;
fi

normalizeVersion () {
  #split into parts
  inputBuffer=($(echo $1 | tr "." " "));

  inputVersion="";
  
  #remove leading 0s
  for verPart in ${inputBuffer[@]}; do

    #printf -v verPart "%06s" $verPart

    #./leftPad stringToPad padToLen [ padChar, default 0 ]
    verPartBuffer=$( ./leftPad.sh ${verPart} 6 )

    inputVersion+=${verPartBuffer};
  done;

  #remove leading 0s
  echo $inputVersion;
}

comparedValue=$(normalizeVersion $1)

#echo "$1="$1;
#echo "comparedValue="${comparedValue};

compareTo=$(normalizeVersion $2)
#echo "$2="$2;
#echo "compareTo="${compareTo};

if [ ${comparedValue} -eq ${compareTo} ]; then
  echo 'equal'
elif [ ${comparedValue} -gt ${compareTo} ]; then
  echo 'greater'
elif [ ${comparedValue} -lt ${compareTo} ]; then
  echo 'less'
fi

exit;
