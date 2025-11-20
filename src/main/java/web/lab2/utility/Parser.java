package web.lab2.utility;

import web.lab2.exceptions.*;
import jakarta.servlet.http.HttpServletRequest;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class Parser {
    public static List<HashMap<String, Double>> parse(HttpServletRequest request, boolean areaClick) throws ValidationException, RequestException {
        List<HashMap<String, Double>> resultList = new ArrayList<>();
        String[] xValues = request.getParameterValues("x");
        String y = request.getParameter("y");
        String r = request.getParameter("r");
        if ((xValues.length == 0) || (y == null) || (r == null)) {
            throw new RequestException("There are must be at least three parameters: x, y, r");
        }
        for (String x: xValues) {
            HashMap<String, Double> shotMap = new HashMap<>();
            shotMap.put("x", Validator.validateXString(x, areaClick));
            shotMap.put("y", Validator.validateYString(y, areaClick));
            shotMap.put("r", Validator.validateRString(r));
            resultList.add(shotMap);
        }

        return resultList;
    }
}
