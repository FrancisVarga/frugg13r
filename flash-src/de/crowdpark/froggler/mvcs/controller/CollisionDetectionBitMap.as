﻿package de.crowdpark.froggler.mvcs.controller{	import de.crowdpark.froggler.mvcs.views.board.BoardViewMediator;	import utils.display.bringToFront;	import utils.array.arrayContainsValue;	import utils.array.removeItem;	import utils.display.localToLocal;	import de.crowdpark.froggler.components.Water;	import de.crowdpark.froggler.mvcs.core.AbstractBoardToken;	import de.crowdpark.froggler.mvcs.views.board.BoardView;	import flash.display.BitmapData;	import flash.display.MovieClip;	import flash.events.Event;	import flash.events.IEventDispatcher;	import flash.geom.Point;	import flash.geom.Rectangle;	/**	 * @author Francis Varga	 */	public class CollisionDetectionBitMap extends MovieClip	{		private static var _Instance : CollisionDetectionBitMap;		private var _hitItems : Array;		private var _hitItemBitMapData : Vector.<BitmapData> = new Vector.<BitmapData>();		private var _waterRawItems : Array;		private var _waterBitMapItems : Vector.<BitmapData> = new Vector.<BitmapData>();		private var _frog : FroggerController;		private var _streetHitTestArea : MovieClip;		private var _waterHitTestArea : MovieClip;		private var _boardView : BoardView;		public static function get Instance() : CollisionDetectionBitMap		{			if (!_Instance) _Instance = new  CollisionDetectionBitMap();			return _Instance;		}		public function init() : void		{			_boardView = BoardView.Instance;			_hitItems = new Array();			_hitItemBitMapData = new Vector.<BitmapData>();			_streetHitTestArea = (_boardView.getChildByName("_streetHitTestArea_") as MovieClip);			_waterHitTestArea = (_boardView.getChildByName("_waterHitTestArea_") as MovieClip);			_frog = FroggerController.Instance;			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);		}		private function createBitMap(raw : MovieClip) : BitmapData		{			var rawRect : Rectangle = raw.getBounds(BoardView.Instance);			var rawBitMap : BitmapData = new BitmapData(rawRect.width, rawRect.height);			rawBitMap.draw(raw);			return rawBitMap;		}		private function onEnterFrame(event : Event) : void		{			if (hitObjectTesting() == false)			{				IEventDispatcher(event.currentTarget).removeEventListener(event.type, arguments['callee']);				frogDied();			}			if (waterTesting() == false && _frog.isFloaTing === false)			{				IEventDispatcher(event.currentTarget).removeEventListener(event.type, arguments['callee']);				frogDied();			}			if (inRangeTesting() == false && _frog.isFloaTing === true)			{				IEventDispatcher(event.currentTarget).removeEventListener(event.type, arguments['callee']);				frogDied();			}			if (winnerTesting() === true)			{				IEventDispatcher(event.currentTarget).removeEventListener(event.type, arguments['callee']);				frogWin();			}		}		private function frogWin() : void		{			resetData();			_frog.win();		}		private function winnerTesting() : Boolean		{			if (_frog.y <= _frog.height)			{				return true;			}			return false;		}		private function inRangeTesting() : Boolean		{			if (_frog.x <= (_frog.xCord))			{				return false;			}			return true;		}		private function resetData() : void		{			_frog.isFloaTing = false;			_hitItems = new Array();			_hitItemBitMapData = new Vector.<BitmapData>();			_waterRawItems = new Array();			_waterBitMapItems = new Vector.<BitmapData>();		}		private function frogDied() : void		{			resetData();			_frog.die();		}		private function hitObjectTesting() : Boolean		{			if (_hitItems.length > 0)			{				for (var i : int = 0; i < _hitItems.length; i++)				{					var bitmapData : BitmapData = _hitItemBitMapData[i];					var rawData : AbstractBoardToken = _hitItems[i];					_frog.isFloaTing = false;					// Following Concept					if (hitTest(bitmapData, rawData))					{						if (rawData.following)						{							_frog.isFloaTing = true;							bringToFront(_frog);							var rawDataPoint : Point = localToLocal(rawData, BoardView.Instance);							_frog.x = rawDataPoint.x + _frog.xCord;							_frog.y = rawDataPoint.y + _frog.yCord;							return true;						}						else						{							_frog.isFloaTing = false;							return false;						}					}				}			}			return true;		}		private function waterTesting() : Boolean		{			if (_waterRawItems.length > 0)			{				for (var i : int = 0; i < _waterRawItems.length; i++)				{					var water : BitmapData = _waterBitMapItems[i];					var waterRAW : MovieClip = _waterRawItems[i];					if (hitTest(water, waterRAW))					{						return false;					}				}			}			return true;		}		private function hitTest(bitmapData : BitmapData, rawData : MovieClip) : Boolean		{			if (bitmapData && rawData)			{				return bitmapData.hitTest(localToLocal(rawData, BoardView.Instance), 255, new Point(_frog.x, _frog.y));			}			return true;		}		public function removeHitItem(target : MovieClip) : void		{			if (arrayContainsValue(_hitItems, target))			{				removeItem(_hitItems, target);			}		}		public function addHitItem(target : MovieClip) : void		{			_hitItemBitMapData.push(createBitMap(target));			_hitItems.push(target);		}		public function set waterRawItems(waterRawItems : Array) : void		{			_waterRawItems = waterRawItems;			_waterBitMapItems = new Vector.<BitmapData>();			for (var i : int = 0; i < _waterRawItems.length; i++)			{				var water : Water = _waterRawItems[i];				_waterBitMapItems.push(createBitMap(water));			}		}	}}