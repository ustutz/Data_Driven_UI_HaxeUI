package data;
import enums.TValueType;
import haxe.ui.components.Label;
import haxe.ui.components.TextField;

/**
 * ...
 * @author Urs Stutz
 */
class FieldData {
	
	public var name:String;
	public var type:TValueType;
	public var value:Dynamic;
	public var labelElement:Label;
	public var inputElement:TextField;
	public var retrieve:TextField->Dynamic;

	public function new( name:String, type:TValueType, value:Dynamic, labelElement:Label, inputElement:TextField, retrieve:Dynamic->Dynamic ) {
		this.name = name;
		this.type = type;
		this.value = value;
		this.labelElement = labelElement;
		this.inputElement = inputElement;
		this.retrieve = retrieve;
	}
	
}