const path = require('path');

module.exports = {
  entry: ['./app/frontend/App.js'],
  output: {
    path: path.join(__dirname, '../../app/assets/javascripts'),
    filename: 'bundle.js',
    publicPath: '/assets'
  },
  module: {
    rules: [
      {
        test: /\.js?$/,
        use: 'babel-loader',
        exclude: [
          path.join(__dirname, '../../node_modules')
        ]
      }
    ]
  },
}