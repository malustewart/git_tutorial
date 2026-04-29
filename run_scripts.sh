# ==== CONFIG ====
SCRIPTS_DIR="./scripts"
OUT_DIR="$SCRIPTS_DIR/split_scripts"
PRESENTATION_DIR="./presentation"
PRESENTATION_SNIPPETS_DIR="$PRESENTATION_DIR/bash_snippets"
# =================
rm -rf $OUT_DIR/*
mkdir -p "$OUT_DIR"
mkdir -p "$PRESENTATION_SNIPPETS_DIR"

shopt -s nullglob

for file in "$SCRIPTS_DIR"/*.sh; do
  base="$(basename "$file" .sh)"
  i=0
  printf -v idx "%02d" "$i"
  outfile="$OUT_DIR/${base}_${idx}.sh"

  : > "$outfile"
  while IFS= read -r line || [[ -n "$line" ]]; do
    if [[ "$line" =~ ^[[:space:]]*### ]]; then
      ((i++))
      printf -v idx "%02d" "$i"
      outfile="$OUT_DIR/${base}_${idx}.sh"
      : > "$outfile"
    else
      echo "$line" >> "$outfile"
    fi
  done < "$file"
  chmod +x "$OUT_DIR/${base}_"*.sh
done

rootpwd=$PWD
rootdir=${rootpwd##*/}

rm -rf mynewrepo
filenames=`ls $OUT_DIR/*.sh`
for eachfile in $filenames
do
    if [[ $(basename "$eachfile") == 0* ]]; then
        outfile="${eachfile%.sh}"_out.txt
        outfile="${outfile##*/}"
        echo $outfile
        outfile="$PRESENTATION_SNIPPETS_DIR/$outfile"
        script -q "$outfile" -c "PS4='\[\e[1;92m\]malu@balseiro:\[\e[1;34m\]\$(p=\$(pwd); p=$rootdir\${p##*$rootdir}; echo \$p)\[\e[0m\]$ ' bash -x \"$eachfile\""
        sed -i 1d $outfile
    fi
done

cd mynewrepo

for eachfile in $filenames
do
    if [[ $(basename "$eachfile") != 0* ]]; then
        outfile="${eachfile%.sh}"_out.txt
        outfile="${outfile##*/}"
        outfile=../$PRESENTATION_SNIPPETS_DIR/$outfile
        script -q "$outfile" -c "PS4='\[\e[1;92m\]malu@balseiro:\[\e[1;34m\]\$(p=\$(pwd); p=$rootdir\${p##*$rootdir}; echo \$p)\[\e[0m\]$ ' bash -x \"../$eachfile\""
        sed -i 1d $outfile
    fi
done
