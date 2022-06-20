gcloud secrets list | awk '{ print $1 }'|sed "1d" |sed  's/^/gcloud secrets versions access 1 --secret=/' | sed '1 i #! /bin/bash' > env.sh
bash env.sh > secrets.txt
sed -i s/$/\"/ secrets.txt
sed -i s/^/\"/ secrets.txt


gcloud secrets list | awk '{ print $1 }'|sed "1d" | sed 's/^/export /' | sed 's/$/=/'|sed 's/ *$//' > ex.txt

paste ex.txt secrets.txt > hel.txt

sed -i 's/=[^=\"]*\"/=\"/g' hel.txt
cat hel.txt >> .bashrc
