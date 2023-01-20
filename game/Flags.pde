/**
 * Flags class to turn extra features on and off
 *
 * @author Jan Grüttefien
 * @version 1.0
 * @date 2023-01-20
 */
public class Flags {
    boolean debugMode;
    boolean cheatMode;
    boolean nsfwMode;
    char lastKey;
    boolean blockInput;

    /**
     * Constructor for Flags class
     */
    public Flags() {
        this.debugMode = false;
        this.cheatMode = false;
        this.nsfwMode = false;
        this.lastKey = 'x';
        this.blockInput = false;
    }

    /**
     * Method to listen for keyboard input
     */
    public void listenForKeyboard() {
        if (key == 'q' || key == 'Q') {
            this.debugMode = true;
        } else if (key == 'w' || key == 'W') {
             this.debugMode = false;
        } else if(key == 'e' || key == 'E') {
            this.cheatMode = true;
        } else if (key == 'r' || key == 'R') {
            this.cheatMode = false;
        } else if (key == 't' || key == 'T') {
            this.nsfwMode = true;
        } else if (key == 'z' || key == 'Z'){
            this.nsfwMode = false;
        }
    }

    /**
     * Get debug mode status
     */
    public boolean getDebugMode() {
        return this.debugMode;
    }

    /**
     * Get cheat mode status
     */
    public boolean getCheatMode() {
        return this.cheatMode;
    }

    /**
     * Get nsfw mode status
     */
    public boolean getNsfwMode() {
        return this.nsfwMode;
    }
}