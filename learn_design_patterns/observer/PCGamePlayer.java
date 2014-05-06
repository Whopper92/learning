package observer;

public class PCGamePlayer implements GamePlayer, Observer {

	private String newestGame;
	private Subject videoGameStore;
	
	public PCGamePlayer(Subject videoGameStore) {
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
		System.out.print("PC Master Race is playing: " + this.newestGame);
	}

}
