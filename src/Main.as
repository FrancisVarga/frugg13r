package 
{
	import de.crowdpark.froggler.mvcs.ApplicationContext;

	import flash.display.MovieClip;
	
	[SWF(backgroundColor="#FFFFFF", frameRate="30", width="768", height="768")]
	public class Main extends MovieClip
	{
		public function Main()
		{
			// Launch your application by right clicking within this class and select: Deubg As > FDT SWF Application
			var appContext : ApplicationContext = ApplicationContext.Instance;
			appContext.root = this;
			appContext.init();
			
		}
	}
}
