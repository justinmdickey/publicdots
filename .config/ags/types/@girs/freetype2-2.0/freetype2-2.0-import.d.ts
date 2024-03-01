
import Freetype220 from '@girs/freetype2-2.0';

declare global {
    export interface GjsGiImports {
        freetype2: typeof Freetype220;
    }
}

export default GjsGiImports;


