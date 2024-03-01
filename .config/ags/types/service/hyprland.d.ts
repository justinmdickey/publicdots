import Service from '../service.js';
export declare class ActiveClient extends Service {
    private _address;
    private _title;
    private _class;
    get address(): string;
    get title(): string;
    get class(): string;
}
export declare class ActiveID extends Service {
    private _id;
    private _name;
    get id(): number;
    get name(): string;
    update(id: number, name: string): void;
}
export declare class Actives extends Service {
    private _client;
    private _monitor;
    private _workspace;
    constructor();
    get client(): ActiveClient;
    get monitor(): ActiveID;
    get workspace(): ActiveID;
}
export declare class Hyprland extends Service {
    private _active;
    private _monitors;
    private _workspaces;
    private _clients;
    private _decoder;
    private _encoder;
    get active(): Actives;
    get monitors(): Monitor[];
    get workspaces(): Workspace[];
    get clients(): Client[];
    readonly getMonitor: (id: number) => Monitor | undefined;
    readonly getWorkspace: (id: number) => Workspace | undefined;
    readonly getClient: (address: string) => Client | undefined;
    constructor();
    private _watchSocket;
    readonly sendMessage: (cmd: string) => Promise<string>;
    private _syncMonitors;
    private _syncWorkspaces;
    private _syncClients;
    private _onEvent;
}
export interface Monitor {
    id: number;
    name: string;
    description: string;
    make: string;
    model: string;
    serial: string;
    width: number;
    height: number;
    refreshRate: number;
    x: number;
    y: number;
    activeWorkspace: {
        id: number;
        name: string;
    };
    specialWorkspace: {
        id: number;
        name: string;
    };
    reserved: [
        number,
        number,
        number,
        number
    ];
    scale: number;
    transform: number;
    focused: boolean;
    dpmsStatus: boolean;
    vrr: boolean;
    activelyTearing: boolean;
}
export interface Workspace {
    id: number;
    name: string;
    monitor: string;
    monitorID: number;
    windows: number;
    hasfullscreen: boolean;
    lastwindow: string;
    lastwindowtitle: string;
}
export interface Client {
    address: string;
    mapped: boolean;
    hidden: boolean;
    at: [number, number];
    size: [number, number];
    workspace: {
        id: number;
        name: string;
    };
    floating: boolean;
    monitor: number;
    class: string;
    title: string;
    initialClass: string;
    initialTitle: string;
    pid: number;
    xwayland: boolean;
    pinned: boolean;
    fullscreen: boolean;
    fullscreenMode: number;
    fakeFullscreen: boolean;
    grouped: [string];
    swallowing: string;
    focusHistoryID: number;
}
export declare const hyprland: Hyprland;
export default hyprland;
