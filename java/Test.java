public class Test {
    public static void main(String[] args) {
        System.out.println("Begin");

        Test test = new Test();
        int date = 9;
        BirthDate d1 = new BirthDate(7, 7, 1970);
        BirthDate d2 = new BirthDate(1, 1, 2000);
        test.change1(date);
        test.change2(d1);
        test.change3(d2);

        System.out.println("End");
    }

    public void change1(int i) {
        i = 1234;
    }

    public void change2(BirthDate b) {
        b = new BirthDate(22, 2, 2004);
    }

    public void change3(BirthDate b) {
        b.setDay(22);
    }
}

class BirthDate {
    int day;
    int month;
    int year;

    public BirthDate(int day, int month, int year) {
        this.day = day;
        this.month = month;
        this.year = year;
    }

    int getDay() {
        return day;
    }

    void setDay(int day) {
        this.day = day;
    }

    int getMonth() {
        return month;
    }

    void setMonth(int month) {
        this.month = month;
    }

    int getYear() {
        return year;
    }

    void setYear(int year) {
        this.year = year;
    }

}
