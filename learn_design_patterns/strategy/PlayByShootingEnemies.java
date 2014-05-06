package strategy;

public class PlayByShootingEnemies implements PlayBehavior {

	@Override
	public void play() {
		System.out.println("Boom! Headshot!");
	}
}
