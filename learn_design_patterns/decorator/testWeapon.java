package decorator;

public class testWeapon {

	public static void main(String[] args) {
		Weapon weapon1 = new M4();
		System.out.println(weapon1.getDescription() + ", power " + weapon1.getPower() + ", ranged: " + weapon1.hasRange());
		weapon1 = new Iron(weapon1);
		weapon1 = new Steel(weapon1);
		System.out.println(weapon1.getDescription() + ", power " + weapon1.getPower() + ", ranged: " + weapon1.hasRange());

		
		Weapon weapon2 = new SVD();
		System.out.println(weapon2.getDescription() + ", power " + weapon2.getPower() + ", ranged: " + weapon2.hasRange());
		weapon2 = new MagnifyingScope(weapon2);
		weapon2 = new Titanium(weapon2);
		System.out.println(weapon2.getDescription() + ", power " + weapon2.getPower() + ", ranged: " + weapon2.hasRange());

		
		Weapon weapon3 = new Mace();
		System.out.println(weapon3.getDescription() + ", power " + weapon3.getPower() + ", ranged: " + weapon3.hasRange());
		weapon3 = new Titanium(weapon3);
		System.out.println(weapon3.getDescription() + ", power " + weapon3.getPower() + ", ranged: " + weapon3.hasRange());


	}

}
