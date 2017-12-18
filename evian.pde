String s = "PVCRESIN";
int tSize = 36, extendLineNum = 20;

// press UP or DOWN key

void setup() {
  textSize(tSize);
  textAlign(LEFT, TOP);
  surface.setSize((int)textWidth(s), height);  // resize window
  size(400, 300);
}
void draw() {
  background(255);
  fill(0);
  text(s, 0, 0);

  int dY = 50, extendLength = 100;

  for (int j = 0; j < tSize; j++) {
    if (j < extendLineNum) drawLine(j, dY + j);
    else if (j == extendLineNum) {
      for (int k = 0; k <= extendLength; k++) drawLine(j, dY + j + k);  // loop
    } else if (j > extendLineNum) drawLine(j, dY + extendLength + j);
  }

  stroke(255, 0, 0);
  line(0, extendLineNum, width, extendLineNum);  // selected line
}

void drawLine(int getLine, int outLine) {  // getLine -> color -> outLine
  for (int i = 0; i < width; i++) {
    color c = get(i, getLine);
    stroke(c);
    point(i, outLine);
  }
  // println(getLine + " -> " + (outLine - 50));
}

void keyPressed() {
  if (keyCode == UP && extendLineNum > 0) extendLineNum--;
  else if (keyCode == DOWN & extendLineNum < tSize) extendLineNum++;
}