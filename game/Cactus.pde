/**
 * Implementation of the Cactus obstacle
 *
 * @author Jan Grüttefien
 * @version 1.1
 * @date 2023-04-22
 */
public class Cactus extends Obstacle {
    private boolean isActive;
    
    /**
     * Constructor for objects of class Cactus
     */
    public Cactus() {
        super();
        this.isActive = true;
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
                rock.activate();
            }
            stroke(#237543);
            strokeWeight(20);
            line(super.xPos, super.yPos, super.xPos, super.yPos - 85);
            line(super.xPos, super.yPos - 40, super.xPos - 25, super.yPos - 40);
            line(super.xPos - 25, super.yPos - 40, super.xPos-25, super.yPos - 60);
            line(super.xPos, super.yPos - 20, xPos + 25, yPos - 20);
            line(super.xPos + 25, super.yPos - 20, super.xPos + 25, super.yPos - 50);
            strokeWeight(1);
            stroke(255);
            if (this.collisionDetected(debugMode)) {
                super.xPos = width;
                super.newRound = true;
                this.isActive = false;
                rock.activate();
                super.fails ++;
                delay(1000);
            }
        }
    }

    /**
     * Activate this obstacle
     */
    @Override
    public void activate() {
        this.isActive = true;
    }

    /**
     * Check if the obstacle collides with the character
     *
     * @param debugMode whether the debug mode is active or not
     * @return true if the obstacle collides with the character
     */
    @Override
    public boolean collisionDetected(final boolean debugMode) {
        float characterPos = amogus.getXpos();
        if (debugMode) {
            stroke(#FF0000);
            line(super.xPos - 20, super.yPos - 25, 100, 400 - characterPos);
            line(super.xPos - 20, super.yPos - 60, 100, 400 - characterPos);
            line(super.xPos, super.yPos - 80, 100, 400 - characterPos);
            line(super.xPos + 25, super.yPos - 45, 100, 400 - characterPos);
            stroke(255);
        }
      
        if (dist(xPos - 20, yPos - 25, 100, 400 - characterPos) <= 30) {
            return true;
        }
        if (dist(xPos - 20, yPos - 60, 100, 400 - characterPos) <= 30) {
            return true;
        }
        if (dist(xPos, yPos - 80, 100, 400 - characterPos) <= 20) {
            return true;
        }
        if (dist(xPos + 25, yPos - 45, 100, 400 - characterPos) <= 20) { 
            return true;
        }
        return false;
    }

    /**
     * Check if the obstacle is displayed
     *
     * @return true if the obstacle is displayed
     */
    @Override
    public boolean isDisplayed() {
        return this.isActive;
    }
}