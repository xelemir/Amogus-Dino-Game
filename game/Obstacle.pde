/**
 * Obstacle class inherits methods to rock and cactus classes
 *
 * @author Jan Grüttefien
 * @version 1.0
 * @date 2023-01-20
 */
class Obstacle {
    int xPos;
    int yPos;
    int fails;
    boolean newRound;

    /**
     * Constructor for objects of class Obstacle
     */
    public Obstacle() {
        this.xPos = width;
        this.yPos = 400;
        this.fails = 0;
        this.newRound = false;
    }

    // DO NOT USE THESE METHODS, USE THE METHODS IN THE ROCK OR CACTUS CLASS!
    
    public void moveObstacle(int speed, boolean debugMode) {
        System.out.println("This should never be called!");
    }

    public void activate() {
        System.out.println("This should never be called!");
    }

    public boolean isNewRound() {
        return this.newRound;
    }

    public boolean collisionDetected(boolean debugMode) {
        System.out.println("This should never be called!");
        return false;
    }

    public boolean isDisplayed() {
        return false;
    }

    public int getXpos() {
        return this.xPos;
    }

    public int getYpos() {
        return this.yPos;
    }
}