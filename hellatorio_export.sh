#!/bin/bash
SRV=`head -n 5 $1 | tail -n 1 | awk '{print $4}'`
mkdir /tmp/$SRV
echo "Horario;Requisicoes;Er. 5xx;Er. 4xx;Scn Rubik;Scn er. 5xx;Scn er. 4xx" > /tmp/$SRV/$SRV.REL_HORA
for i in $(seq 00 6);
do
b=`expr $i + 3`
a=`expr $b + 1`
HR=`expr $b - 3`
HRF=`expr $a - 3`
ACESSO=`sed -n "/0$b:00:[00-59]/,/0$b:59:[00-59]/p" $1  | wc -l`		
ERR500=`sed -n "/0$b:00:[00-59]/,/0$b:59:[00-59]/p" $1  | grep "br 500" | wc -l`
ERR400=`sed -n "/0$b:00:[00-59]/,/0$b:59:[00-59]/p" $1  | grep "br 404" | wc -l`
SCN=`sed -n "/0$b:00:[00-59]/,/0$b:59:[00-59]/p" $1 | grep 10.20.10.5 | wc -l`
SCN5=`sed -n "/0$b:00:[00-59]/,/0$b:59:[00-59]/p" $1 | grep 10.20.10.5 | grep "intra 500" | wc -l`
SCN4=`sed -n "/0$b:00:[00-59]/,/0$b:59:[00-59]/p" $1 | grep 10.20.10.5 | grep "intra 404" | wc -l`
sed -n "/0$b:00:[00-59]/,/0$b:59:[00-59]/p" $1  | grep "br 200 " | awk '{print $7,$NF}' | sort -k2nr | head -n 5 >> /tmp/$SRV/$SRV.reqtime.txt
echo "$HR:00 as $HRF:00;$ACESSO;$ERR500;$ERR400;$SCN;$SCN5;$SCN4" >> /tmp/$SRV/$SRV.REL_HORA
done

for i in $(seq 7 9);
do
b=`expr $i + 3`
a=`expr $b + 1`
HR=`expr $b - 3`
HRF=`expr $a - 3`
ACESSO=`sed -n "/$b:00:[00-59]/,/$b:59:[00-59]/p" $1  | wc -l`
ERR500=`sed -n "/$b:00:[00-59]/,/$b:59:[00-59]/p" $1  | grep "br 500" | wc -l`
ERR400=`sed -n "/$b:00:[00-59]/,/$b:59:[00-59]/p" $1  | grep "br 404" | wc -l`
SCN=`sed -n "/$b:00:[00-59]/,/$b:59:[00-59]/p" $1 | grep 10.20.10.5 | wc -l`
SCN5=`sed -n "/$b:00:[00-59]/,/$b:59:[00-59]/p" $1 | grep 10.20.10.5 | grep "intra 500" | wc -l`
SCN4=`sed -n "/$b:00:[00-59]/,/$b:59:[00-59]/p" $1 | grep 10.20.10.5 | grep "intra 404" | wc -l`
sed -n "/$b:00:[00-59]/,/$b:59:[00-59]/p" $1  | grep "br 200 " | awk '{print $7,$NF}' | sort -k2nr | head -n 5 >> /tmp/$SRV/$SRV.reqtime.txt
echo "$HR:00 as $HRF:00;$ACESSO;$ERR500;$ERR400;$SCN;$SCN5;$SCN4" >> /tmp/$SRV/$SRV.REL_HORA
done


for i in $(seq 10 20);
do
b=`expr $i + 3`
a=`expr $b + 1`
HR=`expr $b - 3`
HRF=`expr $a - 3`
ACESSO=`sed -n "/$b:00:[00-59]/,/$b:59:[00-59]/p" $1  | wc -l`
ERR500=`sed -n "/$b:00:[00-59]/,/$b:59:[00-59]/p" $1  | grep "br 500" | wc -l`
ERR400=`sed -n "/$b:00:[00-59]/,/$b:59:[00-59]/p" $1  | grep "br 40[0-5]" | wc -l`
SCN=`sed -n "/$b:00:[00-59]/,/$b:59:[00-59]/p" $1 | grep 10.20.10.5 | wc -l`
SCN5=`sed -n "/$b:00:[00-59]/,/$b:59:[00-59]/p" $1 | grep 10.20.10.5 | grep "intra 500" | wc -l`
SCN4=`sed -n "/$b:00:[00-59]/,/$b:59:[00-59]/p" $1 | grep 10.20.10.5 | grep "intra 404" | wc -l`
sed -n "/$b:00:[00-59]/,/$b:59:[00-59]/p" $1  | grep "br 200 " | awk '{print $7,$NF}' | sort -k2nr | head -n 5 >> /tmp/$SRV/$SRV.reqtime.txt
echo "$HR:00 as $HRF:00;$ACESSO;$ERR500;$ERR400;$SCN;$SCN5;$SCN4" >> /tmp/$SRV/$SRV.REL_HORA
done

