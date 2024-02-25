class Node:
    def __init__(self):
        self.data = None
        self.next = None
    def __init__(self,data):
        self.data = data
        self.next = None

class pilha:
    def __init__(self) -> None:
        self.top = None
        self.size = 0
    def inserir(self,data):
        if self.top == None:
            self.top = Node(data)
            return
        temp = Node(data)
        temp.next = self.top
        self.top = temp

    def pop(self):
        if(self.top is None):
            return
        print("Removendo o elemento: " + str(self.top.data))
        self.top = self.top.next

    def print(self):
        temp = self.top
        while temp != None:
            print(str(temp.data))
            temp = temp.next
    
    def isEmpty(self)->bool:
        return self.top == None
    


pilha = pilha()
while True:
    resp = int(input("Digite 1 para inserir, 2 para remover, 3 para printar e 4 para sair"))
    if(resp == 1):
        data = input("Digite o dado a ser inserido")
        pilha.inserir(data)
    elif(resp ==2):
        pilha.pop()
    elif(resp==3):
        pilha.print()
    elif(resp==4):
        print("saindo do programa")
        break


