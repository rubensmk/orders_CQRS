# Use a imagem oficial do Ruby
FROM ruby:3.2.1

# Instale dependências
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Configura o diretório de trabalho
WORKDIR /app

# Copia o Gemfile e o Gemfile.lock
COPY Gemfile Gemfile.lock ./

# Instala as gems
RUN bundle install

# Copia o restante da aplicação
COPY . .

# Expõe a porta da aplicação
EXPOSE 3000

# Comando para rodar a aplicação
CMD ["rails", "server", "-b", "0.0.0.0"]
