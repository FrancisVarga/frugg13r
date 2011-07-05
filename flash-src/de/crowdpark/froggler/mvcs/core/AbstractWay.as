package de.crowdpark.froggler.mvcs.core
{
	import utils.array.getRandomElement;

	import de.crowdpark.froggler.mvcs.controller.CollisionDetectionBitMap;

	import com.greensock.TweenMax;
	import com.greensock.easing.Linear;

	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.IEventDispatcher;

	/**
	 * @author Francis Varga
	 */
	public class AbstractWay extends MovieClip
	{
		protected var _direction : uint;
		protected var _isWinnerStage : Boolean;
		protected var _speed : uint;
		protected var _itemClass : Class;
		protected var _gapBetweenItems : uint = 15;
		protected var _maxGroupItems : uint = 4;
		protected var _targetMC : MovieClip;
		private var _childrenList : Array = [];
		private var _gapArray : Array = [75, 80, 100, 120, 75, 75, 90, 90, 80, 80];
		private var _tweenMove : TweenMax;

		public function init() : void
		{
			_gapBetweenItems = getRandomElement(_gapArray);

			var group : MovieClip = getGroup();
			group.addEventListener(Event.ADDED_TO_STAGE, onGroupAddedToStage);
			group.addEventListener(Event.ENTER_FRAME, onGroupEnterFrame);

			if (!_targetMC)
			{
				_targetMC = this;
			}

			_targetMC.addChild(group);
		}

		private function onGroupEnterFrame(event : Event) : void
		{
			if (this.direction === 1)
			{
				if (MovieClip(event.currentTarget).x <= 250)
				{
					IEventDispatcher(event.currentTarget).removeEventListener(event.type, arguments['callee']);
					init();
				}
			}
			else
			{
				if (MovieClip(event.currentTarget).x >= 300)
				{
					IEventDispatcher(event.currentTarget).removeEventListener(event.type, arguments['callee']);
					init();
				}
			}
		}

		private function onGroupAddedToStage(event : Event) : void
		{
			IEventDispatcher(event.currentTarget).removeEventListener(event.type, arguments['callee']);

			var group : MovieClip = (event.currentTarget as MovieClip);
			var xEndPoint : int = 0;

			if (this.direction === 0)
			{
				group.x -= group.width;
				xEndPoint = _targetMC.width + group.width;
			}
			else
			{
				group.x = _targetMC.width + group.width;
				xEndPoint = -(group.width);
			}

			TweenMax.to(group, _speed, {onComplete:onMoveComplete, onCompleteParams:[group], x:xEndPoint, ease:Linear.easeNone});
		}

		private function onMoveComplete(target : MovieClip) : void
		{
			for (var i : int = 0; i < _childrenList.length; i++)
			{
				CollisionDetectionBitMap.Instance.removeHitItem(_childrenList[i]);
			}

			_childrenList.splice(0, _childrenList.length - 1);
			_targetMC.removeChild(target);
		}

		protected function getGroup() : MovieClip
		{
			var group : MovieClip = new MovieClip();
			var gap : uint = 0;

			for (var i : int = 1; i < _maxGroupItems; i++)
			{
				var child : AbstractBoardToken = new _itemClass();
				child.x = gap;
				child.direction = this.direction;
				child.targetMovementMC = group;
				group.addChild(child);
				_childrenList.push(child);

				CollisionDetectionBitMap.Instance.addHitItem(child);

				gap += _gapBetweenItems + child.width;
			}

			return group;
		}

		public function get direction() : uint
		{
			return _direction;
		}

		public function set direction(direction : uint) : void
		{
			_direction = direction;
		}

		public function get isWinnerStage() : Boolean
		{
			return _isWinnerStage;
		}

		public function set isWinnerStage(isWinnerStage : Boolean) : void
		{
			_isWinnerStage = isWinnerStage;
		}

		public function get speed() : uint
		{
			return _speed;
		}

		public function set speed(speed : uint) : void
		{
			_speed = speed;
		}

		public function get itemClass() : Class
		{
			return _itemClass;
		}

		public function set itemClass(itemClass : Class) : void
		{
			_itemClass = itemClass;
		}

		public function get gapBetweenItems() : uint
		{
			return _gapBetweenItems;
		}

		public function set gapBetweenItems(gapBetweenItems : uint) : void
		{
			_gapBetweenItems = gapBetweenItems;
		}

		public function get targetMC() : MovieClip
		{
			return _targetMC;
		}

		public function set targetMC(targetMC : MovieClip) : void
		{
			_targetMC = targetMC;
		}
	}
}
