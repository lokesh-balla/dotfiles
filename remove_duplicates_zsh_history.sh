echo "original entries in ${1}: $(wc -l ${1} | xargs | cut -d ' ' -f1)"
cat -n ${1} | sort -t ';' -uk2 | sort -nk1 | cut -f2- > ${HOME}/.tmp_zhistory
mv ${HOME}/.tmp_zhistory ${1}
echo "unique entries in ${1}: $(wc -l ${1} | xargs | cut -d ' ' -f1)"
