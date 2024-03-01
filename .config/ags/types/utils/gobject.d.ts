/// <reference types="types/@girs/gobject-2.0/gobject-2.0-ambient" />
/// <reference types="types/@girs/gtk-3.0/types/@girs/gobject-2.0/gobject-2.0-ambient" />
/// <reference types="types/@girs/gtk-3.0/types/@girs/harfbuzz-0.0/types/@girs/gobject-2.0/gobject-2.0-ambient" />
import GObject from 'gi://GObject';
type Camel<S extends string> = S extends `${infer P1}_${infer P2}${infer P3}` ? `${Lowercase<P1>}${Uppercase<P2>}${Camel<P3>}` : S;
type Kebab<S extends string> = S extends `${infer Head}_${infer Tail}` ? `${Head}-${Kebab<Tail>}` : S;
/**
 * turns a snake_cased Record into
 * snake & camel & kebab keyed Record
 */
export type CtorProps<T> = T & {
    [K in keyof T as Camel<string & K>]: T[K];
} & {
    [K in keyof T as Kebab<string & K>]: T[K];
};
export declare const kebabify: (str: string) => string;
export type PspecFlag = 'rw' | 'r' | 'w';
export type PspecType = 'jsobject' | 'string' | 'int' | 'float' | 'double' | 'boolean' | 'gobject' | 'widget';
export declare function pspec(name: string, type?: PspecType, handle?: PspecFlag): GObject.ParamSpecString | GObject.ParamSpecInt64 | GObject.ParamSpecFloat | GObject.ParamSpecDouble | GObject.ParamSpecBoolean | GObject.ParamSpecObject | GObject.ParamSpecBoxed;
export declare function registerGObject<Obj extends {
    new (...args: any[]): GObject.Object;
}, Config extends {
    typename?: string;
    signals?: {
        [signal: string]: PspecType[];
    };
    properties?: {
        [prop: string]: [type?: PspecType, handle?: PspecFlag];
    };
    cssName?: string;
}>(object: Obj, config?: Config): Obj;
export {};
