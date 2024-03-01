/// <reference types="types/@girs/gobject-2.0/gobject-2.0-ambient.js" />
/// <reference types="types/@girs/gtk-3.0/types/@girs/gobject-2.0/gobject-2.0-ambient.js" />
/// <reference types="types/@girs/gtk-3.0/types/@girs/harfbuzz-0.0/types/@girs/gobject-2.0/gobject-2.0-ambient.js" />
import GObject from 'gi://GObject';
import { PspecFlag, PspecType } from './utils/gobject.js';
export type OnlyString<S extends string | unknown> = S extends string ? S : never;
export type Props<T> = Omit<Pick<T, {
    [K in keyof T]: T[K] extends (...args: any[]) => any ? never : OnlyString<K>;
}[keyof T]>, 'g_type_instance'>;
export type BindableProps<T> = {
    [K in keyof T]: Binding<any, any, NonNullable<T[K]>> | T[K];
};
export declare class Binding<Emitter extends GObject.Object, Prop extends keyof Props<Emitter>, Return = Emitter[Prop]> {
    emitter: Emitter;
    prop: Prop;
    transformFn: (v: any) => any;
    constructor(emitter: Emitter, prop: Prop);
    transform<T>(fn: (v: Return) => T): Binding<Emitter, Prop, T>;
}
interface Services {
    applications: typeof import('./service/applications.js').default;
    audio: typeof import('./service/audio.js').default;
    battery: typeof import('./service/battery.js').default;
    bluetooth: typeof import('./service/bluetooth.js').default;
    hyprland: typeof import('./service/hyprland.js').default;
    mpris: typeof import('./service/mpris.js').default;
    network: typeof import('./service/network.js').default;
    notifications: typeof import('./service/notifications.js').default;
    powerprofiles: typeof import('./service/powerprofiles.js').default;
    systemtray: typeof import('./service/systemtray.js').default;
    greetd: typeof import('./service/greetd.js').default;
}
export default class Service extends GObject.Object {
    static import<S extends keyof Services>(service: S): Promise<Services[S]>;
    static pspec(name: string, type?: PspecType, handle?: PspecFlag): GObject.ParamSpecString | GObject.ParamSpecInt64 | GObject.ParamSpecFloat | GObject.ParamSpecDouble | GObject.ParamSpecBoolean | GObject.ParamSpecObject | GObject.ParamSpecBoxed;
    static register(service: new (...args: any[]) => GObject.Object, signals?: {
        [signal: string]: PspecType[];
    }, properties?: {
        [prop: string]: [type?: PspecType, handle?: PspecFlag];
    }): void;
    connect(signal: string | undefined, callback: (_: this, ...args: any[]) => void): number;
    updateProperty(prop: string, value: unknown): void;
    changed(property: string): void;
    bind<Prop extends keyof Props<this>>(prop: Prop): Binding<this, Prop, this[Prop]>;
}
export {};
