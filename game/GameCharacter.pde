/**
 * Class for a jumping Amogus character
 *
 * @author Jan Grüttefien
 * @version 1.1
 * @date 2023-04-22
 */
class GameCharacter {
    private final int bodyColor;
    private final int eyeColor;
    private final int dickColor;
    private float jumpVar;
    private float xSin;
    private boolean nsfwOn;
    private float thiccness;
    private boolean modethicc = true;
    
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
        this.thiccness = 1;
        this.modethicc = true;
    }


    /**
     * Draws the character and checks if the character should jump
     +
     * @param nsfw If the character should contain nsfw content
     */
    public void drawCharacter(final boolean nsfw) {
        this.nsfwOn = nsfw;
        if (keyPressed && key == ' '|| this.jumpVar != 0) {
            this.jump();
        }
        
        if (nsfwOn) {
            if (modethicc) {
                thiccness -= 0.2;
                if (thiccness <= 1) {
                    modethicc = false;
                }
            }

            if (!modethicc) {
                thiccness += 0.2;
                if (thiccness >= 2) {
                    modethicc = true;
                }
            }
        }

        stroke(this.bodyColor);
        strokeWeight(50);
        line(100, 350 - this.jumpVar, 100, 350 - this.jumpVar + 25);
        stroke(this.eyeColor);
        strokeWeight(15);
        line(100 - 5, 350 - this.jumpVar, 100 + 15, 350 - this.jumpVar);
        stroke(this.bodyColor);
        strokeWeight(15);
        line(100 - 30, 375 - this.jumpVar, 100 - 30, 355 - this.jumpVar);

        if (this.nsfwOn) {
            stroke(dickColor);
            strokeWeight(15 * thiccness);
            line(100, 350 + 35 - this.jumpVar, 100, 350 + 35 - this.jumpVar);  
            stroke(dickColor);
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
        this.xSin = this.xSin + PI / 40;
        if (this.xSin > 2 * PI || sin(this.xSin) < 0) {
            this.xSin = 0;
        }
        this.jumpVar = sin(this.xSin) * 120;
    }

    /**
     * Returns the current x position of the character
     *
     * @return The current x position of the character
     */
    public float getXpos() {
        return this.jumpVar;
    }
}