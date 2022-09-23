- Qualquer item no catálogo é um **biblio** (ex: um livro qualquer)
  - **biblios** tem **items**
  - **items** são _instâncias_ de biblios (ex: uma cópia física de um livro)
- **holds** são reservas
  - **holds** são feitos a **patrons**
  - **holds** têm vários atributos, entre eles:
    - reminder date
    - expiration date
    - biblio id, item id, patron_id
    - reserve notes*
- **checkouts** são empréstimos
  - **checkouts** são feitos a **patrons**
  - **checkouts** têm vários atributos, entre eles:
    - item_id, patron_id
    - due date
    - library id (FAC)
    - note/note date (observação)
    - checkout date, checkin date
    - allows renew, auto renew, renews, last renewal date
  - é possível pegar todos os checkouts de um **patron**
- **patrons** são pessoas registradas (nao necessariamente com login no koha)
  - **patrons** podem ter vários atributos (não sabemos quais obrigatórios), entre eles:
    - endereço, cep, estado, país
    - email
    - telefone
    - nome
    - etc


## Problemas

- Não é possível ver todos os **items** de uma **biblio**
  - Pela documentação do Koha, deveria ser possível pela rota `/biblios/{biblio_id}/items`, mas está retornando 404

## Todo

- Começar na tela de meus livros
- Empréstimo:
  - Remover tela de login (clicar no - deve abrir QRcode direto)
  - QR Code deve ter o item id referente ao livro no Koha
  - QR Code deve consultar API com o item ID, e recuperar o biblio ID para pegar infos
  - Exibir infos do biblio e item recuperados
  - Clicar em pegar emprestado
  - Mostrar tela com regras
  - Pedir nome e telefone
  - Confirmação de empréstimo 
  - Faz req no checkout para pegar emprestado (colocar nome e telefone no campo de obs)
  - Volta pra tela de meus livros