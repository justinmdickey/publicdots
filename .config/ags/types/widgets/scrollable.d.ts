/// <reference types="types/@girs/dbusmenugtk3-0.4/types/@girs/gtk-3.0/gtk-3.0-ambient.js" />
/// <reference types="types/@girs/gtk-3.0/gtk-3.0-ambient.js" />
import { type BaseProps, type Widget } from './widget.js';
import Gtk from 'gi://Gtk?version=3.0';
declare const POLICY: {
    readonly automatic: Gtk.PolicyType.AUTOMATIC;
    readonly always: Gtk.PolicyType.ALWAYS;
    readonly never: Gtk.PolicyType.NEVER;
    readonly external: Gtk.PolicyType.EXTERNAL;
};
type Policy = keyof typeof POLICY;
export type ScrollableProps<Child extends Gtk.Widget = Gtk.Widget, Attr = unknown, Self = Scrollable<Child, Attr>> = BaseProps<Self, Gtk.ScrolledWindow.ConstructorProperties & {
    child?: Child;
    hscroll?: Policy;
    vscroll?: Policy;
}, Attr>;
export interface Scrollable<Child, Attr> extends Widget<Attr> {
}
export declare class Scrollable<Child extends Gtk.Widget, Attr> extends Gtk.ScrolledWindow {
    constructor(props?: ScrollableProps<Child, Attr>, child?: Child);
    get child(): Child;
    set child(child: Child);
    setScroll(orientation: 'h' | 'v', scroll: Policy): void;
    get hscroll(): Policy;
    set hscroll(hscroll: Policy);
    get vscroll(): Policy;
    set vscroll(vscroll: Policy);
    private _policy;
}
export default Scrollable;
