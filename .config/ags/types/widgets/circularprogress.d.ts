/// <reference types="types/@girs/dbusmenugtk3-0.4/types/@girs/gtk-3.0/gtk-3.0-ambient.js" />
/// <reference types="types/@girs/gtk-3.0/gtk-3.0-ambient.js" />
import { type BaseProps, type Widget } from './widget.js';
import Gtk from 'gi://Gtk?version=3.0';
interface Context {
    setSourceRGBA: (r: number, g: number, b: number, a: number) => void;
    arc: (x: number, y: number, r: number, a1: number, a2: number) => void;
    setLineWidth: (w: number) => void;
    lineTo: (x: number, y: number) => void;
    stroke: () => void;
    fill: () => void;
    $dispose: () => void;
}
export type CircularProgressProps<Child extends Gtk.Widget = Gtk.Widget, Attr = unknown, Self = CircularProgress<Child, Attr>> = BaseProps<Self, Gtk.Bin.ConstructorProperties & {
    child?: Child;
    rounded?: boolean;
    value?: number;
    inverted?: boolean;
    start_at?: number;
    end_at?: number;
}, Attr>;
export interface CircularProgress<Child, Attr> extends Widget<Attr> {
}
export declare class CircularProgress<Child extends Gtk.Widget, Attr = unknown> extends Gtk.Bin {
    constructor(props?: CircularProgressProps<Child, Attr>, child?: Child);
    get child(): Child;
    set child(child: Child);
    get rounded(): boolean;
    set rounded(r: boolean);
    get inverted(): boolean;
    set inverted(inverted: boolean);
    get start_at(): number;
    set start_at(value: number);
    get end_at(): number;
    set end_at(value: number);
    get value(): number;
    set value(value: number);
    vfunc_get_preferred_height(): [number, number];
    vfunc_get_preferred_width(): [number, number];
    private _toRadian;
    private _isFullCircle;
    private _mapArcValueToRange;
    vfunc_draw(cr: Context): boolean;
}
export default CircularProgress;
