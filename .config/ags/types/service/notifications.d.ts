/// <reference types="types/@girs/glib-2.0/glib-2.0-ambient.js" />
/// <reference types="types/@girs/gtk-3.0/types/@girs/glib-2.0/glib-2.0-ambient.js" />
/// <reference types="types/@girs/gtk-3.0/types/@girs/harfbuzz-0.0/types/@girs/glib-2.0/glib-2.0-ambient.js" />
import GLib from 'gi://GLib';
import Service from '../service.js';
export interface Action {
    id: string;
    label: string;
}
export interface Hints {
    'action-icons'?: GLib.Variant;
    'category'?: GLib.Variant;
    'desktop-entry'?: GLib.Variant;
    'image-data'?: GLib.Variant;
    'image-path'?: GLib.Variant;
    'resident'?: GLib.Variant;
    'sound-file'?: GLib.Variant;
    'sound-name'?: GLib.Variant;
    'suppress-sound'?: GLib.Variant;
    'transient'?: GLib.Variant;
    'urgency'?: GLib.Variant;
    'x'?: GLib.Variant;
    'y'?: GLib.Variant;
    [hint: string]: GLib.Variant | undefined;
}
interface NotifcationJson {
    id: number;
    appName: string;
    appIcon: string;
    summary: string;
    body: string;
    actions: Action[];
    urgency: Urgency;
    time: number;
    image?: string;
    appEntry?: string;
    actionIcons?: boolean;
    category?: string;
    resident?: boolean;
    soundFile?: string;
    soundName?: string;
    suppressSound?: boolean;
    transient?: boolean;
    x?: number;
    y?: number;
}
export type Urgency = 'low' | 'critical' | 'normal';
export declare class Notification extends Service {
    private _actionIcons?;
    private _actions;
    private _appEntry?;
    private _appIcon;
    private _appName;
    private _body;
    private _category?;
    private _id;
    private _image?;
    private _popup;
    private _resident?;
    private _soundFile?;
    private _soundName?;
    private _summary;
    private _suppressSound?;
    private _time;
    private _timeout;
    private _transient?;
    private _urgency;
    private _x?;
    private _y?;
    private _hints;
    get action_icons(): boolean | undefined;
    get actions(): Action[];
    get app_entry(): string | undefined;
    get app_icon(): string;
    get app_name(): string;
    get body(): string;
    get category(): string | undefined;
    get id(): number;
    get image(): string | undefined;
    get popup(): boolean;
    get resident(): boolean | undefined;
    get sound_file(): string | undefined;
    get sound_name(): string | undefined;
    get summary(): string;
    get suppress_sound(): boolean | undefined;
    get time(): number;
    get timeout(): number;
    get transient(): boolean | undefined;
    get urgency(): Urgency;
    get x(): number | undefined;
    get y(): number | undefined;
    get hints(): Hints;
    constructor(appName: string, id: number, appIcon: string, summary: string, body: string, acts: string[], hints: Hints, popup: boolean);
    readonly dismiss: () => void;
    readonly close: () => void;
    readonly invoke: (id: string) => void;
    toJson(cacheActions?: boolean): NotifcationJson;
    static fromJson(json: NotifcationJson): Notification;
    private _appIconImage;
    private _parseImageData;
}
export declare class Notifications extends Service {
    popupTimeout: number;
    forceTimeout: boolean;
    cacheActions: boolean;
    private _dbus;
    private _notifications;
    private _dnd;
    private _idCount;
    constructor();
    get dnd(): boolean;
    set dnd(value: boolean);
    get notifications(): Notification[];
    get popups(): Notification[];
    readonly getPopup: (id: number) => Notification | null;
    readonly getNotification: (id: number) => Notification | undefined;
    Notify(appName: string, replacesId: number, appIcon: string, summary: string, body: string, acts: string[], hints: Hints, expiration: number): number;
    Clear(): void;
    DismissNotification(id: number): void;
    CloseNotification(id: number): void;
    InvokeAction(id: number, actionId: string): void;
    GetCapabilities(): string[];
    GetServerInformation(): GLib.Variant;
    readonly clear: () => void;
    private _addNotification;
    private _onDismissed;
    private _onClosed;
    private _onInvoked;
    private _register;
    private _readFromFile;
    private _cache;
}
export declare const notifications: Notifications;
export default notifications;
