/// <reference types="types/@girs/gobject-2.0/gobject-2.0-ambient.js" />
/// <reference types="types/@girs/gtk-3.0/types/@girs/gobject-2.0/gobject-2.0-ambient.js" />
/// <reference types="types/@girs/gtk-3.0/types/@girs/harfbuzz-0.0/types/@girs/gobject-2.0/gobject-2.0-ambient.js" />
/// <reference types="types/@girs/gdk-3.0/gdk-3.0-ambient.js" />
/// <reference types="types/@girs/gtk-3.0/types/@girs/gdk-3.0/gdk-3.0-ambient.js" />
/// <reference types="types/@girs/dbusmenugtk3-0.4/types/@girs/gtk-3.0/gtk-3.0-ambient.js" />
/// <reference types="types/@girs/gtk-3.0/gtk-3.0-ambient.js" />
import GObject from 'gi://GObject';
import Gtk from 'gi://Gtk?version=3.0';
import Gdk from 'gi://Gdk?version=3.0';
import { Props, BindableProps } from '../service.js';
import { registerGObject, type CtorProps } from '../utils/gobject.js';
import { App } from '../app.js';
declare const ALIGN: {
    readonly fill: Gtk.Align.FILL;
    readonly start: Gtk.Align.START;
    readonly end: Gtk.Align.END;
    readonly center: Gtk.Align.CENTER;
    readonly baseline: Gtk.Align.BASELINE;
};
export type Align = keyof typeof ALIGN;
export type Cursor = 'default' | 'help' | 'pointer' | 'context-menu' | 'progress' | 'wait' | 'cell' | 'crosshair' | 'text' | 'vertical-text' | 'alias' | 'copy' | 'no-drop' | 'move' | 'not-allowed' | 'grab' | 'grabbing' | 'all-scroll' | 'col-resize' | 'row-resize' | 'n-resize' | 'e-resize' | 's-resize' | 'w-resize' | 'ne-resize' | 'nw-resize' | 'sw-resize' | 'se-resize' | 'ew-resize' | 'ns-resize' | 'nesw-resize' | 'nwse-resize' | 'zoom-in' | 'zoom-out';
type Property = [prop: string, value: unknown];
type Connection<Self> = [GObject.Object, (self: Self, ...args: unknown[]) => unknown, string?] | [string, (self: Self, ...args: unknown[]) => unknown] | [number, (self: Self, ...args: unknown[]) => unknown];
type Bind = [
    prop: string,
    obj: GObject.Object,
    objProp?: string,
    transform?: (value: any) => any
];
interface CommonProps<Attr> {
    class_name?: string;
    class_names?: Array<string>;
    click_through?: boolean;
    css?: string;
    hpack?: Align;
    vpack?: Align;
    cursor?: Cursor;
    attribute?: Attr;
}
export type BaseProps<Self, Props, Attr = unknown> = {
    setup?: (self: Self) => void;
} & BindableProps<CtorProps<Props & CommonProps<Attr>>>;
type Requierd<T> = {
    [K in keyof T]-?: T[K];
};
export interface Widget<Attr> extends Requierd<CommonProps<Attr>> {
    hook<Gobject extends GObject.Object>(gobject: Gobject | App, callback: (self: this, ...args: any[]) => void, signal?: string): this;
    bind<Prop extends keyof Props<this>, Gobject extends GObject.Object, ObjProp extends keyof Props<Gobject>>(prop: Prop, gobject: Gobject, objProp?: ObjProp, transform?: (value: Gobject[ObjProp]) => this[Prop]): this;
    on(signal: string, callback: (self: this, ...args: any[]) => void): this;
    poll(timeout: number, callback: (self: this) => void): this;
    readonly is_destroyed: boolean;
    _handleParamProp(prop: keyof this, value: any): void;
    _get<T>(field: string): T;
    _set<T>(field: string, value: T, notify?: boolean): void;
    toggleClassName(className: string, condition?: boolean): void;
    setCss(css: string): void;
    isHovered(event?: Gdk.Event): boolean;
}
export declare class AgsWidget<Attr> extends Gtk.Widget implements Widget<Attr> {
    set attribute(attr: Attr);
    get attribute(): Attr;
    hook<Gobject extends GObject.Object>(gobject: Gobject | App, callback: (self: this, ...args: any[]) => void, signal?: string): this;
    bind<Prop extends keyof Props<this>, Gobject extends GObject.Object, ObjProp extends keyof Props<Gobject>>(prop: Prop, gobject: Gobject, objProp?: ObjProp, transform?: (value: Gobject[ObjProp]) => this[Prop]): this;
    on(signal: string, callback: (self: this, ...args: any[]) => void): this;
    poll(timeout: number, callback: (self: this) => void): this;
    _init(config?: BaseProps<this, Gtk.Widget.ConstructorProperties & {
        child?: Gtk.Widget;
    }, Attr>, child?: Gtk.Widget): void;
    _handleParamProp<Props>(prop: keyof Props, value: any): void;
    get is_destroyed(): boolean;
    _get<T>(field: string): T;
    _set<T>(field: string, value: T, notify?: boolean): void;
    set connections(connections: Connection<this>[]);
    set binds(binds: Bind[]);
    set properties(properties: Property[]);
    connectTo<GObject extends GObject.Object>(gobject: GObject, callback: (self: this, ...args: any[]) => void, signal?: string): this;
    _setPack(orientation: 'h' | 'v', align: Align): void;
    _getPack(orientation: 'h' | 'v'): "fill" | "start" | "end" | "center" | "baseline";
    get hpack(): Align;
    set hpack(align: Align);
    get vpack(): Align;
    set vpack(align: Align);
    toggleClassName(className: string, condition?: boolean): void;
    get class_name(): string;
    set class_name(names: string);
    get class_names(): string[];
    set class_names(names: string[]);
    _cssProvider: Gtk.CssProvider;
    setCss(css: string): void;
    get css(): string;
    set css(css: string);
    get child(): Gtk.Widget | null;
    set child(child: Gtk.Widget);
    _updateCursor(): void;
    get cursor(): Cursor;
    set cursor(cursor: Cursor);
    isHovered(event?: Gdk.Event): boolean;
    get click_through(): boolean;
    set click_through(clickThrough: boolean);
}
export declare function register<T extends {
    new (...args: any[]): Gtk.Widget;
}>(klass: T, config?: Parameters<typeof registerGObject>[1] & {
    cssName?: string;
}): T;
declare function W(klass: any): any;
declare namespace W {
    var register: typeof import("./widget.js").register;
}
export default W;
