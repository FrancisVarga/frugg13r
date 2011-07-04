package de.crowdpark.froggler.components {
	import de.crowdpark.froggler.mvcs.core.AbstractInteractiveComponent;

	/**
	 * @author Francis Varga
	 */
	public class FroggleButton extends AbstractInteractiveComponent
	{
		public function FroggleButton()
		{
			super();
			useHandCursor = true;
			buttonMode = true;
		}

	}
}
