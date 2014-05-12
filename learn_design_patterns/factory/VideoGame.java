package factory;

import java.util.ArrayList;

public abstract class VideoGame {
	String title;
	String genre;
	String type;
	String rating;
	ArrayList mechanics = new ArrayList();
	
	void developGame() {
		System.out.println("Developing " + title);
		System.out.println("Shaping to be genre " + genre);
		System.out.println("Shooting for " + rating + " rating");
		for(Object mechanic : mechanics) {
			System.out.println(mechanic.toString());
		}
	}
		
	void planGameplay() {
		System.out.println("The team is deciding what the gameplay should be like");
	}
	
	void addGraphics() {
		System.out.println("Graphics specialists are designing graphical assets");
	}
	
	void releaseGame() {
		System.out.println("The game is being sent to game stores!");
	}
	
	public String getTitle() {
		return title;
	}
}
