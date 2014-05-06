package observer;

public class VideoGameNews {

	public static void main(String[] args) {
		VideoGameStore videoGameStore = new VideoGameStore();
		XboxGamePlayer anXbox = new XboxGamePlayer(videoGameStore);
		PCGamePlayer aPC = new PCGamePlayer(videoGameStore);
		
		videoGameStore.setGameStats("Civilization 6");
		videoGameStore.setGameStats("Call Of Duty 18");
		videoGameStore.setGameStats("Minecraft 2");
	}

}
