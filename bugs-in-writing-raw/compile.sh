bugsDir="bugs-in-writing-raw"
scriptsDir="scripts"

filterWords=("examples" "rules" "meaning")
# don't ask about the sed
$scriptsDir/gh-md-toc $bugsDir/bugs.md | sed "s/^       /  /g" > $bugsDir/toc.md

for filterWord in "${filterWords[@]}"
do
  cat $bugsDir/toc.md | grep -v $filterWord > $bugsDir/tmp-toc.md
  mv $bugsDir/tmp-toc.md $bugsDir/toc.md
done

cat $bugsDir/header.md $bugsDir/toc.md $bugsDir/bugs.md > Bugs-In-Writing.md
