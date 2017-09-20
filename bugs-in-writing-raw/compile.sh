bugsDir="bugs-in-writing-raw"
scriptsDir="scripts"

filterWords=("examples" "rules" "meaning")
$scriptsDir/gh-md-toc $bugsDir/bugs.md > $bugsDir/toc.md

for filterWord in "${filterWords[@]}"
do
  cat $bugsDir/toc.md | grep -v $filterWord > $bugsDir/tmp-toc.md
  mv $bugsDir/tmp-toc.md $bugsDir/toc.md
done

cat $bugsDir/header.md $bugsDir/toc.md $bugsDir/bugs.md > Bugs-In-Writing.md
