
#!/bin/bash

verifica_arquivo() {
  echo "Digite o nome do arquivo:"
  read nome

  if [ -e "$nome" ]
  then
    echo "O arquivo '$nome' existe!"

    if [ -f "$nome" ]
	 then  
     echo "Tipo: ficheiro normal"
  
	  if [ -x "$nome" ]
	    then
 	 echo " Permissao de leitura: sim" 

   		 if [ -w "$nome" ]
		 then
		echo " Permissao de execucao: sim"

   			if [ -r  "$nome" ]
			 then 
				echo "Permissao de escrita: sim"   
 			else
			  echo "Permissao de escrita: sim"  
			fi
		else
		echo " Permissao de execucao: nao"    
		fi
        else
       echo " Permissao de leitura: nao" 
	fi
    elif [ -d "$nome" ]
	 then
     	 echo "Tipo: directorio"
    fi
 else
    echo "O arquivo '$nome' nao existe!"
  fi

}

verifica_arquivo


