import com.humans.Malay;
import com.species.HumanInteraface;

public class Main {

  public static void main(String[] args) {
    Malay h1 = new Malay("Abu", 20, "Melayu-Melaka");
    printHuman(h1);
  }

  public static void printHuman(HumanInteraface h) {
    System.out.println(h.getName() + " " + h.getRaces() + " " + h.getAge());
  }

}
