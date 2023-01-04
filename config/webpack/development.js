process.env.NODE_ENV = process.env.NODE_ENV || 'development'

const environment = require('./environment')

module.exports = environment.toWebpackConfig()

const webpack = require("webpack")

environment.plugins.append("Provide", new webpack.ProvidePlugin({
  Popper: ['popper.js', 'default']
}))
