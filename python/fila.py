
class Node:
    def __init__(self) :
        self.data = None
        self.next = None
    def __init__(self,data):
        self.data = data
        self.next = None

class Fila:
    def __init__(self):
        self.inicio = None
        self.fim = None
        self.tamanho = 0

    def adicionar(self, elemento):
        self.tamanho +=1
        if self.inicio == None:
            self.inicio = Node(elemento)
            self.fim = self.inicio
            return
        self.fim.next = Node(elemento)
        self.fim = self.fim.next
        return
    
    def remover(self):
        if self.inicio == None:
            return
        self.inicio = self.inicio.next
        self.tamanho -=1

    def imprimir(self):
        temp = self.inicio
        while temp != None:
            print(temp.data)
            temp = temp.next

def exit():
    print("Saindo...")



fila = Fila()

while True:
    resp = input("Digite 1 para adicionar, 2 para remover, 3 para imprimir e 4 para sair: ")
    
    if resp == "1":
        elemento = input("Digite o elemento a ser adicionado: ")
        fila.adicionar(elemento)
    elif resp == "2":
        fila.remover()
    elif resp == "3":
        fila.imprimir()
    elif resp == "4":
        print("Saindo do programa.")
        break
    else:
        print("Opção inválida. Por favor, escolha uma opção válida.")
