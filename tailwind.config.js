/* eslint-disable no-undef */
module.exports = {
  theme: {
    extend: {
      fontFamily: {
        base: ['"Source Sans Pro"', 'sans-serif'],
        roboto: ['"Roboto"', 'sans-serif'],
      },
      colors: {
        'blue-gray': {
          '50': '#f8fafc',
          '200': '#E2E8F0',
          '500': '#64748B',
          '700': '#334155',
        },
      },
    },
  },
  variants: {},
  plugins: [
    require('@tailwindcss/forms'),
  ],
  content: [
    './app/**/*.html',
    './app/**/*.vue',
    './app/**/*.js',
    './app/**/*.erb',
  ],
};
