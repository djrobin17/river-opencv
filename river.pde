import gab.opencv.*;
import processing.video.*;
import java.awt.*;
import java.util.Scanner;
import processing.sound.*;

SoundFile audio1;
SoundFile audio2;
SoundFile audio3;
SoundFile audio4;
SoundFile audio5;
SoundFile audio6;
SoundFile audio7;
SoundFile audio8;

PImage blob1;
PImage icon1;
PImage icon2;
PImage icon3;
PImage icon4;
PImage icon5;
PImage icon6;
PImage icon7;
PImage icon8;
PImage layer;
PImage before;
PImage after;
PImage trick;
PFont font;

//int i =0;
// Variable to store text currently being typed
String typing = "";

// Variable to store saved text when return is hit
String name = "";

String b;
String a;
int gameScreen =0;
int posX, posY;


Capture video;
OpenCV opencv;

 
void position(int x, int y) {
    this.posX = x;
    this.posY = y;
  }
 
void setup() {
  size(1280,960);

  video = new Capture(this, 1280/2, 960/2);
  opencv = new OpenCV(this, 1280/2, 960/2);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE); 
  video.start();
  smooth();
  blob1 = loadImage("img1.png");
  icon1 = loadImage("oil.png");
  icon2 = loadImage("leather.png");
  icon3 = loadImage("poop.png");
  icon4 = loadImage("medicine.png");
  icon5 = loadImage("repair.png");
  icon6 = loadImage("toothbrush.png");
  icon7 = loadImage("yarn.png");
  icon8 = loadImage("cement.png");
  layer = loadImage("layer.png");
  trick = loadImage("trick.png");
  font = createFont("Montserrat-Black.ttf",32);
  
  audio1 = new SoundFile(this, "sewage.wav");
  audio2 = new SoundFile(this, "leather.wav");
  audio3 = new SoundFile(this, "poop.aiff");
  audio4 = new SoundFile(this, "medicine.wav");
  audio5 = new SoundFile(this, "repair.wav");
  audio6 = new SoundFile(this, "toothbrush.wav");
  audio7 = new SoundFile(this, "yarn.wav");
  audio8 = new SoundFile(this, "cement.wav");
  
}

void draw() {
  if(gameScreen == 0){
    startScreen();
  }
else if(gameScreen == 1){
    nextScreen();
}
else if(gameScreen == 2){
    mainScreen();
}
else if(gameScreen == 3){
    endScreen();
}
}
void keyPressed() {
  if(gameScreen == 0){
  if (key == '\n') {
    name = typing;
    gameScreen = 1;
  } else {
    if((key >= 'a' && key<='z') || (key>='A' && key<='Z')){
    typing = typing + key;
    }
    else if(key == BACKSPACE){
      typing = typing.substring(0, typing.length() - 1);
  }
  }
}
}
void startScreen(){
  
  background(0);
  textAlign(CENTER);
  fill(256,256,256);
  textFont(font);
  textSize(70);
  text("Enter your name", width/2, height/4);
  text(typing, width/2, height/2);
}
void nextScreen(){
  background(50,50,50);
  fill(0);
   textSize (50);
   fill(175,175,175);
   text ( "I am " + name +" the River" ,width/2, height*6/8);
   //text ( "Press 9 to continue" ,width/2, height*7/8);
   
   opencv.loadImage(video);


  noFill();
  Rectangle[] faces = opencv.detect();
  println(faces.length);
  //filter(INVERT);
    

   image(video, 640/2,480/2-100);
    for (int i = 0; i < faces.length; i++) {
    println(faces[i].x + "," + faces[i].y);
 image(blob1, faces[i].x+260,  faces[i].y+170-75,1.75*faces[i].width, 1.75*faces[i].height);
 }
 image(layer, width/4,140,640,480);
 if(key == '9'){
   //i++;
   b="Before_"+name;
      save(b+".png");
      gameScreen = 2;
    }
  }

