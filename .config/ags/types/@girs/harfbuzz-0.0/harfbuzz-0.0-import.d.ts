
import HarfBuzz00 from '@girs/harfbuzz-0.0';

declare global {
    export interface GjsGiImports {
        HarfBuzz: typeof HarfBuzz00;
    }
}

export default GjsGiImports;


