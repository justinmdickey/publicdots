declare function print(...args: any[]): void;
declare const Widget: typeof import('./widget').default
declare const Service: typeof import('./service').default
declare const Variable: typeof import('./variable').default
declare const Utils: typeof import('./utils').default
declare const App: typeof import('./app').default

declare module 'resource:///com/github/Aylur/ags/app.js' {
    const exports: typeof import('./app')
    export = exports
}
declare module 'resource:///com/github/Aylur/ags/overrides.js' {
    const exports: typeof import('./overrides')
    export = exports
}
declare module 'resource:///com/github/Aylur/ags/service.js' {
    const exports: typeof import('./service')
    export = exports
}
declare module 'resource:///com/github/Aylur/ags/utils.js' {
    const exports: typeof import('./utils')
    export = exports
}
declare module 'resource:///com/github/Aylur/ags/variable.js' {
    const exports: typeof import('./variable')
    export = exports
}
declare module 'resource:///com/github/Aylur/ags/widget.js' {
    const exports: typeof import('./widget')
    export = exports
}
declare module 'resource:///com/github/Aylur/ags/service/applications.js' {
    const exports: typeof import('./service/applications')
    export = exports
}
declare module 'resource:///com/github/Aylur/ags/service/audio.js' {
    const exports: typeof import('./service/audio')
    export = exports
}
declare module 'resource:///com/github/Aylur/ags/service/battery.js' {
    const exports: typeof import('./service/battery')
    export = exports
}
declare module 'resource:///com/github/Aylur/ags/service/bluetooth.js' {
    const exports: typeof import('./service/bluetooth')
    export = exports
}
declare module 'resource:///com/github/Aylur/ags/service/greetd.js' {
    const exports: typeof import('./service/greetd')
    export = exports
}
declare module 'resource:///com/github/Aylur/ags/service/hyprland.js' {
    const exports: typeof import('./service/hyprland')
    export = exports
}
declare module 'resource:///com/github/Aylur/ags/service/mpris.js' {
    const exports: typeof import('./service/mpris')
    export = exports
}
declare module 'resource:///com/github/Aylur/ags/service/network.js' {
    const exports: typeof import('./service/network')
    export = exports
}
declare module 'resource:///com/github/Aylur/ags/service/notifications.js' {
    const exports: typeof import('./service/notifications')
    export = exports
}
declare module 'resource:///com/github/Aylur/ags/service/powerprofiles.js' {
    const exports: typeof import('./service/powerprofiles')
    export = exports
}
declare module 'resource:///com/github/Aylur/ags/service/systemtray.js' {
    const exports: typeof import('./service/systemtray')
    export = exports
}
declare module 'resource:///com/github/Aylur/ags/widgets/box.js' {
    const exports: typeof import('./widgets/box')
    export = exports
}
declare module 'resource:///com/github/Aylur/ags/widgets/button.js' {
    const exports: typeof import('./widgets/button')
    export = exports
}
declare module 'resource:///com/github/Aylur/ags/widgets/centerbox.js' {
    const exports: typeof import('./widgets/centerbox')
    export = exports
}
declare module 'resource:///com/github/Aylur/ags/widgets/circularprogress.js' {
    const exports: typeof import('./widgets/circularprogress')
    export = exports
}
declare module 'resource:///com/github/Aylur/ags/widgets/entry.js' {
    const exports: typeof import('./widgets/entry')
    export = exports
}
declare module 'resource:///com/github/Aylur/ags/widgets/etc.js' {
    const exports: typeof import('./widgets/etc')
    export = exports
}
declare module 'resource:///com/github/Aylur/ags/widgets/eventbox.js' {
    const exports: typeof import('./widgets/eventbox')
    export = exports
}
declare module 'resource:///com/github/Aylur/ags/widgets/icon.js' {
    const exports: typeof import('./widgets/icon')
    export = exports
}
declare module 'resource:///com/github/Aylur/ags/widgets/label.js' {
    const exports: typeof import('./widgets/label')
    export = exports
}
declare module 'resource:///com/github/Aylur/ags/widgets/menu.js' {
    const exports: typeof import('./widgets/menu')
    export = exports
}
declare module 'resource:///com/github/Aylur/ags/widgets/overlay.js' {
    const exports: typeof import('./widgets/overlay')
    export = exports
}
declare module 'resource:///com/github/Aylur/ags/widgets/progressbar.js' {
    const exports: typeof import('./widgets/progressbar')
    export = exports
}
declare module 'resource:///com/github/Aylur/ags/widgets/revealer.js' {
    const exports: typeof import('./widgets/revealer')
    export = exports
}
declare module 'resource:///com/github/Aylur/ags/widgets/scrollable.js' {
    const exports: typeof import('./widgets/scrollable')
    export = exports
}
declare module 'resource:///com/github/Aylur/ags/widgets/slider.js' {
    const exports: typeof import('./widgets/slider')
    export = exports
}
declare module 'resource:///com/github/Aylur/ags/widgets/stack.js' {
    const exports: typeof import('./widgets/stack')
    export = exports
}
declare module 'resource:///com/github/Aylur/ags/widgets/widget.js' {
    const exports: typeof import('./widgets/widget')
    export = exports
}
declare module 'resource:///com/github/Aylur/ags/widgets/window.js' {
    const exports: typeof import('./widgets/window')
    export = exports
}
declare module 'resource:///com/github/Aylur/ags/utils/etc.js' {
    const exports: typeof import('./utils/etc')
    export = exports
}
declare module 'resource:///com/github/Aylur/ags/utils/exec.js' {
    const exports: typeof import('./utils/exec')
    export = exports
}
declare module 'resource:///com/github/Aylur/ags/utils/fetch.js' {
    const exports: typeof import('./utils/fetch')
    export = exports
}
declare module 'resource:///com/github/Aylur/ags/utils/file.js' {
    const exports: typeof import('./utils/file')
    export = exports
}
declare module 'resource:///com/github/Aylur/ags/utils/gobject.js' {
    const exports: typeof import('./utils/gobject')
    export = exports
}
declare module 'resource:///com/github/Aylur/ags/utils/init.js' {
    const exports: typeof import('./utils/init')
    export = exports
}
declare module 'resource:///com/github/Aylur/ags/utils/notify.js' {
    const exports: typeof import('./utils/notify')
    export = exports
}
declare module 'resource:///com/github/Aylur/ags/utils/pam.js' {
    const exports: typeof import('./utils/pam')
    export = exports
}
declare module 'resource:///com/github/Aylur/ags/utils/timeout.js' {
    const exports: typeof import('./utils/timeout')
    export = exports
}
