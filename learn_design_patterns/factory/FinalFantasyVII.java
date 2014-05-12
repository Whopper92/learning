package factory;

public class FinalFantasyVII extends VideoGame {
	public FinalFantasyVII() {
		title = "Final Fantasy VII";
		genre = "Turn Based RPG";
		type  = "Story";
		rating = "T";
		mechanics.add("Select action from menu and watch.");
	}
	
	void releaseGame() {
		System.out.println("The game is being sent to a SELECT FEW game stores!");
	}
}
