DAYS=1825; TODAY=`date +"%s"`;
[ "$1"  == 'CONFIRM' ] && DELETE=1
if [ ${DELETE} ] ; then
    echo "********************************************"
    read -p "Are you sure to delete branche older then ${DAYS} days? (Y|N): " -n 1
    echo
    echo "********************************************"
    [[ ! $REPLY =~ ^[Yy]$ ]] && echo "Exiting..." && exit 1
fi


for branch in `git branch -r --merged | grep -v HEAD | egrep -v "(^\*|master|dev)"` ; do 
    echo -e `git show --format="%cI %ct ${branch} \\t\\t %an" $branch | head -n 1` ;    
done | awk -v today=${TODAY} -v days=${DAYS} '$2 < today - days*24*60*60' | sort -r |  
if [ -z "$DELETE" ] 
    then  
        cat
    else  
        sed s/origin\\/// | awk '{ print $3 }' | xargs -n 1 git push --delete origin  
fi

