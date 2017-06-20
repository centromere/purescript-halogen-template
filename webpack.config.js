const path = require('path')
const BabiliPlugin = require("babili-webpack-plugin");

module.exports = function (env) {
  plugins = [];

  if (env === 'production') {
    plugins.push(new BabiliPlugin({}, {}));
  }

  return {
    entry: path.join(__dirname, 'support/entry.js'),
    context: __dirname,
    target: 'web',
    output: {
      path: path.join(__dirname, 'dist'),
      filename: 'index.js',
      publicPath: '/js'
    },
    module: {
      loaders: [
        {
          test: /\.purs$/,
          loader: 'purs-loader',
          exclude: /node_modules/,
          query: env === 'production' ? {
            bundle: true,
            warnings: false
          } : {
            psc: 'psa',
            pscIde: true
          }
        }
      ]
    },
    plugins: plugins
  };
}
