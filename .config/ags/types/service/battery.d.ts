import Service from '../service.js';
export declare class Battery extends Service {
    private _proxy;
    private _available;
    private _percent;
    private _charging;
    private _charged;
    private _iconName;
    private _timeRemaining;
    private _energy;
    private _energyFull;
    private _energyRate;
    get available(): boolean;
    get percent(): number;
    get charging(): boolean;
    get charged(): boolean;
    get icon_name(): string;
    get time_remaining(): number;
    get energy(): number;
    get energy_full(): number;
    get energy_rate(): number;
    constructor();
    private _sync;
}
export declare const battery: Battery;
export default battery;
