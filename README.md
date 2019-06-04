# Sanic Golang Templater

Sanic uses templaters to convert configuration templates defined in various languages into .yaml or .json files, ready to be processed by kubernetes

This specific one uses [golang text templates](https://tip.golang.org/pkg/text/template/)

In general, you should choose the same template language as your webserver or configuration templater, to reduce developer cognitive overhead.