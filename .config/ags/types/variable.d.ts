/// <reference types="types/@girs/gio-2.0/gio-2.0-ambient.js" />
/// <reference types="types/@girs/gtk-3.0/types/@girs/gio-2.0/gio-2.0-ambient.js" />
/// <reference types="types/@girs/nm-1.0/types/@girs/gio-2.0/gio-2.0-ambient.js" />
/// <reference types="types/@girs/gobject-2.0/gobject-2.0-ambient.js" />
/// <reference types="types/@girs/gtk-3.0/types/@girs/gobject-2.0/gobject-2.0-ambient.js" />
/// <reference types="types/@girs/gtk-3.0/types/@girs/harfbuzz-0.0/types/@girs/gobject-2.0/gobject-2.0-ambient.js" />
import GObject from 'gi://GObject';
import Gio from 'gi://Gio';
import { Binding, Props } from './service.js';
type Listen<T> = [string[] | string, (out: string, self: Variable<T>) => T] | [string[] | string] | string[] | string;
type Poll<T> = [number, string[] | string | ((self: Variable<T>) => T) | ((self: Variable<T>) => Promise<T>)] | [number, string[] | string, (out: string, self: Variable<T>) => T];
export interface Options<T> {
    poll?: Poll<T>;
    listen?: Listen<T>;
}
export declare class Variable<T> extends GObject.Object {
    protected _value: T;
    protected _poll?: Poll<T>;
    protected _listen?: Listen<T>;
    protected _interval?: number;
    protected _subprocess?: Gio.Subprocess | null;
    constructor(value: T, { poll, listen }?: Options<T>);
    startPoll(): void;
    stopPoll(): void;
    startListen(): void;
    stopListen(): void;
    get is_listening(): boolean;
    get is_polling(): boolean;
    dispose(): void;
    getValue(): T;
    setValue(value: T): void;
    get value(): T;
    set value(value: T);
    connect(signal: string | undefined, callback: (self: this, ...args: any[]) => void): number;
    bind<P extends keyof Props<this>>(): Binding<this, P, T>;
    bind<P extends keyof Props<this>>(prop?: P): Binding<this, P, this[P]>;
}
declare const _default: <T>(value: T, options?: Options<T> | undefined) => Variable<T>;
export default _default;
