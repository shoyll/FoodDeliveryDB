import java.sql.*;
import java.util.Scanner;

public class Test {
    public static void main(String[] args) throws SQLException {

        sc.useDelimiter("\n");

        try{
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/delivery", username, password);
        } catch (SQLException e) {
            e.printStackTrace();
        }

       try{
           int scelta;

           do{
               System.out.println("\n\n");
               System.out.println("Scegli un'operazione: ");
               System.out.println("1 - Registrazione di un ordine ");
               System.out.println("2 - Consegna di un ordine ");
               System.out.println("3 - Disponibilita' di un ristorante a ricevere un nuovo ordine");
               System.out.println("4 - Visualizza ristoranti disponibili all'accettazione di un ordine");
               System.out.println("5 - Valutazione di un raider");
               System.out.println("6 - Ordini per cliente");
               System.out.println("7 - Abilitazione di una societa' ad un servizio di delivery");

               System.out.println("Scelta: ");
               scelta = sc.nextInt();

               switch(scelta){
                   case 1 :
                       es1();
                       break;

                   case 2 :
                       es2();
                       break;

                   case 3 :
                       es3();
                       break;

                   case 4 :
                       es4();
                       break;

                   case 5 :
                       es5();
                       break;

                   case 6 :
                       es6();
                       break;

                   case 7 :
                       es7();
                       break;
               }
           }while(scelta != 0);
       }catch(Exception e){
           e.printStackTrace();
       }
    }

