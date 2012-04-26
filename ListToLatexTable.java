import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.BufferedWriter;
import java.io.FileWriter;


public class ListToLatexTable{
    public static void main(final String[] args){
        if (args.length < 2){
            System.err.println("Usage: java ListToLatexTable <input file> <output file>");
            return;
        }
        final ListToLatexTable l = new ListToLatexTable(args[0],args[1]);
        l.parse();
    } // main(String[])

    private static final int MAX = 3;
    private final String infile;
    private final String outfile;
    public ListToLatexTable(final String infile, final String outfile){
        this.infile = infile;
        this.outfile = outfile;
    } // ListToLatexTable(String, String)

    private static void print(final String s){
        System.out.print(s);
    } // print(String)

    private String makeString(final String s, final int pos){
        if (pos % MAX == 0){
            return s + "\\\\\\hline\n";
        } // if
        return s + "&";
    } // makeString(String, pos)

    public void parse(){
        BufferedReader br = null;
        BufferedWriter bw = null;
        try{
            br = new BufferedReader(new FileReader(infile));
            bw = new BufferedWriter(new FileWriter(outfile));
            bw.write("\\begin{tabular}{|");
            for (int i=0; i < MAX; i++){
                bw.write("l|");
            } // for
            bw.write("}\\hline\n");
            String s;
            for (int i=1; (s = br.readLine()) != null; i++){
                bw.write(makeString(s,i));
            } // for
            bw.write("\\end{tabular}\n");
        } catch (final IOException e){
            e.printStackTrace();
        } finally {
            if (br != null){
                try{
                    br.close();
                } catch (final IOException e){
                    e.printStackTrace();
                } // catch
            } // if
            if (bw != null){
                try{
                    bw.close();
                } catch (final IOException e){
                    e.printStackTrace();
                } // catch
            } // if
        } // finally
    } // parse()
    
} // class ListToLatexTable
