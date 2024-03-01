/// <reference types="types/@girs/dbusmenugtk3-0.4/types/@girs/gtk-3.0/gtk-3.0-ambient.js" />
/// <reference types="types/@girs/gtk-3.0/gtk-3.0-ambient.js" />
/**
 * I wish there was a better way to do this, but I couldn't figure out
 * how to write a generic function that could genereate theese
 */
import Gtk from 'gi://Gtk?version=3.0';
import { type BaseProps, type Widget } from './widget.js';
export type CalendarProps<Attr> = BaseProps<Calendar<Attr>, Gtk.Calendar.ConstructorProperties, Attr>;
export interface Calendar<Attr> extends Widget<Attr> {
}
export declare class Calendar<Attr> extends Gtk.Calendar {
    constructor(props?: BaseProps<Calendar<Attr>, Gtk.Calendar.ConstructorProperties, Attr>);
}
export type ColorButtonProps<Attr> = BaseProps<ColorButton<Attr>, Gtk.ColorButton.ConstructorProperties, Attr>;
export interface ColorButton<Attr> extends Widget<Attr> {
}
export declare class ColorButton<Attr> extends Gtk.ColorButton {
    constructor(props?: BaseProps<ColorButton<Attr>, Gtk.ColorButton.ConstructorProperties, Attr>);
}
export type DrawingAreaProps<Attr> = BaseProps<DrawingArea<Attr>, Gtk.DrawingArea.ConstructorProperties, Attr>;
export interface DrawingArea<Attr> extends Widget<Attr> {
}
export declare class DrawingArea<Attr> extends Gtk.DrawingArea {
    constructor(props?: BaseProps<DrawingArea<Attr>, Gtk.DrawingArea.ConstructorProperties, Attr>);
}
export type FileChooserButtonProps<Attr> = BaseProps<FileChooserButton<Attr>, Gtk.FileChooserButton.ConstructorProperties, Attr>;
export interface FileChooserButton<Attr> extends Widget<Attr> {
}
export declare class FileChooserButton<Attr> extends Gtk.FileChooserButton {
    constructor(props?: BaseProps<FileChooserButton<Attr>, Gtk.FileChooserButton.ConstructorProperties, Attr>);
}
export type FixedProps<Attr> = BaseProps<Fixed<Attr>, Gtk.Fixed.ConstructorProperties, Attr>;
export interface Fixed<Attr> extends Widget<Attr> {
}
export declare class Fixed<Attr> extends Gtk.Fixed {
    constructor(props?: BaseProps<Fixed<Attr>, Gtk.Fixed.ConstructorProperties, Attr>);
}
export type FlowBoxProps<Attr> = BaseProps<FlowBox<Attr>, Gtk.FlowBox.ConstructorProperties, Attr>;
export interface FlowBox<Attr> extends Widget<Attr> {
}
export declare class FlowBox<Attr> extends Gtk.FlowBox {
    constructor(props?: BaseProps<FlowBox<Attr>, Gtk.FlowBox.ConstructorProperties, Attr>);
}
export type FontButtonProps<Attr> = BaseProps<FontButton<Attr>, Gtk.FontButton.ConstructorProperties, Attr>;
export interface FontButton<Attr> extends Widget<Attr> {
}
export declare class FontButton<Attr> extends Gtk.FontButton {
    constructor(props?: BaseProps<FontButton<Attr>, Gtk.FontButton.ConstructorProperties, Attr>);
}
export type LevelBarProps<Attr> = BaseProps<LevelBar<Attr>, Gtk.LevelBar.ConstructorProperties, Attr>;
export interface LevelBar<Attr> extends Widget<Attr> {
}
export declare class LevelBar<Attr> extends Gtk.LevelBar {
    constructor(props?: BaseProps<LevelBar<Attr>, Gtk.LevelBar.ConstructorProperties, Attr>);
}
export type ListBoxProps<Attr> = BaseProps<ListBox<Attr>, Gtk.ListBox.ConstructorProperties, Attr>;
export interface ListBox<Attr> extends Widget<Attr> {
}
export declare class ListBox<Attr> extends Gtk.ListBox {
    constructor(props?: BaseProps<ListBox<Attr>, Gtk.ListBox.ConstructorProperties, Attr>);
}
export type MenuBarProps<Attr> = BaseProps<MenuBar<Attr>, Gtk.MenuBar.ConstructorProperties, Attr>;
export interface MenuBar<Attr> extends Widget<Attr> {
}
export declare class MenuBar<Attr> extends Gtk.MenuBar {
    constructor(props?: BaseProps<MenuBar<Attr>, Gtk.MenuBar.ConstructorProperties, Attr>);
}
export type SeparatorProps<Attr> = BaseProps<Separator<Attr>, Gtk.Separator.ConstructorProperties, Attr>;
export interface Separator<Attr> extends Widget<Attr> {
}
export declare class Separator<Attr> extends Gtk.Separator {
    constructor(props?: BaseProps<Separator<Attr>, Gtk.Separator.ConstructorProperties, Attr>);
}
export type SpinButtonProps<Attr> = BaseProps<SpinButton<Attr>, Gtk.SpinButton.ConstructorProperties, Attr>;
export interface SpinButton<Attr> extends Widget<Attr> {
}
export declare class SpinButton<Attr> extends Gtk.SpinButton {
    constructor(props?: BaseProps<SpinButton<Attr>, Gtk.SpinButton.ConstructorProperties, Attr>);
}
export type SpinnerProps<Attr> = BaseProps<Spinner<Attr>, Gtk.Spinner.ConstructorProperties, Attr>;
export interface Spinner<Attr> extends Widget<Attr> {
}
export declare class Spinner<Attr> extends Gtk.Spinner {
    constructor(props?: BaseProps<Spinner<Attr>, Gtk.Spinner.ConstructorProperties, Attr>);
}
export type SwitchProps<Attr> = BaseProps<Switch<Attr>, Gtk.Switch.ConstructorProperties, Attr>;
export interface Switch<Attr> extends Widget<Attr> {
}
export declare class Switch<Attr> extends Gtk.Switch {
    constructor(props?: BaseProps<Switch<Attr>, Gtk.Switch.ConstructorProperties, Attr>);
}
export interface ToggleButton<Child, Attr> extends Widget<Attr> {
}
export type ToggleButtonProps<Child extends Gtk.Widget, Attr> = BaseProps<ToggleButton<Child, Attr>, Gtk.ToggleButton.ConstructorProperties & {
    child?: Child;
}, Attr>;
export declare class ToggleButton<Child extends Gtk.Widget, Attr> extends Gtk.ToggleButton {
    constructor(props?: BaseProps<ToggleButton<Child, Attr>, Gtk.ToggleButton.ConstructorProperties, Attr>, child?: Child);
}
