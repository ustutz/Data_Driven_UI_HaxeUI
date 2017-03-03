package ddui.data.fieldTypes;
import com.ls3d.haxeuiHelpers.RemoveItemsOfListView;
import ddui.data.UIData.ListViewItem;
import haxe.ui.components.DropDown;


class EnumField implements IDataField {

	var data:Dynamic;
	var field:String;
	var dropdown:DropDown;
	var value:Dynamic;
	var items:Array<ListViewItem> = [];
	
	public function new( data:Dynamic, field:String, dropdown:DropDown ) {
		
		this.data = data;
		this.field = field;
		this.dropdown = dropdown;
		
	}
	
	public function data2UI():Void {
		
		value = Reflect.getProperty( data, field );
		
		for( item in items ) {
			dropdown.dataSource.remove( item );
		}
		
		var options = Type.getEnumConstructs( Type.getEnum( value ));
		var index = options.indexOf( value );
		
		for ( i in 0...options.length ) {
			var optionValue = options[i];
			var optionItem:ListViewItem = { value: optionValue };
			if ( i == index ) {
				dropdown.text = optionValue;
			}
			dropdown.dataSource.add( optionItem );
			items.push( optionItem );
		}
		
		dropdown.selectedIndex = Type.enumIndex( value );
		
		if ( options.length == 1 ) {
			dropdown.disabled = true;
		} else {
			dropdown.disabled = false;
		}
	}
	
	public function ui2Data():Void {
		
		var index = dropdown.selectedIndex;
		var enumType = Type.getEnum( value );
		var constructs = Type.getEnumConstructs( enumType );
		var enumString = constructs[index];
		var enumValue = Type.createEnum( enumType, enumString );
		Reflect.setProperty( data, field, enumValue );
	}
}