#!/bin/bash


# Arquivos temporários
TMPF=`mktemp`
USUARIOS=`mktemp`


# 1º passo - Tratar o arquivo de entrada. Ordenar, retirar espaços em branco,remover caracteres invalidos, separar nomes, remover repetidos e ordenar novamente.
sort -b -d -i -u  $1 | cut -d',' -f1 | cut -d'|' -f1 | sort -b -d -i -u >> $TMPF

# Separar os 10 primeiros nomes que iniciam com cada letra do alfabeto a partir da entrada tratada.
# O grep separa todos os nomes que começam com a "letra da vez" e o sed pega os 10 primeiros. Concatenando essas saidas, no final eu tenho um arquivo com os 10 primeiros nomes que iniciam com cada letra do alfabeto.
    grep -i '^[a]' $TMPF | sed -n '1,10 p' >> $USUARIOS    ;    grep -i '^[b]' $TMPF | sed -n '1,10 p' >> $USUARIOS
    grep -i '^[c]' $TMPF | sed -n '1,10 p' >> $USUARIOS    ;    grep -i '^[d]' $TMPF | sed -n '1,10 p' >> $USUARIOS
    grep -i '^[e]' $TMPF | sed -n '1,10 p' >> $USUARIOS    ;    grep -i '^[f]' $TMPF | sed -n '1,10 p' >> $USUARIOS
    grep -i '^[g]' $TMPF | sed -n '1,10 p' >> $USUARIOS    ;    grep -i '^[h]' $TMPF | sed -n '1,10 p' >> $USUARIOS
    grep -i '^[i]' $TMPF | sed -n '1,10 p' >> $USUARIOS    ;    grep -i '^[j]' $TMPF | sed -n '1,10 p' >> $USUARIOS
    grep -i '^[k]' $TMPF | sed -n '1,10 p' >> $USUARIOS    ;    grep -i '^[l]' $TMPF | sed -n '1,10 p' >> $USUARIOS
    grep -i '^[m]' $TMPF | sed -n '1,10 p' >> $USUARIOS    ;    grep -i '^[n]' $TMPF | sed -n '1,10 p' >> $USUARIOS
    grep -i '^[o]' $TMPF | sed -n '1,10 p' >> $USUARIOS    ;    grep -i '^[p]' $TMPF | sed -n '1,10 p' >> $USUARIOS
    grep -i '^[q]' $TMPF | sed -n '1,10 p' >> $USUARIOS    ;    grep -i '^[r]' $TMPF | sed -n '1,10 p' >> $USUARIOS
    grep -i '^[s]' $TMPF | sed -n '1,10 p' >> $USUARIOS    ;    grep -i '^[t]' $TMPF | sed -n '1,10 p' >> $USUARIOS
    grep -i '^[u]' $TMPF | sed -n '1,10 p' >> $USUARIOS    ;    grep -i '^[v]' $TMPF | sed -n '1,10 p' >> $USUARIOS
    grep -i '^[w]' $TMPF | sed -n '1,10 p' >> $USUARIOS    ;    grep -i '^[x]' $TMPF | sed -n '1,10 p' >> $USUARIOS
    grep -i '^[y]' $TMPF | sed -n '1,10 p' >> $USUARIOS    ;    grep -i '^[z]' $TMPF | sed -n '1,10 p' >> $USUARIOS

# Criar Diretórios de grupos com devidas permissões
    mkdir ~/nobackup # Não encontrei a pasta /nobackup no servidor, então para simular (e tambem por que fiz na minha maquina local) vou manter o comando de criar a pasta nobackup.
    mkdir ~/nobackup/users
    mkdir ~/nobackup/users/grupo{1,2,3}
    chmod 755 ~/nobackup/users/grupo1
    chmod 750 ~/nobackup/users/grupo2
    chmod 700 ~/nobackup/users/grupo3

