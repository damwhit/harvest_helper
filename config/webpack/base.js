const { webpackConfig, merge } = require('@rails/webpacker')
const vueConfig = require('./rules/vue')

// switched configs here per https://github.com/rails/webpacker/issues/2835#issuecomment-759772592
module.exports = merge(vueConfig, webpackConfig)