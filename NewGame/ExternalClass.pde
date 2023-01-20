class ExternalClass {
    int x;
    
    ExternalClass (int x) {
      this.x = x;
      fill(#FF0000);
      ellipse(x, x, x, x);
    }
    
    void doSomething() {
      fill(#FF0000);
      ellipse(this.x, this.x, this.x, this.x);
    }
}
