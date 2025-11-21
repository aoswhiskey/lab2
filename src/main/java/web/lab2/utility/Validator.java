package web.lab2.utility;

import web.lab2.exceptions.ValidationException;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Validator {
    public static double validateXString(String x, boolean areaClick) throws ValidationException {
        try{
            double xValue = Double.parseDouble(x);

            if (!areaClick) {
                if (xValue != (int) xValue) {
                    throw new ValidationException("X must be an integer");
                }

                int xInt = (int) xValue;

                if ((xInt < -5) || (xInt > 3)) {
                    throw new ValidationException("X must be an integer in range of [-5; 3]");
                }
            }
            return xValue;
        } catch (NumberFormatException e){
            throw new ValidationException("X must be a valid integer!");
        }
    }

    public static double validateYString(String y,  boolean areaClick) throws ValidationException{
        try{
            double yValue = Double.parseDouble(y);
            if (!areaClick && (yValue <= -3 || yValue >= 3)){
                throw new ValidationException("Y must be in range of (-3, 3)");
            }
            return yValue;
        } catch (NumberFormatException e){
            throw new ValidationException("Y must be a valid double!");
        }

    }

    private static final List<Double> validRValues = Arrays.asList(1.0, 1.5, 2.0, 2.5, 3.0);
    public static double validateRString(String r) throws ValidationException{
        try{
            double rValue = Double.parseDouble(r);
            if (!validRValues.contains(rValue)){
                throw new ValidationException("R value must be selected from: " + validRValues);
            }
            return rValue;
        } catch (NumberFormatException e){
            throw new ValidationException("R must be a valid double!");

        }
    }


}