import { type Urgency } from '../service/notifications.js';
type ClosedReason = ReturnType<typeof _CLOSED_REASON>;
export declare const daemon: {
    running: boolean;
};
declare const _CLOSED_REASON: (reason: number) => "timeout" | "dismissed" | "closed" | "unset" | "undefined";
export interface NotificationArgs {
    appName?: string;
    body?: string;
    iconName?: string;
    id?: number;
    summary?: string;
    urgency?: Urgency;
    category?: string;
    actions?: {
        [label: string]: () => void;
    };
    timeout?: number;
    onClosed?: (reason: ClosedReason) => void;
    actionIcons?: boolean;
    desktopEntry?: string;
    image?: string;
    resident?: boolean;
    soundFile?: string;
    soundName?: string;
    suppressSound?: boolean;
    transient?: boolean;
    x?: number;
    y?: number;
}
export declare function notify(args: NotificationArgs): Promise<number>;
export declare function notify(summary: string, body?: string, iconName?: string): Promise<number>;
export {};
