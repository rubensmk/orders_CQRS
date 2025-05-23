# Event Tickets Service (CQRS + Event Sourcing)

## Descrição
> **Nota:** O termo "Event" pode gerar alguma confusão nesta descrição, pois o projeto exemplifica uma API de vendas de ingressos para eventos (como shows ou outros tipos de entretenimento). No entanto, o termo "Event" também é utilizado no contexto de **Event Sourcing**, uma técnica de desenvolvimento implementada neste projeto. Portanto, é importante distinguir entre os "eventos" relacionados aos ingressos e os "eventos" no sentido de mudanças de estado capturadas no Event Sourcing.


**Event Tickets Service** é uma API desenvolvida em Ruby on Rails para gerenciar a venda de ingressos para eventos (como shows ou outros tipos de entretenimento). Esta API está sendo construída utilizando a versão 7.0.8 do Ruby on Rails e a versão 3.2.1 do Ruby. A aplicação utiliza dois bancos de dados: MongoDB e MySQL, e segue um design pattern inspirado no CQRS (Command Query Responsibility Segregation) com Event Sourcing utilizando a gem rails-event-store. A idéia é que toda vez que for gerado um pedido de compra para o evento seja registrado em dois tipos bancos diferentes, seguindo a lógica do CQRS, um para escrita e todo para a leitura dos dados. Para que esses dados sejam escritos em dois bancos diferentes utilizei a estratégias de sincronização via Event Sourcing. Para a criação de eventos foi criado um job, executado usando Solid Queue, que faz o scrapping da página de eventos do Sympla.

![image](https://github.com/user-attachments/assets/fbe041ed-81fa-4524-a248-a5b26f2e0ad5)
![image](https://github.com/user-attachments/assets/a33ed9ba-1e65-40c5-bcec-0c790b2b3b9f)


## Tecnologias Utilizadas

- **Linguagem**: Ruby 3.2.1
- **Framework**: Ruby on Rails 7.0.8
- **Banco de Dados**: 
  - MongoDB (para dados não estruturados)
  - MySQL (para dados estruturados)
- **Design Pattern**: CQRS (Command Query Responsibility Segregation)
- **Gems**:
  - [rails-event-store](https://railseventstore.org/)
  - [nokogiri](https://nokogiri.org/)
  - [solid-queue](https://github.com/rails/solid_queue)

## Porque Event Sourcing + CQRS (Command Query Responsibility Segregation) ?
Event Sourcing e CQRS (Command Query Responsibility Segregation) são padrões de design que, quando usados juntos, podem proporcionar uma série de vantagens. Aqui estão algumas das principais vantagens de combinar Event Sourcing com CQRS:

### 1. Histórico Completo das Alterações
Event Sourcing: Armazena todas as mudanças de estado como uma sequência de eventos. Isso permite reconstruir o estado atual a qualquer momento e também acessar o histórico completo das alterações. Isso é útil para auditoria, depuração e para entender a evolução dos dados.

### 2. Separação Clara de Responsabilidades
CQRS: Separa as operações de leitura e escrita, o que significa que você pode otimizar cada uma delas de forma independente. Isso pode levar a melhor desempenho e escalabilidade, pois você pode ajustar as estratégias de leitura e escrita de acordo com suas necessidades específicas.

### 3. Escalabilidade
CQRS: Permite escalar as operações de leitura e escrita de forma independente. Se o sistema de leitura precisa de mais recursos devido a um alto volume de consultas, você pode escalar apenas as partes do sistema responsáveis por leitura, sem afetar as operações de escrita, e vice-versa.

### 4. Desempenho e Eficiência
CQRS: Com a separação de leitura e escrita, você pode otimizar o desempenho de consultas e comandos de maneira independente. Por exemplo, a modelagem de leitura pode ser otimizada para consultas rápidas, enquanto a modelagem de escrita pode ser otimizada para validações e lógica de negócios.

### 5. Flexibilidade na Modelagem de Dados
CQRS: Permite usar diferentes modelos de dados para leitura e escrita. O modelo de leitura pode ser ajustado para melhor atender às necessidades das consultas, enquanto o modelo de escrita pode se concentrar na lógica de negócios e na integridade dos dados.

### 6. Facilidade de Implementação de Recursos Avançados
Event Sourcing: Facilita a implementação de recursos avançados, como retrabalho (replay) de eventos para corrigir erros, criação de projeções diferentes a partir dos mesmos eventos, e implementação de event-driven architectures.

### 7. Resiliência e Recuperação
Event Sourcing: Através da preservação de todos os eventos, o sistema pode se recuperar de falhas e inconsistências mais facilmente. Em caso de corrupção de dados ou falhas de sistema, você pode reconstruir o estado a partir dos eventos.

### 8. Desacoplamento de Componentes
CQRS e Event Sourcing: Ambos os padrões incentivam o desacoplamento entre diferentes partes do sistema, facilitando a manutenção e evolução do software. Por exemplo, a lógica de negócios e a persistência podem evoluir independentemente.

### 9. Auditabilidade e Compliance
Event Sourcing: Oferece uma trilha de auditoria completa das mudanças no sistema. Isso é especialmente importante para aplicações que exigem conformidade com regulamentações e auditorias rigorosas.
Em resumo, a combinação de Event Sourcing com CQRS oferece um conjunto robusto de benefícios que pode melhorar a escalabilidade, a eficiência e a flexibilidade do seu sistema, além de proporcionar uma base sólida para auditoria e recuperação de dados.

## Funcionalidades
![image](https://github.com/user-attachments/assets/f8fe37bd-92a7-4e5f-b375-73f733bf11a6)

- **Gestão de pedidos**
- **Gestão de eventos**
  - Web scrapping de eventos usando Nokogiri
- **Gestão de ingressos**
- **Gestão de clientes**

## Requisitos

- Ruby 3.2.1

## Passos para Configurar o Projeto

1. **Clone o repositório**

    ```sh
    git clone https://github.com/rubensmk/event_tickets_service.git
    cd event_tickets_service
    ```

2. **Crie o arquivo .env**

    ```sh
    cp .env. .env.sample
    ```

3. **Inicie o projeto**

    Certifique-se de ter um banco de dados PostgreSQL rodando e configurado corretamente. Em seguida, execute:

    ```sh
    make build
    make up
    ```
3.1 **Inicie o Solid Queue**
    ```sh
    bundle exec rails solid_queue:start
    ```
