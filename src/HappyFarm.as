package
{
	import com.controller.GameControl;
	import com.view.operatebarview.OperateBarView;
	import com.view.userinfoview.UserInfoView;
	
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.net.URLRequest;
	
	[SWF(width="800",height="600",backgroundColor="0x1E6C27")]
	public class HappyFarm extends Sprite
	{
		public static var instance:HappyFarm;
		
		public var control:GameControl;
		public var gridW:int;
		public var gridH:int;
		public var screenW:int;
		public var screenH:int;
		public var userInfo:UserInfoView;
		public var operateBar:OperateBarView;
		
		public var gameLayer:Sprite;
		public var uiLayer:Sprite;
		public var popLayer:Sprite;
		
		public function HappyFarm()
		{
			gridW=60;
			gridH=30;
			screenW=800;
			screenH=600;
			HappyFarm.instance=this;
			control=new GameControl();
			init();
		}
		
		private function init():void
		{
			gameLayer=new Sprite();
			addChild(gameLayer);
			
			uiLayer=new Sprite();
			addChild(uiLayer);
			
			popLayer=new Sprite();
			addChild(popLayer);
			
			userInfo=new UserInfoView();
			uiLayer.addChild(userInfo);
			
			operateBar=new OperateBarView();
			uiLayer.addChild(operateBar);
			operateBar.y=screenH;
			
			control.runOperate("showGameView");
		}
	}
}