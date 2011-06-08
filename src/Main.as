package 
{
	import de.crowdpark.mvcs.ApplicationContext;
	import flash.display.Sprite;

	public class Main extends Sprite
	{
		public function Main()
		{
			var applicationContext : ApplicationContext = new ApplicationContext();
			applicationContext.root = this;
			applicationContext.init();
		}
	}
}
