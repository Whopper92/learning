package factory;

public class ActionGameStore extends VideoGameStore {

	@Override
	protected VideoGame createVideoGame(String type) {
			if(type == "RPG") {
				return new Skyrim();
			} else if(type == "FPS") {
				return new Battlefield();
			}
			return null;
	}

}
