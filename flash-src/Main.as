package {
	import de.crowdpark.froggler.mvcs.ApplicationContext;

	import flash.display.MovieClip;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;

	[SWF(backgroundColor="#FFFFFF", frameRate="36", width="768", height="768")]
	public class Main extends MovieClip
	{
		public function Main()
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;

			this.loaderInfo.addEventListener(IOErrorEvent.IO_ERROR, onIOError);
			this.loaderInfo.addEventListener(ProgressEvent.PROGRESS, onProgress);

			this.addEventListener(Event.ADDED_TO_STAGE, onRootAddedToStage);
		}

		private function onProgress(event : ProgressEvent) : void
		{
		}

		private function onIOError(event : IOErrorEvent) : void
		{
		}

		private function onRootAddedToStage(event : Event) : void
		{
			IEventDispatcher(event.currentTarget).removeEventListener(event.type, arguments['callee']);

			var context : ApplicationContext = ApplicationContext.Instance;
			context.root = this;
			context.init();
		}
	}
}