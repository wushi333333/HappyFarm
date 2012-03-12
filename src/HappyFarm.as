package
{
	import com.controller.GameControl;
	
	import flash.display.Sprite;
	
	[SWF(width="1024",height="768")]
	public class HappyFarm extends Sprite
	{
		public var control:GameControl;
		
		public function HappyFarm()
		{
			Global.root=this;
			control=new GameControl();
			init();
		}
		
		private function init():void
		{
			control.runOperate("showLand");
		}
	}
}