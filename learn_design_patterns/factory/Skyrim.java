package factory;

public class Skyrim extends VideoGame {
	public Skyrim() {
		title = "Skyrim";
		genre = "Real Time RPG";
		type  = "Action";
		rating = "M";
		mechanics.add("Move character around and click to attack.");
	}
}
