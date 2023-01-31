<p align="center"><a href="https://rubyonrails.org/" target]="_blank"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/6/62/Ruby_On_Rails_Logo.svg/1200px-Ruby_On_Rails_Logo.svg.png" width="400"></a></p>

<h1 align="center">Yay! You’re on Rails!</h1>

# Iniciando ambiente de desenvolvimento
1 - Se estiver em ambiente Windows instale o Ubuntu como subsistema através do [WSL2](https://www.youtube.com/watch?v=_Wp2nWtTBBY).

2 - Instale o [Docker Desktop](https://www.docker.com/products/docker-desktop) (Windows) ou [Docker](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04) (Ubuntu) e o [Docker Compose](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-compose-on-ubuntu-20-04).

2 - Carregue algumas funções úteis e inicie os containers.
```
source start.sh
```
## Portando banco de dados produção
3 - Faça o dump do banco de produção (PostgreSQL) e coloque em "docker-compose/db_restore".

4 - Restaure o banco usando o dump de produção.
```
db restore dump-do-banco.sql
```
5 - Acesse a aplicação em [http://localhost:3000](http://localhost:3000).

<br>

# Parões de projeto
## Modelo de gestão de equipe 
- [SCRUM](https://www.youtube.com/results?search_query=scrum+em+9+minutos)

## Workflow: [Git Flow](https://youtu.be/oweffeS8TRc)


![image](https://user-images.githubusercontent.com/38539884/215573408-4d81f256-01c1-47ac-9c16-3400b2112c72.png)

## Clone do projeto
- Faça o clone do projeto e crie uma branch específica para a alteração que está implementando indicando o nome do usuário e o tipo (feature, bugfix, hotfix). 
```
git checkout -b feature/joaquim.neto/listar-produtos-estabelecimento
```
- Crie ou alter o [Diagrama de Classes](https://youtu.be/JQSsqMCVi1k) relacionado.
- Caso a atividade seja especialmente complexa pode-se criar um [Diagrama de Sequencia](https://creately.com/blog/pt/diagrama/tutorial-do-diagrama-de-sequencia/) ou outros.
- Crie [testes unitários](https://pt.wikipedia.org/wiki/Teste_de_unidade).

## Commits
- inicie o expediente atualizando a sua branch com a develop.
```
git pull origin develop
```
- faça pequenos commits.
- adicione a referência do gerenciador de projetos. 
```
✨#4598 Cria crud de pessoa 
```
- não esqueça de usar o emoji correspondente a alteração.
- revise as alterações que foram feitas antes de fazer o push.
```
git diff
```
- ao final do dia salve o seu trabalho na sua branch remota.
```
git push origin feature/joaquim.neto/listar-produtos-estabelecimento
```
## Pull Request
- Crie uma PR para a branch develop após concluir uma tarefa (feature/bugfix/hotfix).
- Escolha e adicione o revisor.
  
## [Daily](https://www.ieepeducacao.com.br/daily-scrum) (pode ser virtual)
- Se presencial, no máximo 15 minutos de duração, em pé.
- o que fez ontem?
- o que ira fazer hoje?
- quais os impedimentos impedimentos?
- quais as estratégias?

## Atualize o gerenciador do projeto ([redmine](https://redmine.ati.to.gov.br))
- Use como base o que você fez ontem.

# Úteis
 - instale emojisense no vs code.
 - criem seeds para informações estáticas.
 - verifique seus ultimos commits.
 ```
 git log --oneline
 ```
 - junte commits com históricos irrelevantes.
 ```
 git rebase -i main~3
 ```

## Ferramentas para geração de diagramas 
| Ferramenta | Visual Studio Code | NetBeans |
|:---------------------------|:----------------------------------------------|:----------------------------------------------|
| Drawio | ✔️ | ? |
| :emojisense: | ✔️ | ? |

## Modelos de commits [gitmoji](https://gitmoji.carloscuesta.me/)

| Tipo de confirmação | Emoji | Código |
|:---------------------------|:----------------------------------------------|:----------------------------------------------|
| Alteração em andamento | git commit -m "🚧# " |`:construction:`|
| Correção de erros | git commit -m "🐛# " |`:bug:` |
| Correção crítica | git commit -m "🚑# " |`:ambulance:` |
| Novo recurso | git commit -m "✨# " |`:sparkles:` |
| Arquivos de configuração| git commit -m "🔧# " |`:wrench:` |
| Adicionando dependencia | git commit -m "➕# " |`:heavy_plus_sign:` |
| Removendo dependencia | git commit -m "➖# " |`:heavy_minus_sign:` |
| Documentando o código-fonte | git commit -m "💡# " |`:bulb:` |
| Cosmético | git commit -m "💄# " |`:lipstick:` |
| Metadados | git commit -m "📇# " |`:card_index:` |
| Commit inicial | git commit -m "🎉# " |`:tada:` |
| Desempenho | git commit -m "🐎# " |`:racehorse:` |
| Tag de versão | git commit -m "🔖# " |`:bookmark:` |
| Documentação | git commit -m "📚# " |`:books:` |
| Testes | git commit -m "🚨# " |`:rotating_light:` |
| Adicionando um teste | git commit -m "✅# " |`:white_check_mark:` |
| Passou em um teste | git commit -m "✔️# " |`:heavy_check_mark:` |
| Atualização geral | git commit -m "⚡# " |`:zap:` |
| Melhorar formato/estrutura | git commit -m "🎨# " |`:art:` |
| Refatorar código | git commit -m "🔨# " |`:hammer:` |
| Removendo código/arquivos | git commit -m "🔥# " |`:fire:` |
| Segurança | git commit -m "🔒# " |`:lock:` |
| Atualizando dependências | git commit -m "⬆️# " |`:arrow_up:` |
| Fazendo downgrade das dependências | git commit -m "⬇️# " |`:arrow_down:` |
| Tradução | git commit -m "👽# " |`:alien:` |
| Texto | git commit -m "✏️# " |`:pencil:` |
| Deploy | git commit -m "🚀# " |`:rocket:` |
| Move/rename repository | git commit -m "🚚# " |`:truck:`|
| Mudança na revisão do codigo | git commit -m "👌# " |`:ok_hand:`|
| Revertendo mudanças | git commit -m "⏪# " |`:rewind:`|
| Mudanças rápidas | git commit -m "💥# " |`:boom:`|
| Merging branches | git commit -m "🔀# " |`:twisted_rightwards_arrows:` |
| Docker | git commit -m "🐋# " |`:whale:` |
