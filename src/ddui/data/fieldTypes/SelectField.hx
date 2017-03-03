package ddui.data.fieldTypes;
import ddui.data.Selection;
import ddui.data.UIData.ListViewItem;
import haxe.ui.components.DropDown;


class SelectField implements IDataField {

	var data:Dynamic;
	var field:String;
	var dropdown:DropDown;
	var selection:Selection;
	var items:Array<ListViewItem> = [];
	
	public function new( data:Dynamic, field:String, dropdown:DropDown ) {
		
		this.data = data;
		this.field = field;
		this.dropdown = dropdown;
	}
	
	public function data2UI():Void {
		
		selection = Reflect.getProperty( data, field );
		
		for( item in items ) {
			dropdown.dataSource.remove( item );
		}
		
		for ( i in 0...selection.options.length ) {
			var optionValue = selection.options[i];
			var optionItem:ListViewItem = { value: optionValue };
			if ( i == selection.index ) {
				dropdown.text = optionValue;
			}
			dropdown.dataSource.add( optionItem );
			items.push( optionItem );
		}
		
		dropdown.selectedIndex = selection.index;
		
		if ( selection.options.length == 1 ) {
			dropdown.disabled = true;
		} else {
			dropdown.disabled = false;
		}
	}
	
	public function ui2Data():Void {
		selection.index = dropdown.selectedIndex;
		Reflect.setProperty( data, field, selection );
	}
}