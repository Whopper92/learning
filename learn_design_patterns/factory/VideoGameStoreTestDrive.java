package factory;

public class VideoGameStoreTestDrive {

	public static void main(String[] args) {
		VideoGameStore actionStore = new ActionGameStore();
		VideoGameStore storyStore = new StoryGameStore();
		
		VideoGame videoGame = actionStore.buyVideoGame("RPG");
		System.out.println(videoGame.getTitle() + " has been purchased!");
	    videoGame = actionStore.buyVideoGame("FPS");
		System.out.println(videoGame.getTitle() + " has been purchased!");
		videoGame = storyStore.buyVideoGame("RPG");
		System.out.println(videoGame.getTitle() + " has been purchased!");
		videoGame = storyStore.buyVideoGame("FPS");
		System.out.println(videoGame.getTitle() + " has been purchased!");

	}
}
