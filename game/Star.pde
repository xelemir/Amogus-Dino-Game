/**
 * Class to create a star
 *
 * @author Jan Grüttefien
 * @version 1.0
 * @date 2023-01-20
 */
class StarA {
     int xPos;
     int yPos;
     int starColor;
     int speed;
     int size;

    /**
     * Constructor for objects of class Star
     *
     * @param xPos The x position of the star
     * @param yPos The y position of the star   
     * @param speed The speed of the star
     */
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

    /**
     * Method to move the star
     *
     * @param asStar If the star should be drawn as a star
     * @param asSun If the star should be drawn as a sun
     */
    public void move(boolean asStar, boolean asSun) {
        this.xPos -= this.speed;
        if (this.xPos <= 0) {
            this.xPos = width;
        }
        if (asStar) {
            fill(this.starColor);
            noStroke();
            circle(this.xPos, this.yPos, this.size);
        } else if (asSun) {
            fill(this.starColor);
            noStroke();
            circle(this.xPos, this.yPos, this.size*10);
        }
    }
}