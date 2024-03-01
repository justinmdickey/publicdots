interface Flags {
    busName: string;
    inspector: boolean;
    runJs: string;
    runFile: string;
    toggleWindow: string;
    quit: boolean;
    runPromise: string;
}
export default function (bus: string, path: string, flags: Flags): void;
export {};
