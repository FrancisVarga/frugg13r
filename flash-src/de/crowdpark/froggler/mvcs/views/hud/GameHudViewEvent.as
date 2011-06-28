package de.crowdpark.froggler.mvcs.views.hud
{
	import flash.events.Event;

	/**
	 * @author Francis Varga
	 */
	public class GameHudViewEvent extends Event
	{
		public static const NO_LIFE : String = "NO_LIFE";
		public static const TIME_COMPLETE : String = "TIME_COMPLETE";

		public function GameHudViewEvent(type : String, bubbles : Boolean = false, cancelable : Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
	}
}
