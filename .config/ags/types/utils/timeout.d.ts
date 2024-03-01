/// <reference types="types/@girs/dbusmenugtk3-0.4/types/@girs/gtk-3.0/gtk-3.0-ambient" />
/// <reference types="types/@girs/gtk-3.0/gtk-3.0-ambient" />
import Gtk from 'gi://Gtk?version=3.0';
export declare function interval(interval: number, callback: () => void, bind?: Gtk.Widget): number;
export declare function timeout(ms: number, callback: () => void): number;
export declare function idle(callback: () => void, prio?: number): number;
