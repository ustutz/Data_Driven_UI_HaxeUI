package ddui.data.fieldTypes;
import haxe.ui.components.CheckBox;


class BoolField implements IDataField {

	var data:Dynamic;
	var field:String;
	var checkBox:CheckBox;
	
	public function new( data:Dynamic, field:String, checkBox:CheckBox ) {
		
		this.data = data;
		this.field = field;
		this.checkBox = checkBox;
	}
	
	public function data2UI():Void {
		checkBox.selected = Reflect.getProperty( data, field );
	}
	
	public function ui2Data():Void {
		Reflect.setProperty( data, field, checkBox.selected );
	}
}