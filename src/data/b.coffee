validateNumber = (val, min=0, max=Infinity) ->
    return no if val is ''
    val = String(val).replace ',', '.'
    min <= val <= max

export default -> [
    # Блок 1
    {
        num: 1
        name: 'Блок 1'
        label: 'Узловой зоб'
        title: 'Внесите данные'
        isComplete: no
        items: [
            # A1
            {
                active: yes
                sum: no
                label:
                    text: ' УЗИ щитовидной железы'
                    desc: ''
                field:
                    complete: no
                    type: 'select'
                    placeholder: ''
                    val: ''
                    options: [
                        {
                            label: 'Выполнено'
                            val: 1
                            selected: no
                        }
                        {
                            label: 'Определение показаний'
                            val: 2
                            selected: no
                        }
                    ]
            }
        ]
    }

    # Диагностика
    {
        num: 3
        name: 'Блок 3'
        label: 'Диагностика'
        title: 'Дифференциальная диагностика узловых образования щитовидной железы'
        isComplete: no
        items: [
            # A2
            {
                active: yes
                sum: no
                label:
                    text: 'Введите уровень ТТГ'
                    desc: ''
                field:
                    complete: no
                    type: 'text'
                    placeholder: 'от 0,00 до 100,0 мкМЕ/мл, мЕД/л'
                    val: ''
                    validate: (val) -> validateNumber val
            }
            # B2
            {
                active: yes
                sum: no
                label:
                    text: 'Пол'
                field:
                    complete: no
                    type: 'radio'
                    val: ''
                    options: [
                        {
                            label: 'Мужчина'
                            val: 1
                            selected: no
                        }
                        {
                            label: 'Женщина'
                            val: 2
                            selected: no
                        }
                    ]
            }
            # C2
            {
                active: yes
                sum: no
                label:
                    text: 'Возраст'
                    desc: ''
                field:
                    complete: no
                    type: 'text'
                    placeholder: 'от 18 до 100'
                    val: ''
                    validate: (val) -> validateNumber val, 0, 100
            }
            # D2
            {
                active: yes
                sum: no
                label:
                    text: 'Кальцитонин'
                    desc: ''
                field:
                    complete: no
                    type: 'text'
                    placeholder: 'от 0 до 5000 пг/мл'
                    val: ''
                    validate: (val) -> validateNumber val, 0, 5000
            }
            # E2
            {
                active: yes
                sum: no
                label:
                    text: 'TIRADS'
                    desc: 'Если возникли трудности при определении, откройте калькулятор'
                field:
                    complete: no
                    type: 'text'
                    placeholder: 'от 2 до 5'
                    val: ''
                    validate: (val) -> validateNumber val, 2, 5
                btn:
                    label: 'Калькулятор EU-TIRADS'
                    event: 'block-tirads'
            }
            # F2
            {
                active: yes
                sum: no
                label:
                    text: 'Размер узла в наибольшем измерении'
                    desc: ''
                field:
                    complete: no
                    type: 'text'
                    placeholder: 'от 5 до 200 мм'
                    val: ''
                    validate: (val) -> validateNumber val, 5, 200
            }
            # G2
            {
                active: yes
                sum: no
                label:
                    text: 'Есть дополнительные подозрительные признаки'
                    desc: ''
                field:
                    complete: no
                    type: 'radio'
                    val: ''
                    options: [
                        {
                            label: 'Да'
                            val: 1
                            selected: no
                        }
                        {
                            label: 'Нет'
                            val: 0
                            selected: no
                        }
                    ]
            }
            # H2
            {
                active: yes
                sum: no
                label:
                    text: 'Результаты ТАБ (Bethesda)'
                    desc: ''
                field:
                    complete: no
                    type: 'select'
                    # placeholder: 'Введите'
                    val: ''
                    label: ''
                    options: [
                        {
                            label: 'I'
                            val: 1
                            selected: no
                            disabled: no
                        }
                        {
                            label: 'II'
                            val: 2
                            selected: no
                            disabled: no
                        }
                        {
                            label: 'III'
                            val: 3
                            selected: no
                            disabled: no
                        }
                        {
                            label: 'IV'
                            val: 4
                            selected: no
                            disabled: no
                        }
                        {
                            label: 'V'
                            val: 5
                            selected: no
                            disabled: no
                        }
                        {
                            label: 'VI'
                            val: 6
                            selected: no
                            disabled: no
                        }
                        {
                            label: 'Не проводилась'
                            val: 0
                            selected: no
                            disabled: no
                        }
                    ]
            }
            # I2
            {
                active: yes
                sum: no
                label:
                    text: 'Есть факторы риска агрессивных форм'
                    desc: ''
                field:
                    complete: no
                    type: 'radio'
                    val: ''
                    options: [
                        {
                            label: 'Да'
                            val: 1
                            selected: no
                        }
                        {
                            label: 'Нет'
                            val: 0
                            selected: no
                        }
                    ]
            }
        ]
    }

    # Обследования
    {
        num: 2
        name: 'Блок 2'
        label: 'Обследование'
        title: 'Алгоритм обследования - показание к УЗИ'
        isComplete: no
        items: [
            # A3
            {
                active: yes
                sum: no
                label:
                    text: 'Введите уровень ТТГ'
                    desc: ''
                field:
                    complete: no
                    type: 'text'
                    placeholder: 'от 0,00 до 100,0 мкМЕ/мл, мЕД/л'
                    val: ''
                    validate: (val) -> validateNumber val
            }
            # B3
            {
                active: no
                sum: no
                label:
                    text: 'Пальпируемое образование на шее'
                field:
                    complete: no
                    type: 'radio'
                    val: ''
                    options: [
                        {
                            label: 'Да'
                            val: 1
                            selected: no
                        }
                        {
                            label: 'Нет'
                            val: 0
                            selected: no
                        }
                    ]
            }
            # C3
            {
                active: no
                sum: no
                label:
                    text: 'Увеличение шейных лимфоузлов'
                field:
                    complete: no
                    type: 'radio'
                    val: ''
                    options: [
                        {
                            label: 'Да'
                            val: 1
                            selected: no
                        }
                        {
                            label: 'Нет'
                            val: 0
                            selected: no
                        }
                    ]
            }
            # D3
            {
                active: no
                sum: no
                label:
                    text: 'Узловое образование щитовидной железы, случайно выявленное при КТ шеи/ ПЭТ/УЗДГ БЦА'
                field:
                    complete: no
                    type: 'radio'
                    val: ''
                    options: [
                        {
                            label: 'Да'
                            val: 1
                            selected: no
                        }
                        {
                            label: 'Нет'
                            val: 0
                            selected: no
                        }
                    ]
            }
            # E3
            {
                active: no
                sum: no
                label:
                    text: 'Семейный анамнез медуллярного рака щитовидной железы'
                field:
                    complete: no
                    type: 'radio'
                    val: ''
                    options: [
                        {
                            label: 'Да'
                            val: 1
                            selected: no
                        }
                        {
                            label: 'Нет'
                            val: 0
                            selected: no
                        }
                    ]
            }
            # F3
            {
                active: no
                sum: no
                label:
                    text: 'Облучение головы и шеи в анамнезе'
                field:
                    complete: no
                    type: 'radio'
                    val: ''
                    options: [
                        {
                            label: 'Да'
                            val: 1
                            selected: no
                        }
                        {
                            label: 'Нет'
                            val: 0
                            selected: no
                        }
                    ]
            }
            # G3
            {
                active: no
                sum: no
                label:
                    text: 'Паралич голосовой связки'
                field:
                    complete: no
                    type: 'radio'
                    val: ''
                    options: [
                        {
                            label: 'Да'
                            val: 1
                            selected: no
                        }
                        {
                            label: 'Нет'
                            val: 0
                            selected: no
                        }
                    ]
            }
            # H3
            {
                active: no
                sum: no
                label:
                    text: 'Операции на щитовидной железе в анамнезе'
                    desc: 'в том числе по поводу рака щитовидной железы'
                field:
                    complete: no
                    type: 'radio'
                    val: ''
                    options: [
                        {
                            label: 'Да'
                            val: 1
                            selected: no
                        }
                        {
                            label: 'Нет'
                            val: 0
                            selected: no
                        }
                    ]
            }
        ]
    }

    # TIRADS
    {
        num: 2
        name: 'Блок 2'
        label: 'EU-TIRADS'
        title: 'Калькулятор EU-TIRADS'
        isComplete: no
        items: [
            # A4
            {
                active: yes
                sum: no
                label:
                    text: 'Эхоструктура'
                    desc: ''
                field:
                    complete: no
                    type: 'select'
                    # placeholder: 'Введите'
                    val: ''
                    label: ''
                    options: [
                        {
                            label: 'Не указана'
                            val: 0
                            selected: no
                        }
                        {
                            label: 'Кистозная или почти полностью кистозная'
                            val: 1
                            selected: no
                            disabled: no
                        }
                        {
                            label: 'Губчатая'
                            val: 2
                            selected: no
                            disabled: no
                        }
                        {
                            label: 'Смешанная солидно-кистозная'
                            val: 3
                            selected: no
                            disabled: no
                        }
                        {
                            label: 'Солидная или почти полностью солидная'
                            val: 4
                            selected: no
                            disabled: no
                        }
                    ]
            }
            # B4
            {
                active: yes
                sum: no
                label:
                    text: 'Эхогенность'
                    desc: ''
                field:
                    complete: no
                    type: 'select'
                    # placeholder: 'Введите'
                    val: ''
                    label: ''
                    options: [
                        {
                            label: 'Не указана'
                            val: 0
                            selected: no
                        }
                        {
                            label: 'Анэхогенная'
                            val: 1
                            selected: no
                            disabled: no
                        }
                        {
                            label: 'Гиперэхогенная'
                            val: 2
                            selected: no
                            disabled: no
                        }
                        {
                            label: 'Изоэхогенная'
                            val: 3
                            selected: no
                            disabled: no
                        }
                        {
                            label: 'Гипоэхогенная'
                            val: 4
                            selected: no
                            disabled: no
                        }
                        {
                            label: 'Выраженно гипоэхогенная'
                            val: 5
                            selected: no
                            disabled: no
                        }
                    ]
            }
            # C4
            {
                active: yes
                sum: no
                label:
                    text: 'Форма'
                    desc: ''
                field:
                    complete: no
                    type: 'select'
                    # placeholder: 'Введите'
                    val: ''
                    label: ''
                    options: [
                        {
                            label: 'Не указана'
                            val: 0
                            selected: no
                        }
                        {
                            label: 'Шире, чем выше'
                            val: 1
                            selected: no
                            disabled: no
                        }
                        {
                            label: 'Выше, чем шире'
                            val: 2
                            selected: no
                            disabled: no
                        }
                    ]
            }
            # D4
            {
                active: yes
                sum: no
                label:
                    text: 'Контур'
                    desc: ''
                field:
                    complete: no
                    type: 'select'
                    # placeholder: 'Введите'
                    val: ''
                    label: ''
                    options: [
                        {
                            label: 'Не указан'
                            val: 0
                            selected: no
                        }
                        {
                            label: 'Ровный'
                            val: 1
                            selected: no
                            disabled: no
                        }
                        {
                            label: 'Не определяется'
                            val: 2
                            selected: no
                            disabled: no
                        }
                        {
                            label: 'Неровный или дольчатый'
                            val: 3
                            selected: no
                            disabled: no
                        }
                        {
                            label: 'Экстратиреоидное распространение'
                            val: 4
                            selected: no
                            disabled: no
                        }
                    ]
            }
            # E4
            {
                active: yes
                sum: no
                label:
                    text: 'Микрокальцинаты'
                    desc: ''
                field:
                    complete: no
                    type: 'radio'
                    val: ''
                    options: [
                        {
                            label: 'Да'
                            val: 1
                            selected: no
                        }
                        {
                            label: 'Нет'
                            val: 0
                            selected: no
                        }
                    ]
            }
        ]
    }
]
