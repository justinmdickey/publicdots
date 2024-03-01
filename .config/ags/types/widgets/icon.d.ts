/// <reference types="types/@girs/dbusmenugtk3-0.4/types/@girs/gtk-3.0/gtk-3.0-ambient.js" />
/// <reference types="types/@girs/gtk-3.0/gtk-3.0-ambient.js" />
/// <reference types="types/@girs/gdkpixbuf-2.0/gdkpixbuf-2.0-ambient.js" />
import { type BaseProps, type Widget } from './widget.js';
import Gtk from 'gi://Gtk?version=3.0';
import GdkPixbuf from 'gi://GdkPixbuf';
import { Binding } from '../service.js';
import cairo from '@girs/cairo-1.0';
export type Props<Attr = unknown, Self = Icon<Attr>> = BaseProps<Self, Gtk.Image.ConstructorProperties & {
    size?: number;
    icon?: string | GdkPixbuf.Pixbuf | Binding<any, any, string> | Binding<any, any, GdkPixbuf.Pixbuf>;
}, Attr>;
export type IconProps<Attr> = Props<Attr> | string | GdkPixbuf.Pixbuf | undefined;
export interface Icon<Attr> extends Widget<Attr> {
}
export declare class Icon<Attr> extends Gtk.Image {
    constructor(props?: IconProps<Attr>);
    get size(): number;
    set size(size: number);
    get icon(): string | GdkPixbuf.Pixbuf;
    set icon(icon: string | GdkPixbuf.Pixbuf);
    private _previousSize;
    private _fontSize;
    private _size;
    vfunc_draw(cr: cairo.Context): boolean;
}
export default Icon;
