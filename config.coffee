path = require 'path'

module.exports = {
  srcDir    : path.join(__dirname, 'src')
  distDir   : path.join(__dirname, 'dist')

  sassDir : path.join(__dirname, 'src/stylesheets')
  pugDir  : path.join(__dirname, 'src/views')
  cssOutputName: 'style.css'
}
