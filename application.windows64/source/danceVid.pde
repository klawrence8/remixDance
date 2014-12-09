import processing.video.*;
Movie head1, head2, head3, head4;
Movie foot1, foot2, foot3, foot4;
Movie bod1, bod2, bod3, bod4;
PImage leftArrow, altLeftArrow;
PImage rightArrow, altRightArrow;
PImage headImg, altHeadImg;
PImage bodImg, altBodImg;
PImage feetImg, altFeetImg;
Movie[] headMovs;
Movie[] bodMovs;
Movie[] feetMovs;
int headInd = 0;
int bodInd = 0;
int feetInd = 0;
String headStr;
String bodStr;
String feetStr;
String[] names;
int l, w;
int leftX, rightX;
int headMovX, headMovY, bodMovX, bodMovY, feetMovX, feetMovY;
int headY, bodY, feetY;
int hX, hY, bX, bY, fX, fY;
boolean head, bod, feet;
boolean headLeft, headRight, bodLeft, bodRight, feetLeft, feetRight;
boolean headTrack, bodTrack, feetTrack;
boolean headPause, bodPause, feetPause;
boolean time, space;

void setup() {
  size(1000, 700);
  textFont(createFont("Georgia", 16));
  textAlign(CENTER, CENTER);
  head1 = new Movie(this, "head1.3gp");
  head2 = new Movie(this, "head2.3gp");
  head3 = new Movie(this, "head3.3gp");
  head4 = new Movie(this, "head4.3gp");
  foot1 = new Movie(this, "foot1.mov");
  foot2 = new Movie(this, "foot2.3gp");
  foot3 = new Movie(this, "foot3.mov");
  foot4 = new Movie(this, "foot4.mov");
  bod1 = new Movie(this, "bod1.3gp");
  bod2 = new Movie(this, "bod2.3gp");
  bod3 = new Movie(this, "bod3.3gp");
  bod4 = new Movie(this, "bod5.3gp");
  headMovs = new Movie[] {head1, head2, head3, head4};
  bodMovs = new Movie[] {bod1, bod2, bod3, bod4};
  feetMovs = new Movie[] {foot1, foot2, foot3, foot4};
  names = new String[] {"Flamenco", "Tap", "Modern", "Ballet"};
  headStr = names[0];
  bodStr = names[0];
  feetStr = names[0];
  leftArrow = loadImage("leftArrow.png");
  rightArrow = loadImage("rightArrow.png");
  altLeftArrow = loadImage("altLeftArrow.png");
  altRightArrow = loadImage("altRightArrow.png");
  headImg = loadImage("head.png");
  altHeadImg = loadImage("altHead.png");
  bodImg = loadImage("bod.png");
  altBodImg = loadImage("altBod.png");
  feetImg = loadImage("feet.png");
  altFeetImg = loadImage("altFeet.png");
  l = leftArrow.height;
  w = leftArrow.width;
  hX = bX = fX = 775; 
  rightX = 875;
  leftX = 675;
  headY = hY = 50;
  bodY = bY = 300;
  feetY = fY = 550;
  time = true;
  space = true;
  headTrack = false;
  bodTrack = false;
  feetPause = false;
  headPause = false;
  bodPause = false;
  feetPause = false;
  background(0);
}

void draw() {
  head1.loop();
  head2.loop();
  head3.loop();
  head4.loop();
  foot1.loop();
  foot2.loop();
  foot3.loop();
  foot4.loop();
  bod1.loop();
  bod2.loop();
  bod3.loop();
  bod4.loop();
  if (!space) {
    if (headTrack) {
      headMovX = mouseX;
      headMovY = mouseY;
    } else if (bodTrack) {
      bodMovX = mouseX;
      bodMovY = mouseY;
    } else if (feetTrack) {
      feetMovX = mouseX;
      feetMovY = mouseY;
    }
  } else {
    hX = bX = fX = 775; 
    rightX = 875;
    leftX = 675;
    headY = hY = 50;
    bodY = bY = 300;
    feetY = fY = 550;
    headMovX = 45;
    bodMovX = 55;
    feetMovX = 50;
    headMovY = -215;
    bodMovY = 95;
    feetMovY = 420;
    //noTint();
    image(leftArrow, leftX, headY);
    image(rightArrow, rightX, headY);
    image(leftArrow, leftX, bodY);
    image(rightArrow, rightX, bodY);
    image(leftArrow, leftX, feetY);
    image(rightArrow, rightX, feetY);
    if (headRight)
      image(altRightArrow, rightX, headY+2);
    if (headLeft)
      image(altLeftArrow, leftX, headY+2);
    if (bodRight)
      image(altRightArrow, rightX, bodY+2);
    if (bodLeft)
      image(altLeftArrow, leftX, bodY+2);
    if (feetRight)
      image(altRightArrow, rightX, feetY+2);
    if (feetLeft) 
      image(altLeftArrow, leftX, feetY+2);
    fill(0, 50);
    rect(600, 0, 400, 700);
    fill(255);
    text(headStr, 825, 100);
    text(bodStr, 825, 350);
    text(feetStr, 825, 600);
    text(timeStr(), 825, 225);
    //text(spaceStr(), 825, 475);
    if (head) 
    image(altHeadImg, hX, hY);
    if (!head)
      image(headImg, hX, hY); 
    if (bod) 
      image(altBodImg, bX, bY);
    if (!bod)
      image(bodImg, bX, bY);
    if(feet)
      image(altFeetImg, fX, fY);
    if (!feet)
      image(feetImg, fX, fY);
  }
  text(spaceStr(), 825, 475);
  image(headMovs[headInd], headMovX, headMovY, 560, 410);
  image(bodMovs[bodInd], bodMovX, bodMovY, 540, 390);
  image(feetMovs[feetInd], feetMovX, feetMovY, 550, 400);
  update();
}

