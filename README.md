# Event Tickets Service

## Descrição

**Event Tickets Service** é uma API desenvolvida em Ruby on Rails para gerenciar a venda de ingressos para eventos. Esta API está sendo construída utilizando a versão 7.0.8 do Ruby on Rails e a versão 3.2.1 do Ruby. A aplicação utiliza dois bancos de dados: MongoDB e MySQL, e segue um design pattern inspirado no CQRS (Command Query Responsibility Segregation) com Event Sourcing utilizando a gem rails-event-store. A idéia é que toda vez que for gerado um pedido de compra para o evento seja registrado em dois tipos bancos diferentes, seguindo a lógica do CQRS, um para escrita e todo para a leitura dos dados. Para que esses dados sejam escritos no dois bancos diferentes existem diferentes estratégias de sincronização, sendo uma delas o Event Sourcing.

Event Sourcing e CQRS (Command Query Responsibility Segregation) são padrões de design que, quando usados juntos, podem proporcionar uma série de vantagens. Aqui estão algumas das principais vantagens de combinar Event Sourcing com CQRS:

1. Histórico Completo das Alterações
Event Sourcing: Armazena todas as mudanças de estado como uma sequência de eventos. Isso permite reconstruir o estado atual a qualquer momento e também acessar o histórico completo das alterações. Isso é útil para auditoria, depuração e para entender a evolução dos dados.

2. Separação Clara de Responsabilidades
CQRS: Separa as operações de leitura e escrita, o que significa que você pode otimizar cada uma delas de forma independente. Isso pode levar a melhor desempenho e escalabilidade, pois você pode ajustar as estratégias de leitura e escrita de acordo com suas necessidades específicas.

3. Escalabilidade
CQRS: Permite escalar as operações de leitura e escrita de forma independente. Se o sistema de leitura precisa de mais recursos devido a um alto volume de consultas, você pode escalar apenas as partes do sistema responsáveis por leitura, sem afetar as operações de escrita, e vice-versa.

4. Desempenho e Eficiência
CQRS: Com a separação de leitura e escrita, você pode otimizar o desempenho de consultas e comandos de maneira independente. Por exemplo, a modelagem de leitura pode ser otimizada para consultas rápidas, enquanto a modelagem de escrita pode ser otimizada para validações e lógica de negócios.

5. Flexibilidade na Modelagem de Dados
CQRS: Permite usar diferentes modelos de dados para leitura e escrita. O modelo de leitura pode ser ajustado para melhor atender às necessidades das consultas, enquanto o modelo de escrita pode se concentrar na lógica de negócios e na integridade dos dados.

6. Facilidade de Implementação de Recursos Avançados
Event Sourcing: Facilita a implementação de recursos avançados, como retrabalho (replay) de eventos para corrigir erros, criação de projeções diferentes a partir dos mesmos eventos, e implementação de event-driven architectures.

7. Resiliência e Recuperação
Event Sourcing: Através da preservação de todos os eventos, o sistema pode se recuperar de falhas e inconsistências mais facilmente. Em caso de corrupção de dados ou falhas de sistema, você pode reconstruir o estado a partir dos eventos.

8. Desacoplamento de Componentes
CQRS e Event Sourcing: Ambos os padrões incentivam o desacoplamento entre diferentes partes do sistema, facilitando a manutenção e evolução do software. Por exemplo, a lógica de negócios e a persistência podem evoluir independentemente.

9. Auditabilidade e Compliance
Event Sourcing: Oferece uma trilha de auditoria completa das mudanças no sistema. Isso é especialmente importante para aplicações que exigem conformidade com regulamentações e auditorias rigorosas.
Em resumo, a combinação de Event Sourcing com CQRS oferece um conjunto robusto de benefícios que pode melhorar a escalabilidade, a eficiência e a flexibilidade do seu sistema, além de proporcionar uma base sólida para auditoria e recuperação de dados.

![image](https://github.com/user-attachments/assets/f8fe37bd-92a7-4e5f-b375-73f733bf11a6)



## Funcionalidades

- **Gestão de eventos**: criação, atualização, listagem e exclusão de eventos.
- **Gestão de ingressos**: emissão, cancelamento e validação de ingressos.

## Tecnologias Utilizadas

- **Linguagem**: Ruby 3.2.1
- **Framework**: Ruby on Rails 7.0.8
- **Banco de Dados**: 
  - MongoDB (para dados não estruturados)
  - MySQL (para dados estruturados)
- **Design Pattern**: CQRS (Command Query Responsibility Segregation)

## Requisitos

- Ruby 3.2.1

