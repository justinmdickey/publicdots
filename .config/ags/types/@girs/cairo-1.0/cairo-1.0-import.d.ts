
import Cairo10 from '@girs/cairo-1.0';

declare global {
    export interface GjsGiImports {
        cairo: typeof Cairo10;
    }
}

export default GjsGiImports;


