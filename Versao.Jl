import java.util.ArrayList;
import java.util.Scanner;

public class GerenciadorDeAtividades {
    public static ArrayList<Atividade> atividades = new ArrayList<>();
    public static Scanner sc = new Scanner(System.in);

    public static void main(String[] args) {
        int opcao;
        do {
            System.out.println("\nMenu");
            System.out.println("1 - Adicionar Nova Atividade");
            System.out.println("2 - Pesquisar Atividade por Título");
            System.out.println("3 - Excluir Atividade pelo Título");
            System.out.println("4 - Atualizar Atividade pelo Título");
            System.out.println("5 - Iniciar Atividade");
            System.out.println("6 - Finalizar Atividade");
            System.out.println("7 - Listar Atividades");
            System.out.println("8 - Sair do Sistema");
            System.out.print("Escolha uma opção: ");
            opcao = sc.nextInt();
            sc.nextLine(); 

            switch (opcao) {
                case 1 -> adicionarAtividade();
                case 2 -> pesquisarAtividade();
                case 3 -> excluirAtividade();
                case 4 -> atualizarAtividade();
                case 5 -> iniciarAtividade();
                case 6 -> finalizarAtividade();
                case 7 -> listarAtividades();
                case 8 -> System.out.println("Saindo do sistema...");
                default -> System.out.println("Opção inválida!");
            }
        } while (opcao != 8);
    }

    public static void adicionarAtividade() {
        System.out.print("Título da atividade: ");
        String titulo = sc.nextLine();
        System.out.print("Descrição: ");
        String descricao = sc.nextLine();
        atividades.add(new Atividade(titulo, descricao));
        System.out.println("Nova atividade cadastrada com sucesso!");
    }

    public static Atividade encontrarAtividade(String titulo) {
        for (Atividade a : atividades) {
            if (a.getTitulo().equalsIgnoreCase(titulo)) {
                return a;
            }
        }
        return null;
    }

    public static void pesquisarAtividade() {
        System.out.print("Digite o título da atividade: ");
        String titulo = sc.nextLine();
        Atividade a = encontrarAtividade(titulo);
        if (a != null) {
            System.out.println(a);
        } else {
            System.out.println("Atividade não encontrada.");
        }
    }

    public static void excluirAtividade() {
        System.out.print("Digite o título da atividade a excluir: ");
        String titulo = sc.nextLine();
        Atividade a = encontrarAtividade(titulo);
        if (a != null) {
            atividades.remove(a);
            System.out.println("Atividade excluída com sucesso!");
        } else {
            System.out.println("Atividade não encontrada.");
        }
    }

    public static void atualizarAtividade() {
        System.out.print("Digite o título da atividade a atualizar: ");
        String titulo = sc.nextLine();
        Atividade a = encontrarAtividade(titulo);
        if (a != null) {
            System.out.print("Novo título: ");
            a.setTitulo(sc.nextLine());
            System.out.print("Nova descrição: ");
            a.setDescricao(sc.nextLine());
            System.out.println("Atividade atualizada com sucesso!");
        } else {
            System.out.println("Atividade não encontrada.");
        }
    }

    public static void iniciarAtividade() {
        System.out.print("Título da atividade a iniciar: ");
        String titulo = sc.nextLine();
        Atividade a = encontrarAtividade(titulo);
        if (a != null && a.getStatus().equals("Pendente")) {
            a.setStatus("Em andamento");
            System.out.println("Atividade iniciada com sucesso!");
        } else {
            System.out.println("Atividade não encontrada ou já iniciada.");
        }
    }

    public static void finalizarAtividade() {
        System.out.print("Título da atividade a finalizar: ");
        String titulo = sc.nextLine();
        Atividade a = encontrarAtividade(titulo);
        if (a != null && a.getStatus().equals("Em andamento")) {
            a.setStatus("Concluída");
            System.out.println("Atividade finalizada com sucesso!");
        } else {
            System.out.println("Atividade não encontrada ou já finalizada.");
        }
    }

    public static void listarAtividades() {
        int opcao;
        do {
            System.out.println("\n*** SUBMENU DE LISTAGEM ***");
            System.out.println("1 - Todas");
            System.out.println("2 - Pendentes");
            System.out.println("3 - Em andamento");
            System.out.println("4 - Concluídas");
            System.out.println("5 - Voltar");
            System.out.print("Escolha uma opção: ");
            opcao = sc.nextInt();
            sc.nextLine();

            String filtro = null;
            switch (opcao) {
                case 2: filtro = "Pendente"; break;
                case 3: filtro = "Em andamento"; break;
                case 4: filtro = "Concluída"; break;
            }

            if (opcao >= 1 && opcao <= 4) {
                boolean encontrou = false;
                for (Atividade a : atividades) {
                    if (filtro == null || a.getStatus().equals(filtro)) {
                        System.out.println("\n" + a);
                        encontrou = true;
                    }
                }
                if (!encontrou) {
                    switch (opcao) {
                        case 1 -> System.out.println("Nenhuma atividade cadastrada.");
                        case 2 -> System.out.println("Nenhuma atividade pendente cadastrada.");
                        case 3 -> System.out.println("Nenhuma atividade em andamento cadastrada.");
                        case 4 -> System.out.println("Nenhuma atividade concluída cadastrada.");
                    }
                }
            }

        } while (opcao != 5);
    }
}

class Atividade {
    private String titulo;
    private String descricao;
    private String status;

    public Atividade(String titulo, String descricao) {
        this.titulo = titulo;
        this.descricao = descricao;
        this.status = "Pendente";
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Título: " + titulo + "\nDescrição: " + descricao + "\nStatus: " + status;
    }
}
