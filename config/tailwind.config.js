const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}',
    './node_modules/tw-elements/dist/js/**/*.js'
  ],
  theme: {
    extend: {
      colors: {
        'lb': '#006dff',
        'lbd': '#0057CB',
        'dgreen': '#003951',
        'lgray': '#4d4d4d',
        'dgray': '#333333',
        'bgray': '#1A1A1A',
        'slg': '#f9f9f9',
        'slgb': '#F6F6F6'
      },
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
        'montserrat': ['Montserrat'],
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('tw-elements/dist/plugin'),
  ]
}
