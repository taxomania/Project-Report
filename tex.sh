WORDS="Words in text"
WC=`./texcount.pl report.tex | grep "$WORDS"`
let "COUNT=${WC/Words in text:/}"
WC=`./texcount.pl chapter1.tex | grep "$WORDS"`
let "COUNT+=${WC/Words in text:/}"
WC=`./texcount.pl chapter2.tex | grep "$WORDS"`
let "COUNT+=${WC/Words in text:/}"
WC=`./texcount.pl chapter3.tex | grep "$WORDS"`
let "COUNT+=${WC/Words in text:/}"
WC=`./texcount.pl chapter4.tex | grep "$WORDS"`
let "COUNT+=${WC/Words in text:/}"
WC=`./texcount.pl chapter5.tex | grep "$WORDS"`
let "COUNT+=${WC/Words in text:/}"
WC=`./texcount.pl chapter6.tex | grep "$WORDS"`
let "COUNT+=${WC/Words in text:/}"
WC=`./texcount.pl chapter7.tex | grep "$WORDS"`
let "COUNT+=${WC/Words in text:/}"


PRINT="$COUNT words"
echo $PRINT
if [ $1 ]
then
  if [ $COUNT -ge $1 ]
  then
	PRINT="$PRINT"$'\n'"WOOHOOO MISSION ACCOMPLISHED"
    echo "WOOHOOO MISSION ACCOMPLISHED"
  else
    let "COUNT=$1-$COUNT" 
    echo "NOT YET"
	PRINT="$PRINT written"$'\n'"$COUNT words to go"
    echo $COUNT words left
  fi
fi

growlnotify -t "LaTeX Report word count" -m "${PRINT}"