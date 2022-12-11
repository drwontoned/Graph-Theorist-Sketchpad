// vertex class
class V {
    // list of edges
    ArrayList < E > edges = new ArrayList < E > ();

    // boolean for if vertex is currently selected
    boolean isSelected = false;

    // vertex label
    String label = "";

    //vertex id
    String id;
    
    // vertex color
    VertexColor c;

    // x and y position
    float x;
    float y;

    // vertex constructor
    V() {
        x = mouseX;
        y = mouseY;
        id = "" + Vertices.size()+1;
        c = ColorList.get(12);
    }
    
    void updatePointVariables(){
        x = mouseX;
        y = mouseY;
        for(int i = 0; i<edges.size(); i++){
          edges.get(i).updatePointVariables();
        }
    }
    
    ArrayList<V> getAdjacentV(){
      ArrayList<V> adjacentV = new ArrayList<V>();
      for(int i = 0; i<edges.size(); i++){
        E currentE = edges.get(i);
        if(currentE.isLoop == false){
          if(currentE.Vertex1.id != id){
            adjacentV.add(currentE.Vertex2);
          }else{
            adjacentV.add(currentE.Vertex1);
          }
        }
      }
      return adjacentV; //<>//
  }
}
