import controlP5.*; //<>// //<>// //<>// //<>//
ControlP5 cp5;

// Vertices and Edges Lists
ArrayList < V > Vertices = new ArrayList < V > ();
int vid = 0;
ArrayList < E > Edges = new ArrayList < E > ();
int eid = 0;

// selected vertices
Boolean selectedVertex1 = false;
int selectedVertex1Index = -1;
Boolean selectedVertex2 = false;
int selectedVertex2Index = -1;

// selected edges
Boolean selectedEdge = false;
int selectedEdgeIndex = -1;

Boolean DrawMode = false;
Boolean EditMode = false;
Boolean InspectMode = false;

ArrayList < VertexColor > ColorList = setColorList();

void setup() {
    size(750, 750);
    noStroke();
    textAlign(CENTER);
    cp5 = new ControlP5(this);
    ModeList(cp5);

}

void draw() {
    background(125);
    fill(0);

    DrawEdges();
    DrawVertices();
}

void mouseClicked() {
    // if mouse clicked within drawing bounds
    if (mouseX > 50 && mouseX < 700 && mouseY > 50 && mouseY < 700) {
        if (DrawMode == true) {
            DrawModeClick();
        } else if (EditMode == true) {
            EditModeClick();
        }
    }
}

void mouseDragged() {
    if (mouseX > 50 && mouseX < 700 && mouseY > 50 && mouseY < 700) {
        move();
    }
}

void mouseWheel(MouseEvent event) {
    float e = event.getCount();
    if (EditMode == true) {
        if (selectedVertex1 == true && selectedVertex2 == false) {
            switchColor(e);
        }
        for (int i = 0; i < Edges.size(); i++) {
            if (Edges.get(i).isLoop == false) {
                println("Vertex 1 color = " + Edges.get(i).Vertex1.c.colorName);
                println("Vertex 2 color = " + Edges.get(i).Vertex2.c.colorName);
            }
        }
    }

}

void controlEvent(ControlEvent theEvent) {
    if (theEvent.isGroup()) {
        // check if the Event was triggered from a ControlGroup
        println("event from group : " + theEvent.getGroup().getValue() + " from " + theEvent.getGroup());
    } else if (theEvent.isController()) {
        if (theEvent.getController().getValue() == 0.0) {
            setMode(0);
            clearSelected();
        } else if (theEvent.getController().getValue() == 1.0) {
            setMode(1);
            clearSelected();
        } else {
            setMode(2);
            clearSelected();
        }
    }
}

void updateAll() { //<>// //<>//
    for (int i = 0; i < Vertices.size(); i++) {
        Vertices.get(i).updateVertexEdge();
    }
    updateEdgeVertex(); //<>// //<>//
}
