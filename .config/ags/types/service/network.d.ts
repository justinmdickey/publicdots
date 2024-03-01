/// <reference types="types/@girs/nm-1.0/nm-1.0-ambient.js" />
import NM from 'gi://NM';
import Service from '../service.js';
export declare class Wifi extends Service {
    private _client;
    private _device;
    private _ap;
    private _apBind;
    constructor(client: NM.Client, device: NM.DeviceWifi);
    readonly scan: () => void;
    private _activeAp;
    get access_points(): {
        bssid: string | null;
        address: string | null;
        lastSeen: number;
        ssid: string | null;
        active: boolean;
        strength: number;
        iconName: string | undefined;
    }[];
    get enabled(): boolean;
    set enabled(v: boolean);
    get strength(): number;
    get internet(): "connecting" | "connected" | "disconnected";
    get ssid(): string | null;
    get state(): "failed" | "disconnected" | "unmanaged" | "unavailable" | "prepare" | "config" | "need_auth" | "ip_config" | "ip_check" | "secondaries" | "activated" | "deactivating" | "unknown";
    get icon_name(): string;
}
export declare class Wired extends Service {
    private _device;
    constructor(device: NM.DeviceEthernet);
    get speed(): number;
    get internet(): "connecting" | "connected" | "disconnected";
    get state(): "failed" | "disconnected" | "unmanaged" | "unavailable" | "prepare" | "config" | "need_auth" | "ip_config" | "ip_check" | "secondaries" | "activated" | "deactivating" | "unknown";
    get icon_name(): "network-wired-acquiring-symbolic" | "network-wired-symbolic" | "network-wired-no-route-symbolic" | "network-wired-disconnected-symbolic";
}
export declare class Network extends Service {
    private _client;
    wifi: Wifi;
    wired: Wired;
    primary: null | 'wifi' | 'wired';
    connectivity: string;
    constructor();
    readonly toggleWifi: () => void;
    private _getDevice;
    private _clientReady;
    private _sync;
}
declare const network: Network;
export default network;
