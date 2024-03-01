/// <reference types="types/@girs/dbusmenugtk3-0.4/types/@girs/gtk-3.0/gtk-3.0-ambient.js" />
/// <reference types="types/@girs/gtk-3.0/gtk-3.0-ambient.js" />
/// <reference types="types/@girs/gdk-3.0/gdk-3.0-ambient.js" />
/// <reference types="types/@girs/gtk-3.0/types/@girs/gdk-3.0/gdk-3.0-ambient.js" />
import { type BaseProps, type Widget } from './widget.js';
import Gtk from 'gi://Gtk?version=3.0';
import Gdk from 'gi://Gdk?version=3.0';
type EventHandler<Self> = (self: Self, event: Gdk.Event) => void | unknown;
declare const POSITION: {
    readonly left: Gtk.PositionType.LEFT;
    readonly right: Gtk.PositionType.RIGHT;
    readonly top: Gtk.PositionType.TOP;
    readonly bottom: Gtk.PositionType.BOTTOM;
};
type Position = keyof typeof POSITION;
type Mark = [number, string?, Position?] | number;
export type SliderProps<Attr = unknown, Self = Slider<Attr>> = BaseProps<Slider<Attr>, Gtk.Scale.ConstructorProperties & {
    on_change?: EventHandler<Self>;
    value?: number;
    min?: number;
    max?: number;
    step?: number;
    marks?: Mark[];
}, Attr>;
export interface Slider<Attr> extends Widget<Attr> {
}
export declare class Slider<Attr> extends Gtk.Scale {
    constructor({ value, min, max, step, marks, ...rest }?: SliderProps<Attr>);
    get on_change(): EventHandler<this>;
    set on_change(callback: EventHandler<this>);
    get value(): number;
    set value(value: number);
    get min(): number;
    set min(min: number);
    get max(): number;
    set max(max: number);
    get step(): number;
    set step(step: number);
    set marks(marks: Mark[]);
    get dragging(): boolean;
    set dragging(dragging: boolean);
    get vertical(): boolean;
    set vertical(vertical: boolean);
    vfunc_button_release_event(event: Gdk.EventButton): boolean;
    vfunc_button_press_event(event: Gdk.EventButton): boolean;
    vfunc_key_press_event(event: Gdk.EventKey): boolean;
    vfunc_key_release_event(event: Gdk.EventKey): boolean;
    vfunc_scroll_event(event: Gdk.EventScroll): boolean;
}
export default Slider;
