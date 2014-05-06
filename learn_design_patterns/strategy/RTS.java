package strategy;

public class RTS extends videoGame {	
	
	public RTS() {
		super.inputBehavior = new InputWithMouse();
		super.playBehavior = new PlayByCommandingUnits();
	}

	@Override
	public void describeGenre() {
		System.out.println("In an RTS, you move units around and destroy bases.");
	}
}
