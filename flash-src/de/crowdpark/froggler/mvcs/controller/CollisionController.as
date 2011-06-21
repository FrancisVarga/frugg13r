package de.crowdpark.froggler.mvcs.controller
{
	import com.coreyoneil.collision.CollisionList;

	import flash.display.MovieClip;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;

	/**
	 * @author Francis Varga
	 */
	public class CollisionController extends EventDispatcher
	{
		private static var _Instance : CollisionController;
		private var _collisionList : CollisionList;
		private var _targetView : MovieClip;

		public static function get Instance() : CollisionController
		{
			if (!_Instance) _Instance = new  CollisionController();

			return _Instance;
		}

		public function CollisionController(target : IEventDispatcher = null)
		{
			super(target);
		}

		public function init() : void
		{
			_collisionList = new CollisionList(_targetView);
		}

		public function addCollisionItems(item : MovieClip) : void
		{
			_collisionList.addItem(item);
		}

		public function set targetView(targetView : MovieClip) : void
		{
			_targetView = targetView;
		}

		public function getCollisions() : Array
		{
			return _collisionList.checkCollisions();
		}

		public function addCollisionList(targetList : Array) : void
		{
			if (targetList.length)
			{
				for (var i : int = 0; i < targetList.length; i++)
				{
					this.addCollisionItems(targetList[i]);
				}
			}
		}
	}
}