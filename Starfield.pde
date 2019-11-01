Particle [] bob;
void setup(){
  size(750,850);
  background(0);
  bob = new Particle[900];
  for(int i = 2; i < bob.length; i++){
   bob[i] = new NormalParticle(); 
}
	bob[0] = new JumboParticle();
	bob[1] = new OddballParticle();
	  
}
void draw(){
  fill(0);
  for(int i=2; i < bob.length; i++){
  	bob[i].show();
  	bob[i].move();
	}
}
class NormalParticle implements Particle{
  double myX, myY, mySpeed, myAngle;
  int myColor;
  
  NormalParticle(){
    myColor = color((int)(Math.random()*256),(int)(Math.random()*256),(int)(Math.random()*0));
    mySpeed = (double)(Math.random()*6)+6;
    myAngle = (double)(Math.random()*9)*Math.PI;
    myX = myY = 450;
  }  
  public void move(){
    myX = myX + (Math.cos(myAngle)*mySpeed);
    myY = myY + (Math.sin(myAngle)*mySpeed);
  }
  public void show(){
    fill(myColor);
    ellipse((float)myX,(float)myY,3,3);
  }
}
interface Particle{
  public void show();
  public void move();
}

class OddballParticle implements Particle{
  int myX, myY, myColor;
  OddballParticle(){
    myColor = color(0,0,0);
  }
  public void move(){
    myX = myX + 3;
    myY = myY + 3;
  }
  public void show(){
    fill(myColor);
    noStroke();
    rect((float)myX,(float)myY,300,300);
    
  }

}
class JumboParticle extends NormalParticle{
    public void show(){
    fill(myColor);
    noStroke();
    ellipse((float)myX,(float)myY,256,256);
  }
}
