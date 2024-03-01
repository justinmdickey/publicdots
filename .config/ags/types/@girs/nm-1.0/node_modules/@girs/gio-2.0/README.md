
# Gio-2.0

![version](https://img.shields.io/npm/v/@girs/gio-2.0)
![downloads/week](https://img.shields.io/npm/dw/@girs/gio-2.0)


GJS TypeScript type definitions for Gio-2.0, generated from library version 2.76.1 using [ts-for-gir](https://github.com/gjsify/ts-for-gir) v3.2.3.

GIO provides a modern and easy-to-use VFS API. It provides a file system abstraction which allows applications to access local and remote files with a single consistent API.

## Install

To use this type definitions, install them with NPM:
```bash
npm install @girs/gio-2.0
```

## Usage

You can import this package into your project like this:
```ts
import Gio from '@girs/gio-2.0';
```

Or if you prefer CommonJS, you can also use this:
```ts
const Gio = require('@girs/gio-2.0');
```

### Ambient Modules

You can also use [ambient modules](https://github.com/gjsify/ts-for-gir/tree/main/packages/cli#ambient-modules) to import this module like you would do this in JavaScript.
For this you need to include `@girs/gio-2.0` or `@girs/gio-2.0/ambient` in your `tsconfig` or entry point Typescript file:

`index.ts`:
```ts
import '@girs/gio-2.0'
```

`tsconfig.json`:
```json
{
  "compilerOptions": {
    ...
  },
  "include": ["@girs/gio-2.0"],
  ...
}
```

Now you can import the ambient module with TypeScript support: 

```ts
import Gio from 'gi://Gio?version=2.0';
```

### Global import

You can also import the module with Typescript support using the global `imports.gi` object of GJS.
For this you need to include `@girs/gio-2.0` or `@girs/gio-2.0/import` in your `tsconfig` or entry point Typescript file:

`index.ts`:
```ts
import '@girs/gio-2.0'
```

`tsconfig.json`:
```json
{
  "compilerOptions": {
    ...
  },
  "include": ["@girs/gio-2.0"],
  ...
}
```

Now you have also type support for this, too:

```ts
const Gio = imports.gi.Gio;
```

### Bundle

Depending on your project configuration, it is recommended to use a bundler like [esbuild](https://esbuild.github.io/). You can find examples using different bundlers [here](https://github.com/gjsify/ts-for-gir/tree/main/examples).

## Other packages

All existing pre-generated packages can be found on [gjsify/types](https://github.com/gjsify/types).

