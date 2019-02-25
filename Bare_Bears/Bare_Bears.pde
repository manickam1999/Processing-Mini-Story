import ddf.minim.*;// bgm
PImage bg; //background
PImage btnEvolve , btnPuEvolve; //evolve
PImage btnFeed , btnPuFeed; //feed
PImage btnPlay , btnPuPlay;//play
PImage btnExit , btnPuExit;//exit
PImage btnBack , btnPuBack;//back
PImage SoundOn , SoundOff;//sound
PImage BoredChat; //bored interaction message
PImage Tree1,Tree2;//feed tree
PImage fruit;// feed fruit
// Snow
int quantity = 300;
float [] xPosition = new float[quantity];
float [] yPosition = new float[quantity];
int [] flakeSize = new int[quantity];
int [] direction = new int[quantity];
int minFlakeSize = 1;
int maxFlakeSize = 5;

String current;// For linking of the activites 
int trigger = -1; // sound on / off 
//play
float x,y;
float oldx, oldy; 
float easing = 0.05; 
// BGM
AudioSnippet BGM;
Minim minim;
// Array for images
String[] bearWalk = new String[]{"BearMove1.png","BearMove2.png","BearMove3.png","BearMove4.png","BearMove5.png","BearMove6.png","BearMove7.png","BearMove8.png","BearMove9.png","BearMove10.png","BearMove11.png","BearMove12.png","BearMove13.png","BearMove14.png","BearMove15.png","BearMove16.png","BearMove17.png","BearMove18.png"};
String [] bearEvolve = new String []{"Evolve1.png","Evolve2.png","Evolve3.png","Evolve4.png","Evolve5.png","Evolve6.png","Evolve7.png","Evolve8.png","Evolve9.png","Evolve10.png","Evolve11.png","Evolve12.png","Evolve13.png","Evolve14.png","Evolve15.png","Evolve16.png","Evolve17.png","Evolve18.png"};
String [] Interaction = new String [] {"Interaction0.png","Interaction1.png"};
String [] MainWalk = new String [] {"Walk1.png","Walk2.png","Walk3.png","Walk4.png","Walk5.png","Walk6.png","Walk7.png","Walk8.png","Walk9.png","Walk10.png","Walk11.png","Walk12.png","Walk13.png","Walk14.png","Walk15.png","Walk16.png"};
String [] MainHoriWalk = new String [] {"WalkHori1.png","WalkHori2.png","WalkHori3.png","WalkHori4.png","WalkHori5.png","WalkHori6.png","WalkHori7.png","WalkHori8.png","WalkHori9.png","WalkHori10.png","WalkHori11.png","WalkHori12.png","WalkHori13.png","WalkHori14.png","WalkHori15.png","WalkHori16.png"};
String [] GroupWalk = new String [] {"GroupWalk1.png","GroupWalk2.png","GroupWalk3.png","GroupWalk4.png","GroupWalk5.png","GroupWalk6.png","GroupWalk7.png","GroupWalk8.png","GroupWalk9.png","GroupWalk10.png","GroupWalk11.png","GroupWalk12.png"};
String [] GroupWalkHori = new String [] {"GroupWalkHori1.png","GroupWalkHori2.png","GroupWalkHori3.png","GroupWalkHori4.png","GroupWalkHori5.png","GroupWalkHori6.png","GroupWalkHori7.png","GroupWalkHori8.png","GroupWalkHori9.png","GroupWalkHori10.png","GroupWalkHori11.png","GroupWalkHori12.png"};
String [] FeedWalk = new String [] {"Feed1.png","Feed2.png","Feed3.png","Feed4.png","Feed5.png","Feed6.png","Feed7.png","Feed8.png","Feed9.png","Feed10.png","Feed11.png","Feed12.png","Feed13.png","Feed14.png","Feed15.png","Feed16.png","Feed17.png","Feed18.png"};
String [] FeedWalkHori = new String [] {"FeedHori1.png","FeedHori2.png","FeedHori3.png","FeedHori4.png","FeedHori5.png","FeedHori6.png","FeedHori7.png","FeedHori8.png","FeedHori9.png","FeedHori10.png","FeedHori11.png","FeedHori12.png","FeedHori13.png","FeedHori14.png","FeedHori15.png","FeedHori16.png","FeedHori17.png","FeedHori18.png"};
//counter for every image
int counterPlay = 0;
int counterInteraction2 = 0;
int counterInteraction = 0;
int counterFeed = 0;
int counterEvolve = 0;
//Position for every character
int PosX = 0;
int PosXInteraction = 0;
int PosX3 = 0;
int PosXFeed = 0;
//Fruit position 
int PosY_Fruit = 142;
//Reverse position
int PosXInteractionReverse = 1100;
int PosX3Reverse = 1100;
int PosXFeedReverse = 740;
//Image for the arrays 
PImage imgPlay;
PImage imgPlay2;
PImage imgGroupWalk;
PImage imgFeed;
//Evolve loop
int EvolveCount = 0;
//Interaction random
int index = int (random(3));
//millis timmer
long m;
mill timer = new mill();


