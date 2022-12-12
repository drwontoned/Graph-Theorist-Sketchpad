class VertexColor { //<>// //<>// //<>// //<>// //<>// //<>//
    String colorName;
    color colorValue;

    VertexColor(String name, color cv) {
        colorName = name;
        colorValue = cv;
    }
}

// method to set a list of colors vertices can change to
ArrayList < VertexColor > setColorList() {
    ArrayList < VertexColor > ColorList = new ArrayList < VertexColor > ();
    ColorList.add(new VertexColor("Red", color(255, 0, 0)));
    ColorList.add(new VertexColor("RedOrange", color(255, 70, 0)));
    ColorList.add(new VertexColor("Orange", color(255, 127, 0)));
    ColorList.add(new VertexColor("OrangeYellow", color(255, 179, 0)));
    ColorList.add(new VertexColor("Yellow", color(255, 255, 0)));
    ColorList.add(new VertexColor("YellowGreen", color(0, 255, 0)));
    ColorList.add(new VertexColor("Green", color(0, 121, 0)));
    ColorList.add(new VertexColor("GreenBlue", color(0, 174, 174)));
    ColorList.add(new VertexColor("Blue", color(0, 0, 255)));
    ColorList.add(new VertexColor("BlueViolet", color(115, 8, 165)));
    ColorList.add(new VertexColor("Violet", color(186, 0, 255)));
    ColorList.add(new VertexColor("VioletRed", color(204, 0, 175)));
    ColorList.add(new VertexColor("White", color(255)));
    return ColorList;
}

// method for switching color
void switchColor(float e) {
    // set a list of available colors
    ArrayList < VertexColor > availableColors = ColorList; //getAvailableColors(Vertices.get(selectedVertex1Index));
    if (e > 0) {
        Vertices.get(selectedVertex1Index).c = getNextColor(Vertices.get(selectedVertex1Index).c, availableColors);
    } else {
        Vertices.get(selectedVertex1Index).c = getPrevColor(Vertices.get(selectedVertex1Index).c, availableColors);
    }
    updateEdgeVertex();
}

VertexColor getNextColor(VertexColor currentColor, ArrayList < VertexColor > availableColors) {
    //initialize variable for next color
    VertexColor nextColor;

    // set the index for the next color
    int colorIndex = availableColors.size() - 1;

    //loop through available colors
    for (int i = 0; i < availableColors.size(); i++) {
        VertexColor currentC = availableColors.get(i);
        // if the size is greater than 1
        if (availableColors.size() > 1) {
            // if at the end of the list set index to start of list
            if (i == availableColors.size() - 1 && currentColor.colorName == currentC.colorName) {
                colorIndex = 0;

                // otherwise set index to next color on list
            } else {
                if (currentColor.colorName == currentC.colorName) {
                    colorIndex = i + 1;
                }
            }
        }
    }
    // set next color then return
    nextColor = availableColors.get(colorIndex);
    return nextColor;
}

VertexColor getPrevColor(VertexColor currentColor, ArrayList < VertexColor > availableColors) {
    //initialize variable for prev color
    VertexColor nextColor;

    // set the index for the prev color
    int colorIndex = availableColors.size() - 1;

    //loop through available colors
    for (int i = 0; i < availableColors.size(); i++) {
        VertexColor currentC = availableColors.get(i);
        // if the size is greater than 1
        if (availableColors.size() > 1) {
            // if at the start of the list set index to end of list
            if (i == 0) {
                colorIndex = availableColors.size() - 1;

                // otherwise set index to prev color on list
            } else {
                if (currentColor.colorName == currentC.colorName) {
                    colorIndex = i - 1;
                }
            }
        }
    }
    // set prev color then return
    nextColor = availableColors.get(colorIndex);
    return nextColor;
}

// method for getting the list of colors a vertex can change to
ArrayList < VertexColor > getAvailableColors(V currentV) {
    // initialize the available color list to contain all colors
    ArrayList < VertexColor > availableColors = ColorList;
    // initialize a list of adjacent vertices
    ArrayList < V > adjacentV = currentV.getAdjacentV();

    // loop through list of adjacent
    for (int i = 0; i < adjacentV.size(); i++) {
        V currentAdjacent = adjacentV.get(i);

        // if the adjacent color is not white
        if (currentAdjacent.c.colorName != "White") {
            // loop through the currently available colors
            for (int j = 0; j < availableColors.size() - 1; j++) {
                VertexColor currentC = availableColors.get(j);

                // if the adjacent color is found in the available colors remove it
                if (currentAdjacent.c.colorName == currentC.colorName) {
                    availableColors.remove(i);
                }
            }
        }
    }

    // return the list
    return availableColors;
}

void updateEdgeVertex() {
    // loop through all edges
    for (int i = 0; i < Edges.size(); i++) {
        // if current edge is not a loop
        if (Edges.get(i).isLoop == false) {
            // loop through all vertices
            for (int j = 0; j < Vertices.size(); j++) {
                //if the current edges vertex1 matches the current vertex then update the edge
                if (Edges.get(i).Vertex1.id == Vertices.get(j).id) {
                    Edges.get(i).Vertex1 = Vertices.get(j);
                    //if the current edges vertex1 matches the current vertex then update the edge  
                } else if (Edges.get(i).Vertex2.id == Vertices.get(j).id) {
                    Edges.get(i).Vertex2 = Vertices.get(j);
                }
            }
            // if not loop
        } else {
            // loop through all vertices
            for (int j = 0; j < Vertices.size(); j++) {
                //if the current edges vertex1 matches the current vertex then update the edge
                if (Edges.get(i).Vertex1.id == Vertices.get(j).id) {
                    Edges.get(i).Vertex1 = Vertices.get(j);
                }
            }
        }
    }
}
