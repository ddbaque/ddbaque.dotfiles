# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a WezTerm configuration repository containing a single Lua configuration file that customizes the WezTerm terminal emulator. The configuration is part of a larger dotfiles collection.

## Architecture

The configuration is entirely contained in `wezterm.lua` and follows this structure:

- **Core Configuration**: Basic settings like default shell, color scheme, font, and window properties
- **Visual Customization**: Custom color scheme with purple/violet theme, opacity settings, and tab bar styling
- **Key Bindings**: Tmux-style leader key (Ctrl+A) with vim-like navigation bindings
- **Key Tables**: Modal key tables for pane resizing and tab movement
- **Status Bar**: Custom status bar showing workspace, current directory, running command, time, IP address, and battery status

## Key Components

### Configuration Structure
- Uses `wezterm.config_builder()` when available for better error handling
- Modular organization with sections for settings, key bindings, colors, and status bar

### Leader Key System
- Leader key: `Ctrl+A` (tmux-style)
- Pane management: splitting, navigation, resizing, closing
- Tab management: creation, navigation, renaming, moving
- Workspace management

### Custom Color Scheme
- Purple/violet theme with custom ANSI colors
- Dynamic battery indicator colors based on charge level
- Tab bar styling with active/inactive states

### Status Bar Features
- Left status: Shows current workspace or active key table
- Right status: Current directory, running command, time, IP address, battery status
- Real-time updates every second

## Development Notes

- This is a configuration file, not a development project - no build/test/lint commands
- Changes can be tested by reloading WezTerm configuration
- The configuration uses WezTerm's Lua API extensively
- Font fallback system with Nerd Font support for icons

## Troubleshooting

### Known Issues
- Encountered an error related to pane ID not found during status bar update
  - Error occurred in `/home/ddbaque/.config/wezterm/wezterm.lua`
  - Potentially related to git branch detection or status bar rendering
- Intermittent git command failures when trying to retrieve current git branch
  - Some git commands return empty results
  - Might require additional error handling in the Lua configuration