filename="$1"
path=$( dirname "$0" )
echo $path

echo " --- Duplicates --- "
perl $path/duplicates.pl $filename

echo " --- Weasel Words --- "
$path/weasel.sh $filename

echo " --- Passive Voice --- "
$path/passive.sh $filename

echo " --- Word Overuse --- "
$path/overuse.sh $filename
