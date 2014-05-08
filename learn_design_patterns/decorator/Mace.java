package decorator;

public class Mace extends Weapon {

	public Mace() {
		description = "A Medieval weapon made of a ball with sharp spikes";
		isRanged = false;
	}
	
	@Override
	public int getPower() {
		return 300;
	}

	@Override
	public boolean hasRange() {
		return isRanged;
	}

}
