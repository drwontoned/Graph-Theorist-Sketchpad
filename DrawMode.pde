void DrawModeClick() { //<>//

    // if left clicked
    if (mouseButton == LEFT) {
        // check if currently overlapping
        boolean overlap = overlapping();

        // check if in range of selecting a vertex and if so select the vertex
        twoVertexSelect();

        // if not overlapping draw vertex and deselect vertices
        if (overlap == false) {
            if (selectedVertex2 == true) {
                selectedVertex2 = false;
                Vertices.get(selectedVertex2Index).isSelected = false;
                selectedVertex2Index = -1;
            }
            if (selectedVertex1 == true) {
                selectedVertex1 = false;
                Vertices.get(selectedVertex1Index).isSelected = false;
                selectedVertex1Index = -1;
            }
            V vertex = new V();
            Vertices.add(vertex);

        }

        // if right clicked
    } else {

        // if there is a selected vertex
        if (selectedVertex1 == true) {
            V v1 = Vertices.get(selectedVertex1Index);

            // if there is a second selected vertex create a regular edge
            if (selectedVertex2 == true) {
                V v2 = Vertices.get(selectedVertex2Index);
                Boolean isParallel = parallel(v1, v2);
                if (isParallel == false) {
                    E edge = new E(v1, v2);
                    v1.edges.add(edge);
                    v2.edges.add(edge);
                    Edges.add(edge);
                } else {
                    updateParallelEdge(v1, v2);
                }

                // if there is not a second selected vertex create a loop
            } else {
                Boolean isParallel = parallel(v1);
                if (isParallel == false) {
                    E edge = new E(v1);
                    v1.edges.add(edge);
                    Edges.add(edge);
                } else {
                    updateParallelEdge(v1);
                }
            }
        }
    }
}

Boolean overlapping() {
    boolean overlap = false;
    for (int i = 0; i < Vertices.size(); i++) {
        V current = Vertices.get(i);
        if (mouseX > current.x - 60 && mouseX < current.x + 60 && mouseY > current.y - 60 && mouseY < current.y + 60) {
            overlap = true;
        }
    }
    return overlap;
}

// check if regular edge is parallel
Boolean parallel(V v1, V v2) {
    boolean isParallel = false;
    for (int i = 0; i < Edges.size(); i++) {
        E current = Edges.get(i);
        if (current.isLoop == false) {
            if ((current.Vertex1 == v1 && current.Vertex2 == v2) || (current.Vertex1 == v2 && current.Vertex2 == v1)) {
                isParallel = true;
            }
        }
    }
    return isParallel;
}

// check if loop is parallel
Boolean parallel(V v1) {
    boolean isParallel = false;
    for (int i = 0; i < Edges.size(); i++) {
        E current = Edges.get(i);
        if (current.isLoop == true) {
            if (current.Vertex1 == v1) {
                isParallel = true;
            }
        }
    }
    return isParallel;
}

void updateParallelEdge(V v1, V v2) {
    for (int i = 0; i < Edges.size(); i++) {
        E current = Edges.get(i);
        if (current.isLoop == false) {
            if ((current.Vertex1 == v1 && current.Vertex2 == v2) || (current.Vertex1 == v2 && current.Vertex2 == v1)) {
                current.parallelCount++;
            }
        }
    }
}

void updateParallelEdge(V v1) {
    for (int i = 0; i < Edges.size(); i++) {
        E current = Edges.get(i);
        if (current.isLoop == true) {
            if (current.Vertex1 == v1) {
                current.parallelCount++;
            }
        }
    }
}
