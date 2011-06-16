package de.crowdpark.froggler.mvcs.core
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;

	/**
	 * @author Francis Varga
	 */
	public class AbstractMediator extends EventDispatcher
	{
		public function AbstractMediator(target : IEventDispatcher = null)
		{
			super(target);
		}
	}
}
