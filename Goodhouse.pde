/*Program: <Animated House>
    Author:  <Amir Heidari>
    Date:    <10/2/14>
    Notes:   The Arrow keys move flappy bird, shift changes color
              of the house and control changes color of roof.
              Clicking on the house will turn the lights on and off.
              Holding 'f' makes it turn to fall
              Holding 'w' makes it turn to winter
              Holding 's' makes it turn back to spring/summer
      */


float x = 0; //cloud position
int clicks = 0; //for lights
boolean lights;
float x1 = 0; //suns x
float y1 = 0; //suns y
float t = 0; //suns time
float x2 = 0; //moon x
float y2 = 0; //moon y
float t1 = 0; //moon time
float speed = random(3); //randomizer for cloud speed
float rX[]=new float [50]; //stars x
float rY[] = new float [50]; //stars y
float zX[] = new float [100]; //snow x
float zY[] = new float [100]; //snow y
float scale[] = new float [50]; //stars size
float opacity = 0; //opacity of sky, light to dark
PImage imghouse; //pic of house in window
PImage imgbird; //bird
PImage imgcloud; //cloud
float bx = 790; //ufo x
float by = 10; //ufo y
color fillValhouse = color(255,0,0); //house color
float shifts = 0; //# of shifts
float controls = 0; //# of controls
color fillValroof = color(255,127,39); //roof color
float opacityfall = 0; //opacity of fall colors
float opacitywinter = 0; //opacity of winter colors
int step = 1; //movement of cloud


void setup(){
  
size(960,540); //canvas size

imghouse = loadImage("house.jpg"); //declaring images
imgbird = loadImage("bird.png"); 
imgcloud = loadImage("cloud.png");

for (int i=0; i<50; i++){ //stars
  rX[i] = random (width);
  rY[i] = random (height/2);
  scale [i] = random (1);
  rect(rX[i], rY[i], 5*scale [i], 5*scale [i]);
}

}
void draw(){
  fill(0,162,232); //sky
  rect(0,0,960,270);
  
  image(imgcloud,x,0,300,150); //cloud
  
  if (x > .9*width || x<0){ //stars
  }
  if (y2<y1){ //sky change
    fill(0,17,121,opacity);
    rect(0,0,960,270);
    if (opacity <= 255){
    opacity = opacity  + 1;
    }

  }

  
   if (opacitywinter > 250){   //snow blizzard when winter
      for (int w = 0; w<100; w++){
        stroke(255);
         line(zX[w], zY[w], zX[w] + 5, zY[w] - 5);
         stroke(0);
      }
      for (int w=0; w<100; w++){
        zX[w] = random(width);
        zY[w] = random(height);
        stroke(255);
        line(zX[w], zY[w], zX[w] + 5, zY[w] - 5);
        stroke(0);
}
    for (int i = 0; i<50; i++){ //for stars
      fill(255,255,0);
      rect(rX[i],rY[i],5*scale [i], 5*scale [i]);
  }
  }
  if (y1<y2){ //sky change
    fill(0,17,121,opacity);
    rect(0,0,960,270);
    if (opacity >= 0){
      opacity = opacity - 1;
     
    }
  }
  
  fill(255,242,0); //sun
  ellipse(x1,y1,124,124);
  x1 = (400*sin(t/150) + 450);
  y1 = -(400*cos(t/150) - 400);
  x1++;
  y1++;
  t++;
  
  fill(255,255,255); //moon
  ellipse(x2,y2,124,124);
  x2 = (-400*sin(t1/150) + 450);
  y2 = -(-400*cos(t1/150) - 400 );
  x2++;
  y2++;
  t1++;

  fill(34,177,76); //ground
  rect(0,270,960,270);
  
  fill(216,128,39,opacityfall); //fall ground
  rect(0,270,960,270);
  
  fill(255,255,255,opacitywinter); //winter ground
  rect(0,270,960,270);

  fill(fillValhouse); //house
  rect(302,109,364,313);



  fill(fillValroof); //chimney
  rect(556,4,80,92);

  fill(fillValroof); //roof
  triangle(302,109,488,25,669,109);

  
  fill(185,122,87); //tree
  rect(64,119,83,261);
  

  fill(34,177,76); //tree leaves
  ellipse(107,83,176,144);
  
  fill(216,128,39,opacityfall); //fall leaves
  ellipse(107,83,176,144);
  
  fill(255,255,255,opacitywinter); //winter leaves
  ellipse(107,83,176,144);
  
  
  
  fill(163,73,164); //door
  rect(449,287,92,130);
  
  
  
  for (int w = width; w>0; w-= 30) { //fence
  fill(255,50,0);
  rect(w, height-100, 20, 200);
  rect(w,height - 50,900,10);
}
  
 x+=step; //cloud movement back and forth
  if (x > width-10) {
    x = width-10;
    step = -1;
  }
  if (x < 0) {
    x = 0;
    step = 1;
  }
 

  if (lights == true){ //lights on/off
    fill(0,0,0);
    rect(345,145,65,78);
    rect(562,145,65,78);
    }
  else{
   fill(255,255,255);
    rect(345,145,65,78);
    rect(562,145,65,78);
    image(imghouse,356,154,40,40);
  }
  if (opacityfall == 257){
    opacityfall = 256;
  }
  if (opacitywinter == 257){
    opacitywinter = 256;
  }
     if (opacityfall <= 256){ //hold f for fall
     if (keyPressed){
       if (key == 'f'){
       opacityfall = opacityfall + 1;
       if (opacitywinter>0){
         opacitywinter = opacitywinter - 1;
       }
       }
     }
     }
   
   
   if (opacitywinter<=256){ //hold w for winter
     if (keyPressed){
       if (key == 'w'){
         opacitywinter++;
       }
     }
   }
   if (opacitywinter>=1){ //hold s for spring/summer
     if (keyPressed){
       if (key == 's'){
         opacitywinter = opacitywinter - 1;
       }
     }
   }
   if (opacityfall>=1){
     if (keyPressed){
       if (key == 's'){
         opacityfall = opacityfall - 1;
       }
     }
   }
  
    
  
  image(imgbird,bx,by,150,100); //flappy bird
  
  
 // println(" o:"+opacity); //keep track of opacity of sky
  //println("opacityfall:" + opacityfall);
  //println("opacitywinter:" + opacitywinter);
  //println(x);
}
void mouseClicked(){
 
  clicks = clicks + 1; //lights on/off
  if (mouseX>302 && mouseX<666 && mouseY>109 && mouseY<422){
  if (clicks % 2 == 0){
     lights = true;

  }
   else{
      lights = false;

  }
  }
}
void keyPressed() {
  if (key == CODED){ //move alien ufo
    if (keyCode == RIGHT){
      bx= bx + 10;
    }
    if (keyCode == LEFT){
      bx = bx - 10;
    }
    if (keyCode == UP){
      by = by - 10;
    }
    if (keyCode == DOWN){
      by = by + 10;
    }
    if (keyCode == SHIFT){ //change color of house
      shifts++;
      if (shifts % 2 == 0){
        fillValhouse = color(255,0,0);
      }
      else{
        fillValhouse = color(3,255,255);
      }
    }
    if (keyCode == CONTROL){ //change color of roof
      controls++;
      if (controls % 2 == 0){
        fillValroof = color(255,127,39);
      }
      else{
        fillValroof = color(252,120,184);
      }
  }
}
}

