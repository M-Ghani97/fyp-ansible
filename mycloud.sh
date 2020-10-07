#!/bin/bash

if [[ $1 = node ]] && [[ $2 = add ]] &&  [[ $3 = compute ]] || [[ $3 = controller ]] || [[ $3 = network ]] || [[ $3 = storage ]]
then
  for i in "$@"
  do
    if [[ $i = node ]] || [[ $i = add ]] || [[ $i = compute ]] || [[ $i = controller ]] || [[ $i = network ]] || [[ $i = storage ]]
    then
      sleep 0.1
    else
      if grep -wq "$i:" inventory.yaml
      then
        echo "[$i] node already exist"
      else
        if grep -wq "$3:" inventory.yaml
        then
          sed -i "s/$3_host/&\n\        $i\:/g" inventory.yaml
          echo "[$i] node added"
        else
cat <<EOF >> inventory.yaml
    $3:
      hosts: #$3_host
        $i:
EOF
          echo "[$i] node added"
        fi
      fi
    fi
  done
elif [[ $1 = node ]] && [[ $2 = delete ]]
then
  for i in "$@"
  do
    if [[ $i = node ]] || [[ $i = delete ]]
    then
      sleep 0.1
    else
      if grep -wq "$i:" inventory.yaml
      then
        sed -i "/$i\:/d" inventory.yaml
        echo "[$i] node removed"
      else
        echo "[$i] node not found"
      fi
    fi
  done
elif [[ $1 = node ]] && [[ $2 = introspect ]]
then
  if [ -z "$3" ]
  then
    echo "remote host username not found"
  else
    ansible all -i inventory.yaml -m ping -u $3
  fi
elif [[ $1 = node ]] && [[ $2 = list ]]
then
  ansible-inventory --graph -i inventory.yaml
elif [[ $1 = deploy ]]
then
  ansible-inventory --graph -i inventory.yaml
  read -p "Start Deployment on these hosts? (y/n)" confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]
  if [[ $confirm == [yY] ]]
  then
    figlet "Deploying . . ."
    ansible-playbook -i inventory.yaml playbook.yaml
  fi
else
  echo "Invalid Command"
fi

