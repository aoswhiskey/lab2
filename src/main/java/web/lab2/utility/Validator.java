package web.lab2.utility;

import web.lab2.exceptions.ValidationException;

public class Validator {
    public static double validateXString(String x, boolean areaClick) throws ValidationException {
        try{
            double xValue = Double.parseDouble(x);
            int xInt = Integer.parseInt(x);
            if (!areaClick && (xInt >= -3) && (xInt <= 5)){
                throw new ValidationException("X must be an integer in range of [-3; 5]");
            }
            return xValue;
        } catch (NumberFormatException e){
            throw new ValidationException("X must be an integer!");
        }
    }

    public static double validateYString(String y,  boolean areaClick) throws ValidationException{
        try{
            double yValue = Double.parseDouble(y);
            if (!areaClick && (yValue <= -5 || yValue >=3)){
                throw new ValidationException("Y must be in range of (-5, 3)");
            }
            return yValue;
        } catch (NumberFormatException e){
            throw new ValidationException("Y must be a double!");
        }

    }

    public static double validateRString(String r) throws ValidationException{
        try{
            double rValue = Double.parseDouble(r);
            if (rValue <= 1 || rValue >=4){
                throw new ValidationException("R must be in range of (1, 4)");
            }
            return rValue;
        } catch (NumberFormatException e){
            throw new ValidationException("R must be a double!");

        }
    }


}