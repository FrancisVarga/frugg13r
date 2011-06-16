package de.crowdpark.froggler.mvcs
{
	import de.crowdpark.froggler.mvcs.commands.GameInvoker;
	import de.crowdpark.froggler.mvcs.models.GameModel;
	import de.crowdpark.froggler.mvcs.models.ScoreModel;
	import de.crowdpark.froggler.mvcs.services.SharedObjectService;

	/**
	 * @author Francis Varga
	 */
	public class ApplicationContext
	{
		private var _root : Main;
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

		public function get root() : Main
		{
			return _root;
		}

		public function set root(root : Main) : void
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
			
			SharedObjectService.Instance.init();
			new GameInvoker();
			
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
