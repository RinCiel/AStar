class block {
  float xpos;
  float ypos;
  float w;
  float h;
  int type;

  block(float xposIn, float yposIn, float wIn, float hIn, int typeIn) {
    xpos = xposIn;
    ypos = yposIn;
    w = wIn;
    h = hIn;
    type = typeIn;
  }
  
  void display() {
    switch (type) {
      case 0: fill(255); break; // free
      case 1: fill(0); break; // wall 
      case 2: fill(0, 255, 0); break; // start
      case 3: fill(255, 0, 0); break; // end
      case 4: fill(0, 0, 255); break;// path
      case 5: fill(75); // examined
    }
    rect(xpos, ypos, xpos + w, ypos + h);
  }
}
