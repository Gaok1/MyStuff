public class Pessoa {
    private int id;
    private String nome;
    private byte[] foto;
    private String email;
    
    Pessoa(String nome, byte[] foto, String email) { // Constructor for insert
        this.nome = nome;
        this.foto = foto;
        this.email = email;
    }

    Pessoa(int id, String nome, byte[] foto, String email) { // Constructor for select
        this.id = id;
        this.nome = nome;
        this.foto = foto;
        this.email = email;
    }

    public int getId() {
        return id;
    }

    public String getNome() {
        return nome;
    }

    public byte[] getFoto() {
        return foto;
    }

    public String getEmail() {
        return email;
    }
    
}
