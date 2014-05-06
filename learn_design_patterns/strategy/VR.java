package strategy;

public class VR extends videoGame {

	public VR() {
		super.inputBehavior = new InputWithMind();
		super.playBehavior = new PlayByMovingObjects();
	}
	
	@Override
	public void describeGenre() {
		System.out.println("In VR games, you might move objects around.");
	}

}
