class StarA {
     int xPos;
     int yPos;
     int starColor;
     int speed;
     int size;

    StarA(int xPos, int yPos, int speed) {
        this.xPos = xPos;
        this.yPos = yPos;
        this.starColor = #CCCC00;
        this.speed = speed;
        this.size = 10;
        fill(this.starColor);
        noStroke();
        circle(this.xPos, this.yPos, this.size);
        fill(255);
    }

    public void move() {
        this.xPos -= this.speed;
        if (this.xPos <= 0) {
            this.xPos = width;
        }
        fill(this.starColor);
        noStroke();
        circle(this.xPos, this.yPos, this.size);
    }

    public void changeColor(int newColor) {
        this.starColor = newColor;
    }
}