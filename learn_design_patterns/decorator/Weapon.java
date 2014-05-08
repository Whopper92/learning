package decorator;

public abstract class Weapon {

	protected String description = "An Unknown Weapon";
	protected int power = 0;
	protected boolean isRanged;
	
	public String getDescription() {
		return description;
	}
	
	public abstract int getPower();
	public abstract boolean hasRange();
}
