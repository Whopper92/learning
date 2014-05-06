package strategy;

public class PlayByMovingObjects implements PlayBehavior {

	@Override
	public void play() {
		System.out.println("Objects are moving around the screen!");
	}
}
