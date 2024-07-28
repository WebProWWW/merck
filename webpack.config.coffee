webpack = require 'webpack'
path = require 'path'
HtmlWebpackPlugin = require 'html-webpack-plugin'
{ VueLoaderPlugin } = require 'vue-loader'

module.exports = (env, argv) ->

    src = path.resolve __dirname, "src"
    dist = path.resolve __dirname, "dist"

    entry:
        'calc-a': "#{src}/index-a.coffee"
        'calc-b': "#{src}/index-b.coffee"

    resolve: alias: '@': src

    # optimization:
    #     minimize: no
    #     runtimeChunk: 'single'

    output:
        clean: yes
        hashDigestLength: 8
        path: dist
        publicPath: '/'
        filename: '[name].[contenthash].js'

    devServer:
        client:
            overlay: yes
            logging: 'warn'

    module:
        rules: [
            {
                test: /\.coffee$/i
                loader: 'coffee-loader'
                options:
                    bare: no
                    sourceMap: no
                    inlineMap: no
                    header: no
                    transpile: presets: ['@babel/preset-env']
            }
            {
                test: /\.styl(us)?$/i
                use: [
                    'style-loader'
                    'css-loader'
                    {
                        loader: 'postcss-loader'
                        options:
                            postcssOptions:
                                plugins: ['postcss-preset-env']
                    }
                    'stylus-loader'
                ]
            }
            {
                test: /\.css$/i
                use: [
                    'style-loader'
                    'css-loader'
                ]
            }
            {
                test: /.vue$/i
                loader: 'vue-loader'
            }
            {
                test: /\.(png|svg|jpg|jpeg|gif)$/i
                type: 'asset/inline'
            }
        ]

    plugins: [
        new HtmlWebpackPlugin
            inject: yes
            minify: no
            chunks: ['calc-a']
            template: "#{src}/calc-a.html"
            filename: 'calc-a.html'
        new HtmlWebpackPlugin
            inject: yes
            minify: no
            chunks: ['calc-b']
            template: "#{src}/calc-b.html"
            filename: 'calc-b.html'
        new VueLoaderPlugin
        new webpack.DefinePlugin
            __VUE_OPTIONS_API__: no
            __VUE_PROD_DEVTOOLS__: no
            __VUE_PROD_HYDRATION_MISMATCH_DETAILS__: no
    ]