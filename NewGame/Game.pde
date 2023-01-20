ExternalClass e;

    void setup() {
        size(1000,600);
        frameRate(60);
        e = new ExternalClass(100);
    }

    public void draw() {    
        background(0);
        fill(255);
        e.doSomething();
        
    }