#Criar diretório para cada usuário em seu determinado grupo com devidos arquivos e permissões.
for NOME in $(cat $USUARIOS); do
    AUX=` echo $NOME | wc -m ` # Quantidade de caracteres do nome
    AUX=$(($AUX - 1))  # Correção numerica necessaria
    AUX2=$( echo $NOME | grep -i -P '^[aeiou](?:.*[aeiou])?$' ) # Verifica se o nome começa e termina com vogal, se verdadeiro, a variavel $AUX2 recebe a $NOME. Se falso, ela fica em branco.

    # Se o nome tiver 5 letras (somente a-z) que iniciem e terminem com vogais
    if [[ $AUX -eq 5 ]] && [[ $AUX2 == $NOME ]]  ; then 
        mkdir ~/nobackup/users/grupo1/$NOME 
        echo alias ll="ls -ltr" >> ~/nobackup/users/grupo1/$NOME/.bashrc
        mkdir ~/nobackup/users/grupo1/$NOME/.html
        chmod 711 ~/nobackup/users/grupo1/$NOME/.html 
        echo -e '<!DOCTYPE html>' "\n" '<html>' "\n" '<head>' "\n" '<title>' "\n" "$NOME" "\n" '</title>' "\n" '</head>' "\n" '<body>' "\n" 'Alo mamae!' "\n" '</body>' "\n" '</html>' >>  ~/nobackup/users/grupo1/$NOME/.html/index.html  
        mkdir ~/nobackup/users/grupo1/$NOME/bin
        mkdir ~/nobackup/users/grupo1/$NOME/tmp
        touch ~/nobackup/users/grupo1/$NOME/bin/limpa_cookies.sh
        echo -e '#!/bin/bash' "\n" 'cat .navegaaipo/cookies > .navegaaipo/cookies' >> ~/nobackup/users/grupo1/$NOME/bin/limpa_cookies.sh
        chmod +x ~/nobackup/users/grupo1/$NOME/bin/limpa_cookies.sh
        echo './bin/limpacookies.sh'  >> ~/nobackup/users/grupo1/$NOME/.bash_logout
        
    # Se o nome tiver mais do que 5 letras.        
    elif [[ $AUX -gt 5 ]] ; then 
        mkdir ~/nobackup/users/grupo2/$NOME
        echo -e 'alias ll="ls -ltr"' "\n" 'alias la="ls -la' "\n" 'alias lF="ls -lF' >> ~/nobackup/users/grupo2/$NOME/.bashrc
        mkdir ~/nobackup/users/grupo2/$NOME/bin
        mkdir ~/nobackup/users/grupo2/$NOME/tmp
        touch ~/nobackup/users/grupo2/$NOME/bin/limpa_cookies.sh
        echo -e '#!/bin/bash' "\n" 'cat .navegaaipo/cookies > .navegaaipo/cookies' >> ~/nobackup/users/grupo2/$NOME/bin/limpa_cookies.sh
        chmod +x ~/nobackup/users/grupo2/$NOME/bin/limpa_cookies.sh
        echo './bin/limpacookies.sh'  >> ~/nobackup/users/grupo2/$NOME/.bash_logout 

    # Se o nome não se encaixar nos padrões acima    
    else   
        mkdir ~/nobackup/users/grupo3/$NOME  
        echo -e 'alias ll="ls -ltr"' "\n" 'alias la="ls -la' "\n" 'alias lF="ls -lF' >> ~/nobackup/users/grupo3/$NOME/.bashrc 
        mkdir ~/nobackup/users/grupo3/$NOME/bin
        mkdir ~/nobackup/users/grupo3/$NOME/tmp
        touch ~/nobackup/users/grupo3/$NOME/bin/limpa_cookies.sh
        echo -e '#!/bin/bash' "\n" 'cat .navegaaipo/cookies > .navegaaipo/cookies' >> ~/nobackup/users/grupo3/$NOME/bin/limpa_cookies.sh
        chmod +x ~/nobackup/users/grupo3/$NOME/bin/limpa_cookies.sh
        echo './bin/limpacookies.sh'  >> ~/nobackup/users/grupo3/$NOME/.bash_logout       
    fi
done

