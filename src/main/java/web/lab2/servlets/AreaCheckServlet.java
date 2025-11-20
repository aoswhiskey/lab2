package web.lab2.servlets;

import web.lab2.exceptions.*;
import web.lab2.model.ShotResult;
import web.lab2.utility.Checker;
import web.lab2.utility.Parser;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.io.PrintWriter;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class AreaCheckServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            if ("true".equals(req.getParameter("areaClick"))) {
                List<ShotResult> shotResults = fillContextData(req, true);
                sendJSONResponse(shotResults, resp);
            } else {
                List<ShotResult> shotResults = fillContextData(req, false);
                ServletContext context = req.getServletContext();
                context.setAttribute("shotCount", shotResults.size());
                req.getRequestDispatcher("/jsp/shot_result.jsp").forward(req, resp);
            }
        } catch (ValidationException | RequestException e) {
            ServletContext context = req.getServletContext();
            context.setAttribute("current_error", e.getMessage());
            req.getRequestDispatcher("/jsp/error.jsp").forward(req, resp);
        } catch (JSONException e) {
            ServletContext context = req.getServletContext();
            context.setAttribute("current_error", "Ошибка сервера. Попробуйте снова.");
        }
    }

    private void sendJSONResponse(List<ShotResult> shotResults, HttpServletResponse resp) throws IOException, JSONException {
        PrintWriter out = resp.getWriter();
        JSONArray jsonArray = new JSONArray();
        for (ShotResult shotResult : shotResults){
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("x", shotResult.getGraphShot().getX());
            jsonObject.put("y", shotResult.getGraphShot().getY());
            jsonObject.put("r", shotResult.getGraphShot().getR());
            jsonObject.put("result", shotResult.isInArea());
            jsonArray.put(jsonObject);
        }

        out.println(jsonArray);
    }
    private List<ShotResult> fillContextData(HttpServletRequest req, boolean areaClick) throws ValidationException, RequestException {
        List<HashMap<String, Double>> requestList = Parser.parse(req, areaClick);
        ServletContext context = req.getServletContext();
        if (context.getAttribute("shots") == null) {
            context.setAttribute("shots", new ArrayList<ShotResult>());
        }
        List<ShotResult> filledShots = new ArrayList<>();
        for (HashMap<String, Double> requestParams : requestList){
            @SuppressWarnings("unchecked")
            ArrayList<ShotResult> shotResults = (ArrayList<ShotResult>) context.getAttribute("shots");
            double x = requestParams.get("x");
            double y = requestParams.get("y");
            double r = requestParams.get("r");

            ShotResult shotResult = new ShotResult(x, y, r, Checker.checkParams(x, y, r));
            shotResults.add(shotResult);
            filledShots.add(shotResult);
        }

        return filledShots;
    }
}
