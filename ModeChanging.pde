void setMode(int mode) {
    switch (mode) {
        case 0:
            resetMode();
            DrawMode = true;
            break;
        case 1:
            resetMode();
            EditMode = true;
            break;
        case 2:
            resetMode();
            InspectMode = true;
            break;
    }
}

void resetMode() {
    DrawMode = false;
    EditMode = false;
    InspectMode = false;
}
