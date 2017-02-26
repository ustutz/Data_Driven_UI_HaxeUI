package;

import contexts.CreateUI;
import contexts.Data2UIData;
import contexts.UI2Data;
import data.DataAllTypes;
import data.DataString;
import data.FieldData;
import data.Selection;
import haxe.Json;
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
	
	var data1:DataAllTypes;
	var data2:DataString;
	
	var usedData:Dynamic;
	var fieldDatasets:Array<FieldData>;
	
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
		
		fieldDatasets = Data2UIData.createFieldDatasets( usedData ); trace( fieldDatasets );
		CreateUI.create( container, fieldDatasets );
		
		ok.registerEvent( MouseEvent.CLICK, onClick );

	}

	function onClick( e:MouseEvent ) {
		
		var retrievedData = UI2Data.retrieve( usedData, fieldDatasets );
		trace( retrievedData );
	}

}
