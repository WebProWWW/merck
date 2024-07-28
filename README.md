## Установка на сайт

### Рассчитать дозу Эутирокс

`[hash]` - Хэш сборки

файл: `dist/calc-a.[hash].js` 

тэг: `<div id="app-calculator-a"></div>`

### Определить тактику ведения пациента с узловым зобом

`[hash]` - Хэш сборки

файл: `dist/calc-b.[hash].js`

тэг: `<div id="app-calculator-b"></div>`

## Пример установки на Tilda

Файлы подключаются с помощью сервиса jsDelivr https://www.jsdelivr.com/github

[![Видео пример Tilda](https://webprowww.github.io/projects/merck/cover-480.jpg)](https://webprowww.github.io/projects/merck/example-tilda.mov)

## Разработка и сборка

После установки Node модулей `npm install`

Откройте файл `node_modules/@vue/compiler-sfc/dist/compiler-sfc.cjs.js` и удалите или закомментируйте следующий код:

```JavaScript
this.scriptAst = descriptor.script && parse(descriptor.script.content, descriptor.script.loc.start.offset);
```

После этого в файлах .vue будет работать синтаксис CoffeeScript, иначе vue компилятор будет ругаться

После выполнения выше описанных шагов, проект можно запускать

Разработка: `npm run dev`

Сборка: `npm run build`
