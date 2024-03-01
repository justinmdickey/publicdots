/// <reference types="types/@girs/dbusmenugtk3-0.4/types/@girs/gtk-3.0/gtk-3.0-ambient.js" />
/// <reference types="types/@girs/gtk-3.0/gtk-3.0-ambient.js" />
/// <reference types="types/@girs/pango-1.0/pango-1.0-ambient.js" />
import { type BaseProps, type Widget } from './widget.js';
import Gtk from 'gi://Gtk?version=3.0';
import Pango from 'gi://Pango';
declare const JUSTIFICATION: {
    readonly left: Gtk.Justification.LEFT;
    readonly right: Gtk.Justification.RIGHT;
    readonly center: Gtk.Justification.CENTER;
    readonly fill: Gtk.Justification.FILL;
};
declare const TRUNCATE: {
    readonly none: Pango.EllipsizeMode.NONE;
    readonly start: Pango.EllipsizeMode.START;
    readonly middle: Pango.EllipsizeMode.MIDDLE;
    readonly end: Pango.EllipsizeMode.END;
};
type Justification = keyof typeof JUSTIFICATION;
type Truncate = keyof typeof TRUNCATE;
export type Props<Attr = unknown, Self = Label<Attr>> = BaseProps<Self, Gtk.Label.ConstructorProperties & {
    justification?: Justification;
    truncate?: Truncate;
}, Attr>;
export type LabelProps<Attr> = Props<Attr> | string | undefined;
export interface Label<Attr> extends Widget<Attr> {
}
export declare class Label<Attr> extends Gtk.Label {
    constructor(props?: LabelProps<Attr>);
    get label(): string;
    set label(label: string);
    get truncate(): Truncate;
    set truncate(truncate: Truncate);
    get justification(): Justification;
    set justification(justify: Justification);
}
export default Label;
