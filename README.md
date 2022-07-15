# Vite Vue TS

## Install

`git clone https://github.com/n3wborn/vite-vue-ts.git`

`cd vite-vue-ts`

`make install`

## Config

Vite and Docker are configured to use 3333 port but you can change if you want.

**change Vite port**:

```diff
# vite.config.ts
server: {
-    port: 3333,
+    port: <new port>,
    host: true,
},

```

**change container port accordingly**:

```diff
# Makefile
-PORT_CONTAINER = 3333
+PORT_CONTAINER = <new port>
```

**if you want to change you host port too**:

```diff
# Makefile
-PORT_HOST = 3333
+PORT_HOST = <new port>
```

## Dev

-   `make dev`
-   navigate to `http://localhost:<PORT_HOST>/` where PORT_HOST is... the PORT_HOST
-   enjoy Vite [Hot Module Reload](https://vitejs.dev/guide/features.html#hot-module-replacement) and [TS support](https://vitejs.dev/guide/features.html#typescript)
-   have fun with [Vuejs](https://vuejs.org/)

## Package Management

Once container is running :

-   `make add_deps <package>` to add a dependency
-   `make add_dev_deps` for a dev dependency
-   `make rm_deps` to remove one of them

## Links

-   [Vue](https://vuejs.org/)
-   [Vite config](https://vitejs.dev/config)
-   [Vite server config](https://vitejs.dev/config/server-options.html)
-   [Node](https://hub.docker.com/_/node) on Docker hub
-   [Node lts-slim](https://hub.docker.com/_/node?tab=tags&page=1&name=lts-slim) image on Docker hub
-   [Docker](https://docs.docker.com/)
-   [Docker and Node.js best practices](https://github.com/nodejs/docker-node/blob/main/docs/BestPractices.md)
