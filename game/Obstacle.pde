/**
 * Obstacle class inherits methods to rock and cactus classes
 *
 * @author Jan Grüttefien
 * @version 1.1
 * @date 2023-04-22
 */
public abstract class Obstacle {
    protected int xPos;
    protected int yPos;
    protected int fails;
    protected boolean newRound;

    /**
     * Constructor for objects of class Obstacle
     */
    public Obstacle() {
        this.xPos = width;
        this.yPos = 400;
        this.fails = 0;
        this.newRound = false;
    }

    public boolean isNewRound() {
        return this.newRound;
    }

    public int getXpos() {
        return this.xPos;
    }

    public int getYpos() {
        return this.yPos;
    }

    // abstract methods are implemented in the subclasses
    public abstract void moveObstacle(final int speed, final boolean debugMode);

    public abstract void activate();

    public abstract boolean collisionDetected(final boolean debugMode);

    public abstract boolean isDisplayed();
}