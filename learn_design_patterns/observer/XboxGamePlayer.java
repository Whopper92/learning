package observer;

public class XboxGamePlayer implements GamePlayer, Observer {

	private String newestGame;
	private Subject videoGameStore;
	
	public XboxGamePlayer(Subject videoGameStore) {
		this.videoGameStore = videoGameStore;
		videoGameStore.registerObserver(this);
	}
	
	@Override
	public void update(String newestGame, int numGames) {
		this.newestGame = newestGame;
		this.playGame();
	}
	
	@Override
	public void updatePull(Subject subject) {
		if(subject instanceof VideoGameStore) {
			VideoGameStore gameStore = (VideoGameStore)subject;
			this.newestGame = gameStore.getNewestGame();
			this.playGame();
		}
	}

	@Override
	public void playGame() {
		System.out.println("The newest game I'm playing is: " + newestGame);
	}

}
