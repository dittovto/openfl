package openfl.system; #if !flash


import openfl.Lib;

#if js
import js.html.Element;
import js.Browser;
#end


class Capabilities {
	
	
	public static var hasAccessibility = false;
	public static var pixelAspectRatio (get, null):Float;
	public static var screenDPI (get, null):Float;
	public static var screenResolutionX (get, null):Float;
	public static var screenResolutionY (get, null):Float;
	public static var language (get, null):String;
	
	
	
	
	// Getters & Setters
	
	
	
	
	private static function get_pixelAspectRatio ():Float { return 1; }
	private static function get_screenDPI ():Float {
		
		#if js
		
		if (screenDPI > 0) return screenDPI;
		
		//little trick of measuring the width of a 1 inch div
		//but sadly most browsers/OSs still return wrong result...
		var body = Browser.document.getElementsByTagName ("body")[0];
		var testDiv:Element = cast Browser.document.createElement ("div");
		testDiv.style.width = testDiv.style.height = "1in";
		testDiv.style.padding = testDiv.style.margin = "0px";
		testDiv.style.position = "absolute";
		testDiv.style.top = "-100%";
		body.appendChild (testDiv);
		screenDPI = testDiv.offsetWidth;
		body.removeChild (testDiv);
		
		return screenDPI;
		
		#else
		
		return 0;
		
		#end
		
	}
	
	
	private static function get_screenResolutionX ():Float { 
		
		#if js
		
		return Browser.window.screen.width;
		
		#else
		
		return 0;
		
		#end
		
	}
	
	
	private static function get_screenResolutionY ():Float {
		
		#if js
		
		return Browser.window.screen.height;
		
		#else
		
		return 0;
		
		#end
		
	}
	
	
	private static function get_language ():String {
		
		#if js
		
		return untyped navigator.language;
		
		#else
		
		return "en-US";
		
		#end
	
	}
	
	
}


#else
typedef Capabilities = flash.system.Capabilities;
#end