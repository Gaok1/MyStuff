#IO em Python
#declarar objeto usuario em python, contendo nome e senha
#criar um loop para receber 10 usuarios
#criar um loop para receber 10 senhas
#criar um loop para verificar se a senha é igual ao usuario
#se for igual, printar "Senha igual ao usuario"
#se não for igual, printar "Senha diferente do usuario"


#declarando objeto usuario aqui abaixo
class Usuario:
    def __init__(self, nome, senha):
        self.nome = nome
        self.senha = senha


quantidade = int(input("Digite o número de usuários que serao lidos: "))
#declarar lista de Usuarios de acordo com o numero de usuarios
listaUsuarios = []
#loop para receber os usuarios
for i in range(quantidade):
    print("Digite o seu nome: ")
    nome = input()
    print("Digite a sua senha")
    senha = input()
    usuario = Usuario(nome,senha)
    listaUsuarios.append(usuario)

print("logue-se")

nome = input("Digite o seu nome: ")
senha = input("Digite a sua senha: ")
logado = False
for usuario in listaUsuarios:
    if nome == usuario.nome and senha == usuario.senha:
        print("Senha igual ao usuario")
        logado = True
        break

if not logado:
    print("Senha diferente do usuario")
