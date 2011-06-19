package de.crowdpark.froggler.mvcs.views.board
{
	import flash.events.Event;

	/**
	 * @author Francis Varga
	 */
	public class BoardViewEvent extends Event
	{
		public static const START_GAME : String = "START_GAME";
		public function BoardViewEvent(type : String, bubbles : Boolean = false, cancelable : Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
	}
}
