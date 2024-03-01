/// <reference types="types/@girs/dbusmenugtk3-0.4/types/@girs/gtk-3.0/gtk-3.0-ambient.js" />
/// <reference types="types/@girs/gtk-3.0/gtk-3.0-ambient.js" />
/// <reference types="types/@girs/gdk-3.0/gdk-3.0-ambient.js" />
/// <reference types="types/@girs/gtk-3.0/types/@girs/gdk-3.0/gdk-3.0-ambient.js" />
import { type BaseProps, type Widget } from './widget.js';
import Gtk from 'gi://Gtk?version=3.0';
import Gdk from 'gi://Gdk?version=3.0';
type EventHandler<Self> = (self: Self, event: Gdk.Event) => boolean | unknown;
export type EventBoxProps<Child extends Gtk.Widget = Gtk.Widget, Attr = unknown, Self = EventBox<Child, Attr>> = BaseProps<Self, Gtk.EventBox.ConstructorProperties & {
    child?: Child;
    on_hover?: EventHandler<Self>;
    on_hover_lost?: EventHandler<Self>;
    on_scroll_up?: EventHandler<Self>;
    on_scroll_down?: EventHandler<Self>;
    on_primary_click?: EventHandler<Self>;
    on_middle_click?: EventHandler<Self>;
    on_secondary_click?: EventHandler<Self>;
    on_primary_click_release?: EventHandler<Self>;
    on_middle_click_release?: EventHandler<Self>;
    on_secondary_click_release?: EventHandler<Self>;
}, Attr>;
export interface EventBox<Child, Attr> extends Widget<Attr> {
}
export declare class EventBox<Child extends Gtk.Widget, Attr> extends Gtk.EventBox {
    constructor(props?: EventBoxProps<Child, Attr>, child?: Child);
    get child(): Child;
    set child(child: Child);
    get on_hover(): EventHandler<this>;
    set on_hover(callback: EventHandler<this>);
    get on_hover_lost(): EventHandler<this>;
    set on_hover_lost(callback: EventHandler<this>);
    get on_scroll_up(): EventHandler<this>;
    set on_scroll_up(callback: EventHandler<this>);
    get on_scroll_down(): EventHandler<this>;
    set on_scroll_down(callback: EventHandler<this>);
    get on_primary_click(): EventHandler<this>;
    set on_primary_click(callback: EventHandler<this>);
    get on_middle_click(): EventHandler<this>;
    set on_middle_click(callback: EventHandler<this>);
    get on_secondary_click(): EventHandler<this>;
    set on_secondary_click(callback: EventHandler<this>);
    get on_primary_click_release(): EventHandler<this>;
    set on_primary_click_release(callback: EventHandler<this>);
    get on_middle_click_release(): EventHandler<this>;
    set on_middle_click_release(callback: EventHandler<this>);
    get on_secondary_click_release(): EventHandler<this>;
    set on_secondary_click_release(callback: EventHandler<this>);
}
export default EventBox;
