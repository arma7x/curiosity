package local;

public class LocalFoo {

  public int bar;

  public LocalFoo(int bar) {
    this.bar = bar;
  }

  public int getBar() {
    return this.bar;
  }

  public static void whoami() {
    System.out.println("LocalFoo");
  }

}
