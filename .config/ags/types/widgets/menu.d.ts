/// <reference types="types/@girs/dbusmenugtk3-0.4/types/@girs/gtk-3.0/gtk-3.0-ambient.js" />
/// <reference types="types/@girs/gtk-3.0/gtk-3.0-ambient.js" />
import { type BaseProps, type Widget } from './widget.js';
import Gtk from 'gi://Gtk?version=3.0';
type MenuEventHandler<Self> = {
    on_popup?: (self: Self, flipped_rect: any | null, final_rect: any | null, flipped_x: boolean, flipped_y: boolean) => void | unknown;
    on_move_scroll?: (self: Self, scroll_type: Gtk.ScrollType) => void | unknown;
};
export type MenuProps<MenuItem extends Gtk.MenuItem = Gtk.MenuItem, Attr = unknown, Self = Menu<MenuItem, Attr>> = BaseProps<Self, Gtk.Menu.ConstructorProperties & {
    children?: MenuItem[];
} & MenuEventHandler<Self>, Attr>;
export interface Menu<MenuItem, Attr> extends Widget<Attr> {
}
export declare class Menu<MenuItem extends Gtk.MenuItem, Attr> extends Gtk.Menu {
    constructor(props?: MenuProps<MenuItem, Attr>, ...children: MenuItem[]);
    get on_popup(): MenuEventHandler<this>['on_popup'];
    set on_popup(callback: MenuEventHandler<this>['on_popup']);
    get on_move_scroll(): MenuEventHandler<this>['on_move_scroll'];
    set on_move_scroll(callback: MenuEventHandler<this>['on_move_scroll']);
    get children(): MenuItem[];
    set children(children: MenuItem[]);
}
type EventHandler<Self> = (self: Self) => boolean | unknown;
export type MenuItemProps<Child extends Gtk.Widget = Gtk.Widget, Attr = unknown, Self = MenuItem<Child, Attr>> = BaseProps<Self, Gtk.MenuItem.ConstructorProperties & {
    child?: Child;
    on_activate?: EventHandler<Self>;
    on_select?: EventHandler<Self>;
    on_deselct?: EventHandler<Self>;
}, Attr>;
export interface MenuItem<Child, Attr> extends Widget<Attr> {
}
export declare class MenuItem<Child extends Gtk.Widget, Attr> extends Gtk.MenuItem {
    constructor(props?: MenuItemProps<Child, Attr>, child?: Child);
    get child(): Child;
    set child(child: Child);
    get on_activate(): EventHandler<this>;
    set on_activate(callback: EventHandler<this>);
    get on_select(): EventHandler<this>;
    set on_select(callback: EventHandler<this>);
    get on_deselect(): EventHandler<this>;
    set on_deselect(callback: EventHandler<this>);
}
export default Menu;
