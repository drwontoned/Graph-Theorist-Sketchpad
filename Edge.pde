class E {
    // vertices the edge may be connected to
    V Vertex1;
    V Vertex2;

    // boolean for if edge is currently selected
    boolean isSelected = false;

    // boolean for if the edge is a loop
    boolean isLoop = false;

    // boolean for if the edge is directed
    boolean isDirected = false;

    int parallelCount = 0;

    // variables for making the line or bezier
    float x1;
    float y1;
    float x2;
    float y2;
    float x3;
    float y3;
    float x4;
    float y4;

    // mid point x and y
    float[] edgeMidPoint;

    // regular edge constructor
    E(V v1, V v2) {
        Vertex1 = v1;
        Vertex2 = v2;

        setPointVariables(Vertex1, Vertex2);

        edgeMidPoint = midPoint();
    }

    // loop constructor
    E(V v1) {
        Vertex1 = v1;

        isLoop = true;

        setPointVariables(Vertex1);

        edgeMidPoint = midPoint();
    }

    // mid point calculator
    float[] midPoint() {
        float[] midPoint = new float[2];
        if (isLoop == false) {
            midPoint[0] = (x1 + x2) / 2;
            midPoint[1] = (y1 + y2) / 2;
        } else {
            midPoint[0] = (x2 + x3) / 2;
            midPoint[1] = ((y2 + y3) / 2) + 10;
        }
        return midPoint;
    }
    
    // method for setting the point variables when regular edge
    void setPointVariables(V v1, V v2) {
        x1 = v1.x;
        y1 = v1.y;
        x2 = v2.x;
        y2 = v2.y;
    }
    
    // method for setting point variables when loop
    void setPointVariables(V v1) {
        x1 = v1.x - 10;
        y1 = v1.y - 10;
        x2 = v1.x - 50;
        y2 = v1.y - 50;
        x3 = v1.x + 50;
        y3 = v1.y - 50;
        x4 = v1.x + 10;
        y4 = v1.y - 10;
    }
    
    // method for updating the point variables when a vertex is being moved
    void updatePointVariables() {
        if (isLoop == false) {
            setPointVariables(Vertex1,Vertex2);
        } else {
            setPointVariables(Vertex1);
        }
        edgeMidPoint = midPoint();
    }
}
