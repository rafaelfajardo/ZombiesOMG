SimpleFigure Tom;
SimpleFigure Dick;
SimpleFigure Harry;
int population = 500;
SimpleFigure[] zombie = new SimpleFigure[population];
int index = 0;

void setup()
{
  size(1000, 744);
  Tom = new SimpleFigure(width/2-50,height/2);
  Dick = new SimpleFigure(width/2,height/2);
  Harry = new SimpleFigure(width/2+50,height/2);
  for (int i = 0; i < population; i++)
  {
  zombie[i] = new SimpleFigure();
  }
}

void draw()
{
  background(40);
  Tom.drawMe();
  Dick.drawMe();
  Harry.drawMe();

  Tom.moveMe();
  Dick.moveMe();
  Harry.moveMe();

  for (int i = 0; i < population; i++)
  {
    zombie[i].drawMe();
    zombie[i].moveMe();
    if (Tom.intersect(zombie[i]))
    {
      zombie[i].setVX(0);
      zombie[i].setVY(0);
    }
  }
}


void mouseClicked()
{
  println("index is: " + index);
  if (index < population )
  {  
    // zombie[index] = new SimpleFigure(mouseX,mouseY);
    zombie[index].setX(mouseX) ;
    zombie[index].setY(mouseY) ;
    index ++;
  }
  else
  {
   index = 0; 
  }
}

