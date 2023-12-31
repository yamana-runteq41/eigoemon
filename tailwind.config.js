module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ],
  plugins: [
    require("daisyui")
  ],
  daisyui: {
    themes: [
      "fantasy",
    ],
  },
  theme: {
    extend: {
      fontFamily: {
        'dotgothic': ['DotGothic16', 'sans-serif'],
        'rocknroll': ['RocknRoll One', 'sans-serif'],
        'rowdies': ['Rowdies', 'cursive'],
        'yusei': ['Yusei Magic', 'sans-serif']
      },
      width: {
        '85': '21.25rem',
        '90': '22.5rem', 
        '124': '31rem', 
      },
      margin: {
        '128': '32rem',
        '144': '36rem',
        '160': '40rem',
      },
    },
  },
}
