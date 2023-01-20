int speed = 1;
int play_pause = 0;
boolean night = true;
int fails = 0;
int round = 0;
int xPos = 0;
int yPos = 0;
StarA star1;
StarA star2;
StarA star3;
GameCharacter amogus;
Obstacle cactus;
Obstacle rock;
Scene scene;
Flags flags;


void setup() {
    size(1000,600);
    frameRate(60);
    star1 = new StarA(width/2, 200, 1);
    star2 = new StarA(width, 150, 2);
    star3 = new StarA(width/4, 100, 3);
    amogus = new GameCharacter();
    cactus = new Cactus();
    rock = new Rock();
    scene = new Scene();
    flags = new Flags();
}

public void draw() {    
    if(play_pause == 1) {
        if(cactus.isNewRound() || rock.isNewRound()) {
            round += 1;
            if(round % 10 == 0 && round != 0) {
                speed = speed + 2;
            }
            if(speed >= 10) speed = 10;
        }
        
        
        this.autorun(flags.getCheatMode());
        flags.listenForKeyboard();
        scene.create(round);

        star1.move(scene.isNight(), false);
        star2.move(scene.isNight(), true);
        star3.move(scene.isNight(), false);
        scoreboard(cactus.fails + rock.fails);
        amogus.drawCharacter(flags.getNsfwMode());
        cactus.moveObstacle(speed, flags.getDebugMode());
        rock.moveObstacle(speed, flags.getDebugMode());
        endgame(cactus.fails + rock.fails);
    }

    if(play_pause == 0) {
        startgame();
    }
}

/* 
 * This function implements the autorun mode.
 * @param cheatOn true if the autorun mode is enabled
 */
void autorun(boolean cheatOn) {
    if(cheatOn) {
        if (cactus.isDisplayed()) {
            xPos = cactus.getXpos();
            yPos = cactus.getYpos();
        } else {
            xPos = rock.getXpos();
            yPos = rock.getYpos();
        }

        if(dist(xPos-20, yPos, 100, 400 - amogus.getXpos()) <= 150+speed*15) {
            keyPressed = true;
            key = ' ';
        } else {
            keyPressed = false;
        }
    }
}

/* 
 * This function shows the scoreboard.
 * @param fails the number of fails
 */
void scoreboard(int fails) {
    if(night == true) fill(255);
    else fill(0);
    textAlign(LEFT);
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
    
    if (flags.getDebugMode()) {
        text("DebugMode:", width - 120, 110);
        text("on", width - 50, 110);
    }
    if (flags.getCheatMode()) {
        text("Bot:", width - 100, 140);
        text("on", width - 50, 140);
    }
    if (flags.getNsfwMode()) {
        text("NSFW:", width - 100, 170);
        text("on", width - 50, 170);
    }
    text("Amogus Game by Jan Grüttefien", 10, height - 10);
}

/* 
 * This function shows the endscreen.
 * @param fails the number of fails
 */
void endgame(int fails) {
    if(fails >= 10) play_pause = 0;
}

/* 
 * This function shows the startscreen.
 */
void startgame() {
    if(fails >= 10) {
        textSize(100);
        fill(255);
        textAlign(CENTER);
        text("GAME OVER", width / 2, height/2 - 50);
        textSize(32);
        textAlign(LEFT);
        text("Score:", width / 2 - 100, height / 2);
        text(round, width / 2 + 40, height/ 2);
        textAlign(CENTER);
        text("Press 'space' to play again", width/2, height / 2 + 150);
        if(keyPressed == true && key == ' ') {
            play_pause = 1;
            textSize(10);
            fails = 0;
            round = 0;
            speed = 1;
        }
    } else {
        fill(0);
        rect(0, 0, 1000, 600);
        textSize(70);
        fill(255);
        textAlign(CENTER);
        text("Welcome, Imposter", width / 2, height / 2 - 100);
        textSize(32);
        text("Press 'space' to play", width/2, height / 2 + 100);
        if(keyPressed == true && key == ' ') play_pause = 1;
        textSize(10);
        textAlign(LEFT);
        text("Amogus Game by Jan Grüttefien", 10, height - 10);
        fails = 0;
    }
}
