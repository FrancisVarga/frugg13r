﻿package de.crowdpark.froggler.mvcs.controller{	import utils.range.isInRange;	import utils.array.arrayContainsValue;	import utils.array.removeItem;	import utils.display.localToLocal;	import de.crowdpark.froggler.components.Water;	import de.crowdpark.froggler.mvcs.core.AbstractBoardToken;	import de.crowdpark.froggler.mvcs.views.board.BoardView;	import flash.display.BitmapData;	import flash.display.MovieClip;	import flash.events.Event;	import flash.events.IEventDispatcher;	import flash.geom.Point;	import flash.geom.Rectangle;	/**	 * @author Francis Varga	 */	public class CollisionDetectionBitMap extends MovieClip	{		private static var _Instance : CollisionDetectionBitMap;		private var _hitItems : Array;		private var _hitItemBitMapData : Vector.<BitmapData> = new Vector.<BitmapData>();		private var _waterRawItems : Array;		private var _waterBitMapItems : Vector.<BitmapData>;		private var _frog : FroggerController;		private var _streetHitTestArea : MovieClip;		private var _waterHitTestArea : MovieClip;		private var _boardView : BoardView;		public static function get Instance() : CollisionDetectionBitMap		{			if (!_Instance) _Instance = new  CollisionDetectionBitMap();			return _Instance;		}		public function init() : void		{			_boardView = BoardView.Instance;			_hitItems = new Array();			_hitItemBitMapData = new Vector.<BitmapData>();			_streetHitTestArea = (_boardView.getChildByName("_streetHitTestArea_") as MovieClip);			_waterHitTestArea = (_boardView.getChildByName("_waterHitTestArea_") as MovieClip);			_waterRawItems = WaterEnemysController.Instance.targetList;			_waterBitMapItems = new Vector.<BitmapData>();			for (var i : int = 0; i < _waterRawItems.length; i++)			{				var water : Water = _waterRawItems[i];				_waterBitMapItems.push(createBitMap(water));			}			_frog = FroggerController.Instance;			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);		}		private function createBitMap(raw : MovieClip) : BitmapData		{			var rawRect : Rectangle = raw.getBounds(BoardView.Instance);			var rawBitMap : BitmapData = new BitmapData(rawRect.width, rawRect.height);			rawBitMap.draw(raw);			return rawBitMap;		}		private function onEnterFrame(event : Event) : void		{			if (hitObjectTesting() == false)			{				IEventDispatcher(event.currentTarget).removeEventListener(event.type, arguments['callee']);				frogDied();			}			// if (waterTesting() == false)			// {			// IEventDispatcher(event.currentTarget).removeEventListener(event.type, arguments['callee']);			// _frog.die();			// }		}		private function frogDied() : void		{			_hitItems = new Array();			_hitItemBitMapData = new Vector.<BitmapData>();			_waterRawItems = new Array();			_waterBitMapItems = new Vector.<BitmapData>();			_frog.die();		}		private function hitObjectTesting() : Boolean		{			if (_hitItems.length > 0)			{				for (var i : int = 0; i < _hitItems.length; i++)				{					var bitmapData : BitmapData = _hitItemBitMapData[i];					var rawData : AbstractBoardToken = _hitItems[i];					// if (hitTest(bitmapData, rawData))					// {					// return false;					// }					// Following Concept					if (hitTest(bitmapData, rawData))					{						if (rawData.following)						{							var frogPoint : Point = localToLocal(_frog, rawData);							_frog.x = frogPoint.x;							_frog.y = frogPoint.y;							return true;						}						else						{							return false;						}					}				}			}			return true;		}		private function waterTesting() : Boolean		{			for (var i : int = 0; i < _waterRawItems.length; i++)			{				var water : BitmapData = _waterBitMapItems[i];				var waterRAW : MovieClip = _waterRawItems[i];				if (hitTest(water, waterRAW))				{					return false;				}			}			return true;		}		private function hitTest(bitmapData : BitmapData, rawData : MovieClip) : Boolean		{			if (bitmapData && rawData)			{				return bitmapData.hitTest(localToLocal(rawData, BoardView.Instance), 255, new Point(_frog.x, _frog.y));			}			return true;		}		public function removeHitItem(target : MovieClip) : void		{			if (arrayContainsValue(_hitItems, target))			{				removeItem(_hitItems, target);			}		}		public function addHitItem(target : MovieClip) : void		{			_hitItemBitMapData.push(createBitMap(target));			_hitItems.push(target);		}	}}