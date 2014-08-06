class DescPanel {
  TextField inputLine = new TextField("initial");
  int fnum;
  int posx;
  int posy;
  DescPanel(int _posx, int _posy, int _fnum) {
    fnum = _fnum;
    posx = _posx;
    posy = _posy;
  }

  void display() {
      fill(200, 0, 100,10);
    rect(posx, posx, 100, 200);
    inputLine.setBounds(posx+10, posy+10, 50, 20);
    //inputLine.setText(str(fnum));
    inputLine.setText(str(aFrame.length -1));
        add(inputLine);
  }

  void update() {
    posx -=1;
    posy -=1;
    inputLine.setBounds(posx, posy, 50, 20);
  }
}

