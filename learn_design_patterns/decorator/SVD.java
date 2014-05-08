package decorator;

public class SVD extends Weapon {

	public SVD() {
		description = "A Russian sniper rifle";
		isRanged = true;
	}
	
	@Override
	public int getPower() {
		return 1500;
	}

	@Override
	public boolean hasRange() {
		return isRanged;
	}
}
