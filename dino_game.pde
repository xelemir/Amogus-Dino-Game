//      © Jan Grüttefien 2021

float x = 0;                                                                           // variable declaration
int up_or_down = 0;
int modethicc = 0;
float thiccness = 1.0;
int nsfw_mode = 0;
int xPos = width;
int yPos = 400;
int xPosStar1 = width/2;
int yPosStar1 = 100;
int xPosStar2 = width;
int yPosStar2 = 150;
int xPosStar3 = 300;
int yPosStar3 = 200;
boolean autorun = false;
boolean debugmode = false;
int round = 0;
int fails = 0;
int fail = 0;
int cactus_or_rock = 0;
int speed = 1;
int play_pause = 0;

void setup() {
    size(1000,600);
    frameRate(60);
}

void draw() {
    if(play_pause == 1) {                                                               // actual game
      if(xPos == width) round = round + 1;                                              // increase round
      if(round % 10 == 0 && round != 0 && xPos == width) speed = speed + 2;             // increase speed every 10 rounds
      if(speed >= 10) speed = 10;                                                       // speed wont increase after round 40 and upwards
      autorun();                                                                        // check if autorun bot is turned on/off by user
      nsfw();                                                                           // check if nsfw mode is turned on/off by user
      debugmode();                                                                      // check if DevMode is turned on/off by user
      scoreboard();                                                                     // update scoreboard
      fill(#594b1d);                                                                    // sandy looking desert is created
      rect(0, 400, width, height);
      if(keyPressed == true && key == ' '|| x != 0) jump(7.5);                          // Amogus will jump if <space> is pressed. Jump won't be interrupted by new user input while already in jump
      else jump(0);                                                                     // Amogus won't jump if <space> isn't pressed
      if(round % 2 == 0) obstacleRock();                                                // if round is even, obstacle rock is chosen
      if(round % 2 != 0) obstacleCactus();                                              // if round is odd, obstacle cactus is chosen
      star1();                                                                          // stars will move using the daisy chain principle
      endgame();                                                                        // if user had 10 fails, game over screen will appear
    }
    if(play_pause == 0) {                                                               // show the start/welcome screen
        startgame();
    }
}

void obstacleCactus() {                                                                 // cactus obstacle
    xPos = xPos - 10 - speed;                                                           // obstacle movement towards left side with possible speed increasement
    if(xPos < -50) xPos = width;                                                        // obstacle back to right side if left side is reached
    stroke(#237543);
    strokeWeight(20);
    line(xPos, yPos, xPos, yPos - 85);
    line(xPos, yPos - 40, xPos - 25, yPos - 40);
    line(xPos - 25, yPos - 40, xPos-25, yPos - 60);
    line(xPos, yPos - 20, xPos + 25, yPos - 20);
    line(xPos + 25, yPos - 20, xPos + 25, yPos - 50);
    strokeWeight(1);
    stroke(255);
    collision_detection_Cactus();                                                       // check if Amogus crashed with obstacle
    fails = fails + fail;                                                               // if chashed, fails += 1
}

void collision_detection_Cactus() {                                                     // collision detection
    if(debugmode == true) {                                                             // collision detection visualization if DevMode is turned on
        stroke(#FF0000);
        line(xPos-20, yPos - 25, 100, 400 - x);
        line(xPos-20, yPos - 60, 100, 400 - x);
        line(xPos, yPos - 80, 100, 400 - x);
        line(xPos + 25, yPos - 45, 100, 400 - x);
        stroke(255);
    }
    
    fail = 0;                                                                           // actual crash detection if line between Amogus and obstacle is smaller than specific value
    if(dist(xPos-20, yPos - 25, 100, 400 - x) <= 30) fail = 1;
    if(dist(xPos-20, yPos - 60, 100, 400 - x) <= 30) fail = 1;
    if(dist(xPos, yPos - 80, 100, 400 - x) <= 20) fail = 1;
    if(dist(xPos + 25, yPos - 45, 100, 400 - x) <= 20) fail = 1;
    if(fail > 0) {
        xPos = width;                                                                   // if crashed, obstacle back to right side
        delay(1000);                                                                    // if crashed, Amogus stuck for one second
        fail = 1;                                                                       // if crashed, one fail added
    }  
}

void obstacleRock() {                                                                   // rock obstacle
    xPos = xPos - 10 - speed;                                                           // obstacle movement towards left side with possible speed increasement
    if(xPos < -50) xPos = width;                                                        // obstacle back to right side if left side is reached
    fill(#808080);                                                                      
    triangle(xPos, yPos, xPos+50, yPos, xPos+25, yPos-75);
    triangle(xPos-20, yPos, xPos+25, yPos, xPos, yPos-50);
    stroke(255);
    collision_detection_Rock();                                                         // check if Amogus crashed with obstacle
    fails = fails + fail;                                                               // if chashed, fails += 1
}

void collision_detection_Rock() {                                                       // collision detection
    if(debugmode == true) {                                                             // collision detection visualization if DevMode is turned on
        stroke(#FF0000);
        line(xPos-20, yPos, 100, 400 - x);
        line(xPos, yPos-50, 100, 400 - x);
        line(xPos, yPos-25, 100, 400 - x);
        line(xPos+25, yPos-50, 100, 400 - x);
        stroke(255);
    }
    
    fail = 0;                                                                           // actual crash detection if line between Amogus an obstacle is smaller then specific value
    if(dist(xPos-20, yPos, 100, 400 - x) <= 20) fail = 1;
    if(dist(xPos, yPos-50, 100, 400 - x) <= 10) fail = 1;
    if(dist(xPos, yPos-25, 100, 400 - x) <= 20) fail = 1;
    if(dist(xPos+25, yPos-50, 100, 400 - x) <= 25) fail = 1;
    if(fail > 0) {
        xPos = width;                                                                   // if crashed, obstacle back to right side
        delay(1000);                                                                    // if crashed, Amogus stuck for one second
        fail = 1;                                                                       // if crashed, one fail added
    }
}

void jump(float var_jump) {                                                             // jump mechanics
    if(up_or_down == 0) {                                                               // jump upwards
        x = x + var_jump;                                                               // jump increment either 7.5 or 0
        if(x > 150) {                                                                   // jump back to fall after specific height
            up_or_down = 1;
        }
    }

    if(up_or_down == 1) {                                                               // fall downwards
        x = x - var_jump;                                                               // fall increment either 7.5 or 0
        if(x <= 0) {                                                                    // fall on ground level and not deeper                  
            x = 0;
            up_or_down = 0;                                                             // jump mode turned back to "jump" from jump mode "fall"
        }
    }

    if(nsfw_mode == 1) {
        if (modethicc == 1) {
            thiccness = thiccness - 0.2;
            if (thiccness <= 1) {
                modethicc = 0;
            }
        }

        if (modethicc == 0) {
            thiccness = thiccness + 0.2;
            if (thiccness >= 2) {
                modethicc = 1;
            }
        }
    }
    
    stroke(219, 112, 147);                                                              // Amogus body is created
    strokeWeight(50);
    line(100, 350 - x, 100, 350 - x + 25);
    stroke(135, 206, 250);                                                              // Amogus eyes are created
    strokeWeight(15);
    line(100 - 5, 350 - x, 100 + 15, 350 - x);
    stroke(219, 112, 147);                                                              // Amogus backpack is created
    strokeWeight(15);
    line(100 - 30, 375 - x, 100 - 30, 355 - x);
    if(nsfw_mode == 1) {                                                                // other Amogus body parts are created if nsfw mode is turned on
        stroke(255, 182, 193);                                                          //"circle"
        strokeWeight(15 * thiccness);
        line(100, 350 + 35 - x, 100, 350 + 35 - x);  
        stroke(255, 182, 193);                                                          //"stick"
        strokeWeight(10 * thiccness);
        line(100, 350 + 30 - thiccness - x, 100 + 30 * thiccness, 350 + 30 - thiccness - x);
    }
    strokeWeight(1);
    stroke(255, 255, 255);
}

void star1() {                                                                          // star 1 is created
    xPosStar1 = xPosStar1 - 1;
    if(xPosStar1 <= 0) xPosStar1 = width;
    fill(#CCCC00);
    circle(xPosStar1, yPosStar1, 10);
    fill(255);
    star2();                                                                            // star 2 is triggered
}

void star2() {                                                                          // star 2 is created
    xPosStar2 = xPosStar2 - 3;
    if(xPosStar2 <= 0) xPosStar2 = width;
    fill(#CCCC00);
    circle(xPosStar2, yPosStar2, 10);
    fill(255);
    star3();                                                                            // star 3 is triggered
}

void star3() {                                                                          // star 3 is created
    xPosStar3 = xPosStar3 - 2;
    if(xPosStar3 <= 0) xPosStar3 = width;
    fill(#CCCC00);
    circle(xPosStar3, yPosStar3, 10);
    fill(255);
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

void scoreboard() {                                                                     // scoreboard is created
    textAlign(LEFT);
    background(0);
    text("Round:", 50, 50);                                                             // round is displayed
    text(round, 100, 50);
    text("Fails:", 50, 80);                                                             // fails are displayed
    text(fails, 100, 80);
    text("Speed:", 50, 110);                                                            // speed is displayed
    text((speed+1)/2, 100, 110);
    // right side
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
}

void endgame() {                                                                        // game over screen
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
        fails = 0;
    }
}
