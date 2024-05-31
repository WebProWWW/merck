## Разработка и сборка

После установки Node модулей `npm install`

Удалить или закомментировать  код на строке #15689 (номер строки может отличаться) в файле: `node_modules/@vue/compiler-sfc/dist/compiler-sfc.cjs.js`

```JavaScript
this.scriptAst = descriptor.script && parse(descriptor.script.content, descriptor.script.loc.start.offset);
```

После этого в файлах .vue будет работать синтаксис CoffeeScript, иначе vue компилятор будет ругаться

После выполнения выше описанных шагов, проект можно запускать

Разработка: `npm run dev`

Сборка: `npm run prod`

В проекте содержится 2 калькулятора

### "Рассчитать дозу Эутирокс"

файл: `public_html/calc-a.[hash].js` 

тэг: `<div id="app-calculator-a"></div>`

### "Определить тактику ведения пациента с узловым зобом"

файл: `public_html/calc-b.[hash].js`

тэг: `<div id="app-calculator-b"></div>`