pragma Singleton
import QtQuick

QtObject {{
    // Pywal colors
    readonly property color background: "{color0}"
    readonly property color backgroundLight: "{color8}"
    
    // Accent colors
    readonly property color accent: "{color4}"
    readonly property color accentHover: "{color12}"
    
    // Text colors
    readonly property color text: "{foreground}"
    readonly property color textDim: "{color7}"
    
    // Status colors
    readonly property color success: "{color2}"
    readonly property color warning: "{color3}"
    readonly property color error: "{color1}"
    
    // Workspace colors
    readonly property color workspaceActive: "{color4}"
    readonly property color workspaceOccupied: "{color8}"
    readonly property color workspaceEmpty: "{color0}"
    
    // Opacity
    readonly property real panelOpacity: 1.0
    readonly property real hoverOpacity: 0.8
}}