    static void es1(){
        try {
            PreparedStatement statement;
            ResultSet rs;
            statement = conn.prepareStatement("INSERT INTO ordine VALUES (0,?,?,?,?,?,?,?,?,?,?,?)");

            String dataOrdinazione,orarioEffettivo,stato,tipo,orarioConsegnaPresunto,nominativoRitiro,nomeRistorante,indirizzoRistorante,
                    cfDipendente,cfRider,cfCliente;

            sc.nextLine();

            System.out.println("Consegna un dipendente o un rider? (0- Dipendente, 1- Rider) : ");
            if(sc.nextInt() == 0) {
                sc.nextLine();
                System.out.println("Codice Fiscale del Dipendente : ");
                cfDipendente = sc.nextLine();
                statement.setString(10,null);
                statement.setString(9,cfDipendente);

            }else{
                sc.nextLine();
                System.out.println("Codice Fiscale del Rider : ");
                cfRider = sc.nextLine();
                statement.setString(10,cfRider);
                statement.setString(9,null);
            }

            System.out.println("Data Ordinazione (yyyy-mm-dd) : ");
            dataOrdinazione = sc.nextLine();
            System.out.println("Orario Effettivo (hh:mm) : ");
            orarioEffettivo = sc.nextLine();
            System.out.println("Stato ['Ordinato','Espletato','Consegnato']  : ");
            stato = sc.nextLine();
            System.out.println("Tipo : ");
            tipo = sc.nextLine();
            System.out.println("Orario Consegna Presunto (hh:mm) : ");
            orarioConsegnaPresunto = sc.nextLine();
            System.out.println("Nominativo Ritiro : ");
            nominativoRitiro = sc.nextLine();
            System.out.println("Nome Ristorante : ");
            nomeRistorante = sc.nextLine();
            System.out.println("Indirizzo Ristorante : ");
            indirizzoRistorante = sc.nextLine();
            System.out.println("Codice Fiscale del Cliente : ");
            cfCliente = sc.nextLine();

            statement.setString(1,dataOrdinazione);
            statement.setString(2,orarioEffettivo);
            statement.setString(3,stato);
            statement.setString(4,tipo);
            statement.setString(5,orarioConsegnaPresunto);
            statement.setString(6,nominativoRitiro);
            statement.setString(7,nomeRistorante);
            statement.setString(8,indirizzoRistorante);
            statement.setString(11,cfCliente);



            System.out.println(statement.executeUpdate() + " righa/e modificata/e ");

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    static void es2() throws SQLException {
        int id;
        System.out.println("Inserire ID Dell'ordine da consegnare: ");
        id = sc.nextInt();

        String idString = Integer.toString(id);

        PreparedStatement st;
        st = conn.prepareStatement("UPDATE Ordine SET stato = 'Consegnato' WHERE nOrdine = ?");

        st.setString(1,idString);

        if(st.executeUpdate() > 0){
            System.out.println("Ordine numero " + idString + " consegnato.");
        }else{
            System.out.println("Ordine numero " + idString + " non trovato.");
        }
    }

    static void es3() throws SQLException {
        sc.nextLine();
        Statement st;
        ResultSet rs;

        String nomeRistorante;
        System.out.println("Nome Ristorante : ");
        nomeRistorante = sc.nextLine();

        st = conn.createStatement();
        rs = st.executeQuery("select maxPrenotazioni,nome,count(*) as numeroOrdini from ristorante left join ordine ON nome = nomeRistorante AND indirizzo = indirizzoRistorante WHERE stato <> \"Consegnato\" OR stato is null GROUP BY nome HAVING numeroOrdini < maxPrenotazioni");

        int trovato = 0;

        while(rs.next()){
            if(rs.getString("nome").equals(nomeRistorante)) trovato = 1;
        }

        if (trovato == 1){
            System.out.println("Ristorante disponibile ad accettare nuovi ordini");
        }else{
            System.out.println("Coda Ordini Piena");
        }

    }

    static void es4() throws SQLException {
        Statement st;
        ResultSet rs;

        st = conn.createStatement();
        rs = st.executeQuery("select maxPrenotazioni,nome,count(*) as numeroOrdini from ristorante left join ordine ON nome = nomeRistorante AND indirizzo = indirizzoRistorante WHERE stato <> \"Consegnato\" OR stato is null GROUP BY nome HAVING numeroOrdini < maxPrenotazioni");

        while(rs.next()){
            System.out.println(rs.getString("nome"));
        }


    }

    static void es5() throws SQLException {
        sc.nextLine();
        PreparedStatement st = conn.prepareStatement("INSERT INTO Valutazione VALUES(?,?,?,?)");

        String dataValutazione;
        String score;
        String cfCliente;
        String cfRaider;

        System.out.println("Data Valutazione (yyyy-mm-dd) : ");
        dataValutazione = sc.nextLine();
        st.setString(1,dataValutazione);
        System.out.println("Score (da 1 a 5) : ");
        score = sc.nextLine();
        st.setString(2,score);
        System.out.println("Codice Fiscale del Cliente : ");
        cfCliente = sc.nextLine();
        st.setString(3,cfCliente);
        System.out.println("Codice Fiscale del Raider : ");
        cfRaider = sc.nextLine();
        st.setString(4,cfRaider);

        System.out.println(st.executeUpdate() + " righa/e modificata/e ");
    }

    static void es6() throws SQLException {
        Statement st = conn.createStatement();
        ResultSet rs;

        String sql = "select nome,cognome, count(cf) as nOrdini from ordine o join cliente c on o.cfCliente = c.cf GROUP BY nome";

        rs = st.executeQuery(sql);

        while(rs.next()){
            System.out.println(rs.getString("Nome") + " " + rs.getString("Cognome") + " " + rs.getString("nOrdini"));
        }

    }

    static void es7() throws SQLException {
        sc.nextLine();
        PreparedStatement st = conn.prepareStatement("INSERT INTO delivery_esterno VALUES (?,?,?,?,?,?,?)");

        String codice;
        String descrizione;
        String cadenzaSettimanale;
        String dataInizio;
        String nomeRistorante;
        String indirizzoRistorante;
        String ivaSocieta;

        System.out.println("Nuovo codice Delivery: ");
        codice = sc.nextLine();
        st.setString(1,codice);

        System.out.println("Descrizione: ");
        descrizione = sc.nextLine();
        st.setString(2,descrizione);

        System.out.println("Cadenza Settimanale: ");
        cadenzaSettimanale = sc.nextLine();
        st.setString(3,cadenzaSettimanale);

        System.out.println("Data inizio (yyyy-mm-dd) : ");
        dataInizio = sc.nextLine();
        st.setString(4,dataInizio);

        System.out.println("Nome Ristorante: ");
        nomeRistorante = sc.nextLine();
        st.setString(5,nomeRistorante);

        System.out.println("Indirizzo Ristorante: ");
        indirizzoRistorante = sc.nextLine();
        st.setString(6,indirizzoRistorante);

        System.out.println("Iva Societa: ");
        ivaSocieta = sc.nextLine();
        st.setString(7,ivaSocieta);

        System.out.println(st.executeUpdate() + " righa/e modificata/e ");
    }

    static Connection conn = null;
    static String username = "root";
    static String password = "password";
    static Scanner sc = new Scanner(System.in);
}
