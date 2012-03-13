package com.view.gameview.land
{
	import flash.display.Loader;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	
	public class Land extends Sprite
	{
		private var landShape:Shape;
		private var landGrid:Shape;
		
		public function Land()
		{
			super();
			
			cacheAsBitmap=true;
			
			landShape=new Shape();
			addChild(landShape);
			
			landGrid=new Shape();
			addChild(landGrid);
		}
		
		public function initLand(row:int,col:int,gw:int,gh:int):void
		{
			//取单元格的一半大小
			var hw:int=gw*0.5;
			var hh:int=gh*0.5;
			//计算组成land的四个坐标
			var maxX:int=col*hw;
			var maxY:int=(row+col)*hh;
			var minX:int=-1*row*hw;
			var minY:int=0;
			var arr:Array=[[minX,row*hh],[0,0],[maxX,col*hh],[(col-row)*hw,maxY]];
			var len:int=arr.length;
			landShape.graphics.beginFill(0x34AF49);
			landShape.graphics.moveTo(arr[0][0],arr[0][1]);
			for(var i:int=1;i<len;i++)
			{
				landShape.graphics.lineTo(arr[i][0],arr[i][1]);
			}
			landShape.graphics.lineTo(arr[0][0],arr[0][1]);
			landShape.graphics.endFill();
			
			landShape.x-=(col-row)*hw*0.5;
			landShape.y-=(row+col)*hh*0.5;
			
			//初始化风格层
			landGrid.graphics.lineStyle(1);
			for(i=row;i>=0;i--)
			{
				landGrid.graphics.moveTo(-i*hw,i*hh);
				landGrid.graphics.lineTo(maxX-i*hw,hh*(col+i));
			}
			
			for(i=col;i>=0;i--)
			{
				landGrid.graphics.moveTo(i*hw,i*hh);
				landGrid.graphics.lineTo(minX+i*hw,(row+i)*hh);
			}
			landGrid.x=landShape.x;
			landGrid.y=landShape.y;
		}
		
		public function setGrid(visible:Boolean):void
		{
			landGrid.visible=visible;
		}
		
		public function release():void
		{
			landShape.graphics.clear();
			landShape=null;
			while(numChildren>0)
			{
				removeChildAt(0);
			}
		}
	}
}