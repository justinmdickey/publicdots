
/*
 * Type Definitions for Gjs (https://gjs.guide/)
 *
 * These type definitions are automatically generated, do not edit them by hand.
 * If you found a bug fix it in `ts-for-gir` or create a bug report on https://github.com/gjsify/ts-for-gir
 */

import './xlib-2.0-ambient.d.ts';
import './xlib-2.0-import.d.ts';
/**
 * xlib-2.0
 */

import type GObject from '@girs/gobject-2.0';

export function open_display(): void
export interface Display {
}

export class Display {

    // Own properties of xlib-2.0.xlib.Display

    static name: string
}

export interface Screen {
}

export class Screen {

    // Own properties of xlib-2.0.xlib.Screen

    static name: string
}

export interface Visual {
}

export class Visual {

    // Own properties of xlib-2.0.xlib.Visual

    static name: string
}

export interface XConfigureEvent {
}

export class XConfigureEvent {

    // Own properties of xlib-2.0.xlib.XConfigureEvent

    static name: string
}

export interface XImage {
}

export class XImage {

    // Own properties of xlib-2.0.xlib.XImage

    static name: string
}

export interface XFontStruct {
}

export class XFontStruct {

    // Own properties of xlib-2.0.xlib.XFontStruct

    static name: string
}

export interface XTrapezoid {
}

export class XTrapezoid {

    // Own properties of xlib-2.0.xlib.XTrapezoid

    static name: string
}

export interface XVisualInfo {
}

export class XVisualInfo {

    // Own properties of xlib-2.0.xlib.XVisualInfo

    static name: string
}

export interface XWindowAttributes {
}

export class XWindowAttributes {

    // Own properties of xlib-2.0.xlib.XWindowAttributes

    static name: string
}

export interface XEvent {
}

export class XEvent {

    // Own properties of xlib-2.0.xlib.XEvent

    static name: string
}

    export type Atom = number
    export type Colormap = number
    export type Cursor = number
    export type Drawable = number
    export type GC = any
    export type KeyCode = number
    export type KeySym = number
    export type Picture = number
    export type Time = number
    export type VisualID = number
    export type Window = number
    export type XID = number
    export type Pixmap = number
/**
 * Name of the imported GIR library
 * @see https://gitlab.gnome.org/GNOME/gjs/-/blob/master/gi/ns.cpp#L188
 */
export const __name__: string
/**
 * Version of the imported GIR library
 * @see https://gitlab.gnome.org/GNOME/gjs/-/blob/master/gi/ns.cpp#L189
 */
export const __version__: string
// END