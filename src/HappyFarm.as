package
{
	import com.controller.GameControl;
	
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.net.URLRequest;
	
	[SWF(width="800",height="600",backgroundColor="0x1E6C27")]
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
//			var bg:Loader=new Loader();
//			bg.load(new URLRequest("res/bg/bg.jpg"));
//			addChild(bg);
		}
	}
}