void mainScreen(){
  background(50,50,50);
  fill(0);
   textSize (50);
   fill(175,175,175);
   text ( "I am " + name +" the River" ,width/2, height*6/8);
   //text ( "Press 0 to continue" ,width/2, height*7/8);
   
   image(icon1, width/32, height/7,237,92);
   image(icon2, width/32, height*2/7,237,92);
   image(icon3, width/32, height*3/7,237,92);
   image(icon4, width/32, height*4/7,237,92);
   image(icon5, width*25/32, height/7,237,92);
   image(icon6, width*25/32, height*2/7,237,92);
   image(icon7, width*25/32, height*3/7,237,92);
   image(icon8, width*25/32, height*4/7,237,92);

   opencv.loadImage(video);


  noFill();
  Rectangle[] faces = opencv.detect();
  println(faces.length);
  //filter(INVERT);
    

   image(video, 640/2,480/2-100);
   if(key == '1'){
      audio1.play();
      audio1.amp(0.2);
      icon1 = loadImage("oil1.png");
      icon2 = loadImage("leather.png");
      icon3 = loadImage("poop.png");
      icon4 = loadImage("medicine.png");
      icon5 = loadImage("repair.png");
      icon6 = loadImage("toothbrush.png");
      icon7 = loadImage("yarn.png");
      icon8 = loadImage("cement.png");
      blob1 = loadImage("img1.png");
      audio1.pause();
    }
    else if (key == '2'){
      audio2.play();
      //audio2.amp(0.2);
      icon1 = loadImage("oil.png");
      icon2 = loadImage("leather1.png");
      icon3 = loadImage("poop.png");
      icon4 = loadImage("medicine.png");
      icon5 = loadImage("repair.png");
      icon6 = loadImage("toothbrush.png");
      icon7 = loadImage("yarn.png");
      icon8 = loadImage("cement.png");
      blob1 = loadImage("img2.png");
      audio2.pause();
    }
    else if (key == '3'){
      audio3.play();
      audio3.amp(0.2);
      icon1 = loadImage("oil.png");
      icon2 = loadImage("leather.png");
      icon3 = loadImage("poop1.png");
      icon4 = loadImage("medicine.png");
      icon5 = loadImage("repair.png");
      icon6 = loadImage("toothbrush.png");
      icon7 = loadImage("yarn.png");
      icon8 = loadImage("cement.png");
      blob1 = loadImage("img3.png");
      audio3.pause();
    }
    else if (key == '4'){
      audio4.play();
      audio4.amp(0.2);
      icon1 = loadImage("oil.png");
      icon2 = loadImage("leather.png");
      icon3 = loadImage("poop.png");
      icon4 = loadImage("medicine1.png");
      icon5 = loadImage("repair.png");
      icon6 = loadImage("toothbrush.png");
      icon7 = loadImage("yarn.png");
      icon8 = loadImage("cement.png");
      blob1 = loadImage("img4.png");
      audio4.pause();
    }
    else if (key == '5'){
      audio5.play();
      audio5.amp(0.2);
      icon1 = loadImage("oil.png");
      icon2 = loadImage("leather.png");
      icon3 = loadImage("poop.png");
      icon4 = loadImage("medicine.png");
      icon5 = loadImage("repair1.png");
      icon6 = loadImage("toothbrush.png");
      icon7 = loadImage("yarn.png");
      icon8 = loadImage("cement.png");
      blob1 = loadImage("img5.png");
      audio5.pause();
    }
    else if (key == '6'){
      audio6.play();
      audio6.amp(0.2);
      icon1 = loadImage("oil.png");
      icon2 = loadImage("leather.png");
      icon3 = loadImage("poop.png");
      icon4 = loadImage("medicine.png");
      icon5 = loadImage("repair.png");
      icon6 = loadImage("toothbrush1.png");
      icon7 = loadImage("yarn.png");
      icon8 = loadImage("cement.png");
      blob1 = loadImage("img6.png");
      audio6.pause();
    }
    else if (key == '7'){
      audio7.play();
      audio7.amp(0.2);
      icon1 = loadImage("oil.png");
      icon2 = loadImage("leather.png");
      icon3 = loadImage("poop.png");
      icon4 = loadImage("medicine.png");
      icon5 = loadImage("repair.png");
      icon6 = loadImage("toothbrush.png");
      icon7 = loadImage("yarn1.png");
      icon8 = loadImage("cement.png");
      blob1 = loadImage("img7.png");
      audio7.pause();
    }
    else if (key == '8'){
      audio8.play();
      audio8.amp(0.2);
      
      icon1 = loadImage("oil.png");
      icon2 = loadImage("leather.png");
      icon3 = loadImage("poop.png");
      icon4 = loadImage("medicine.png");
      icon5 = loadImage("repair.png");
      icon6 = loadImage("toothbrush.png");
      icon7 = loadImage("yarn.png");
      icon8 = loadImage("cement1.png");
      blob1 = loadImage("img8.png");
      audio8.pause();
    }
    
  for (int i = 0; i < faces.length; i++) {
    println(faces[i].x + "," + faces[i].y);
 image(blob1, faces[i].x+260,  faces[i].y+170-75,1.75*faces[i].width, 1.75*faces[i].height);
 }
 image(layer, width/4,140,640,480);
 if(key == '0'){
      image(trick, width/65, height/8,300,800);
      image(trick, width*49/65, height/8,300,800);
      blob1 = loadImage("img8.png");
      //i++;
      a="After_"+name;
      save(a+".png");
      gameScreen = 3;
    }
 
}
void endScreen(){
  before = loadImage(b+".png");
  after = loadImage(a+".png");
  background(50,50,50);
  fill(0);
   textSize (50);
   fill(175,175,175);
   text ( "Before" ,width/4, height/8);
   text ( "After" ,width*3/4, height/8);
   image(before, 0, height/4, 640, 480);
   image(after, 640, height/4, 640, 480);
   
   if (key == 'r'){
      gameScreen =0;
      typing = "";
      name = "";
      blob1 = loadImage("img1.png");
      icon1 = loadImage("oil.png");
      icon2 = loadImage("leather.png");
      icon3 = loadImage("poop.png");
      icon4 = loadImage("medicine.png");
      icon5 = loadImage("repair.png");
      icon6 = loadImage("toothbrush.png");
      icon7 = loadImage("yarn.png");
      icon8 = loadImage("cement.png");
      redraw();
    }
}

void captureEvent(Capture c) {
  c.read();
  }
