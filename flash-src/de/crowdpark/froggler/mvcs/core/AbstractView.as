package de.crowdpark.froggler.mvcs.core
{
	import de.crowdpark.froggler.mvcs.ApplicationContext;

	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.IEventDispatcher;

	/**
	 * @author Francis Varga
	 */
	public class AbstractView extends MovieClip
	{
		private var _mediator : IMediator;
		private var _gameRoot : Main;
		
		public function AbstractView()
		{
			
			this._gameRoot = ApplicationContext.Instance.root;
			
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			this.addEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
			this.initMediator();
			this.initView();
		}

		protected function get gameRoot() : Main
		{
			return this._gameRoot;
		}
		
		protected function initView() : void
		{
		}

		protected function initMediator() : void
		{
		}

		protected function onRemovedFromStage(event : Event) : void
		{
			IEventDispatcher(event.currentTarget).removeEventListener(event.type, arguments['callee']);
			this.mediator.dispose();	
		}

		protected function onAddedToStage(event : Event) : void
		{
			IEventDispatcher(event.currentTarget).removeEventListener(event.type, arguments['callee']);
			this.mediator.init(this);
		}

		public function get mediator() : IMediator
		{
			return _mediator;
		}

		public function set mediator(mediator : IMediator) : void
		{
			_mediator = mediator;
		}
	}
}
