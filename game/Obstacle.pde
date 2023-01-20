class Obstacle {
    int xPos;
    int yPos;
    int fails;

    public Obstacle() {
        this.xPos = width;
        this.yPos = 400;
        this.fails = 0;
    }

    public void moveObstacle(int speed) {
        System.out.println("This should never be called!");
    }

    public void activate() {
        System.out.println("This should never be called!");
    }

    public boolean collisionDetected() {
        System.out.println("This should never be called!");
        return false;
    }
}