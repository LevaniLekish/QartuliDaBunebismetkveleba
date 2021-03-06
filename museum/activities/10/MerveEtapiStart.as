﻿package
{
	import flash.display.MovieClip;
	import flash.utils.*;
	import flash.events.Event;
	import com.greensock.*;
	import com.greensock.easing.*;
	import flash.events.DataEvent;
	
	public class MerveEtapiStart extends MovieClip
	{
		private var merveEtapiStart_mc:MovieClip;
		
		
		private var soundControl1:SoundControl;
		private var _stageHeight:Number;
		private var _stageWidth:Number;
		
		public function MerveEtapiStart(_stageWidth:Number = 1024, _stageHeight:Number = 768)
		{
			this._stageHeight = _stageHeight;
			this._stageWidth = _stageWidth;
			addEventListener(Event.ADDED_TO_STAGE, initHandler)
		}
		
		private function initHandler(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, initHandler);
			initMerveEtapiStart();
		}
		
		private function initMerveEtapiStart():void
		{
			merveEtapiStart_mc = new Merveetapi_mc();
			
			merveEtapiStart_mc.x = _stageWidth / 2;
			merveEtapiStart_mc.y = _stageHeight / 2;
			merveEtapiStart_mc.height  = _stageHeight / 1.5;
			merveEtapiStart_mc.scaleX = merveEtapiStart_mc.scaleY;
			animZgarbi();
			merveEtapiStart_mc.textFrame.alpha = 0;
			merveEtapiStart_mc.zgarbi.alpha = 0;
			addChild(merveEtapiStart_mc);
			
		
		}
		
		private function animZgarbi():void
		{
			TweenMax.fromTo(merveEtapiStart_mc.zgarbi, 1, {x: merveEtapiStart_mc.zgarbi.x, y: (2 * stage.stageHeight)}, {x: merveEtapiStart_mc.zgarbi.x, y: merveEtapiStart_mc.zgarbi.y, alpha: 1, onComplete: addText});
		}
		
		private function addText():void
		{
			
			soundControl1 = new SoundControl();
			addChild(soundControl1);
			soundControl1.loadSound("10.mp3", 1);
			soundControl1.soundPlay();
			
			TweenMax.to(merveEtapiStart_mc.textFrame, 0.5, {alpha: 1, onComplete: next});
		
		}
		
		private function next():void
		{
			setTimeout(merveetapicall, 3000)
		}
		
		private function merveetapicall():void
		{
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "movrchishemosvlas"));
			destroy();
			
		}
		
		private function destroy():void
		{
			TweenMax.killTweensOf(merveEtapiStart_mc.zgarbi)
			TweenMax.killTweensOf(merveEtapiStart_mc.textFrame)
			if (merveEtapiStart_mc)
			{
				removeChild(merveEtapiStart_mc);
				merveEtapiStart_mc = null;
			}
			if (soundControl1)
			{
				removeChild(soundControl1)
				soundControl1 = null;
			}			
			
		}	
	}

}
