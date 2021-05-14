//      © Jan Malte Grüttefien 2021
//
//      Game ends with 10 fails
//      Acceleration every 10 rounds until 50
//
//      HotKeys:
//
//      p   nsfw on
//      o   nsfw off
//
//      i   bot on
//      u   bot off
//
//      z   DevMode on
//      t   DevMode off


float x = 0;
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

void setup() {
    size(1000,600);
    frameRate(60);
}

void draw() {
    if(xPos == width) round = round + 1;
    if(round % 10 == 0 && round != 0 && xPos == width) speed = speed + 2;
    if(speed >= 10) speed = 10;
    autorun();
    nsfw();
    debugmode();
    scoreboard();
    fill(#594b1d);
    rect(0, 400, width, height);
    if(keyPressed == true && key == ' '|| x != 0) jump(7.5);
    else jump(0);
    if(round % 2 == 0) obstacleRock(); 
    if(round % 2 != 0) obstacleCactus();
    star1();
    endgame();
}

void obstacleCactus() {
    xPos = xPos - 10 - speed;
    if(xPos < -50) xPos = width;
    stroke(#237543);
    strokeWeight(20);
    line(xPos, yPos, xPos, yPos - 85);
    line(xPos, yPos - 40, xPos - 25, yPos - 40);
    line(xPos - 25, yPos - 40, xPos-25, yPos - 60);
    line(xPos, yPos - 20, xPos + 25, yPos - 20);
    line(xPos + 25, yPos - 20, xPos + 25, yPos - 50);
    strokeWeight(1);
    stroke(255);
    collision_detection_Cactus();
    fails = fails + fail;

}

void collision_detection_Cactus() {
    if(debugmode == true) {
        stroke(#FF0000);
        line(xPos-20, yPos - 25, 100, 400 - x);

        line(xPos-20, yPos - 60, 100, 400 - x);

        line(xPos, yPos - 80, 100, 400 - x);

        line(xPos + 25, yPos - 45, 100, 400 - x);
        stroke(255);
    }
    fail = 0;
    if(dist(xPos-20, yPos - 25, 100, 400 - x) <= 30) fail = 1;
    if(dist(xPos-20, yPos - 60, 100, 400 - x) <= 30) fail = 1;
    if(dist(xPos, yPos - 80, 100, 400 - x) <= 20) fail = 1;
    if(dist(xPos + 25, yPos - 45, 100, 400 - x) <= 20) fail = 1;
    if(fail > 0) {
        xPos = width;
        delay(1000);
        fail = 1;
    }  
}

void obstacleRock() {
    xPos = xPos - 10 - speed;
    if(xPos < -50) xPos = width;
    fill(#808080);
    triangle(xPos, yPos, xPos+50, yPos, xPos+25, yPos-75);
    triangle(xPos-20, yPos, xPos+25, yPos, xPos, yPos-50);
    stroke(255);
    collision_detection_Rock();
    fails = fails + fail;
}

void collision_detection_Rock() {
    if(debugmode == true) {
        stroke(#FF0000);
        line(xPos-20, yPos, 100, 400 - x);

        line(xPos, yPos-50, 100, 400 - x);

        line(xPos, yPos-25, 100, 400 - x);

        line(xPos+25, yPos-50, 100, 400 - x);
        stroke(255);
    }
    fail = 0;
    if(dist(xPos-20, yPos, 100, 400 - x) <= 20) fail = 1;
    if(dist(xPos, yPos-50, 100, 400 - x) <= 10) fail = 1;
    if(dist(xPos, yPos-25, 100, 400 - x) <= 20) fail = 1;
    if(dist(xPos+25, yPos-50, 100, 400 - x) <= 25) fail = 1;
    if(fail > 0) {
        xPos = width;
        delay(1000);
        fail = 1;
    }
}

void jump(float var_jump) {
    if(up_or_down == 0) {
        x = x + var_jump;
        if(x > 150) {
            up_or_down = 1;
        }
    }

    if(up_or_down == 1) {
        x = x - var_jump;
        if(x <= 0) {
            x = 0;
            up_or_down = 0;
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

    //body
    stroke(219, 112, 147);
    strokeWeight(50);
    line(100, 350 - x, 100, 350 - x + 25);

    //head
    stroke(135, 206, 250);
    strokeWeight(15);
    line(100 - 5, 350 - x, 100 + 15, 350 - x);

    //backpack
    stroke(219, 112, 147);
    strokeWeight(15);
    line(100 - 30, 375 - x, 100 - 30, 355 - x);


    if(nsfw_mode == 1) {

        //"circle"
        stroke(255, 182, 193);
        strokeWeight(15 * thiccness);
        line(100, 350 + 35 - x, 100, 350 + 35 - x);

        //"stick"
        stroke(255, 182, 193);
        strokeWeight(10 * thiccness);
        line(100, 350 + 30 - thiccness - x, 100 + 30 * thiccness, 350 + 30 - thiccness - x);
    }

    strokeWeight(1);
    stroke(255, 255, 255);

}

void star1() {
    xPosStar1 = xPosStar1 - 1;
    if(xPosStar1 <= 0) xPosStar1 = width;
    fill(#CCCC00);
    circle(xPosStar1, yPosStar1, 10);
    fill(255);
    star2();
}

void star2() {
    xPosStar2 = xPosStar2 - 3;
    if(xPosStar2 <= 0) xPosStar2 = width;
    fill(#CCCC00);
    circle(xPosStar2, yPosStar2, 10);
    fill(255);
    star3();
}

void star3() {
    xPosStar3 = xPosStar3 - 2;
    if(xPosStar3 <= 0) xPosStar3 = width;
    fill(#CCCC00);
    circle(xPosStar3, yPosStar3, 10);
    fill(255);
}

void nsfw() {
    if(nsfw_mode == 0) {
        if(key == 'p' || key == 'P') {
            nsfw_mode = 1;
        }
    }
    if(nsfw_mode == 1) {
        if(key == 'o' || key == 'O') {
            nsfw_mode = 0;
        }
    }
}

void debugmode() {
    if(debugmode == false) {
        if(key == 'z' || key == 'Z') {
            debugmode = true;
        }
    }
    if(debugmode == true) {
        if(key == 't' || key == 'T') {
            debugmode = false;
        }
    }
}

void autorun() {
    if(autorun == false) {
        if(key == 'i' || key == 'I') {
            autorun = true;
        }
    }
    if(autorun == true) {
        if(key == 'u' || key == 'U') {
            autorun = false;
        }
    }

    if(autorun == true){
        if(dist(xPos-20, yPos, 100, 400 - x) <= 150+speed*15) keyPressed = true;
        else keyPressed = false;
    }
}

void scoreboard() {
    background(0);
    text("Round:", 50, 50);
    text(round, 100, 50);
    text("Fails:", 50, 80);
    text(fails, 100, 80);
    text("Speed:", 50, 110);
    text((speed+1)/2, 100, 110);

    text("RTX:", width - 100, 50);
    text("on",  width - 50, 50);
    text("FPS:",  width - 100, 80);
    text(int(frameRate),  width - 50, 80);

    if(debugmode == true) {
        text("DevMode:", width - 120, 110);
        text("on", width - 50, 110);
    }

    if(autorun == true) {
        text("Bot:", width - 100, 140);
        text("on", width - 50, 140);
    }

    if(nsfw_mode == 1) {
        text("NSFW:", width - 100, 170);
        text("on", width - 50, 170);
    }
}

void endgame() {
    if(fails > 9) {
        fill(0);
        rect(0, 0, 1000, 600);
        textSize(100);
        fill(255);
        text("GAME", width/2-300, height/2);
        text("OVER", width/2, height/2);
        textSize(32);
        text("Score:", width/2 - 100, height/2 + 100);
        text(round, width/2 + 5, height/2 + 100);
        noLoop();
    }
}