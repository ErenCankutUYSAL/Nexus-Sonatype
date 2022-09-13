repoquery -a | xargs repotrack -a x86_64 -p .

wget -A rpm -r -l 5 http://mirror.centos.org/centos/7/os/x86_64/Packages/ -P .

wget -A rpm -r -l 5 http://mirror.centos.org/centos/8/BaseOS/x86_64/os/Packages/ -P .

centos7="$(ls -1 /root/mirror.centos.org/centos/7/os/x86_64/Packages/)"
centos7file="/root/mirror.centos.org/centos/7/os/x86_64/Packages/"
centos8="$(ls -1 /root/mirror.centos.org/centos/8/BaseOS/x86_64/os/Packages/)"
centos8file="/root/mirror.centos.org/centos/8/BaseOS/x86_64/os/Packages/"

echo "$centos7" >> lists7.out
sed -i '$ d' lists7.out
sonuc=lists7.out

while read x; do

curl -v --user 'username:password' --upload-file $centos7file$x http://repo..local:8081/repository/yum-hosted/7/$x

#rm -rf $x

done < $sonuc

echo "$centos8" >> lists8.out
sed -i '$ d' lists8.out
sonuc=lists8.out

while read d; do

curl -v --user 'username:password' --upload-file $centos8file$d http://repo.local:8081/repository/yum-hosted/8/$d

done < $sonuc
