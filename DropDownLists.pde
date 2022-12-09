void ModeList(ControlP5 cp5) { //<>// //<>//
    DropdownList ModeList = cp5.addDropdownList("Mode").setPosition(0, 0);
    ModeList.addItem("Draw Mode", 0);
    ModeList.addItem("Edit Mode", 1);
    ModeList.addItem("InspectMode", 2);
    ModeList.setBarHeight(15);
    ModeList.setBackgroundColor(color(255));
    ModeList.setColorBackground(color(60));
    ModeList.setColorActive(color(250));
}
