
import Notify07 from '@girs/notify-0.7';

declare global {
    export interface GjsGiImports {
        Notify: typeof Notify07;
    }
}

export default GjsGiImports;


