package
{
	import de.crowdpark.froggler.mvcs.ApplicationContext;

	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.IEventDispatcher;

	[SWF(backgroundColor="#FFFFFF", frameRate="30", width="768", height="768")]
	public class Main extends FrogglerMain
	{
		public function Main()
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;

			this.addEventListener(Event.ADDED_TO_STAGE, onRootAddedToStage);
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