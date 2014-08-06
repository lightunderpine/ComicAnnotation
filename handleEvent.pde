// ボタンが押された時の処理
void handleEvent(String[] parameters) {
  //
  if (parameters[1].equals("create") && parameters[2].equals("mouseClicked")) {
    aFrame[frameID] = new Frame(100, 100, frameID); 
    frameID++;
    // activeFrame++;
    // println(">"+ parameters[1]);
  } 
  else if (parameters[1].equals("fix") && parameters[2].equals("mouseClicked")) {
    activeFrame=999;
    currentMode = "createAnnotation";
  }
  else if (parameters[1].equals("annotation") && parameters[2].equals("mouseClicked")) {
    myAnnotation[annotID] = new Annotation(550, 200);
    annotID ++;
    activeAnnot ++;
    println("annotID: "+annotID);
  } 
  else if (parameters[1].equals("write") && parameters[2].equals("mouseClicked")) {
    activeFrame=999;
    writeAnnotations();
  }
  else if (parameters[1].equals("update") && parameters[2].equals("mouseClicked")) {
    myAnnotation[activeAnnot].annotationValue = testpanel2.inputLine.getText();
  }
}

