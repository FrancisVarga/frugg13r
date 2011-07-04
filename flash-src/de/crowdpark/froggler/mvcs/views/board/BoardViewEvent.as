package de.crowdpark.froggler.mvcs.views.board {
	import flash.events.Event;

	/**
	 * @author Francis Varga
	 */
	public class BoardViewEvent extends Event
	{
		public static const START_GAME : String = "START_GAME";
		public static const SHOW_START_SCREEN : String = "SHOW_START_SCREEN";
		public function BoardViewEvent(type : String, bubbles : Boolean = false, cancelable : Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
	}
}
