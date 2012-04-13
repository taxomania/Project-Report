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

echo $COUNT words
if [ $1 ]
then
  if [ $COUNT -ge $1 ]
  then
    echo "WOOHOOO MISSION ACCOMPLISHED"
  else
    let "COUNT=$1-$COUNT" 
    echo "NOT YET"
    echo $COUNT words left
  fi
fi
