// vertex class
class V {
    // list of edges
    ArrayList < E > edges = new ArrayList < E > ();

    // boolean for if vertex is currently selected
    boolean isSelected = false;

    // vertex label
    String label = "";

    // vertex color
    color c = color(255, 255, 255);

    // x and y position
    float x;
    float y;

    // vertex constructor
    V() {
        x = mouseX;
        y = mouseY;
    }
}
