/**
 * Class for a jumping Amogus character
 * @author Jan Grüttefien
 * @version 1.0
 * @date 2023-01-20
 */
class GameCharacter {
    int bodyColor;
    int eyeColor;
    int dickColor;
    float jumpVar;
    float xSin;
    boolean nsfwOn;
    
    /**
     * Constructor for a Amogus character with jumping ability
     */
    GameCharacter() {
        this.bodyColor = #db7093;
        this.eyeColor = #87cefa;
        this.dickColor = #ffb6c1;
        this.jumpVar = 0;
        this.xSin = 0;
        this.nsfwOn = false;
    }


    /**
     * Draws the character and checks if the character should jump
     +
     * @param nsfw If the character should contain nsfw content
     */
    public void drawCharacter() {
        if(keyPressed == true && key == ' '|| this.jumpVar != 0) {
            this.jump();
        }

        float thiccness = random(1, 3);
        stroke(this.bodyColor);
        strokeWeight(50);
        line(100, 350 - this.jumpVar, 100, 350 - this.jumpVar + 25);
        stroke(this.eyeColor);
        strokeWeight(15);
        line(100 - 5, 350 - this.jumpVar, 100 + 15, 350 - this.jumpVar);
        stroke(this.bodyColor);
        strokeWeight(15);
        line(100 - 30, 375 - this.jumpVar, 100 - 30, 355 - this.jumpVar);

        if (nsfwOn) {
            stroke(this.dickColor);
            strokeWeight(15 * thiccness);
            line(100, 350 + 35 - this.jumpVar, 100, 350 + 35 - this.jumpVar);

            stroke(this.dickColor);
            strokeWeight(10 * thiccness);
            line(100, 350 + 30 - thiccness - this.jumpVar, 100 + 30 * thiccness, 350 + 30 - thiccness - this.jumpVar);
        }

        strokeWeight(1);
        stroke(255, 255, 255);
    }

    /**
     * Makes the character jump up and down by using a sine function
     */
    public void jump() {
        this.xSin = this.xSin + PI/40;
        if (this.xSin > 2 * PI || sin(this.xSin) < 0) {
            this.xSin = 0;
        }
        this.jumpVar = sin(this.xSin) * 120;
    }

    public void setNsfw(boolean nsfw) {
        this.nsfwOn = nsfw;
    }

    public float getXpos() {
        return this.jumpVar;
    }
}