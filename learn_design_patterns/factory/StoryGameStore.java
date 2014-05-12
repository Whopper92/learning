package factory;

public class StoryGameStore extends VideoGameStore {

	@Override
	protected VideoGame createVideoGame(String type) {
		if(type == "RPG") {
			return new FinalFantasyVII();
		} else if(type == "FPS") {
			return new Bioshock();
		}
		return null;
	}

}
