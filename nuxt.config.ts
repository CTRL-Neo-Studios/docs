export default defineNuxtConfig({
    modules: [
        '@nuxtjs/i18n',
        '@nuxt/content',
        '@nuxt/image',
        '@nuxt/scripts',
        '@nuxt/ui',
    ],
    i18n: {
        defaultLocale: 'en',
        locales: [{
            code: 'en',
            name: 'English',
        }],
    },
    site: {
        name: 'CTRL Docs'
    },
    content: {
        preview: {
            api: 'https://api.nuxt.studio'
        }
    }
})