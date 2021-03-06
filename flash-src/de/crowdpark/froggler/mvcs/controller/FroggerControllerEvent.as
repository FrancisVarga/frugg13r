package de.crowdpark.froggler.mvcs.controller {
	import flash.events.Event;

	/**
	 * @author Francis Varga
	 */
	public class FroggerControllerEvent extends Event
	{
		public static const DIE : String = "DIE";
		public static const WIN : String = "WIN";
		public static const SHOW_DIE_SPLASH : String = "SHOW_DIE_SPLASH";
		public function FroggerControllerEvent(type : String, bubbles : Boolean = false, cancelable : Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
	}
}
