class Frame {
  boolean isActive = false; //自分がアクティブかどうか
  int cornerNum = 4;        // 頂点の数
  int myframeID;            //コマの ID
  int centerX, centerY;     //中心座標
  int initWidth = 50;       //デフォルトで作られるコマの一辺の大きさ
  Dot[] frameCorners = new Dot[cornerNum];
  Region frameRegion;
  color activeColor = color(200, 10, 10); // active -> red
  color normalColor = color(10, 10, 10);  // normal -> gray

  Frame(int _centerX, int _centerY, int _frameID) {
    centerX = _centerX;
    centerY = _centerY;
    myframeID = _frameID;
    frameCorners[0] = new Dot(centerX - initWidth, centerY - initWidth);
    frameCorners[1] = new Dot(centerX + initWidth, centerY - initWidth);
    frameCorners[2] = new Dot(centerX + initWidth, centerY + initWidth);
    frameCorners[3] = new Dot(centerX - initWidth, centerY + initWidth);
    frameRegion = new Region(frameCorners[0], frameCorners[1], frameCorners[2], frameCorners[3]);
  }

  // フレームの表示
  void display() {
    boolean isInMode = currentMode.equals("createFrame");
    // 自分がアクティブかどうかで色を変える
    /*
    if (myframeID == activeFrame) {
     isActive = true;
     } else {
     isActive = false;
     }*/
    if (isInMode) {       
      if (isActive) {
        fill(activeColor, 30);
      }
      else {
        fill(normalColor, 30);
      }
      // 領域の表示
      frameRegion.display(isInMode);
      // 各頂点の表示
      for (int i=0; i < cornerNum; i++) {
        frameCorners[i].display();
      }
      // 領域番号の表示
      fill(normalColor);
      frameRegion.showName(myframeID);
    } 
    else {
      strokeWeight(5);
      stroke(40, 40, 40);
      noFill();
      frameRegion.display(isInMode);
    }
  }


  // マウスがこのコマ上にあるか？
  boolean isOnMouse(Dot mousePoint) {
    if (frameCorners[0].isOnMouse(mousePoint.posX, mousePoint.posY) ||
        frameCorners[1].isOnMouse(mousePoint.posX, mousePoint.posY) ||
        frameCorners[2].isOnMouse(mousePoint.posX, mousePoint.posY) ||
        frameCorners[3].isOnMouse(mousePoint.posX, mousePoint.posY) ||
        frameRegion.includep(mousePoint)) {
      isActive = true;
      activeFrame = myframeID;
      return(true);
    }
    else {
      isActive = false;
      return(false);
    }
  }




  int checkdots() {
    int x = 0;
    boolean flag = false;
    int result = 999;
    while (flag == false && x < cornerNum) {
      if (frameCorners[x].isOnMouse(mouseX, mouseY)) {
        result = x;
        flag = true;
      } 
      else {
        x++;
      }
    }
    return result;
  }

  // 特定の角オブジェクトを移動させる
  void movePoint(Dot point, int dx, int dy) {
    point.posX += dx;
    point.posY += dy;
  }

  // すべてのコマオブジェクトを移動させる
  void moveAll(int dx, int dy) {
    for (int i=0; i<cornerNum; i++) {
      movePoint(frameCorners[i], dx, dy);
    }
  }
}

// 点オブジェクト
class Dot {
  int posX;
  int posY;
  int dotRadius = 5;

  Dot(int _posX, int _posY) {
    posX = _posX;
    posY = _posY;
  }

  void display() {
    ellipse(posX, posY, 2 * dotRadius, 2 * dotRadius);
  }

  boolean isOnMouse(int pointX, int pointY) {
    if (dist(posX, posY, pointX, pointY) <= (dotRadius + 1)) {
      return true;
    } 
    else {
      return false;
    }
  }  

  void update() {
    posX = mouseX;
    posY = mouseY;
  }
}



class Region {
  Dot leftTop;
  Dot rightTop;
  Dot rightBottom;
  Dot leftBottom;

  Region(Dot _lt, Dot _rt, Dot _rb, Dot _lb) {
    leftTop = _lt;
    rightTop = _rt;
    rightBottom = _rb;
    leftBottom = _lb;
  }

  void display(boolean isInMode) {
    if (isInMode) {
      strokeWeight(1);
      stroke(0);
    }
    else {
      strokeWeight(4);
      stroke(40, 40, 40);
    }
    beginShape();
    vertex(leftTop.posX, leftTop.posY);
    vertex(rightTop.posX, rightTop.posY);
    vertex(rightBottom.posX, rightBottom.posY);
    vertex(leftBottom.posX, leftBottom.posY);
    endShape(CLOSE);
  }

  // 与えられた点（Dot クラス）が領域内かどうか？
  boolean includep(Dot ms) {
    float anglesum = 0.0;
    anglesum = angle(ms, leftTop, rightTop) + angle(ms, rightTop, rightBottom)+angle(ms, rightBottom, leftBottom)+angle(ms, leftBottom, leftTop);
    if (abs(anglesum)>6.2) {
      return true;
    } 
    else {
      return false;
    }
  }

    // 自分の名前を表示する
  void showName(int name) {
    int posX = (leftTop.posX + rightTop.posX + rightBottom.posX + leftBottom.posX)/4;
    int posY = (leftTop.posY + rightTop.posY + rightBottom.posY + leftBottom.posY)/4;
    text(name, posX, posY);
  }
}

