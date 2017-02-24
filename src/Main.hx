package;

import data.DataAllTypes;
import data.DataString;
import data.FieldData;
import data.Selection;
import haxe.ui.Toolkit;
import haxe.ui.core.Screen;
import haxe.ui.macros.ComponentMacros;
import openfl.display.Sprite;
import openfl.Lib;

/**
 * ...
 * @author Urs Stutz
 */
class Main extends Sprite {

	var data1:DataAllTypes;
	var data2:DataString;
	
	var usedData:Dynamic;
	var fieldDatasets:Array<FieldData>;
	
	public function new() {
		
		super();
		
		Toolkit.init();
		var ui = ComponentMacros.buildComponent("Assets/xml/ui.xml");
		Screen.instance.addComponent( ui );
	}
	
	function buildUI():Void {
		
		data1 = new DataAllTypes( 	0, 
									true, 
									0.12, 
									4, 
									"Random Text", 
									Choices.Second, 
									new Selection( ["Same as Input Series", "1", "2"] ), 
									new Selection( ["Input Series"]
								));
								
		data2 = new DataString( 1, "Some Text", "More Text", "and another one" );
		
		usedData = data1;
	}

}