void setup()
{
  current="Menu";
  size (1171,476); //size of the screen
  bg = loadImage("Snow.PNG"); 
  btnFeed = loadImage ("button_feed.png");
  btnPuFeed = loadImage ("button_feed2.png");
  btnPlay = loadImage ("button_play2.png");
  btnPuPlay = loadImage ("button_play.png");
  btnEvolve = loadImage("button_evolve.png");
  btnPuEvolve = loadImage ("button_evolve2.png");
  btnExit = loadImage ("button_exit2.png");
  btnPuExit = loadImage ("button_exit.png");
  btnBack = loadImage ("button_back.png");
  btnPuBack = loadImage ("button_back2.png");
  SoundOn = loadImage ("Sound_On.png");
  SoundOff = loadImage ("Sound_Off.png");
  BoredChat = loadImage ("BoredChat.png");
  Tree1 = loadImage ("SnowTree.png");
  Tree2 = loadImage ("SnowTree2.png");
  fruit = loadImage ("fruit.png");
  noStroke();
  frameRate(18);
  smooth ();
  for(int i = 0; i < quantity; i++) {
    flakeSize[i] = round(random(minFlakeSize, maxFlakeSize));
    xPosition[i] = random(0, width);
    yPosition[i] = random(0, height);
    direction[i] = round(random(0, 1));
  }
minim = new Minim (this);
BGM = minim.loadSnippet ("BGM.mp3");
  

}
void draw()
{
  if(current=="Menu")
  {
    Menu ();
  }
  else if (current=="Feed")
  {
    Feed ();
  }
  else if (current == "Play")
  {
    Play ();
  }
  else if (current== "Evolve")
  {
    Evolve ();
  }
  else if (current == "Exit")
  {
    Exit ();
  }
  if(trigger == 1)
  {
    BGM.pause();
    image(SoundOff,1100,10,256/6,256/6);//Sound off image 
  }
  else
  {
    BGM.play();
    image(SoundOn,1100,10,256/6,256/6);//Sound on image
  }
    


}
void Menu ()
{
  Snow ();
  Interaction ();
  image(btnFeed,0,400);//Loading of the button feed
  image(btnPlay,200,400);//Loading of the button play
  image(btnEvolve,400,400);// Loading of the button evolve
  image(btnExit,640,400);// Loading of the button exit
  image(SoundOn,1100,10,256/6,256/6);// Loading of the sound button
    
  if(mouseX>0 && mouseX<142 && mouseY>400 && mouseY <500) //Mouse event for button feed
  {
    if(mousePressed){
    image(btnPuFeed,0,400);
    current="Feed";
    }
  }
  
    if(mouseX>200 && mouseX<340 && mouseY>400 && mouseY <500)//Mouse event for button play
  {
    if(mousePressed){
    image(btnPuPlay,200,400);
    current="Play";
    }
  }
  
  if(mouseX>400 && mouseX<580 && mouseY>400 && mouseY <500)//Mouse event for button evolve
  {
    if(mousePressed){
    image(btnPuEvolve,400,400);
    current="Evolve";
    }
}
  
  if(mouseX>640 && mouseX<766 && mouseY>400 && mouseY <500)//Mouse event for button exit
  {
    if(mousePressed){
    image(btnPuExit,640,400);
    current="Exit";
    }
  }
  
  if(mouseX>1100 && mouseX<1143 && mouseY>10 && mouseY <53) //Mouse event for button feed
  {
    if(mousePressed){
        trigger*=-1; 
   }
  }
  else 
  {
   BGM.play ();
  }
   
    
}

