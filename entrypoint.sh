#!/bin/sh -l

echo "Data: $1"
echo "Data File: $2"
echo "Path: $3"

#example dir=`ls ./airflow/dags/*.py`
if [[ $1 == 'None' && $2 == 'None' ]];
then
	echo 'Provide Key Value Mapping'
	exit 1
fi

echo 'Templating Start'

if [ '$1' != 'None' ];
then
  dir=`ls $3`

  for eachfile in $dir;
  do
     jinja2 --strict -D $1 $eachfile > "${eachfile}_"
     echo $eachfile
  done

  for eachfile in $dir;
  do
     rm ${eachfile}
     mv "${eachfile}_" ${eachfile}
  done
fi

if [ '$2' != 'None' ];
then
  dir=`ls $3`
  for eachfile in $dir;
  do
     jinja2 --strict $eachfile $2 > "${eachfile}_"
     echo $eachfile
  done

  for eachfile in $dir;
  do
     rm ${eachfile}
     mv "${eachfile}_" ${eachfile}
  done
fi

echo 'Templating Done'
exit 0
