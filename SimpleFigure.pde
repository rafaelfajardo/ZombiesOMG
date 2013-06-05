class SimpleFigure
// simple figure made of a circle for the head and a square for the torso
// the proportions are such that the figure is 3 x radius tall
// and 2 x radius wide, or 2:3
// 
// I would like the figure to be scalable from the main program loop
// 
// I would like the figure to detect collision with another figure
//
// the rectMode is CENTER, so that it can align easily with the circle
//
// it may be better to use a rect that is 3 x radius tall
// so that the width to height ratio is an easy 1:2
// and the center of the figure is easy to calculate using a whole number (integer)
// 
// It would also be useful to define passable color properties
{
  //Properties
  // define instance variables
  int myX;
  int myY;
  int myRadius;
  int myW;
  int myH;
  float myVX;
  float myVY;



  //Default Constructor
  // initialize instance variables
  SimpleFigure()
  {
    myX = (int) random(width);
    myY = (int) random(height);
    myW = 20;
    myH = 20;
    myVX = random(1, 3);
    myVY = random(1, 3);
  }

  //Constructor
  // initialize instance variables to passed/passable variable values
  SimpleFigure(int inputX, int inputY)
  {
    myX = inputX;
    myY = inputY;
    myW = 20;
    myH = 20;
    myVX = random(-2, -1);
    myVY = random(-2, -1);
  }
  
  //Setters
  //allows one to pass and set values for instance variables
  void setX(int inX) 
  {
    myX = inX ;
  }
  void setY(int inY) 
  {
    myY = inY ;
  }
  void setVX(int inVX)
  {
    myVX = inVX;
  }
  void setVY(int inVY)
  {
    myVY = inVY;
  }
  
  //Getters
  //allows one to sample or poll the current state of instance variables
  int getX() 
  {
    return myX;
  }
  int getY() 
  {
    return myY;
  }
  float getVX()
  {
    return myVX;
  }
  float getVY()
  {
    return myVY;
  }


  //Methods
  //functions that are local to the instance/object of this class`
  void drawMe()
  {
    rectMode(CENTER);
    fill(127, 127, 127);
    rect(myX, myY+10, myW, myH, 5);
    fill(200, 200, 127);
    ellipse(myX, myY, myW, myH);
  }

  void moveMe()
  {
    myX += myVX;
    myY += myVY;

    if (myX > width || myX < 0)
    {
      myVX *= -1;
    }
    if (myY > height || myY < 0)
    {
      myVY *= -1;
    }
  }

  boolean intersect (SimpleFigure otherFigure)
  {
    float distance;

    int diffX = this.getX() - otherFigure.getX();
    int diffY = this.getY() - otherFigure.getY();
    distance = sqrt ( diffX*diffX + diffY*diffY);

    if ( distance <= myW)
    {
      return true;
    }
    else
    {
      return false;
    }
  }
}

