class VertexColor {
    String colorName;
    color colorValue;

    VertexColor(String name, color cv) {
        colorName = name;
        colorValue = cv;
    }
}

VertexColor[] setColorArray() {
    VertexColor[] ColorArray = new VertexColor[13];
    ColorArray[0] = new VertexColor("Red", color(255, 0, 0));
    ColorArray[1] = new VertexColor("RedOrange", color(255, 70, 0));
    ColorArray[2] = new VertexColor("Orange", color(255, 127, 0));
    ColorArray[3] = new VertexColor("OrangeYellow", color(255, 179, 0));
    ColorArray[4] = new VertexColor("Yellow", color(255, 255, 0));
    ColorArray[5] = new VertexColor("YellowGreen", color(0, 255, 0));
    ColorArray[6] = new VertexColor("Green", color(0, 121, 0));
    ColorArray[7] = new VertexColor("GreenBlue", color(0, 174, 174));
    ColorArray[8] = new VertexColor("Blue", color(0, 0, 255));
    ColorArray[9] = new VertexColor("BlueViolet", color(115, 8, 165));
    ColorArray[10] = new VertexColor("Violet", color(186, 0, 255));
    ColorArray[11] = new VertexColor("VioletRed", color(204, 0, 175));
    ColorArray[12] = new VertexColor("White", color(255));
    return ColorArray;
}

void switchColor() {
    V current = Vertices.get(selectedVertex1Index);
}
