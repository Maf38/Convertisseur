package ejb;

import java.util.Map;
import javax.ejb.Remote;

/**
 *
 * @author gai
 */
@Remote
public interface ControleurRemote {
     double convertir(String source, String cible, double montant) ;                                                                                         
     Map getConversionTable();
     
    public String hello();
    public double plus(double nb1, double nb2);
    public double divise(double nb1, double nb2);
    public double moins(double nb1, double nb2);
    public double multiplie(double nb1, double nb2);
     
     
}