void Feed ()
{
  Snow ();
   image(btnBack,1000,400);
   if(mouseX>1000 && mouseX<1128 && mouseY>400 && mouseY <500) //Mouse event for button back
  {
    if(mousePressed){
    image(btnPuBack,1000,400);
    current="Menu";
    PosXFeed = 0;
    PosXInteraction = 0;
    timer.reset();
    }
  }
  // Loading of trees
  image (Tree1, 1000, 70);
  image (Tree2, 975 , 165);
  image (Tree1, 880, 70);
  if (PosXFeed >= 0 && PosXFeed < 740) //activy for feeding
  {
        PosY_Fruit = 142;
        imgFeed = loadImage(FeedWalk[counterFeed]);
        counterFeed++;
        image(imgFeed,PosXFeed,170,650/2.8,586/2.8);
        if(counterFeed == 18)
        {
          counterFeed = 0;
        }
        
              if (PosXFeed <= 740)
             {
                 PosXFeed = PosXFeed + 5;
              }
   
        
       if (PosXFeed == 740)
      {
        PosXFeedReverse = 740;
      }

  }
  
        
 if (PosXFeed >= 740)
      {
        image (fruit,969,PosY_Fruit); 
               if (PosY_Fruit < 341)
              {
                imgFeed = loadImage(FeedWalk[counterFeed]);
                image(imgFeed,740,170,650/2.8,586/2.8);
                PosY_Fruit = PosY_Fruit + 5;
              }
        if (PosY_Fruit > 341)
        {
        image (Tree1, 1000, 70);
        image (Tree2, 975 , 165);
        image (Tree1, 880, 70);
        imgFeed = loadImage(FeedWalkHori[counterFeed]);
        image(imgFeed,PosXFeedReverse,170,650/2.8,586/2.8);
        counterFeed++;
          if(counterFeed == 18)
          {
            counterFeed = 0;
            
          }
          PosXFeedReverse = PosXFeedReverse - 5;
          if (PosXFeedReverse == 0)
          {
            PosXFeed = 0;
          }
        }
          
      }
     
  
};


void Play ()
{
  Snow ();
  image(btnBack,1000,400);
   if(mouseX>1000 && mouseX<1128 && mouseY>400 && mouseY <500) //Mouse event for button back
  {
    if(mousePressed){
    image(btnPuBack,1000,400);
    current="Menu";
    PosXInteraction = 0;
    timer.reset();
    }
  }

  x = (1-easing) * oldx + easing * mouseX;
  y = (1-easing) * oldy + easing * mouseY;
  ellipse(x,y,50,50);
  oldx = x;
  oldy = y;
  imgPlay = loadImage(bearWalk[counterPlay]);
  counterPlay++;
  image(imgPlay,x-210,200,498/2,448/2);
  if(counterPlay == 18)
  {
    counterPlay = 0;
  }
  
  
};

void Evolve ()
{
  Snow ();
  image(btnBack,1000,400);
  
   if(mouseX>1000 && mouseX<1128 && mouseY>400 && mouseY <500) //Mouse event for button back
  {
    if(mousePressed)
    {
    image(btnPuBack,1000,400);
    current="Menu";
    EvolveCount = 0;
    PosX = 0;
    PosXInteraction = 0;
    timer.reset();
    }
  }
 

  if (EvolveCount <4 )
  {
  imgPlay = loadImage(bearWalk[counterEvolve]);
  }
  else if (EvolveCount >= 4)
  {
  imgPlay = loadImage(bearEvolve[counterEvolve]);
  }
  counterEvolve++;
  image(imgPlay,PosX,200,498/2,448/2);
  if(counterEvolve == 18)
  {
    counterEvolve = 0;
    EvolveCount ++;
  }
  PosX = PosX + 5;
  if (PosX > 1100 )
  {
     EvolveCount = 0;
    PosX = 0;
  }
    

};
 


