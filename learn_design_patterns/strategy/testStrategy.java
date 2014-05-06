package strategy;

public class testStrategy {

	public static void main(String[] args) {
		videoGame starcraft = new RTS();
		starcraft.describeGenre();
		starcraft.performInput();
		starcraft.setInputBehavior(new InputWithController());
		starcraft.performInput();
		starcraft.performPlay();
		starcraft.setPlayBehavior(new PlayByShootingEnemies());
		starcraft.performPlay();
		
		videoGame callOfDuty = new FPS();
		callOfDuty.describeGenre();
		callOfDuty.performInput();
		callOfDuty.performPlay();
		
		videoGame someVR = new VR();
		someVR.describeGenre();
		someVR.performInput();
		someVR.performPlay();
	}
}
