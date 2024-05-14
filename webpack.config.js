const path = require('path');
 
module.exports = {
  mode: 'development',
  entry: {
    index: './src/index.js',
  },
  output: {
    filename: '[hokkaidomaps].bundle.js',
    path: path.resolve(__dirname, 'dist'),
  },
};