package de.crowdpark.froggler.mvcs.views.scores {
	import flash.events.Event;

	/**
	 * @author Francis Varga
	 */
	public class ScoresViewEvent extends Event
	{
		public static const BACK : String = "BACK";
		public function ScoresViewEvent(type : String, bubbles : Boolean = false, cancelable : Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
	}
}
