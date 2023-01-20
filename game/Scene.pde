/**
 * Scene class creates the background and the ground of the game.
 * 
 * @author Jan Grüttefien
 * @version 1.0
 * @date 2023-01-20
 */
public class Scene {
    boolean night;

    /**
     * Constructor for objects of class Scene
     */
    public Scene() {
        this.night = false;
    }

    /**
     * Creates the background and the ground of the game.
     * 
     * @param round The current round of the game.
     */
    public void create(int round) {
        if(((round / 10) % 10) % 2 == 0) {
            night = true;
            background(0);
            fill(#594b1d);
            noStroke();
            rect(0, 400, width, height);
            fill(255);
        }
        else {
            night = false;
            background(#87ceeb);
            fill(#f0bb48);
            noStroke();
            rect(0, 400, width, height);
            fill(0);
        }
    }

    /**
     * Returns whether it is night or not.
     * 
     * @return whether it is night or not.
     */
    public boolean isNight() {
        return this.night;
    }
}