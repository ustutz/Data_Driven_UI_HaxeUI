package ddui;

import ddui.data.DataAllTypes;
import ddui.data.NestedData;
import ddui.data.Selection;
import ddui.data.UIData;
import haxe.ui.Toolkit;
import haxe.ui.components.Button;
import haxe.ui.containers.Grid;
import haxe.ui.core.Component;
import haxe.ui.core.MouseEvent;
import haxe.ui.core.Screen;
import haxe.ui.macros.ComponentMacros;
import openfl.display.Sprite;
import openfl.Lib;

class Main extends Sprite {

	var ui:Component;
	
	static var testData:DataAllTypes;
	
	static private var uiData:UIData;
	
	public function new() {
		
		super();
		
		Toolkit.init();
		ui = ComponentMacros.buildComponent("Assets/xml/ui.xml");
		Screen.instance.addComponent( ui );
		
		buildUI();
	}
	
	function buildUI():Void {
		
		var container = ui.findComponent( "container", Grid );
		var ok = ui.findComponent( "ok", Button );
		ok.registerEvent( MouseEvent.CLICK, onClick );
		
		testData = new DataAllTypes( 	0, 
									true, 
									0.12, 
									4, 
									"Random Text", 
									Choices.Second, 
									new Selection( ["Same as Input Series", "1", "2"] ), 
									new Selection( ["Input Series"] ),
									new NestedData( false, 5 )
								);
								
		uiData = new UIData( testData );
		uiData.init();
		
		for ( component in uiData.components ) {
			container.addComponent( component );
		}
	}

	function onClick( e:MouseEvent ) {
		
		uiData.ui2Data();
		
		trace( testData );
	}

}
