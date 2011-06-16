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
		
		private var _view : MovieClip;
		
		public function AbstractMediator(target : IEventDispatcher = null)
		{
			super(target);
		}

		public function init(view : MovieClip) : void
		{
			this._view = view;
		}

		public function dispose() : void
		{
		}

		public function get view() : MovieClip
		{
			return _view;
		}
	}
}
