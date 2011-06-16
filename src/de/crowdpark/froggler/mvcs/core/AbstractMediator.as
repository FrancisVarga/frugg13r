package de.crowdpark.froggler.mvcs.core
{
	import flash.display.MovieClip;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;

	/**
	 * @author Francis Varga
	 */
	public class AbstractMediator extends EventDispatcher implements IMediator
	{
		public function AbstractMediator(target : IEventDispatcher = null)
		{
			super(target);
		}

		public function init(view : MovieClip) : void
		{
		}

		public function dispose() : void
		{
		}
	}
}
