package decorator;

public class Iron extends sightDecorator {

	Weapon weapon;
	
	public Iron(Weapon weapon) {
		this.weapon = weapon;
	}
	
	@Override
	public String getDescription() {
		return this.weapon.getDescription() + " with Iron sights";
	}

	@Override
	public int getPower() {
		return 100 + this.weapon.getPower();
	}

	@Override
	public boolean hasRange() {
		return this.weapon.hasRange();
	}
}
