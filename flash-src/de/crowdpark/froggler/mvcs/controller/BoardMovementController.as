package de.crowdpark.froggler.mvcs.controller
{
	import flash.display.MovieClip;

	/**
	 * @author Francis Varga
	 */
	public class BoardMovementController
	{
		private var _boardView : MovieClip;

		public function set boardView(boardView : MovieClip) : void
		{
			_boardView = boardView;
		}
		
		public function init():void
		{
			buildMatrix();
		}
		
		private function buildMatrix():void
		{
			
		}
	}
}
