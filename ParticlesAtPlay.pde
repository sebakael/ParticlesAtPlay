//MIDI
import themidibus.*;
MidiBus MPKMini;

float redVal = 255;
float greenVal = 0;
float blueVal = 0;
float CshapeSize = 50;
float PshapeSize = 12;
float tempKnob6 = 0;
float tempKnob7 = 0;
float tempKnob8 = 0;

float compShapeVal = 1;
float simpShapeVal = 0;
float relocateRand = 0;
float relocateCent = 0;
float moveChoice = 1;
float moveLinear = 0;
//float cResize = 0;
float moveForces = 0;


int num = 50;
Particle[] Particle = new Particle[num];
Particle p;
Attractor a;


void setup() {
  MidiBus.list();
  MPKMini = new MidiBus(this, "MPK Mini Mk II", -1, "From dah mini");
  size(600, 800); 
  background(0);
  for (int i = 0; i< Particle.length; i++) {
    Particle[i] = new Particle();
  }
  a = new Attractor();
}

void draw() {
  strokeWeight(0);
  fill(0, 1);
  rect(0, 0, width, height);
  
  relocateRand = constrain(relocateRand,0,25);
  relocateCent = constrain(relocateCent,0,25);
  relocateRand--;
  relocateCent--;

  for (int i = 0; i< Particle.length; i++) {
    Particle[i].display(); 
    if (moveLinear == 1) {
      Particle[i].normMov();
    } else if (moveChoice == 1) {
      Particle[i].choiceMov();
    }

    CshapeSize--;
    CshapeSize = constrain(CshapeSize, 100, 250);
    strokeWeight(2);
    stroke(0);
    fill(255);
    a.display();
  }
}

  void noteOn(int channel, int pitch, int velocity) 
  {
    println("Note On: Ch:"+channel+" P:"+pitch+" V:"+velocity);
    if (channel == 0 && pitch == 44) {
      //compShapeVal = 255;
    }
    if (channel == 0 && pitch == 45) {
      //simpShapeVal = 255;
    }
    if (channel == 0 && pitch == 46) {
      //relocateRand = 255;
    }
    if (channel == 0 && pitch == 47) {
      //relocateCent = 255;
    }
    if (channel == 0 && pitch == 48) {
      moveChoice = 255;
    }
    if (channel == 0 && pitch == 49) {
      moveLinear = 255;
    }
    if (channel == 0 && pitch == 50) {
      moveForces = 255;
    }
    if (channel == 0 && pitch == 51) {
      //CshapeSize = CshapeSize + 5;
    }
  }

  void noteOff(int channel, int pitch, int velocity) 
  {
    println("Note Off: Ch:"+channel+" P:"+pitch+" V:"+velocity);
    if (channel == 0 && pitch == 44) {
      compShapeVal = compShapeVal + 1;
      simpShapeVal = 0;
    }
    if (channel == 0 && pitch == 45) {
      simpShapeVal = simpShapeVal + 1;
      compShapeVal = 0;
    }
    if (channel == 0 && pitch == 46) {
      relocateRand = 10;

    }
    if (channel == 0 && pitch == 47) {
      relocateCent = 10;
    
    }
    if (channel == 0 && pitch == 48) {
      moveChoice = 1;
      moveLinear = 0;
      moveForces = 0;
    }
    if (channel == 0 && pitch == 49) {
      moveChoice = 0;
      moveLinear = 1;
      moveForces = 0;
    }
    if (channel == 0 && pitch == 50) {
      moveChoice = 0;
      moveLinear = 0;
      moveForces = 1;
    }
    if (channel == 0 && pitch == 51) {
      CshapeSize = CshapeSize + 25;
    }
  }

  void controllerChange(int channel, int number, int value) 
  {
    println("Ctl Chg: Ch:"+channel+" N:"+number+" V:"+value);
    if (channel == 0 && number == 1) {
      redVal = map(value, 0, 127, 0, 255);
    }
    if (channel == 0 && number == 2) {
      greenVal = map(value, 0, 127, 0, 255);
    }
    if (channel == 0 && number == 3) {
      blueVal = map(value, 0, 127, 0, 255);
    }
    if (channel == 0 && number == 4) {
      //CshapeSize = map(value, 0, 127, 50, 200);
    }
    if (channel == 0 && number == 5) {
      PshapeSize = map(value, 0, 127, 12, 48);
    }
    if (channel == 0 && number == 6) {
      //tempKnob6 = map(value, 0, 127, 0, 255);
    }
    if (channel == 0 && number == 7) {
      //tempKnob7 = map(value, 0, 127, 0, 255);
    }
    if (channel == 0 && number == 8) {
      //rempKnob8 = map(value, 0, 127, 0, 255);
    }
  }
