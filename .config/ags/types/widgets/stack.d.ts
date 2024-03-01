/// <reference types="types/@girs/dbusmenugtk3-0.4/types/@girs/gtk-3.0/gtk-3.0-ambient.js" />
/// <reference types="types/@girs/gtk-3.0/gtk-3.0-ambient.js" />
import { type BaseProps, type Widget } from './widget.js';
import Gtk from 'gi://Gtk?version=3.0';
declare const TRANSITION: {
    readonly none: Gtk.StackTransitionType.NONE;
    readonly crossfade: Gtk.StackTransitionType.CROSSFADE;
    readonly slide_right: Gtk.StackTransitionType.SLIDE_RIGHT;
    readonly slide_left: Gtk.StackTransitionType.SLIDE_LEFT;
    readonly slide_up: Gtk.StackTransitionType.SLIDE_UP;
    readonly slide_down: Gtk.StackTransitionType.SLIDE_DOWN;
    readonly slide_left_right: Gtk.StackTransitionType.SLIDE_LEFT_RIGHT;
    readonly slide_up_down: Gtk.StackTransitionType.SLIDE_UP_DOWN;
    readonly over_up: Gtk.StackTransitionType.OVER_UP;
    readonly over_down: Gtk.StackTransitionType.OVER_DOWN;
    readonly over_left: Gtk.StackTransitionType.OVER_LEFT;
    readonly over_right: Gtk.StackTransitionType.OVER_RIGHT;
    readonly under_up: Gtk.StackTransitionType.UNDER_UP;
    readonly under_down: Gtk.StackTransitionType.UNDER_DOWN;
    readonly under_left: Gtk.StackTransitionType.UNDER_LEFT;
    readonly under_right: Gtk.StackTransitionType.UNDER_RIGHT;
    readonly over_up_down: Gtk.StackTransitionType.OVER_UP_DOWN;
    readonly over_down_up: Gtk.StackTransitionType.OVER_DOWN_UP;
    readonly over_left_right: Gtk.StackTransitionType.OVER_LEFT_RIGHT;
    readonly over_right_left: Gtk.StackTransitionType.OVER_RIGHT_LEFT;
};
type Transition = keyof typeof TRANSITION;
export type StackProps<Children extends {
    [name: string]: Gtk.Widget;
} = {
    [name: string]: Gtk.Widget;
}, Attr = unknown, Self = Stack<Children, Attr>> = BaseProps<Self, Gtk.Stack.ConstructorProperties & {
    shown?: keyof Children;
    transition?: Transition;
    children?: Children;
    items?: [string, Gtk.Widget][];
}, Attr>;
export interface Stack<Children, Attr> extends Widget<Attr> {
}
export declare class Stack<Children extends {
    [name: string]: Gtk.Widget;
}, Attr> extends Gtk.Stack {
    constructor(props?: StackProps<Children, Attr>, children?: Children);
    get children(): Children;
    set children(children: Children);
    get items(): Array<[string, Gtk.Widget]>;
    set items(items: Array<[string, Gtk.Widget]>);
    get transition(): Transition;
    set transition(transition: Transition);
    get shown(): keyof Children;
    set shown(name: keyof Children);
}
export default Stack;
