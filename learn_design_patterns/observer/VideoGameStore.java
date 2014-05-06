package observer;
import java.util.ArrayList;

public class VideoGameStore implements Subject {

	private ArrayList observers;
	private String newestGame;
	private int numGames;
	
	public VideoGameStore() {
		observers = new ArrayList();
		this.newestGame = "No games!";
		this.numGames = 0;
	}
	
	@Override
	public void registerObserver(Observer obs) {
		observers.add(obs);
	}

	@Override
	public void removeObserver(Observer obs) {
		int i = observers.indexOf(obs);
		if(i >= 0) {
			observers.remove(i);
		}
	}

	@Override
	public void notifyObservers() {
		for(int i=0; i < observers.size(); ++i) {
			Observer observer = (Observer)observers.get(i);
			//observer.update(newestGame, numGames);
			observer.updatePull(this);
		}
	}
	
	public void gameAnnouncements() { // When a company releases a new game, we get an announcement and update
		notifyObservers();
	}
	
	public void setGameStats(String newGame) {
		this.newestGame = newGame;
		this.numGames += 1;
		this.gameAnnouncements();
	}
	
	public String getNewestGame() {
		return this.newestGame;
	}

	public int getNumGames() {
		return this.numGames;
	}
}
