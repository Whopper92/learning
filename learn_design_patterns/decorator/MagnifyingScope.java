package decorator;

public class MagnifyingScope extends sightDecorator {

	Weapon weapon;
	
	public MagnifyingScope(Weapon weapon) {
		this.weapon = weapon;
	}
	
	@Override
	public String getDescription() {
		return this.weapon.getDescription() + " with a magnifying scope";
	}

	@Override
	public int getPower() {
		return 250 + this.weapon.getPower();
	}

	@Override
	public boolean hasRange() {
		return this.weapon.hasRange();
	}
}
