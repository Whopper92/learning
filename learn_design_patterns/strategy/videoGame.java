package strategy;

public abstract class videoGame {

	InputBehavior inputBehavior;     // display input method (mouse + keyboard, controller, VR, etc...)
	PlayBehavior playBehavior;       // pretend to play the game
	
	public abstract void describeGenre();
	
	public void setInputBehavior(InputBehavior behavior) {
		inputBehavior = behavior;
	}
	
	public void performInput() {
		inputBehavior.input();
	}
	
	public void setPlayBehavior(PlayBehavior behavior) {
		playBehavior = behavior;
	}
	
	public void performPlay() {
		playBehavior.play();
	}
	
	public void startGame() {
		System.out.println("Launching Game...");
	}
}
