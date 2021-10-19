### Native Lib

The lib exposes the native things that are not accessible in redscript by default.

### Base Lib

Prototype of the lib for redscript.

#### Features

- Hashing
  * CRC32L (Used by TweakDB)
  * FNV1a64 (Experimental)
- Global registry
  * Store and retrieve objects by name
  * Access game instance anywhere
- UI: Custom widgets
  * Create composite widgets with logic
- UI: Buttons
- UI: Button hints
- UI: Popups
- UI: Resolution watcher
  * Apply scaling to widgets
  * Make adaptive layouts
- Localization [WIP]
- Delay System
  * Schedule events for UI controllers

#### Usage

The lib can be used in two ways: as a shared or internal lib. 

##### Shared Lib

You can add the lib as a dependency.

##### Internal Lib

You can include a full or partial copy of the lib with only features you need in your mod. 

To prevent conflicts with other mods and / or shared lib, you must give your copy a unique namespace.
For example, you can simply add your mod's namespace: `BaseLib` → `MyMod.BaseLib`. 

### Ink Playground

Mod to help understand how to build a UI from code. 
This entire widget is 100% built from scratch using redscript.
There are no repurposed original UI controllers.

To open the Ink Playground popup you have to hold `R` when on foot (same key as for reload or radio). 
To close the popup press `ESC` or `C` key.
