import org.graphstream.graph.Graph;
import org.graphstream.graph.Node;
import org.graphstream.graph.implementations.SingleGraph;

public class Main {
    public static Graph graph = new SingleGraph("Árvore Binária");
    public static Node root = null;
    public static void main(String[] args) {
        System.setProperty("org.graphstream.ui", "swing");

        

        // Adicionando a raiz
        adicionar(50);

       

        // Exibindo a árvore
        graph.display();
    }

    public static void adicionar(int elemento) {
        
        if(root == null){
            graph.addNode(String.valueOf(elemento)).setAttribute(String.valueOf(elemento) +"_Atribute", elemento);
            //identificador do node é o valor do elemento, pois não pode haver elementos repetidos

        }
        
    }
}
