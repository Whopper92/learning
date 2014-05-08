package decorator;

public class Titanium extends materialDecorator {

	Weapon weapon;
	
	public Titanium(Weapon weapon) {
		this.weapon = weapon;
	}
	
	@Override
	public String getDescription() {
		return this.weapon.getDescription() + " constructed with Titanium";
	}

	@Override
	public int getPower() {
		return 400 + this.weapon.getPower();
	}

	@Override
	public boolean hasRange() {
		return this.weapon.hasRange();
	}
}
