package factory;

public abstract class VideoGameStore {

	public VideoGame buyVideoGame(String type) {
		VideoGame videoGame;
		videoGame = createVideoGame(type);
		
		videoGame.planGameplay();
		videoGame.addGraphics();
		videoGame.releaseGame();
		return videoGame;
		
	}

	protected abstract VideoGame createVideoGame(String type);
}
