public class Type {
    public static void main(String[] args) {
        objPoolTest();
    }

    public static void objPoolTest() {
        int i0 = 40;
        int i1 = 40;
        Integer I0 = 40;
        Integer I1 = 40;
        Integer I2 = 0;
        Integer I3 = new Integer(40);
        Integer I4 = new Integer(40);
        Integer I5 = new Integer(0);
        double d0 = 1.0;
        double d1 = 1.0;
        Double D0 = 1.0;
        Double D1 = 1.0;

        System.out.println("i0 == i1\t" + (i0 == i1));
        System.out.println("I0 == I1\t" + (I0 == I1));
        System.out.println("i0 == I0\t" + (i0 == I0));
        System.out.println("I0 == I1 + I2\t" + (I0 == I1 + I2));
        System.out.println("I3 == I4\t" + (I3 == I4));
        System.out.println("I3 == I4 + I5\t" + (I3 == I4 + I5));
        System.out.println("d0 == d1\t" + (d0 == d1));
        System.out.println("D0 == D1\t" + (D0 == D1));

        System.out.println();
    }
}
