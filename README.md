Tips on writing from [Bugs In Writing](Bugs-In-Writing.md).

Some shell scripts from [Matt Might's blog post](http://matt.might.net/articles/shell-scripts-for-passive-voice-weasel-words-duplicates/)

---
Scripts usage

Duplicate words: finds duplicate words (e.g. double the)
```perl duplicates.pl input.txt```

Passive: finds abuse of passive voice
```./passive.sh input.txt```

Weasel: finds weasel, or lazy,  words like *very*.
```./weasel.sh input.txt```

Detect word overuse (simply by a frequency analysis, thresholds are tunable)
```overuse.sh input.txt```

All of the scripts:
```detectBadWriting.sh input.txt```
