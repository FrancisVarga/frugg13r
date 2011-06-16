package de.crowdpark.froggler.mvcs
{
	import de.crowdpark.froggler.mvcs.models.GameModel;
	import de.crowdpark.froggler.mvcs.models.ScoreModel;

	import flash.display.MovieClip;

	/**
	 * @author Francis Varga
	 */
	public class ApplicationContext
	{
		private var _root : MovieClip;
		private static var _Instance : ApplicationContext;
		private var _gameModel : GameModel;
		private var _scoreModel : ScoreModel;
		
		public static function get Instance() : ApplicationContext
		{
			if (!_Instance)
			{
				_Instance = new ApplicationContext();
			}

			return _Instance;
		}

		public function get root() : MovieClip
		{
			return _root;
		}

		public function set root(root : MovieClip) : void
		{
			_root = root;
		}

		public function init() : void
		{
			if (!root)
			{
				throw new Error("root is null");
			}
			
			this.root.gotoAndPlay("titleIn");
			
			this.invokeBootStrap();
		}

		private function invokeBootStrap() : void
		{
			this._gameModel = new GameModel();
			this._scoreModel = new ScoreModel();
			
			
		}

		public function get scoreModel() : ScoreModel
		{
			return _scoreModel;
		}

		public function get gameModel() : GameModel
		{
			return _gameModel;
		}
	}
}
