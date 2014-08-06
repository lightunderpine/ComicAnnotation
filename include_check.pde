
/*
boolean includep(Dot ms, Dot vtex0, Dot vtex1, Dot vtex2, Dot vtex3) {
 float anglesum = 0.0;
 anglesum = angle(ms, vtex0, vtex1) + angle(ms, vtex1, vtex2)+angle(ms, vtex2, vtex3)+angle(ms, vtex3, vtex0);
 if (abs(anglesum)>6.2) {
 return true;
 } else {
 return false;
 }
 }
 */

// p1 を原点とし、p２ から p３ の角度を求める
float angle(Dot p1, Dot p2, Dot p3) {
  float p1x = p1.posX;
  float p1y = p1.posY;
  float p2x = p2.posX;
  float p2y = p2.posY;
  float p3x = p3.posX;
  float p3y = p3.posY;
  // 外積
  float crossProduct = (p2x - p1x) * (p3y - p1y) - (p2y - p1y) * (p3x - p1x);
  // 内積
  float innerProduct = (p2x - p1x) * (p3x - p1x) + (p2y - p1y) * (p3y - p1y);
  // atan2(外積, 内積) で回転方向付きのラジアン角が求まる
  return atan2(crossProduct, innerProduct);
}

