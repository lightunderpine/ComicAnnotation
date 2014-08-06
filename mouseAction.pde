void mousePressed() {
  boolean tmp=false;
  boolean tmp2=false;
  int pressed = 999;
  msX=mouseX;
  msY=mouseY;
  target="";
  int fnum = activeFrame;


  mouse.update();

  println(activeAnnot);
  if (currentMode.equals("createFrame")&&activeFrame != 999) {
    tmp = aFrame[fnum].frameRegion.includep(mouse);
    testpanel.inputLine.setText(str(activeFrame));

    pressed =aFrame[fnum].checkdots();
  }
  tmp2 = myAnnotation[activeAnnot].isOnMouse(mouse.posX, mouse.posY);




  //println("fdasf"+ pressed);

  if (pressed == 0) {
    target = "0";
  } 
  else if (pressed == 1) {
    target = "1";
  }
  else if (pressed == 2) {
    target = "2";
  }
  else if (pressed == 3) {
    target = "3";
  }
  else if (tmp) {
    target = "body";
  } 
  else if (tmp2) {
    println("fadsfa");
    target = "annot";
    testpanel.inputLine.setText(str(annotID));
    testpanel2.inputLine.setText(myAnnotation[activeAnnot].annotationValue);
  }
  else {
    target = "---";
  }
  println(target);
}  


void mouseDragged() {
  println( target);

  mouse.update();
  if (target == "0") {
    aFrame[activeFrame].movePoint(aFrame[activeFrame].frameCorners[0], mouse.posX-msX, mouse.posY-msY);
  } 
  else if (target=="1") {
    aFrame[activeFrame].movePoint(aFrame[activeFrame].frameCorners[1], mouse.posX-msX, mouse.posY-msY);
  } 
  else if (target=="2") {
    aFrame[activeFrame].movePoint(aFrame[activeFrame].frameCorners[2], mouse.posX-msX, mouse.posY-msY);
  } 
  else if (target=="3") {
    aFrame[activeFrame].movePoint(aFrame[activeFrame].frameCorners[3], mouse.posX-msX, mouse.posY-msY);
  }    
  else if (target =="body") {
    aFrame[activeFrame].moveAll(mouse.posX - msX, mouse.posY - msY);
  } 
  else if (target =="annot") {
    println("annot:" + activeAnnot);
    myAnnotation[activeAnnot].move(mouse.posX - msX, mouse.posY - msY);
  }
  else {
    println("nothing is dragged");
  }

  msX=mouse.posX;
  msY=mouse.posY;
}

void mouseReleased() {
  msX=mouse.posX;
  msY=mouse.posY;
  testpanel.inputLine.setText("");
}

