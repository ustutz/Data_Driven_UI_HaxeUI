package ddui.contexts;
import ddui.data.Data;
import ddui.data.FieldData;
import ddui.data.Selection;
import ddui.enums.TValueType;
import haxe.ui.components.CheckBox;
import haxe.ui.components.DropDown;
import haxe.ui.components.TextField;
import haxe.ui.core.Component;

class UI2Data {

	public static function retrieve( dataContainer:Data, fieldDatasets:Array<FieldData> ):Data {
		
		for ( fieldData in fieldDatasets ) {
			var value = fieldData.retrieve( cast( fieldData.inputElement ));
			
			switch fieldData.type {
				case TValueType.TEnum:
					var enumType = Type.getEnum( fieldData.value );
					var constructs = Type.getEnumConstructs( enumType );
					if( value != -1 ) {
						var enumString = constructs[value];
						var enumValue = Type.createEnum( enumType, enumString );
						Reflect.setProperty( dataContainer, fieldData.name, enumValue );
					} else {
						trace( 'Error: enumType: $enumType  constructs: $constructs  value: $value' );
					}
				case TValueType.TSelection:
					var selection = new Selection( fieldData.value.options, value );
					Reflect.setProperty( dataContainer, fieldData.name, selection );
				case _:
					Reflect.setProperty( dataContainer, fieldData.name, value );
			}
		}
		return dataContainer;
	}
	
	public static function retrieveArray( selectElement:DropDown ):Int {
		return selectElement.selectedIndex;
	}
	public static function retrieveBool( checkBox:CheckBox ):Bool {
		return checkBox.selected;
	}
	public static function retrieveFloat( inputElement:TextField ):Float {
		return Std.parseFloat( inputElement.value );
	}
	public static function retrieveInt( inputElement:TextField ):Int {
		return Std.parseInt( inputElement.value );
	}
	public static function retrieveString( inputElement:TextField ):String {
		return inputElement.value;
	}
	public static function retrieveSelect( selectElement:DropDown ):Int {
		return selectElement.selectedIndex;
	}
	public static function retrieveZero( component:Component ):Int {
		return 0;
	}
	
}