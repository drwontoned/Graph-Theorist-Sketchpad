void move(){
  if(mouseOverVertex() == true){
    if(getVertexIndex() != -1){
      V current = Vertices.get(getVertexIndex());
      current.updatePointVariables();
    }
  }
}

boolean mouseOverVertex(){
    boolean over = false;
    // loop through list of vertices
    for (int i = 0; i < Vertices.size(); i++) {
        V current = Vertices.get(i);
        // check if mouse is within bounds of any vertex
        if (mouseX > current.x - 25 && mouseX < current.x + 25 && mouseY > current.y - 25 && mouseY < current.y + 25) {
          over = true;
        }
    }
    return over;
}

int getVertexIndex(){
  int index = -1;
  for (int i = 0; i < Vertices.size(); i++) {
        V current = Vertices.get(i);
        // check if mouse is within bounds of any vertex
        if (mouseX > current.x - 25 && mouseX < current.x + 25 && mouseY > current.y - 25 && mouseY < current.y + 25) {
          index = i;
        }
    }
    return index;
}
