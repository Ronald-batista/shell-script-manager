# Shell Script System Administrator
#### Simulação de um administrador de sistemas que precisa criar uma estrutura de diretórios para vários usuários.

## Como Executar o programa:
#### Primeiro adicione permissão de execução para o script
#### ` chmod +x script.sh `

#### Em seguida, execute
#### `sudo .\script.sh nomes.csv`


## Enunciado completo do script

<p class="has-line-data" data-line-start="0" data-line-end="2">gora você é o administrador de um sistema Linux e precisa criar diretórios<br>
HOME para os usuários cujos login names são os 10 primeiros nomes válidos iniciados por cada uma das letras do alfabeto. Os login names precisam ser extraídos das linhas do arquivo dado.</p>
<p class="has-line-data" data-line-start="3" data-line-end="4">ATENÇÃO: o HOME desses usuários deve ser criado em /nobackup para não estourar a cota de vocês!!!</p>
<p class="has-line-data" data-line-start="5" data-line-end="6">Notem que há linhas deste arquivo que contêm mais de um nome (se for o caso, somente o primeiro nome deve ser considerado), enquanto que há linhas que não possuem nome algum (neste caso, a linha inteira deve ser desconsiderada).</p>
<p class="has-line-data" data-line-start="8" data-line-end="9">Os usuários serão classificados em três grupos:</p>
<p class="has-line-data" data-line-start="10" data-line-end="12">grupo1: login names de usuários constituídos apenas por letras de a-z,<br>
desde que iniciem e terminem com vogais e tenham exatamente 5 letras;</p>
<p class="has-line-data" data-line-start="13" data-line-end="14">grupo2: login names de usuários que na sua constituição possuem mais de 5 letras;</p>
<p class="has-line-data" data-line-start="15" data-line-end="16">grupo3: o restante dos usuários do arquivo fornecido.</p>
<p class="has-line-data" data-line-start="17" data-line-end="18">Todos os diretórios criados deverão estar sob /nobackup/users</p>
<p class="has-line-data" data-line-start="19" data-line-end="20">Sob /nobackup/users, deverão ser criados os seguintes subdiretórios:</p>
<p class="has-line-data" data-line-start="21" data-line-end="24">/nobackup/users/grupo1<br>
/nobackup/users/grupo2<br>
/nobackup/users/grupo3</p>
<p class="has-line-data" data-line-start="25" data-line-end="28">Os diretórios para cada login name deverão ser criados no diretório<br>
correspondente ao grupo ao qual ele pertence e terão o próprio login<br>
name como nome de diretório. Assim, por exemplo:</p>
<p class="has-line-data" data-line-start="29" data-line-end="32">. um login name “izuko” implicará em um diretório /nobackup/users/grupo1/izuko<br>
. um login name “rycharlyssom” implicará em um diretório /nobackup/users/grupo2/rycha.rlyssom<br>
. um login name “erick” implicará em um diretório /nobackup/users/grupo3/erick</p>
<p class="has-line-data" data-line-start="33" data-line-end="35">Os diretórios correspondentes a cada grupo deverão ser criados com as<br>
seguintes permissões:</p>
<p class="has-line-data" data-line-start="37" data-line-end="40">grupo1: drwxr-xr-x<br>
grupo2: drwxr-x—<br>
grupo3: drwx------</p>
<p class="has-line-data" data-line-start="41" data-line-end="44">Todos os usuários devem ter um arquivo .bashrc em seu diretório. O<br>
conteúdo deste .bashrc deve conter apenas e tão somente alguns aliases,<br>
conforme o grupo:</p>
<p class="has-line-data" data-line-start="46" data-line-end="49">grupo1: alias ll=“ls -ltr” e mais nada<br>
grupo2: alias la=“ls -la” além do alias do grupo1<br>
grupo3: alias lF=“ls -lF” além dos aliases dos grupos 1 e 2</p>
<p class="has-line-data" data-line-start="50" data-line-end="54">Os usuários do grupo1 devem ter um diretório .html imediatamente sob<br>
seu diretório principal. Os dos outros grupos não. As permissões<br>
do diretório .html deverá ser “drwx–x--x”, e deverá conter um<br>
arquivo de nome “index.html” com o seguinte conteúdo:</p>
<p class="has-line-data" data-line-start="55" data-line-end="63">--------------- index.html --------------------<br>
&lt;!DOCTYPE html&gt;<br>
&lt;html&gt;<br>
&lt;head&gt;<br>
&lt;title&gt;<br>
*** substitua esta linha pelo login name do usuario ***<br>
&lt;/title&gt;<br>
&lt;/head&gt;</p>
<p class="has-line-data" data-line-start="64" data-line-end="68">&lt;body&gt;<br>
Alo mamae!<br>
&lt;/body&gt;<br>
&lt;/html&gt;</p>
<hr>
<p class="has-line-data" data-line-start="70" data-line-end="71">Todos os usuários devem ter sob seu diretório dois outros subdiretórios:</p>
<p class="has-line-data" data-line-start="73" data-line-end="75">tmp<br>
bin</p>
<p class="has-line-data" data-line-start="76" data-line-end="79">Este diretório “bin” deverá conter um script de nome “limpa_cookies.sh”<br>
cuja função é limpar os cookies gerados pelo famoso navegador NAVEGAAIPO,<br>
que fica sempre no arquivo .navegaaipo/cookies</p>
<p class="has-line-data" data-line-start="80" data-line-end="83">Finalmente, crie um arquivo .bash_logout na conta de cada usuário<br>
que invoque o script limpa_cookies.sh, isto é, cada vez que o usuário<br>
der logout, vai limpar os cookies.</p>
