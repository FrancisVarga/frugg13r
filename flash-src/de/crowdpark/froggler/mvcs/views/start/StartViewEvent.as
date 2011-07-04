package de.crowdpark.froggler.mvcs.views.start {
	import flash.events.Event;

	/**
	 * @author Francis Varga
	 */
	public class StartViewEvent extends Event
	{
		public static const START_GAME : String = "START_GAME";
		public static const SHOW_SCORE : String = "SHOW_SCORE";
		public function StartViewEvent(type : String, bubbles : Boolean = false, cancelable : Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
	}
}
