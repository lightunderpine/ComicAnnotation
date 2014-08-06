// アノテーションの生成
class Annotation {
  String annotationType;
  String annotationValue;
  String annotationOptional;
  Dot anchorPoint;
  int posX;
  int posY;

  Annotation(int _posX, int _posY) {
    posX = _posX;
    posY = _posY;
    anchorPoint = new Dot(posX, posY);
    annotationType = new String("Person");
    annotationValue = new String("日本語");
  }

  void display() {
    strokeWeight(1);
    fill(30);
    anchorPoint.display();
    fill(200);
    if (anchorPoint.isOnMouse(mouse.posX, mouse.posY)) {
	fill(100, 100, 256, 200);
      rect(anchorPoint.posX+20, anchorPoint.posY-10, 70, 25);
      fill(30);
      text(annotationType, anchorPoint.posX+55, anchorPoint.posY+10);
      strokeWeight(2);
      line(anchorPoint.posX, anchorPoint.posY, anchorPoint.posX+20, anchorPoint.posY);
    }
  }

  void move(int dx, int dy) {
    anchorPoint.posX += dx;
    anchorPoint.posY += dy;
  }

  boolean isOnMouse(int pointX, int pointY) {
    return anchorPoint.isOnMouse(pointX, pointY);
  }
}

