import Service from '../service.js';
type Response = {
    type: 'success';
} | {
    type: 'error';
    error_type: 'auth_error' | 'error';
    description: string;
} | {
    type: 'auth_message';
    auth_message_type: 'visible' | 'secret' | 'info' | 'error';
    auth_message: string;
};
export declare class Greetd extends Service {
    private _decoder;
    readonly login: (username: string, password: string, cmd: string[] | string, env?: string[]) => Promise<void>;
    readonly createSession: (username: string) => Promise<Response>;
    readonly postAuth: (response?: string) => Promise<Response>;
    readonly startSession: (cmd: string[] | string, env?: string[]) => Promise<Response>;
    readonly cancelSession: () => Promise<Response>;
    private _send;
}
export declare const greetd: Greetd;
export default greetd;
