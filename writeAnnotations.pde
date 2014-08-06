void writeAnnotations() {
  println("---Begin: Created Annotations");
  for (int i=0; i < frameID; i++) {
    print("<frame id="+i+">");
    for (int j=0; j < 4; j++) {
      print("<"+aFrame[i].frameCorners[j].posX+","+aFrame[i].frameCorners[j].posY+">,");
    }
    println("</frame>");
  }
  println("---Finish: Created Annotations");
}

