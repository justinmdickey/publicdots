import Service from '../service.js';
declare class PowerProfiles extends Service {
    private _proxy;
    private _unpackDict;
    constructor();
    get active_profile(): string;
    set active_profile(profile: string);
    get performance_inhibited(): string;
    get performance_degraded(): string;
    get profiles(): {}[];
    get actions(): [string];
    get active_profile_holds(): {}[];
    get icon_name(): string;
}
declare const service: PowerProfiles;
export default service;
