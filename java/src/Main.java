import java.lang.Cloneable;
import java.lang.CloneNotSupportedException;
import java.lang.reflect.*;
import local.LocalFoo;
import local.LocalBar;
import local.sub.LocalSubBaz;
import foreign.Baz;
import foreign.J2SE5;

interface A {
    public void fooA();
}

interface B extends A {

    public int value = 0; // FINAL

    public void fooB();

    default void barB() {}
}

class C implements B {
    public void fooA() {}
    public void fooB() {}
}

abstract class D implements B {
    public abstract void fooD();
    public void barD() {}
}

class F extends D {
    public void fooA() {}
    public void fooB() {}
    public void fooD() {}
}

class G extends F implements Cloneable {

    private int value;

    G(int value) {
        this.value = value;
    }

    public void fooA() {}

    public Object clone() throws CloneNotSupportedException{
        return super.clone();
    }
}

interface LocalFooInterface {
    void whoami();
}

class Main {

    public static void main(String[] args) throws ClassNotFoundException, NoSuchMethodException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {

        G g = new G(1);
        try {
            G gc = (G) g.clone();
        } catch (CloneNotSupportedException err) { // or add CloneNotSupportedException to void main() throws
            System.out.println(err);
        }

        int intArray1[] = {1, 2, 3, 4};
        int[] intArray2 = {1, 2, 3, 4};
        int[] intArray3 = new int[4];

        System.out.println("Hello World!");

        Class myClass = Class.forName("local.LocalFoo");
        Method method = myClass.getDeclaredMethod("whoami");
        Object result = method.invoke(null);
        // or
        LocalFoo.whoami();
        // or
        LocalFooInterface lf = LocalFoo::whoami;
        lf.whoami();

        LocalFoo f = new LocalFoo(1);
        System.out.println(f.getBar());

        LocalBar b = new LocalBar(2);
        System.out.println(b.getBaz());

        LocalSubBaz lbz = new LocalSubBaz(3);
        System.out.println(lbz.getBaz());

        Baz bz = new Baz(4);
        System.out.println(bz.getBaz());

        J2SE5 gbzi = new J2SE5(1);
        System.out.println(gbzi.getBaz());

        J2SE5 gbzs = new J2SE5("1");
        System.out.println(gbzs.getBaz());

    }
}
