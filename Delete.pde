void deleteVertex() { //<>// //<>//
    if (selectedVertex1 == true && selectedVertex2 == false) {
        updateEdgesVertexDelete(selectedVertex1Index);
        Vertices.remove(selectedVertex1Index);
        updateAll();
    }
}

void deleteEdge() {
    if (selectedEdge == true) {
        if (Edges.get(selectedEdgeIndex).parallelCount > 0) {
            Edges.get(selectedEdgeIndex).parallelCount--;
            updateAll();
        } else {
            Edges.remove(selectedEdgeIndex);
            updateAll();
        }
    }
}

void updateEdgesVertexDelete(int selectedVertex1Index) {
    String deletedid = Vertices.get(selectedVertex1Index).id;
    //loop through all edges backward
    for (int i = Edges.size() - 1; i >= 0; i--) {
        //if current edge is a loop
        if (Edges.get(i).isLoop == true) {
            //if the edge is a loop for the to be deleted vertex then remove
            if (Edges.get(i).Vertex1.id == deletedid) {
                Edges.remove(i);
            }
        // if regular edge
        } else {
            // if regular edge is parallel
            if (Edges.get(i).parallelCount > 0) {
                int count = Edges.get(i).parallelCount + 1;
                // if the regular edges vertex 1 is the to be deleted vertex
                if (Edges.get(i).Vertex1.id == deletedid) {
                    // if vertex 2 has loops then update that edges parallel count
                    if (Edges.get(i).Vertex2.hasLoop() == true) {
                        Edges.get(getLoopFromVertex(Edges.get(i).Vertex2.id)).parallelCount += count;
                        Edges.remove(i);
                        updateAll();

                    //if it has no loops then create a replacement edge that is a loop with the parallel count
                    } else {
                        E replacement = new E(Vertices.get(getVertexFromVertices(Edges.get(i).Vertex2.id)), Edges.get(i).id);
                        replacement.parallelCount += count;
                        Edges.remove(i);
                        Edges.add(replacement);
                    }
                // if the regular edges vertex 2 is the to be deleted vertex
                } else if (Edges.get(i).Vertex2.id == deletedid) {
                    if (Edges.get(i).Vertex1.hasLoop() == true) {
                        Edges.get(getLoopFromVertex(Edges.get(i).Vertex1.id)).parallelCount += count;
                        Edges.remove(i);
                        updateAll();

                    //if it has no loops then create a replacement edge that is a loop with the parallel count
                    } else {
                        E replacement = new E(Vertices.get(getVertexFromVertices(Edges.get(i).Vertex1.id)), Edges.get(i).id);
                        replacement.parallelCount += count;
                        Edges.remove(i);
                        Edges.add(replacement);
                        updateAll();
                    }
                }
            // if regular edge has no parallels  
            } else {
              // if the regular edges vertex 1 is the to be deleted vertex
                if (Edges.get(i).Vertex1.id == deletedid) {
                    // if vertex 2 has loops then update that edges parallel count
                    if (Edges.get(i).Vertex2.hasLoop() == true) {
                        Edges.get(getLoopFromVertex(Edges.get(i).Vertex2.id)).parallelCount++;
                        Edges.remove(i);
                        updateAll();

                    //if it has no loops then create a replacement edge that is a loop with the parallel count
                    } else {
                        E replacement = new E(Vertices.get(getVertexFromVertices(Edges.get(i).Vertex2.id)), Edges.get(i).id);
                        replacement.parallelCount ++;
                        Edges.remove(i);
                        Edges.add(replacement);
                        updateAll();
                    }
                // if the regular edges vertex 2 is the to be deleted vertex
                } else if (Edges.get(i).Vertex2.id == deletedid) {
                    if (Edges.get(i).Vertex1.hasLoop() == true) {
                        Edges.get(getLoopFromVertex(Edges.get(i).Vertex1.id)).parallelCount ++;
                        Edges.remove(i);
                        updateAll();

                    //if it has no loops then create a replacement edge that is a loop with the parallel count
                    } else {
                        E replacement = new E(Vertices.get(getVertexFromVertices(Edges.get(i).Vertex1.id)), Edges.get(i).id);
                        replacement.parallelCount ++;
                        Edges.remove(i);
                        Edges.add(replacement);
                        updateAll();
                    }
                }
            }
        }
    }
}

int getVertexFromVertices(String id) {
    int index = -1;
    for (int i = 0; i < Vertices.size(); i++) {
        if (Vertices.get(i).id == id) {
            index = i;
        }
    }
    return index;
}

int getLoopFromVertex(String id) {
    int index = -1;
    for (int i = 0; i < Edges.size(); i++) {
        if (Edges.get(i).isLoop == true) {
            if (Edges.get(i).Vertex1.id == id) {
                index = i;
            }
        }
    }
    return index;
}
