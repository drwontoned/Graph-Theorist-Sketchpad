// vertex class
class V {
    // list of edges
    ArrayList < E > edges = new ArrayList < E > ();

    // boolean for if vertex is currently selected
    boolean isSelected = false;

    // vertex label
    String label = "";

    // vertex color
    VertexColor c;

    // x and y position
    float x;
    float y;

    // vertex constructor
    V() {
        x = mouseX;
        y = mouseY;
        c = ColorArray[12];
    }
    
    void updatePointVariables(){
        x = mouseX;
        y = mouseY;
        for(int i = 0; i<edges.size(); i++){
          edges.get(i).updatePointVariables();
        }
    }
}
