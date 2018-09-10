filename="$1"
now=$(date +%b-%d-%H-%M-%S)
tmp_file=/tmp/$filename-$now

# 0.5% of text
threshold="${2:-1}"
mult="${3:-100}"

# from https://gist.github.com/deekayen/4148741
# wget https://gist.github.com/deekayen/4148741; cat 1-1000.txt | head -n 50 | tr '\n' '|'
common_words="the|of|to|and|a|in|is|it|you|that|he|was|for|on|are|with|as|I|his|they|be|at|one|have|this|from|or|had|by|hot|word|but|what|some|we|can|out|other|were|all|there|when|up|use|your|how|said|an|each|she"
# transform to lower case, and make each word a line
# remove all non A-Zs, and then remove empty lines
# then remove common words
# sort them and count them
cat $filename | tr '[:upper:]' '[:lower:]' | tr ' ' '\n' | sed "s/[^[:alpha:]]//g" | sed 's/ //g' | sed "/^$/d" | egrep -i -v "\\b($common_words)\\b" | sort | uniq -c | sort -nr > $tmp_file

# get the total number of non common words
total=$( cat $tmp_file | awk '{ sum += $1; } END { print sum; }')
# iterate over each word and print if common
while read line;
do
  count=$( echo $line | awk '{print $1}')
  word=$( echo $line | awk '{print $2}')
  freq=$( echo "( $count / $total ) * $mult"  | bc -l  | awk '{printf "%f", $0}' | cut -d "." -f 1 )
  if [ "$freq" -gt "$threshold" ]; then
    echo "$word : $count / $total"
  else
    # since sorted we know no more
    break
  fi
done < $tmp_file

rm $tmp_file
