// Substitua esses dados de exemplo com dados reais obtidos do servidor
const pessoas = [
    { id: 1, nome: "João Silva", email: "joao@email.com", foto: "data:image/png;base64,..." },
    { id: 2, nome: "Maria Souza", email: "maria@email.com", foto: "data:image/png;base64,..." },
    // ... mais pessoas
  ];

  // Função para renderizar cada linha da tabela
  function renderPessoa(pessoa) {
    return `
      <tr>
        <td>${pessoa.id}</td>
        <td><img src="${pessoa.foto}" alt="${pessoa.nome}" class="rounded-circle" width="40" height="40"></td>
        <td>${pessoa.nome}</td>
        <td>${pessoa.email}</td>
        <td>
          <button class="btn btn-danger btn-sm" onclick="deletePessoa(${pessoa.id})">Deletar</button>
        </td>
      </tr>
    `;
  }

  // Função para deletar uma pessoa
  function deletePessoa(id) {
    // Implementar lógica de deleção usando API/banco de dados
    console.log("Deletando pessoa:", id);

    // Remover linha da tabela após confirmar a deleção
    document.getElementById(`pessoa-${id}`).remove();
  }

  // Renderizar cada pessoa na tabela
  pessoas.forEach(pessoa => {
    const tableBody = document.getElementById("pessoa-table");
    const row = document.createElement("tr");
    row.id = `pessoa-${pessoa.id}`;
    row.innerHTML = renderPessoa(pessoa);
    tableBody.appendChild(row);
  });