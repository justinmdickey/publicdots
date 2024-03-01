/// <reference types="types/@girs/dbusmenugtk3-0.4/types/@girs/gtk-3.0/gtk-3.0-ambient.js" />
/// <reference types="types/@girs/gtk-3.0/gtk-3.0-ambient.js" />
import Gtk from 'gi://Gtk?version=3.0';
import { type BaseProps, type Widget } from './widget.js';
export type CenterBoxProps<StartWidget extends Gtk.Widget = Gtk.Widget, CenterWidget extends Gtk.Widget = Gtk.Widget, EndWidget extends Gtk.Widget = Gtk.Widget, Attr = unknown, Self = CenterBox<StartWidget, CenterWidget, EndWidget, Attr>> = BaseProps<Self, Gtk.Box.ConstructorProperties & {
    vertical?: boolean;
    children?: [StartWidget?, CenterWidget?, EndWidget?];
    start_widget?: StartWidget;
    center_widget?: CenterWidget;
    end_widget?: EndWidget;
}, Attr>;
export interface CenterBox<StartWidget, CenterWidget, EndWidget, Attr> extends Widget<Attr> {
}
export declare class CenterBox<StartWidget extends Gtk.Widget, CenterWidget extends Gtk.Widget, EndWidget extends Gtk.Widget, Attr> extends Gtk.Box {
    constructor(props?: CenterBoxProps<StartWidget, CenterWidget, EndWidget, Attr>, startWidget?: StartWidget, centerWidget?: CenterWidget, endWidget?: EndWidget);
    get children(): [StartWidget | null, CenterWidget | null, EndWidget | null];
    set children(children: [StartWidget | null, CenterWidget | null, EndWidget | null]);
    get start_widget(): StartWidget | null;
    set start_widget(child: StartWidget | null);
    get end_widget(): EndWidget | null;
    set end_widget(child: EndWidget | null);
    get center_widget(): CenterWidget | null;
    set center_widget(child: CenterWidget | null);
    get vertical(): boolean;
    set vertical(vertical: boolean);
}
export default CenterBox;
