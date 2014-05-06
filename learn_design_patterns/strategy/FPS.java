package strategy;

public class FPS extends videoGame {

	public FPS() {		
		super.inputBehavior = new InputWithController();
		super.playBehavior = new PlayByShootingEnemies();
	}
	
	@Override
	public void describeGenre() {
		System.out.println("In an FPS, you aim your guns and shoot enemies!.");
	}
}