void Exit ()
{
  exit();
};

void Snow ()
{
  image(bg,0,0);
  for(int i = 0; i < xPosition.length; i++) {
    
    ellipse(xPosition[i], yPosition[i], flakeSize[i], flakeSize[i]);
    
    if(direction[i] == 0) {
      xPosition[i] += map(flakeSize[i], minFlakeSize, maxFlakeSize, .1, .5);
    } else {
      xPosition[i] -= map(flakeSize[i], minFlakeSize, maxFlakeSize, .1, .5);
    }
    
    yPosition[i] += flakeSize[i] + direction[i]; 
    
    if(xPosition[i] > width + flakeSize[i] || xPosition[i] < -flakeSize[i] || yPosition[i] > height + flakeSize[i]) {
      xPosition[i] = random(0, width);
      yPosition[i] = -flakeSize[i];
    }
  }

  
};

void Interaction ()
{
   m = timer.getMill();
   if (m > 20000 && (PosXInteraction == 0 || PosXInteractionReverse == 1100))
 {
    if (index == 0)
    {
       imgPlay = loadImage ("Interaction0.png");
      image(imgPlay,450,200,550/3,523/3);

   }
  else if (index == 1)
    {
      imgPlay = loadImage ("Interaction1.png");
      image(imgPlay,400,250,1266/6,631/6);
      image (BoredChat,630,150,500/3,377/3);

    }
    else if (index == 2)
    {
      if (PosX3 >= 0)
    {
        imgGroupWalk = loadImage(GroupWalk[counterInteraction]);
        counterInteraction++;
        image(imgGroupWalk,PosX3,90,408/2,586/2);
        if(counterInteraction == 12)
        {
          counterInteraction = 0;
          
        }
          PosX3 = PosX3 + 5;
      if (PosX3 == 1100)
      {
        PosX3Reverse = 1100;
      }
    }        
       if (PosX3 >= 1100)
      {
        imgGroupWalk = loadImage(GroupWalkHori[counterInteraction]);
        image(imgGroupWalk,PosX3Reverse,90,408/2,586/2);
          if(counterInteraction == 12)
          {
            counterInteraction = 0;
            
          }
          PosX3Reverse = PosX3Reverse - 5;
          if (PosX3Reverse == 0)
          {
            PosX3 = 0;
          }
          
      }

          
     }

  }
  else 
  {
    if (PosXInteraction >= 0)
 {
  imgPlay2 = loadImage(MainWalk[counterInteraction2]);
  counterInteraction2++;
  image(imgPlay2,PosXInteraction,230,800/4,600/4);
  if(counterInteraction2 == 16)
  {
    counterInteraction2 = 0;
    
  }
  PosXInteraction = PosXInteraction + 5;
  if (PosXInteraction == 1100)
      {
        PosXInteractionReverse = 1100;
      }
  }
   if (PosXInteraction >= 1100)
  {
    imgPlay2 = loadImage (MainHoriWalk [counterInteraction2]);
    image(imgPlay2,PosXInteractionReverse,230,800/4,600/4);
      if(counterInteraction2 == 16)
      {
        counterInteraction2 = 0;
        
      }
      PosXInteractionReverse = PosXInteractionReverse - 5;
      if (PosXInteractionReverse == 0)
      {
        PosXInteraction = 0;
      }
      
  }

    
  } 
}

class mill
{
    long start;
    public mill() { this.reset(); }
    public void reset() { this.start = System.currentTimeMillis(); }
    public long getMill() { return System.currentTimeMillis() - start; }
}

void mouseClicked()
{
  System.out.println(mouseX);
  System.out.println(mouseY);
  System.out.println("==");
}
  
