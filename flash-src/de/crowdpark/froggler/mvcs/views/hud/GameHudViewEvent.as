package de.crowdpark.froggler.mvcs.views.hud
{
	import flash.events.Event;

	/**
	 * @author Francis Varga
	 */
	public class GameHudViewEvent extends Event
	{
		public function GameHudViewEvent(type : String, bubbles : Boolean = false, cancelable : Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
	}
}
