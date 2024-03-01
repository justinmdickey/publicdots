/// <reference types="types/@girs/dbusmenugtk3-0.4/types/@girs/gtk-3.0/gtk-3.0-ambient.js" />
/// <reference types="types/@girs/gtk-3.0/gtk-3.0-ambient.js" />
/// <reference types="types/@girs/gdk-3.0/gdk-3.0-ambient.js" />
/// <reference types="types/@girs/gtk-3.0/types/@girs/gdk-3.0/gdk-3.0-ambient.js" />
import { type BaseProps, type Widget } from './widget.js';
import Gtk from 'gi://Gtk?version=3.0';
import Gdk from 'gi://Gdk?version=3.0';
declare const ANCHOR: {
    readonly left: any;
    readonly right: any;
    readonly top: any;
    readonly bottom: any;
};
declare const LAYER: {
    readonly background: any;
    readonly bottom: any;
    readonly top: any;
    readonly overlay: any;
};
declare const KEYMODE: {
    readonly 'on-demand': any;
    readonly exclusive: any;
    readonly none: any;
};
type Layer = keyof typeof LAYER;
type Anchor = keyof typeof ANCHOR;
type Exclusivity = 'normal' | 'ignore' | 'exclusive';
type Keymode = keyof typeof KEYMODE;
export type WindowProps<Child extends Gtk.Widget = Gtk.Widget, Attr = unknown, Self = Window<Child, Attr>> = BaseProps<Self, Gtk.Window.ConstructorProperties & {
    child?: Child;
    anchor?: Anchor[];
    exclusivity?: Exclusivity;
    layer?: Layer;
    margins?: number[];
    monitor?: number;
    gdkmonitor?: Gdk.Monitor;
    popup?: boolean;
    visible?: boolean;
    keymode?: Keymode;
    exclusive?: boolean;
    focusable?: boolean;
}, Attr>;
export interface Window<Child, Attr> extends Widget<Attr> {
}
export declare class Window<Child extends Gtk.Widget, Attr> extends Gtk.Window {
    constructor({ anchor, exclusive, exclusivity, focusable, keymode, layer, margins, monitor, gdkmonitor, popup, visible, ...params }?: WindowProps<Child, Attr>, child?: Child);
    get child(): Child;
    set child(child: Child);
    get gdkmonitor(): Gdk.Monitor | null;
    set gdkmonitor(monitor: Gdk.Monitor);
    get monitor(): Gdk.Monitor;
    set monitor(monitor: number);
    get exclusive(): boolean;
    set exclusive(exclusive: boolean);
    get exclusivity(): Exclusivity;
    set exclusivity(exclusivity: Exclusivity);
    get layer(): Layer;
    set layer(layer: Layer);
    get anchor(): Anchor[];
    set anchor(anchor: Anchor[]);
    get margins(): number[];
    set margins(margin: number[]);
    get popup(): boolean;
    set popup(popup: boolean);
    get focusable(): boolean;
    set focusable(focusable: boolean);
    get keymode(): Keymode;
    set keymode(mode: Keymode);
}
export default Window;
