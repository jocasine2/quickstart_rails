<p align="center"><a href="https://rubyonrails.org/" target]="_blank"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/6/62/Ruby_On_Rails_Logo.svg/1200px-Ruby_On_Rails_Logo.svg.png" width="400"></a></p>

<h1 align="center">Yay! You’re on Rails!</h1>

# Iniciando ambiente de desenvolvimento
1 - Instale o [Docker](https://www.docker.com/products/docker-desktop)

2 - Carregue algumas funções úteis e inicie os containers
```
source start.sh
```
3 - Faça o dump do banco de produção e coloque em "docker-compose/db_restore"

4 - Restaure o banco usando o dump de produção
```
db restore dump-do-banco.sql
```
5 - Acesse a aplicação em [http://localhost:3000/](http://localhost:3000/)

<br>

# Boas práticas para o gerenciamento do projeto

## Clone do projeto
- Faça o clone do projeto e crie uma branch específica para a funcionalidade que está implementando indicando o tipo (feature, bugfix, hotfix) e o nome do usuário 
```
git checkout -b feature/joaquim.neto/listar-produtos-estabelecimento
```
- Crie [testes unitários](https://pt.wikipedia.org/wiki/Teste_de_unidade)

## Commits
- faça pequenos commits
- adicione a referencia do gerenciador de projetos 
```
✨#4598 Cria crud de pessoa 
```
- não esqueça de usar o emoji correspondente a alteração
- revise as alterações que foram feitas antes de fazer o push
```
git diff
```
## Pull Request
- Crie uma PR para a branch develop
- Escolha adicione o revisor
  
## [Daily](https://www.ieepeducacao.com.br/daily-scrum) (pode ser virtual)
- o que fez ontem?
- o que ira fazer hoje?
- quais os impedimentos impedimentos?
- quais as estratégias?

## Atualize o gerenciador do projeto ([redmine](https://redmine.ati.to.gov.br))
- Use como base o que voce fez ontem

## Úteis
 - instale emojisense no vs code
 - criem seeds para informações estáticas

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
| Faça um teste passar | git commit -m "✔️# " |`:heavy_check_mark:` |
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
