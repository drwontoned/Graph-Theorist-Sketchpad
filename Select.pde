void twoVertexSelect() {
    // loop through list of vertices
    for (int i = 0; i < Vertices.size(); i++) {
        V current = Vertices.get(i);
        // check if mouse is within bounds of any vertex
        if (mouseX > current.x - 25 && mouseX < current.x + 25 && mouseY > current.y - 25 && mouseY < current.y + 25) {

            // if currently looking at selected vertex 1
            if (i == selectedVertex1Index) {

                // if there is not a second selected vertex deselect
                if (selectedVertex2 == false) {
                    current.isSelected = false;
                    selectedVertex1 = false;
                    selectedVertex1Index = -1;

                    // if there is a second selected vertex
                } else {
                    current.isSelected = false;
                    // convert it to selected vertex 1
                    selectedVertex1 = selectedVertex2;
                    selectedVertex1Index = selectedVertex2Index;

                    // set the selected vertex 2 to be nothing
                    selectedVertex2 = false;
                    selectedVertex2Index = -1;
                }

                // if currently looking at selected vertex 2 deselect
            } else if (i == selectedVertex2Index) {
                current.isSelected = false;
                selectedVertex2 = false;
                selectedVertex2Index = -1;

                // if looking at a non selected vertex
            } else {

                // if there is a selected vertex 1
                if (selectedVertex1 == true) {
                    // if there is a selected vertex 2
                    if (selectedVertex2 == true) {
                        //deselect selected vertex 1
                        Vertices.get(selectedVertex1Index).isSelected = false;

                        // convert selected vertex 2 to selected vertex 1
                        selectedVertex1 = selectedVertex2;
                        selectedVertex1Index = selectedVertex2Index;

                        // set the new selected vertex 2
                        selectedVertex2Index = i;
                        current.isSelected = true;

                        // if there is not a selected vertex 2
                    } else {
                        // set selected vertex 2
                        selectedVertex2 = true;
                        selectedVertex2Index = i;
                        current.isSelected = true;
                    }
                    // if there is not a selected vertex 1
                } else {
                    // set selected vertex 1
                    selectedVertex1 = true;
                    selectedVertex1Index = i;
                    current.isSelected = true;
                }
            }
        }
    }
}

void oneVertexSelect() {
  // loop through list of vertices
    for (int i = 0; i < Vertices.size(); i++) {
        V current = Vertices.get(i);
        // check if mouse is within bounds of any vertex
        if (mouseX > current.x - 25 && mouseX < current.x + 25 && mouseY > current.y - 25 && mouseY < current.y + 25) {
            clearSelectedEdges();
            // if currently looking at selected vertex 1 then deselect
            if (i == selectedVertex1Index) {
                current.isSelected = false;
                selectedVertex1 = false;
                selectedVertex1Index = -1;
            // if looking at a non selected vertex
            } else {
                // if there is a selected vertex 1
                if (selectedVertex1 == true) {
                    //deselect selected vertex 1
                    Vertices.get(selectedVertex1Index).isSelected = false;

                    // set selected vertex 1 to new vertex
                    current.isSelected = true;
                    selectedVertex1Index = i;
                    
                    // if there is not a selected vertex 1
                } else {
                    // set selected vertex 1
                    selectedVertex1 = true;
                    selectedVertex1Index = i;
                    current.isSelected = true;
                }
            }
        }
    }
}

void edgeSelect() {
    // loop through list of edges
    for (int i = 0; i < Edges.size(); i++) {
        E current = Edges.get(i);

        // check if mouse is within bounds of any edge mid point
        if (mouseX > current.edgeMidPoint[0] - 10 && mouseX < current.edgeMidPoint[0] + 10 && mouseY > current.edgeMidPoint[1] - 10 && mouseY < current.edgeMidPoint[1] + 10) {
            clearSelectedVertices();
            // if currently looking at selected edge then deselect
            if (i == selectedEdgeIndex) {
                current.isSelected = false;
                selectedEdge = false;
                selectedEdgeIndex = -1;

                // if looking at a non selected edge
            } else {
                // if there is a selected edge
                if (selectedEdge == true) {
                    // deselect the selected edge
                    Edges.get(selectedEdgeIndex).isSelected = false;

                    // set new selected Edge
                    current.isSelected = true;
                    selectedEdgeIndex = i;

                    // if there is no selected edge       
                } else {
                    // set selected edge
                    selectedEdge = true;
                    current.isSelected = true;
                    selectedEdgeIndex = i;
                }
            }
        }
    }
}

void clearSelected() {
    //deselect all vertices
    for (int i = 0; i < Vertices.size(); i++) {
        Vertices.get(i).isSelected = false;
    }
    selectedVertex1 = false;
    selectedVertex1Index = -1;
    selectedVertex2 = false;
    selectedVertex2Index = -1;

    //deselect all edges
    for (int i = 0; i < Edges.size(); i++) {
        Edges.get(i).isSelected = false;
    }
    selectedEdge = false;
    selectedEdgeIndex = -1;
}

void clearSelectedVertices() {
    //deselect all vertices
    for (int i = 0; i < Vertices.size(); i++) {
        Vertices.get(i).isSelected = false;
    }
    selectedVertex1 = false;
    selectedVertex1Index = -1;
    selectedVertex2 = false;
    selectedVertex2Index = -1;
}

void clearSelectedEdges() {
    //deselect all edges
    for (int i = 0; i < Edges.size(); i++) {
        Edges.get(i).isSelected = false;
    }
    selectedEdge = false;
    selectedEdgeIndex = -1;
}
