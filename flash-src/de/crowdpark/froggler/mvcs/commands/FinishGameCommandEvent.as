package de.crowdpark.froggler.mvcs.commands {
	import flash.events.Event;

	/**
	 * @author Francis Varga
	 */
	public class FinishGameCommandEvent extends Event
	{
		public static const GAME_OUT_COMPLETE : String = "GAME_OUT_COMPLETE";
		public function FinishGameCommandEvent(type : String, bubbles : Boolean = false, cancelable : Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
	}
}
