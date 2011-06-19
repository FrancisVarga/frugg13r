package de.crowdpark.froggler.mvcs.controller
{
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;

	/**
	 * @author Francis Varga
	 */
	public class FroggerController extends game_frog
	{
		private static var _Instance : FroggerController;
		private var _boardMC : MovieClip;
		
		public static function get Instance() : FroggerController
		{
			if (!_Instance) _Instance = new  FroggerController();
		
			return _Instance;
		}

		override protected function clickState(event : MouseEvent) : void
		{
			return;
		}

		override protected function overState(event : MouseEvent) : void
		{
			return;
		}

		override protected function idleState(event : MouseEvent) : void
		{
			return;
		}

		public function init() : void
		{
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDownHandler);
		}

		private function onKeyDownHandler(event : KeyboardEvent) : void
		{
			var keyCode : uint = event.keyCode;
			trace(keyCode);
			
			switch(keyCode)
			{
				
			}
		}
			
		override protected function moveForward() : void {
			
		}
			
		override protected function moveRight() : void {
			
		}
		
		override protected function moveLeft() : void {
			
		}
		
		public function removeKeyboardListener() : void
		{
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, onKeyDownHandler);
		}

		override public function dispose() : void
		{
			super.dispose();
		}
	
		public function set boardMC(boardMC : MovieClip) : void
		{
			_boardMC=boardMC;
		}
	}
}
