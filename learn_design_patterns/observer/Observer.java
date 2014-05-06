package observer;

public interface Observer {
	public void update(String newestGame, int numGames);
	public void updatePull(Subject subject);
}
