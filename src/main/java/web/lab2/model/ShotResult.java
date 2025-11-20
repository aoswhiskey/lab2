package web.lab2.model;

public class ShotResult {
    private GraphShot graphShot;
    private boolean isInArea;

    public ShotResult(double x, double y, double r, boolean isInArea){
        this.graphShot = new GraphShot(x, y, r);
        this.isInArea = isInArea;
    }

    public ShotResult(GraphShot graphShot, boolean isInArea){
        this.graphShot = graphShot;
        this.isInArea = isInArea;
    }

    public GraphShot getGraphShot() {
        return graphShot;
    }


    public boolean isInArea() {
        return isInArea;
    }
}