void update() {
  if (overButton(hX, hY, w, l)) {
    head = true;
  } else {
    head = false;
  }
  if (overButton(bX, bY, w, l)) {
    bod = true;
  } else {
    bod = false;
  }
  if (overButton(fX, fY, w, l)) {
    feet = true;
  } else {
    feet = false;
  }
  if (overButton(leftX, headY, w, l) ) {
    headLeft = true;
    headRight = false;
    bodLeft = false;
    bodRight = false;
    feetLeft = false;
    feetRight = false;
  } else if (overButton(leftX, bodY, w, l) ) {
    headLeft = false;
    headRight = false;
    bodLeft = true;
    bodRight = false;
    feetLeft = false;
    feetRight = false;
  } else if (overButton(leftX, feetY, w, l) ) {
    headLeft = false;
    headRight = false;
    bodLeft = false;
    bodRight = false;
    feetLeft = true;
    feetRight = false;
  } else if (overButton(rightX, headY, w, l) ) {
    headLeft = false;
    headRight = true;
    bodLeft = false;
    bodRight = false;
    feetLeft = false;
    feetRight = false;
  } else if (overButton(rightX, bodY, w, l) ) {
     headLeft = false;
    headRight = false;
    bodLeft = false;
    bodRight = true;
    feetLeft = false;
    feetRight = false;
  } else if (overButton(rightX, feetY, w, l) ) {
    headLeft = false;
    headRight = false;
    bodLeft = false;
    bodRight = false;
    feetLeft = false;
    feetRight = true;
  } else {
    headLeft = bodLeft = feetLeft = headRight = bodRight = feetRight = false;
  }
}

void mousePressed() {
  if (!space || !time) {
    if (overButton(headMovX, headMovY, 550, 250)) {
      if (!space) {
        headTrack = !headTrack;
        bodTrack = false;
        feetTrack = false;
      }
      if (!time) {
         headMovs[headInd].jump(random(headMovs[headInd].duration()));
      } 
    } else if (overButton(bodMovX, bodMovY, 550, 400)) {
      if (!space) {
        headTrack = false;
        bodTrack = !bodTrack;
        feetTrack = false;
      }
      if (!time) {
        bodMovs[bodInd].jump(random(bodMovs[bodInd].duration()));
      }
    } else if (overButton(feetMovX, feetMovY, 550, 400)) {
      if (!space) {
        headTrack = false;
        bodTrack = false;
        feetTrack = !feetTrack;
      }
      if (!time) {
        feetMovs[feetInd].jump(random(feetMovs[feetInd].duration()));
      }
    }
  }     
  if (overButton(775, 200, l, w))
    time = !time;
  if (overButton(775, 425, l, w)){
    space = !space;
    headTrack = true;
    fill(0);
    rect(600, 0, 400, 700);
    fill(255);
  }
  if (feetRight)
    feetInd++;
  else if (feetLeft)
    feetInd--;
  else if (headLeft)
    headInd--;
  else if (headRight)
    headInd++;
  else if (bodLeft)
    bodInd--;
  else if (bodRight)
    bodInd++;
  if (feetInd < 0)
    feetInd = feetMovs.length - 1;
  if (feetInd == feetMovs.length)
    feetInd = 0;
  if (bodInd < 0)
    bodInd = bodMovs.length - 1;
  if (bodInd == bodMovs.length)
    bodInd = 0;
  if (headInd < 0)
    headInd = headMovs.length - 1;
  if (headInd == headMovs.length)
    headInd = 0;
  bodStr = names[bodInd];
  headStr = names[headInd]; 
  feetStr = names[feetInd];
}

// Called every time a new frame is available to read
void movieEvent(Movie m) {
  m.read();
}

boolean overButton(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

String timeStr() {
  if (time)
    return "Escape Time";
  return "Recapture Time";
}

String spaceStr() {
  if (space)
    return "Escape Space";
  return "Recapture Space";
}
