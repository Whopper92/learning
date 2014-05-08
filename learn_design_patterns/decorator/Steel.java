package decorator;

public class Steel extends materialDecorator {

	Weapon weapon;
	
	public Steel(Weapon weapon) {
		this.weapon = weapon;
	}
	
	@Override
	public String getDescription() {
		return this.weapon.getDescription() + " constructed with steel";
	}

	@Override
	public int getPower() {
		return 150 + this.weapon.getPower();
	}

	@Override
	public boolean hasRange() {
		return this.weapon.hasRange();
	}
}
