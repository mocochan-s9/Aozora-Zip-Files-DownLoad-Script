rm list_person_all_extended_diff.csv
rm list_person_all_extended_utf8.zip
rm list_person_all_extended_utf8.csv
curl -O https://www.aozora.gr.jp/index_pages/list_person_all_extended_utf8.zip
unzip list_person_all_extended_utf8.zip
diff list_person_all_extended_utf8_$1.csv list_person_all_extended_utf8.csv | grep -E '^>' | perl -pe 's/^>\s//g' > list_person_all_extended_diff.csv
mkdir zip
python3 urls.py list_person_all_extended_diff.csv > zip/urls.txt
cd zip
xargs -n 1 curl -O < urls.txt
cd ..
mv list_person_all_extended_utf8.csv list_person_all_extended_utf8_`date +%Y%m%d`.csv