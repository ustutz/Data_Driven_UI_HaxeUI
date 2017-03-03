package ddui.data.fieldTypes;
import haxe.ui.components.TextField;


class FloatField implements IDataField {

	var data:Dynamic;
	var field:String;
	var textField:TextField;
	
	public function new( data:Dynamic, field:String, textField:TextField ) {
		
		this.data = data;
		this.field = field;
		this.textField = textField;
	}
	
	public function data2UI():Void {
		textField.text = Std.string( Reflect.getProperty( data, field ));
	}
	
	public function ui2Data():Void {
		
		var value = Std.parseFloat( textField.text );
		if( value != Math.NaN ) {
			Reflect.setProperty( data, field, value );
		} else {
			trace( 'Error: parsing Float Value ${textField.text}' );
		}
	}
}