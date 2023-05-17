package foreign;

public class J2SE5<T> {

  public enum Season {
    WINTER,
    SPRING,
    SUMMER,
    FALL
  }

  T baz;

  public J2SE5(T baz) {
    this.baz = baz;
    for (Season s: Season.values()) {
      System.out.println(s);
    }
  }

  public T getBaz() {
    return this.baz;
  }

}
