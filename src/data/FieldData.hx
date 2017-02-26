package data;
import enums.TValueType;
import haxe.ui.components.Label;
import haxe.ui.components.TextField;
import haxe.ui.core.Component;

class FieldData {
	
	public var name:String;
	public var type:TValueType;
	public var value:Dynamic;
	public var labelElement:Label;
	public var inputElement:Component;
	public var retrieve:Component->Dynamic;

	public function new( name:String, type:TValueType, value:Dynamic, labelElement:Label, inputElement:Component, retrieve:Dynamic->Dynamic ) {
		
		this.name = name;
		this.type = type;
		this.value = value;
		this.labelElement = labelElement;
		this.inputElement = inputElement;
		this.retrieve = retrieve;
	}
	
	public function toString():String {
		return 'name: $name, type: $type, value: $value';
	}
}