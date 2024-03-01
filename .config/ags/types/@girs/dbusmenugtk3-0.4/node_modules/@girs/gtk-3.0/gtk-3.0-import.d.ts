
import Gtk30 from '@girs/gtk-3.0';

declare global {
    export interface GjsGiImports {
        Gtk: typeof Gtk30;
    }
}

export default GjsGiImports;


