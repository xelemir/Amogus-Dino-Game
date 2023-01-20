float x = 0;
int up_or_down = 0;
int modethicc = 0;
float thiccness = 1.0;
int nsfw_mode = 0;
int xPos = width;
int yPos = 400;

boolean autorun = false;
boolean debugmode = false;
int round = 0;
int fails = 0;
int fail = 0;
int cactus_or_rock = 0;
int speed = 1;
int play_pause = 0;
boolean night = true;


StarA star1;
StarA star2;
StarA star3;
GameCharacter amogus;
Obstacle cactus;
Obstacle rock;

void setup() {
    size(1000,600);
    frameRate(60);
    star1 = new StarA(width/2, 200, 1);
    star2 = new StarA(width, 150, 2);
    star3 = new StarA(width/4, 100, 3);
    amogus = new GameCharacter();
    cactus = new Cactus();
    rock = new Rock();

    
}

public void draw() {    
    if(play_pause == 1) {
    if(xPos == width) round = round + 1;
    if(round % 10 == 0 && round != 0 && xPos == width) speed = speed + 2;             // increase speed every 10 rounds
    if(speed >= 10) speed = 10;                                                       // speed wont increase after round 40 and upwards
    //autorun();                                                                        // check if autorun bot is turned on/off by user
    //nsfw();                                                                           // check if nsfw mode is turned on/off by user
    //debugmode();                                                                      // check if DevMode is turned on/off by user
    scene();                                                                          // decide if day or night time
    star1.move();
    star2.move();
    star3.move();
    scoreboard(cactus.fails + rock.fails);
    amogus.drawCharacter();
    cactus.moveObstacle(speed);
    rock.moveObstacle(speed);
    endgame(cactus.fails + rock.fails);
    }

    if(play_pause == 0) {                                                               // show the start/welcome screen
        startgame();
    }
}

  void scene() {
      if(((round / 10) % 10) % 2 == 0) {
          night = true;                                                                   // night scene
          background(0);                                                                  // dark sky
          fill(#594b1d);                                                                  // desert at night
          noStroke();
          rect(0, 400, width, height);
          fill(255);
      }
      else {
          night = false;                                                                  // day scene
          background(#87ceeb);                                                            // blue sky
          fill(#f0bb48);                                                                  // desert at day
          noStroke();
          rect(0, 400, width, height);
          fill(0);
      }
  }


  void nsfw() {                                                                           // ckeck if keys for nsfw mode are pressed
      if(nsfw_mode == 0) {
          if(key == 'p' || key == 'P') {                                                  // if <p> is pressed, nsfw mode is turned on
              nsfw_mode = 1;
          }
      }
      if(nsfw_mode == 1) {
          if(key == 'o' || key == 'O') {                                                  // if <o> is pressed, nsfw mode is turned off
              nsfw_mode = 0;
          }
      }
  }

  void debugmode() {                                                                      // ckeck if keys for DevMode are pressed
      if(debugmode == false) {
          if(key == 'z' || key == 'Z') {                                                  // if <z> is pressed, DevMode is turned on
              debugmode = true;
          }
      }
      if(debugmode == true) {
          if(key == 't' || key == 'T') {                                                  // if <t> is pressed, DevMode is turned off
              debugmode = false;
          }
      }
  }

  void autorun() {                                                                        // ckeck if keys for autorun bot are pressed
      if(autorun == false) {
          if(key == 'i' || key == 'I') {                                                  // if <i> is pressed, autorun bot is turned on
              autorun = true;
          }
      }
      if(autorun == true) {
          if(key == 'u' || key == 'U') {                                                  // if <u> is pressed, autorun bot is turned off
              autorun = false;
          }
      }

      if(autorun == true){                                                                // autorun bot
          if(dist(xPos-20, yPos, 100, 400 - x) <= 150+speed*15) {                         // if Amogus is near obstacle...
          keyPressed = true;
          key = ' ';                                                                    // ...keypress of <space> is simulated which makes Amogus jump
          }
          else keyPressed = false;
      }
  }

  void scoreboard(int fails) {                                                                     // scoreboard is created
      if(night == true) fill(255);
      else fill(0);
      textAlign(LEFT);
      text("Round:", 50, 50);                                                             // round is displayed
      text(round, 100, 50);
      text("Fails:", 50, 80);                                                             // fails are displayed
      text(fails, 100, 80);
      text("Speed:", 50, 110);                                                            // speed is displayed
      text((speed+1)/2, 100, 110);
      text("RTX:", width - 100, 50);                                                      // RTX obviously always on (GeForce RTX 3090 required)
      text("on",  width - 50, 50);
      text("FPS:",  width - 100, 80);                                                     // FPS are displayed
      text(int(frameRate),  width - 50, 80);
      
      if(debugmode == true) {                                                             // DevMode displayed if turned on
          text("DevMode:", width - 120, 110);
          text("on", width - 50, 110);
      }
      if(autorun == true) {                                                               // autorun Bot diplayed if turned on
          text("Bot:", width - 100, 140);
          text("on", width - 50, 140);
      }
      if(nsfw_mode == 1) {                                                                // nsfw mode displayed if turned on
          text("NSFW:", width - 100, 170);
          text("on", width - 50, 170);
      }
      text("Amogus Game by Jan Grüttefien", 10, height - 10);
  }

  void endgame(int fails) {                                                                        // game over screen
      if(fails >= 10) play_pause = 0;                                                     // if user failed 10 times
  }

  void startgame() {
      if(fails >= 10) {
          textSize(100);
          fill(255);
          textAlign(CENTER);
          text("GAME OVER", width / 2, height/2 - 50);                                    // display game over
          textSize(32);
          textAlign(LEFT);
          text("Score:", width / 2 - 100, height / 2);                                    // display reached score (score = rounds)
          text(round, width / 2 + 40, height/ 2);
          textAlign(CENTER);
          text("Press 'space' to play again", width/2, height / 2 + 150);                 // restart game option
          if(keyPressed == true && key == ' ') {
              play_pause = 1;
              textSize(10);
              fails = 0;
              round = 0;
              speed = 1;
          }
      }
      else {                                                                              // display welcome screen
          fill(0);
          rect(0, 0, 1000, 600);
          textSize(70);
          fill(255);
          textAlign(CENTER);
          text("Welcome, Imposter", width / 2, height / 2 - 100);
          textSize(32);
          text("Press 'space' to play", width/2, height / 2 + 100);                       // start game with <space>     
          if(keyPressed == true && key == ' ') play_pause = 1;
          textSize(10);
          textAlign(LEFT);
          text("Amogus Game by Jan Grüttefien", 10, height - 10);
          fails = 0;
      }
  }
