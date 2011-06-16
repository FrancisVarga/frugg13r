package de.crowdpark.froggler.mvcs.core
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;

	/**
	 * @author Francis Varga
	 */
	public class AbstractService extends EventDispatcher
	{
		public function AbstractService(target : IEventDispatcher = null)
		{
			super(target);
		}
	}
}
