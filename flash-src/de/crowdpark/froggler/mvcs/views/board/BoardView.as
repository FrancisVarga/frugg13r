﻿package de.crowdpark.froggler.mvcs.views.board{	import com.greensock.TweenMax;	/**	 * @author Francis Varga	 */	public class BoardView extends game_play_container	{		private static var _Instance : BoardView;		public static function get Instance() : BoardView		{			if (!_Instance) _Instance = new  BoardView();			return _Instance;		}		override protected function initView() : void		{			this.alpha = 0;			this.x = 2000;			gameRoot.addChild(this);			TweenMax.to(this, 0.4, {alpha:1, x:0, onComplete:super.initView});		}		override protected function initMediator() : void		{			this.mediator = new BoardViewMediator();			super.initMediator();		}		public function startGame() : void		{			dispatchEvent(new BoardViewEvent(BoardViewEvent.SHOW_START_SCREEN));		}	}}