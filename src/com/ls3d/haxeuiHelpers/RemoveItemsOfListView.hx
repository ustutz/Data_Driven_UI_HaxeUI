package com.ls3d.haxeuiHelpers;
import ddui.data.UIData.ListViewItem;
import haxe.ui.containers.ListView;
import haxe.ui.data.ArrayDataSource;

class RemoveItemsOfListView {

	public static function removeAll( listView:ListView, items:Array<ListViewItem> ):Void {
		
		for ( item in items ) { //trace( 'remove item ${item.value}' );
			listView.dataSource.remove( item );
		}
		items.splice( 0, items.length );
	}
	
}