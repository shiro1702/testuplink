const path = require('path');
const HtmlWebpackPlugin = require('html-webpack-plugin');
const merge = require('webpack-merge');
const pug = require('./webpack/pug');
const devserver = require('./webpack/devserver');
const sass = require('./webpack/sass');
const sass_prod = require('./webpack/sass-prod');
const images = require('./webpack/images');
const fonts = require('./webpack/fonts');

const ExtractTextPlugin = require ('extract-text-webpack-plugin');


const PATHS = {
    source: path.join(__dirname, 'source'),
    build: path.join(__dirname, 'build')
};

const common = merge([
    {
  	entry: {'index' : PATHS.source + '/index/index.js'},
    output: {
        path: PATHS.build,
        filename: '[name].js'
    },

    plugins: [
	 new HtmlWebpackPlugin({
				filename: 'index.html',
				chunks: ['index'],
				template: PATHS.source + '/index/index.pug'
			}),
	 new ExtractTextPlugin('bundle.css')
    ],
    },
    pug(),
	images(),
	fonts()
]);

module.exports = function(env) {
    if (env === 'production') {
        return merge([
			common,
			sass_prod()
		]);
    }
    if (env === 'development') {
        return merge([
            common,
			sass(),
            devserver()
        ]);
    }
};
