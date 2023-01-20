class Rock extends Obstacle {
    boolean isActive;
    
    public Rock() {
        super();
        this.isActive = false;
    }

    @Override
    public void moveObstacle(int speed) {
        if (this.isActive) {
            super.xPos = super.xPos - 10 - speed;
            if(super.xPos < -50) {
                super.xPos = width;
                this.isActive = false;
                cactus.activate();
            }
            fill(#808080);
            noStroke();                                                                      
            triangle(super.xPos, super.yPos, super.xPos + 50, super.yPos, super.xPos + 25, super.yPos - 75);
            triangle(super.xPos-20, super.yPos, super.xPos + 25, super.yPos, super.xPos, super.yPos - 50);
            noStroke();
            if (this.collisionDetected()) {
                super.xPos = width;
                this.isActive = false;
                cactus.activate();
                super.fails += 1;
                delay(1000);
            }
        }
    }

    @Override
    public void activate() {
        this.isActive = true;
    }

    @Override
    public boolean collisionDetected() {
        boolean debugMode = true;
        float characterPos = amogus.getXpos();

        if(debugMode == true) {
            stroke(#FF0000);
            line(super.xPos-20, super.yPos, 100, 400 - characterPos);
            line(super.xPos, super.yPos-50, 100, 400 - characterPos);
            line(super.xPos, super.yPos-25, 100, 400 - characterPos);
            line(super.xPos+25, super.yPos-50, 100, 400 - characterPos);
            stroke(255);
        }
      
        if(dist(super.xPos-20, super.yPos, 100, 400 - characterPos) <= 20) {
            return true;
        }
        if(dist(super.xPos, super.yPos-50, 100, 400 - characterPos) <= 10) {
            return true;
        }
        if(dist(super.xPos, super.yPos-25, 100, 400 - characterPos) <= 20) {
            return true;
        }
        if(dist(super.xPos+25, super.yPos-50, 100, 400 - characterPos) <= 25) {
            return true;
        }
        return false;
    }
}
