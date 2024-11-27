const defaultTheme = require('tailwindcss/defaultTheme')
const colors = require('tailwindcss/colors')

module.exports = {
    content: [
        './public/*.html',
        './app/helpers/**/*.rb',
        './app/javascript/**/*.js',
        './app/views/**/*.{erb,haml,html,slim}',
        './app/assets/stylesheets/**/*.css',
    ],

    theme: {
        extend: {
            colors: {
                'orange': colors.orange,
            },
            fontFamily: {
                sans: ['Open Sans', ...defaultTheme.fontFamily.sans],
            },
            animation: {
                'slide-in': 'slideIn 0.3s ease-out',
                'slide-out': 'slideOut 0.3s ease-out'
            },
            keyframes: {
                slideIn: {
                    '0%': {transform: 'translateX(100%)', opacity: '0'},
                    '100%': {transform: 'translateX(0)', opacity: '1'}
                },
                slideOut: {
                    '0%': {transform: 'translateX(0)', opacity: '1'},
                    '100%': {transform: 'translateX(100%)', opacity: '0'}
                }
            }
        },
    },
    plugins: [
        require('@tailwindcss/forms'),
        require('@tailwindcss/typography'),
        require('@tailwindcss/container-queries'),
    ],
    darkMode: 'class',
}