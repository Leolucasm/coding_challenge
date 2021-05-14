## Coding Challenge

Projeto criado para desafio técnico.


## Tecnologias

Estas são as tecnologias utilizadas no projeto

* Ruby version  2.7.0
* Rails version 6.0.3.7


## Ruby Gems

* gem 'rails', '~> 6.0.2', '>= 6.0.2.2'
* gem 'rails-i18n'
* gem 'pg'
* gem 'puma', '~> 4.1'
* gem 'sass-rails', '>= 6'
* gem 'webpacker', '~> 4.0'
* gem 'turbolinks', '~> 5'
* gem 'jbuilder', '~> 2.7'
* gem 'bootsnap', '>= 1.4.2', require: false
* gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]  
* gem 'faker'  
* gem 'rspec-rails', '~> 5.0.0'
* gem 'web-console', '>= 3.3.0'
* gem 'spring'
* gem 'listen', '>= 3.0.5', '< 3.2'  
* gem 'spring-watcher-listen', '~> 2.0.0'  
* gem 'webdrivers', '~> 3.0'
* gem 'capybara', '>= 2.15'
* gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
* gem 'foreman'
* gem 'rest-client', '~> 2.0', '>= 2.0.2'

## Iniciando

* Instalar GEMs
>    $ bundle install
* Iniciar aplicação
>    $ foreman s
* Executar testes
>    $ bundle exec rspec


## Funcionalidades

  - Listagem de atores principais de filmes e os principais filmes em que atuaram.


## Links

  - Link da aplicação: https://codingchallenge-flama.herokuapp.com/
  - Repositório: https://github.com/Leolucasm/coding_challenge


## Autores
* **LEONARDO MELO**: @Leolucasm (https://github.com/Leolucasm)


## FLAMA

  - Repositório (Google Drive): https://drive.google.com/drive/folders/1u7mH5B0o3DwSpEaZa9jQO5ODSRw_vSVE?usp=sharing
  - Repositório (GIT): https://github.com/Leolucasm/coding_challenge

## Respostas

* Por favor descreva o seu processo para abordar o code challenge. Que tipo de planejamento você fez? Seus planos mudaram à medida que começou a escrever código?
> Inicialmente realizei a leitura completa do desafio, buscando compreender primeiramente os principais pontos do projeto. Na sequência, foi realizada a leitura da documentação da API para me aprofundar nas principais configurações e destacar os principais end-points que possívelmente seriam utilizados.
Após a etapa inicial, descrevi em tópicos uma sequência de itens a seguir para a implementação do projeto, garantindo que nenhum item seria esquecido. Poucos itens precisaram ser modificados à medida que o código foi escrito, e essas alterações estavam mais relacionadas com os end-points que seriam consumidos da api.

* Descreva a distribuição de responsabilidades no código. Quais responsabilidades você achou importante agrupar (seja em um método, módulo, objeto ou arquivo)? Quais responsabilidades você achou importante manter separadas? Por que?
> Classe ApiConsumer::MovieDatabase: Foi criado uma classe responsável pelo encapsulamento e consumo da API. Essa estrutura foi montada para garantir a centralização das rotinas em uma possível evolução do produto e também para garantir as devidas validações da API.
Foram criados três métodos com o prefixo search, que são os métodos que acionam um end-point da API com os devidos parâmetros. O objetivo desta ação foi de manter o Clean Code e centralizar as responsabilidades de cada método.
Outros três métodos foram criados com o prefixo get, que realizam a montagem do json de retorno principal. O objetivo desta separação foi o de permitir a montagem correta do json principal (uma rotina aciona a outra), mas também permitir futuros acionamento de cada uma das rotinas separadas. Na estrutura atual, esta é a seguinte hierarquia dos métodos com prefixo get: get_actors_movie -> get_main_actor_movie -> get_main_movies_actor

> HomeController: O controller Home possui duas actions, são elas: index e find_actors_movie. A index tem sua função padrão, de apresentar a view inicial ao usuário. A action find_actors_movie realiza o acionamento da classe MovieDatabase para obter o json e o envia para a view.

* Se você tivesse mais um dia para trabalhar nesse MVP, onde você investiria esse tempo? E se tivesse um mês?
> Se tivesse mais um dia para trabalhar, investiria tempo na implementação de uma autenticação (com um campo de data de nascimento do usuário) e utilizaria essa informação para permitir ou não o retorno de conteúdos adultos nas consultas.

> Se tivesse mais um mês, iria implementar um novo formulário, que deveria listar os filmes pesquisados, com a imagem de capa e detalhamento dos filmes, realizando a estilização visual dos elementos (css). Para cada card (filme) seria adicionado uma opção de visualizar mais detalhes. Essa segunda visualização deveria exibir todos os detalhes do filme, bem como o elenco e os filmes similares. Neste ponto, seria possível clicar em um ator/atriz e visualizar as informações dele/dela e os filmes em que atuaram.
A segunda feature, seria utilizar a autenticação do usuário para permitir que o usuário pudesse salvar nos favoritos os filmes e atores/atrizes que mais gostam.
Por fim, a terceira, seria a de consumir outros itens da API (séries e shows de TV, por exemplo) e implementar os formulários descritos acima para elas também.
