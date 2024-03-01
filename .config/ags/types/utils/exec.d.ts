/// <reference types="gjs" />
/// <reference types="types/@girs/dbusmenugtk3-0.4/types/@girs/gtk-3.0/gtk-3.0-ambient" />
/// <reference types="types/@girs/gtk-3.0/gtk-3.0-ambient" />
/// <reference types="types/@girs/gio-2.0/gio-2.0-ambient" />
/// <reference types="types/@girs/gtk-3.0/types/@girs/gio-2.0/gio-2.0-ambient" />
/// <reference types="types/@girs/nm-1.0/types/@girs/gio-2.0/gio-2.0-ambient" />
import Gtk from 'gi://Gtk?version=3.0';
import Gio from 'gi://Gio';
export declare function execAsync(cmd: string | string[]): Promise<string>;
export declare function exec(cmd: string): string;
export declare function subprocess(cmd: string | string[], callback: (out: string) => void, onError?: typeof logError, bind?: Gtk.Widget): Gio.Subprocess | null;