ACESSO=`sed -n "/00:00:[00-59]/,/00:59:[00-59]/p" $1  | wc -l`
ERR500=`sed -n "/00:00:[00-59]/,/00:59:[00-59]/p" $1  | grep "br 500" | wc -l`
ERR400=`sed -n "/00:00:[00-59]/,/00:59:[00-59]/p" $1  | grep "br 40[0-5]" | wc -l`
SCN=`sed -n "/00:00:[00-59]/,/00:59:[00-59]/p" $1 | grep 10.20.10.5 | wc -l`
SCN5=`sed -n "/00:00:[00-59]/,/00:59:[00-59]/p" $1 | grep 10.20.10.5 | grep "intra 500" | wc -l`
SCN4=`sed -n "/00:00:[00-59]/,/00:59:[00-59]/p" $1 | grep 10.20.10.5 | grep "intra 404" | wc -l`
sed -n "/00:00:[00-59]/,/00:59:[00-59]/p" $1  | grep "br 200 " | awk '{print $7,$NF}' | sort -k2nr | head -n 5 >> /tmp/$SRV/$SRV.reqtime.txt
echo "21:00 as 22:00;$ACESSO;$ERR500;$ERR400;$SCN;$SCN5;$SCN4" >> /tmp/$SRV/$SRV.REL_HORA

ACESSO=`sed -n "/01:00:[00-59]/,/01:59:[00-59]/p" $1  | wc -l`
ERR500=`sed -n "/01:00:[00-59]/,/01:59:[00-59]/p" $1  | grep "br 500" | wc -l`
ERR400=`sed -n "/01:00:[00-59]/,/01:59:[00-59]/p" $1  | grep "br 40[0-5]" | wc -l`
SCN=`sed -n "/01:00:[00-59]/,/01:59:[00-59]/p" $1 | grep 10.20.10.5 | wc -l`
SCN5=`sed -n "/01:00:[00-59]/,/01:59:[00-59]/p" $1 | grep 10.20.10.5 | grep "intra 500" | wc -l`
SCN4=`sed -n "/01:00:[00-59]/,/01:59:[00-59]/p" $1 | grep 10.20.10.5 | grep "intra 404" | wc -l`
sed -n "/01:00:[00-59]/,/01:59:[00-59]/p" $1  | grep "br 200 " | awk '{print $7,$NF}' | sort -k2nr | head -n 5 >> /tmp/$SRV/$SRV.reqtime.txt
echo "22:00 as 23:00;$ACESSO;$ERR500;$ERR400;$SCN;$SCN5;$SCN4" >> /tmp/$SRV/$SRV.REL_HORA

ACESSO=`sed -n "/02:00:[00-59]/,/02:59:[00-59]/p" $1  | wc -l`
ERR500=`sed -n "/02:00:[00-59]/,/02:59:[00-59]/p" $1  | grep "br 500" | wc -l`
ERR400=`sed -n "/02:00:[00-59]/,/02:59:[00-59]/p" $1  | grep "br 40[0-5]" | wc -l`
SCN=`sed -n "/02:00:[00-59]/,/02:59:[00-59]/p" $1 | grep 10.20.10.5 | wc -l`
SCN5=`sed -n "/02:00:[00-59]/,/02:59:[00-59]/p" $1 | grep 10.20.10.5 | grep "intra 500" | wc -l`
SCN4=`sed -n "/02:00:[00-59]/,/02:59:[00-59]/p" $1 | grep 10.20.10.5 | grep "intra 404" | wc -l`
sed -n "/02:00:[00-59]/,/02:59:[00-59]/p" $1  | grep "br 200 " | awk '{print $7,$NF}' | sort -k2nr | head -n 5 >> /tmp/$SRV/$SRV.reqtime.txt
echo "23:00 as 24:00;$ACESSO;$ERR500;$ERR400;$SCN;$SCN5;$SCN4" >> /tmp/$SRV/$SRV.REL_HORA


grep "br 40[0-5]" $1 | awk '{print $17,$16,$7}' | tr A-Z a-z | sort | uniq -c | sort -rn | head -n 10 | cat -n | awk '{print $1,$2,$3,$4,$5}' | sed 's/[[:space:]]/;/g' >> /tmp/$SRV/$SRV.4xx
grep "br 50[0-5]" $1 | awk '{print $17,$16,$7}' | tr A-Z a-z | sort | uniq -c | sort -rn | head -n 10 | cat -n | awk '{print $1,$2,$3,$4,$5}' | sed 's/[[:space:]]/;/g' >> /tmp/$SRV/$SRV.5xx
cat /tmp/$SRV/$SRV.reqtime.txt | tr A-Z a-z | sort | uniq | sort -k2nr | head -n 20 | cat -n | awk '{print $1,$2,$3}' | sed 's/[[:space:]]/;/g' >> /tmp/$SRV/$SRV.reqtime
rm /tmp/$SRV/$SRV.reqtime.txt


