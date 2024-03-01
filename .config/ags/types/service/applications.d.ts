/// <reference types="types/@girs/gio-2.0/gio-2.0-ambient.js" />
/// <reference types="types/@girs/gtk-3.0/types/@girs/gio-2.0/gio-2.0-ambient.js" />
/// <reference types="types/@girs/nm-1.0/types/@girs/gio-2.0/gio-2.0-ambient.js" />
import Gio from 'gi://Gio';
import Service from '../service.js';
export declare class Application extends Service {
    private _app;
    private _frequency;
    get app(): Gio.DesktopAppInfo;
    get frequency(): number;
    set frequency(value: number);
    get name(): string;
    get desktop(): string | null;
    get description(): string | null;
    get wm_class(): string | null;
    get executable(): string;
    get icon_name(): string | null;
    constructor(app: Gio.DesktopAppInfo, frequency?: number);
    private _match;
    readonly getKey: (key: string) => string | null;
    readonly match: (term: string) => boolean;
    readonly launch: () => void;
}
export declare class Applications extends Service {
    private _list;
    private _frequents;
    readonly query: (term: string) => Application[];
    constructor();
    get list(): Application[];
    get frequents(): {
        [app: string]: number;
    };
    private _launched;
    readonly reload: () => void;
}
export declare const applications: Applications;
export default applications;
