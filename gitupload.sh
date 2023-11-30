#!bin/bash

cd ./iflows
#git init
git clone -b artifacts --single-branch https://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@github.com/kunal-kamble-git/prpiper.git
cp *.zip ./prpiper/
cd prpiper
git add -A
git commit -m "artifact upload"
git push https://kunal-kamble-git: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@github.com/kunal-kamble-git/prpiper.git master
#git push origin artifacts
cd ../
rm -rf prpiper