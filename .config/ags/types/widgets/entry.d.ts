/// <reference types="types/@girs/dbusmenugtk3-0.4/types/@girs/gtk-3.0/gtk-3.0-ambient.js" />
/// <reference types="types/@girs/gtk-3.0/gtk-3.0-ambient.js" />
import { type BaseProps, type Widget } from './widget.js';
import Gtk from 'gi://Gtk?version=3.0';
type EventHandler<Self> = (self: Self) => void | unknown;
export type EntryProps<Attr = unknown, Self = Entry<Attr>> = BaseProps<Self, Gtk.Entry.ConstructorProperties & {
    on_accept?: EventHandler<Self>;
    on_change?: EventHandler<Self>;
}, Attr>;
export interface Entry<Attr> extends Widget<Attr> {
}
export declare class Entry<Attr> extends Gtk.Entry {
    constructor(props?: EntryProps<Attr>);
    get on_accept(): EventHandler<this>;
    set on_accept(callback: EventHandler<this>);
    get on_change(): EventHandler<this>;
    set on_change(callback: EventHandler<this>);
}
export default Entry;
