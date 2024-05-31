validateNumber = (val, min=0, max=Infinity) ->
    return no if val is ''
    val = String(val).replace ',', '.'
    min <= val <= max

export default -> [
    # Блок 1 Внесите данные
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
            # C3
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
                    validate: (val) -> validateNumber val, 18, 100
            }

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
                    text: 'Узловое образование щитовидной железы, случайно выявленные при КТ шеи/ПЭТ/УЗДГ БЦА'
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
]
