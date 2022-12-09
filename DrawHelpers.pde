void DrawEdges() {
    stroke(0);
    strokeWeight(2);
    for (int i = Edges.size() - 1; i >= 0; i--) {
        E current = Edges.get(i);
        if(current.isSelected == true){
          strokeWeight(3);
        }
        if (current.isLoop == true) {
            noFill();
            bezier(current.x1, current.y1, current.x2, current.y2, current.x3, current.y3, current.x4, current.y4);
            fill(255);
            circle(current.edgeMidPoint[0], current.edgeMidPoint[1], 20);
            strokeWeight(2);
            if (current.parallelCount > 0) {
                fill(0);
                text(current.parallelCount + 1, current.edgeMidPoint[0], current.edgeMidPoint[1] + 2);
            }
        } else if (current.isDirected == true) {

        } else {
            line(current.x1, current.y1, current.x2, current.y2);
            fill(255);
            circle(current.edgeMidPoint[0], current.edgeMidPoint[1], 20);
            strokeWeight(2);
            if (current.parallelCount > 0) {
                fill(0);
                text(current.parallelCount + 1, current.edgeMidPoint[0], current.edgeMidPoint[1] + 2);
            }
        }

    }
}

void DrawVertices() {
    noStroke();
    for (int i = 0; i < Vertices.size(); i++) {
        V current = Vertices.get(i);
        if (current.isSelected == true) {
            stroke(0);
            strokeWeight(2);
        }
        fill(current.c);
        circle(current.x, current.y, 50);
        noStroke();
    }
}
