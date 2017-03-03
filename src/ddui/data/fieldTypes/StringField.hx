package ddui.data.fieldTypes;
import haxe.ui.components.TextField;


class StringField implements IDataField {

	var data:Dynamic;
	var field:String;
	var textField:TextField;
	
	public function new( data:Dynamic, field:String, textField:TextField ) {
		
		this.data = data;
		this.field = field;
		this.textField = textField;
	}
	
	public function data2UI():Void {
		textField.text = Reflect.getProperty( data, field );
	}
	
	public function ui2Data():Void {
		Reflect.setProperty( data, field, textField.text );
	}
}