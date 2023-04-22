/**
 * Implementation of the Rock obstacle
 *
 * @author Jan Grüttefien
 * @version 1.1
 * @date 2023-04-22
 */
public class Rock extends Obstacle {
    private boolean isActive;
    
    /**
     * Constructor for objects of class Rock
     */
    public Rock() {
        super();
        this.isActive = false;
    }

    /**
     * Move the obstacle from right to left
     *
     * @param speed the speed of the obstacle
     * @param whether the debug mode is active or not
     */
    @Override
    public void moveObstacle(final int speed, final boolean debugMode) {
        super.newRound = false;
        if (this.isActive) {
            super.xPos = super.xPos - 10 - speed;
            if (super.xPos < -50) {
                super.xPos = width;
                super.newRound = true;
                this.isActive = false;
                cactus.activate();
            }
            fill(#808080);
            noStroke();                                                                      
            triangle(super.xPos, super.yPos, super.xPos + 50, super.yPos, super.xPos + 25, super.yPos - 75);
            triangle(super.xPos - 20, super.yPos, super.xPos + 25, super.yPos, super.xPos, super.yPos - 50);
            noStroke();
            if (this.collisionDetected(debugMode)) {
                super.xPos = width;
                super.newRound = true;
                this.isActive = false;
                cactus.activate();
                super.fails ++;
                delay(1000);
            }
        }
    }

    /**
     * activate this obstacle
     */
    @Override
    public void activate() {
        this.isActive = true;
    }

    /**
     * check if the obstacle collides with the character
     *
     * @param debugMode whether the debug mode is active or not
     * @return true if the obstacle collides with the character
     */
    @Override
    public boolean collisionDetected(final boolean debugMode) {
        float characterPos = amogus.getXpos();
        if (debugMode) {
            stroke(#FF0000);
            line(super.xPos - 20, super.yPos, 100, 400 - characterPos);
            line(super.xPos, super.yPos - 50, 100, 400 - characterPos);
            line(super.xPos, super.yPos - 25, 100, 400 - characterPos);
            line(super.xPos + 25, super.yPos - 50, 100, 400 - characterPos);
            stroke(255);
        }
      
        if (dist(super.xPos - 20, super.yPos, 100, 400 - characterPos) <= 20) {
            return true;
        }
        if (dist(super.xPos, super.yPos - 50, 100, 400 - characterPos) <= 10) {
            return true;
        }
        if (dist(super.xPos, super.yPos - 25, 100, 400 - characterPos) <= 20) {
            return true;
        }
        if (dist(super.xPos + 25, super.yPos - 50, 100, 400 - characterPos) <= 25) {
            return true;
        }
        return false;
    }

    /**
     * check if the obstacle is displayed
     *
     * @return true if the obstacle is displayed
     */
    @Override
    public boolean isDisplayed() {
        return this.isActive;
    }
}