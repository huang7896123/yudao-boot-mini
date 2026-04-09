import { defineConfig } from '@vben/vite-config';

export default defineConfig(async () => {
  return {
    application: {},
    vite: {
      server: {
        proxy: {
          '/admin-api': {
            changeOrigin: true,
            rewrite: (path) => path.replace(/^\/admin-api/, ''),
            // mock代理目标地址
            target: 'http://111.230.20.34:48080/admin-api',
            ws: true,
          },
        },
      },
    },
  };
});
