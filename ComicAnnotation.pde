import SpringGUI.*;
import java.awt.*; 

PImage comic;                     // Comic のページ
Frame[] aFrame = new Frame[50]; // 一つのコマ
int frameID = 0;                 // コマの数
int activeFrame = 0;              // active なコマかどうか
Annotation myAnnotation[] = new Annotation[50];
int annotID = 0;
int activeAnnot = 0;
int msX, msY;
String target;
SpringGUI gui;
Dot mouse;
boolean activeFlag = false;
String currentMode;

//test
DescPanel testpanel = new DescPanel(500, 500, 1);
DescPanel testpanel2 = new DescPanel(500, 535, 2);
//test

void setup() {
  size(600, 600);

  comic = loadImage("896.png");
  textFont(loadFont("Serif-24.vlw"));
  textAlign(CENTER);
  currentMode = new String("createFrame");

  // Control Panel
  gui= new SpringGUI(this);
  gui.addButton("create", "new frame", 505, 30, 90, 30);
  gui.addButton("fix", "fix frame", 505, 60, 90, 30);
  gui.addButton("annotation", "annotation", 505, 90, 90, 30);
  gui.addButton("write", "write data", 505, 460, 90, 30);
  gui.addButton("update", "update", 505, 570, 90, 30);

  aFrame[frameID] = new Frame(100, 100, frameID); 
  myAnnotation[annotID] = new Annotation(300, 300);
  annotID++;
  //  println("set"+aFrame.length);
  frameID++;
  //println("frameID"+frameID);
  mouse = new Dot(mouseX, mouseY);
  //test
  testpanel.display();
  testpanel2.display();
}

void draw() {
  fill(99, 20);
  rect(0, 0, 600, 600);
  mouse.update();
  // コミックのページを表示
  image(comic, 0, 0, 500, 500);
  // コマの表示
  activeFlag = false;
  //  for(int i=0; i<frameID; i++){
  for (int i=frameID-1; i>= 0; i--) {
    if (activeFlag == false && aFrame[i].isOnMouse(mouse) == true) {
      aFrame[i].isActive = true;
      activeFlag = true;
    } 
    else {
      aFrame[i].isActive = false;
    }
    aFrame[i].display();
  }

  //testpanel.update();
  for (int j=0; j<annotID; j++) {
    myAnnotation[j].display();
  }
}

