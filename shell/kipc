if [ $# -eq 0 ]
then
        echo Usage: $0 [user_name]
        exit
fi

for qid in `ipcs -q|grep $1|awk '{print $2}'`
do
        echo kill queue $qid
        ipcrm -q $qid
done
for mid in `ipcs -m|grep $1|awk '{print $2}'`
do
        echo kill shmem $mid
        ipcrm -m $mid
done
for sid in `ipcs -s|grep $1|awk '{print $2}'`
do
        echo kill semphore $sid
        ipcrm -s $sid
done
