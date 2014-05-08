package decorator;

public class M4 extends Weapon {

	public M4() {
		description = "An American assault rifle";
		isRanged = true;
	}
	
	@Override
	public int getPower() {
		return 900;
	}

	@Override
	public boolean hasRange() {
		return isRanged;
	}
}
