package web.lab2.utility;

public class Checker {
    public static boolean checkParams(double x, double y, double r) {
        boolean isInFirstQuarter = (y >= 0) && (x >= 0);
        boolean isInSecondQuarter = (y >= 0) && (x <= 0);
        boolean isInThirdQuarter = (y <= 0) && (x <= 0);
        boolean isInFourthQuarter = (y < 0) && (x > 0);

        return (( isInFirstQuarter & (y <= (-2 * x + 1 * r)) ) || ( isInSecondQuarter & (Math.pow(x, 2) + Math.pow(y, 2) <= Math.pow(r, 2)) ) || ( isInThirdQuarter  & (y >= - 1 * r) & (x >= -0.5 * r) )) & !isInFourthQuarter;
    }
}