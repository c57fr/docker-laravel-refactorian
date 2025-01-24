import { defineConfig } from "vite";
import laravel from "laravel-vite-plugin";
import react from "@vitejs/plugin-react";

export default defineConfig({
    plugins: [
        laravel({
            input: ["resources/css/app.css", "resources/js/app.js"],
            refresh: [
                ".env",
                ".env.local",
                "public/assets/**",
                "resources/css/**",
                "resources/views/**",
                "routes/**",
                "app/**",
                "lang/**",
                "config/**",
            ],
        }),
        react(),
    ],
    build: {
        manifest: true,
        outDir: "public/build",
        // chunkSizeWarningLimit: 2000,
    },
});
