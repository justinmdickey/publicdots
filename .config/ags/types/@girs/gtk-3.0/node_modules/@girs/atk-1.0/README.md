
# Atk-1.0

![version](https://img.shields.io/npm/v/@girs/atk-1.0)
![downloads/week](https://img.shields.io/npm/dw/@girs/atk-1.0)


GJS TypeScript type definitions for Atk-1.0, generated from library version 2.45.1 using [ts-for-gir](https://github.com/gjsify/ts-for-gir) v3.2.2.

ATK provides the set of accessibility interfaces that are implemented by other toolkits and applications. Using the ATK interfaces, accessibility tools have full access to view and control running applications.

## Install

To use this type definitions, install them with NPM:
```bash
npm install @girs/atk-1.0
```

## Usage

You can import this package into your project like this:
```ts
import Atk from '@girs/atk-1.0';
```

Or if you prefer CommonJS, you can also use this:
```ts
const Atk = require('@girs/atk-1.0');
```

### Ambient Modules

You can also use [ambient modules](https://github.com/gjsify/ts-for-gir/tree/main/packages/cli#ambient-modules) to import this module like you would do this in JavaScript.
For this you need to include `@girs/atk-1.0` or `@girs/atk-1.0/ambient` in your `tsconfig` or entry point Typescript file:

`index.ts`:
```ts
import '@girs/atk-1.0'
```

`tsconfig.json`:
```json
{
  "compilerOptions": {
    ...
  },
  "include": ["@girs/atk-1.0"],
  ...
}
```

Now you can import the ambient module with TypeScript support: 

```ts
import Atk from 'gi://Atk?version=1.0';
```

### Global import

You can also import the module with Typescript support using the global `imports.gi` object of GJS.
For this you need to include `@girs/atk-1.0` or `@girs/atk-1.0/import` in your `tsconfig` or entry point Typescript file:

`index.ts`:
```ts
import '@girs/atk-1.0'
```

`tsconfig.json`:
```json
{
  "compilerOptions": {
    ...
  },
  "include": ["@girs/atk-1.0"],
  ...
}
```

Now you have also type support for this, too:

```ts
const Atk = imports.gi.Atk;
```

### Bundle

Depending on your project configuration, it is recommended to use a bundler like [esbuild](https://esbuild.github.io/). You can find examples using different bundlers [here](https://github.com/gjsify/ts-for-gir/tree/main/examples).

## Other packages

All existing pre-generated packages can be found on [gjsify/types](https://github.com/gjsify/types).

