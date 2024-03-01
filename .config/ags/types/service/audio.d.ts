/// <reference types="types/@girs/gvc-1.0/gvc-1.0-ambient.js" />
import Service from '../service.js';
import Gvc from 'gi://Gvc';
export declare class Stream extends Service {
    private _stream?;
    private _ids?;
    private _oldVolume;
    readonly setStream: (stream: Gvc.MixerStream | null) => void;
    constructor(stream?: Gvc.MixerStream);
    get application_id(): string | null;
    get stream(): Gvc.MixerStream | null;
    get description(): string | null;
    get icon_name(): string | null;
    get id(): number | null;
    get name(): string | null;
    get state(): string;
    get is_muted(): boolean;
    set is_muted(mute: boolean);
    get volume(): number;
    set volume(value: number);
    readonly close: () => void;
}
export declare class Audio extends Service {
    maxStreamVolume: number;
    private _control;
    private _streams;
    private _streamBindings;
    private _speaker;
    private _microphone;
    constructor();
    get control(): Gvc.MixerControl;
    get speaker(): Stream;
    set speaker(stream: Stream);
    get microphone(): Stream;
    set microphone(stream: Stream);
    get microphones(): Stream[];
    get speakers(): Stream[];
    get apps(): Stream[];
    get recorders(): Stream[];
    readonly getStream: (id: number) => Stream | undefined;
    private _defaultChanged;
    private _streamAdded;
    private _streamRemoved;
    private _getStreams;
    private _notifyStreams;
}
declare const audio: Audio;
export default audio;
