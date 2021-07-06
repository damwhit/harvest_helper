module.exports = {
  purge: [ // define what tree shake for production
    './app/frontend/**/*.vue',
    './app/frontend/**/*.js', // need to reference javascript too
  ],
  corePlugins: {
    container: false,
    preflight: false,
  },
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {},
  },
  variants: {
    extend: {},
  },
  plugins: [],
}
