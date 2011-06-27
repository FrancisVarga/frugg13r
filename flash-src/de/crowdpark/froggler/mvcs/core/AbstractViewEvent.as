package de.crowdpark.froggler.mvcs.core
{
	import flash.events.Event;

	/**
	 * @author Francis Varga
	 */
	public class AbstractViewEvent extends Event
	{
		public static const INIT_VIEW_COMPLETE : String = "INIT_VIEW_COMPLETE";
		public static const INIT_MEDIATOR_COMPLETE : String = "INIT_MEDIATOR_COMPLETE";
		public static const DISPOSE : String = "DISPOSE";
		public static const SHOW_COMPLETE : String = "SHOW_COMPLETE";
		public static const HIDE_COMPLETE : String = "HIDE_COMPLETE";

		public function AbstractViewEvent(type : String, bubbles : Boolean = false, cancelable : Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
	}
}
