class Particle {
  PVector location = new PVector(width/2, height/2);
  PVector preLoc = new PVector(location.x, location.y);
  PVector normSpeed = new PVector(6, 6);
  PVector normAccel = new PVector(.2, .2);
  PVector choiceSpeed = new PVector(10, 10);
  //float mass;
  //PVector forceAccel;
  
  int iniDir = int(random(4));
  int RcolorType = int(random(1, 20));
  int GcolorType = int(random(1, 20));
  int BcolorType = int(random(1, 20));
  int strokeVal;
  
  

  Particle() {
    fill(round(redVal/RcolorType), round(greenVal/GcolorType), round(blueVal/BcolorType));
    stroke(round(redVal/RcolorType), round(greenVal/GcolorType), round(blueVal/BcolorType));

    if (iniDir == 1) {
      normSpeed.x = normSpeed.x * -1;
      normAccel.x = normAccel.x * -1;
    } else if (iniDir == 2) {
      normSpeed.y = normSpeed.y * -1;
      normAccel.y = normAccel.y * -1;
    } else if (iniDir == 3) {
      normSpeed.x = normSpeed.x * -1;
      normAccel.x = normAccel.x * -1; 
      normSpeed.y = normSpeed.y * -1;
      normAccel.y = normAccel.y * -1;
    }
  }
  
  //void applyForce(PVector force) {
    //acceleration = force;
  //}

  void display() {
    fill(round(redVal/RcolorType), round(greenVal/GcolorType), round(blueVal/BcolorType));
    stroke(round(redVal/RcolorType), round(greenVal/GcolorType), round(blueVal/BcolorType));
    
    if(relocateCent >= 1){
      location.x = width/2;
      location.y = height/2;
    }else if(relocateRand >= 1){
      location.x = random(width);
      location.y = random(height);
    }
    
    if (compShapeVal == 1) {
      ellipse(location.x, location.y, PshapeSize, PshapeSize);
    } else if (compShapeVal == 2) {
      rect(location.x, location.y, PshapeSize, PshapeSize);
    } else if ((compShapeVal >= 3) && (simpShapeVal == 0)) {
      compShapeVal = 1;
    }
    if (simpShapeVal == 1){
      strokeVal = round(map(PshapeSize,12,48,1,10));
      strokeWeight(strokeVal);
      line(location.x,location.y,preLoc.x,preLoc.y);
    }else if(simpShapeVal == 2){
      strokeWeight(5);
      point(location.x,location.y);
    }else if ((simpShapeVal >= 3) && (compShapeVal == 0)){
      simpShapeVal = 1;
    }
    
    location.x = constrain(location.x, 0, width);
    location.y = constrain(location.y, 0, height);
  }

  void choiceMov() {
    preLoc.x = location.x;
    preLoc.y = location.y;
    int choice = int(random(8));
    if (choice == 0) {
      location.x = location.x + choiceSpeed.x;
    } else if (choice == 1) {
      location.y = location.y + choiceSpeed.y;
    } else if (choice == 2) {
      location.x = location.x - choiceSpeed.x;
    } else if (choice == 3) {
      location.y = location.y - choiceSpeed.y;
    } else if (choice == 4) {
      location.x = location.x + choiceSpeed.x;
      location.y = location.y + choiceSpeed.y;
    } else if (choice == 5) {
      location.x = location.x + choiceSpeed.x;
      location.y = location.y - choiceSpeed.y;
    } else if (choice == 6) {
      location.x = location.x - choiceSpeed.x;
      location.y = location.y + choiceSpeed.y;
    } else if (choice == 7) {
      location.x = location.x - choiceSpeed.x;
      location.y = location.y - choiceSpeed.y;
    }
  }

  void normMov() {
    preLoc.x = location.x;
    preLoc.y = location.y;
    normSpeed.add(normAccel);
    location.add(normSpeed);
    if ((location.x <= 0) || (location.x >= width)) {
      normSpeed.x = normSpeed.x / -1.5;
      normAccel.x = normAccel.x / -1;
    }
    if ((location.y <= 0) || (location.y >= height)) {
      normSpeed.y = normSpeed.y / -1.5;
      normAccel.y = normAccel.y / -1;
    }
  }
  void forceMov(){
    
  }
}
