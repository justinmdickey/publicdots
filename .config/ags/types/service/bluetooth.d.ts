import GnomeBluetooth from 'gi://GnomeBluetooth?version=3.0';
import Service from '../service.js';
export declare class BluetoothDevice extends Service {
    private _device;
    private _ids;
    private _connecting;
    get device(): GnomeBluetooth.Device;
    constructor(device: GnomeBluetooth.Device);
    close(): void;
    get address(): any;
    get alias(): any;
    get battery_level(): any;
    get battery_percentage(): any;
    get connected(): any;
    get icon_name(): any;
    get name(): any;
    get paired(): any;
    get trusted(): any;
    get type(): any;
    get connecting(): boolean;
    readonly setConnection: (connect: boolean) => void;
}
export declare class Bluetooth extends Service {
    private _client;
    private _devices;
    constructor();
    readonly toggle: () => void;
    private _getDevices;
    private _deviceAdded;
    private _deviceRemoved;
    readonly connectDevice: (device: BluetoothDevice, connect: boolean, callback: (s: boolean) => void) => void;
    readonly getDevice: (address: string) => BluetoothDevice | undefined;
    set enabled(v: boolean);
    get enabled(): boolean;
    get state(): string;
    get devices(): BluetoothDevice[];
    get connected_devices(): BluetoothDevice[];
}
export declare const bluetooth: Bluetooth;
export default bluetooth;
