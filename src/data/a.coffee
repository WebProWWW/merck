
validateNumber = (val, min=0, max=Infinity) ->
    return no if val is ''
    val = String(val).replace ',', '.'
    min <= val <= max

export default -> [
    # 0 Общие вопросы
    {
        num: 1
        name: 'Блок 1'
        label: 'Общие вопросы'
        title: 'Заполните основную информацию о пациенте'
        isComplete: no
        items: [
            # 0 - A1
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
            # 1 - B1
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
            # 2 - C1
            {
                active: no
                sum: no
                label:
                    text: 'Беременность'
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
            # 3 - D1
            {
                active: no
                sum: no
                label:
                    text: 'Причина гипотиреоза'
                    desc: ''
                field:
                    complete: no
                    type: 'select'
                    placeholder: ''
                    val: ''
                    options: [
                        {
                            label: 'Послеоперационный'
                            val: 1
                            selected: no
                        }
                        {
                            label: 'Другая причина'
                            val: 2
                            selected: no
                        }
                    ]
            }
            # 4 - E1
            {
                active: no
                sum: no
                label:
                    text: 'Операция была выполнена по поводу'
                    desc: ''
                field:
                    complete: no
                    type: 'select'
                    placeholder: ''
                    val: ''
                    options: [
                        {
                            label: 'Высокодиференцированного рака щитовидной железы'
                            val: 1
                            selected: no
                        }
                        {
                            label: 'Другого вида рака щитовидной железы'
                            val: 2
                            selected: no
                        }
                        {
                            label: 'Доброкачественного заболевания'
                            val: 3
                            selected: no
                        }
                    ]
            }
            # 5 - F1
            {
                active: yes
                sum: no
                label:
                    text: 'Вес'
                    desc: ''
                field:
                    complete: no
                    type: 'text'
                    placeholder: 'от 1 до 300 кг'
                    val: ''
                    validate: (val) -> validateNumber val, 1, 300
            }
            # 6 - G1
            {
                active: yes
                sum: no
                label:
                    text: 'Рост'
                    desc: ''
                field:
                    complete: no
                    type: 'text'
                    placeholder: 'от 1 до 250 см'
                    val: ''
                    validate: (val) -> validateNumber val, 1, 300
            }
            # 7 - H1
            {
                active: yes
                sum: yes
                label:
                    text: 'ИМТ (Индекс массы тела)'
                    desc: 'Рассчитывается автоматически'
                field:
                    complete: no
                    type: 'readonly'
                    val: ''
            }
        ]
    }

    # 1 Гипотиреоз
    {
        num: 2
        name: 'Блок 2'
        label: 'Гипотиреоз'
        title: 'Внесите данные о гипотиреозе'
        isComplete: no
        items: [
            # 0 - A2
            {
                active: yes
                sum: no
                label:
                    text: 'Уровень ТТГ'
                    desc: ''
                field:
                    complete: no
                    type: 'text'
                    placeholder: 'от 0,00 до 1000,0 мкМЕ/мл, мЕД/л'
                    val: ''
                    validate: (val) -> validateNumber val, 0, 1000
            }
            # 1 - B2
            {
                active: yes
                sum: no
                label:
                    text: 'Уровень Т4св'
                    desc: ''
                field:
                    complete: no
                    type: 'select'
                    # placeholder: 'Введите'
                    val: ''
                    label: ''
                    options: [
                        {
                            label: 'Ниже нормы'
                            val: 1
                            selected: no
                            disabled: no
                        }
                        {
                            label: 'Норма'
                            val: 2
                            selected: no
                            disabled: no
                        }
                        {
                            label: 'Повышен'
                            val: 3
                            selected: no
                            disabled: no
                        }
                    ]
            }
            # 2 - C2
            {
                active: no
                sum: no
                label:
                    text: 'Титр АТ-ТПО'
                    desc: ''
                field:
                    complete: no
                    type: 'select'
                    # placeholder: 'Введите'
                    val: ''
                    label: ''
                    options: [
                        {
                            label: 'Не учитывать'
                            val: 0
                            selected: no
                        }
                        {
                            label: 'Повышен'
                            val: 1
                            selected: no
                        }
                        {
                            label: 'Не повышен'
                            val: 2
                            selected: no
                        }
                        {
                            label: 'Не измерялся'
                            val: 3
                            selected: no
                        }
                    ]
            }
            # 3 - D2
            {
                active: no
                sum: no
                label:
                    text: 'Наличие сердечно-сосудистого заболевания'
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
            # 4 - E2
            {
                active: no
                sum: no
                label:
                    text: 'Симптомы и признаки гипотиреоза'
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
            # 5 - F2
            {
                active: no
                sum: no
                label:
                    text: 'Наличие факторов риска ССЗ'
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
            # 6 - G2
            {
                active: no
                sum: no
                label:
                    text: 'Наличие специфических факторов риска'
                    desc: 'в т.ч. РЙТ, операции на щитовидной железе в анамнезе'
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
            # 7 - H2
            {
                active: no
                sum: no
                label:
                    text: 'Есть фаткоры риска вторичного гипотиеоза'
                    desc: 'объемное образование в области гипофиза, травма головы, облучение головы и шеи'
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
            # 8 - I2
            {
                active: no
                sum: no
                label:
                    text: 'Планирование беременности'
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

    # 2 Беременность
    {
        num: 3
        name: 'Блок 3'
        label: 'Беременность'
        title: 'Заполните основную информацию о пациенте'
        isComplete: no
        items: [
            # A3
            {
                active: yes
                sum: no
                label:
                    text: 'Прием левотироксина до наступления беременности'
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
            # B3
            {
                active: no
                sum: no
                label:
                    text: 'Введите текущую дозу левотироксина'
                    desc: ''
                field:
                    complete: no
                    type: 'text'
                    placeholder: 'от 12,5 до 300 мкг'
                    val: ''
                    validate: (val) -> validateNumber(val, 12.5, 300)
            }
            # C3
            {
                active: no
                sum: no
                label:
                    text: 'Введите уровень ТТГ'
                    desc: ''
                field:
                    complete: no
                    type: 'text'
                    placeholder: 'от 0,1 до 1000,0 мкМЕ/мл, мЕД/л'
                    val: ''
                    validate: (val) -> validateNumber val, 0.1, 1000
            }
            # D3
            {
                active: no
                sum: no
                label:
                    text: 'Введите уровень Т4св'
                    desc: ''
                field:
                    complete: no
                    type: 'select'
                    # placeholder: 'Введите'
                    val: ''
                    options: [
                        {
                            label: 'Ниже нормы'
                            val: 1
                            selected: no
                        }
                        {
                            label: 'Норма'
                            val: 2
                            selected: no
                        }
                    ]
            }
            # E3
            {
                active: no
                sum: no
                label:
                    text: 'Титр АТ-ТПО'
                    desc: ''
                field:
                    complete: no
                    type: 'select'
                    placeholder: ''
                    val: ''
                    options: [
                        {
                            label: 'Повышен'
                            val: 1
                            selected: no
                        }
                        {
                            label: 'Не повышен'
                            val: 2
                            selected: no
                        }
                    ]
            }
        ]
    }

    # 3 ВДРЩЖ
    {
        num: 4
        name: 'Блок 4'
        label: 'ВДРЩЖ'
        title: 'Заполните основную информацию о пациенте'
        isComplete: no
        items: [
            # A4
            {
                active: yes
                sum: no
                label:
                    text: 'Группа риска'
                    desc: ''
                field:
                    complete: no
                    type: 'select'
                    placeholder: ''
                    val: ''
                    options: [
                        {
                            label: 'Низкий'
                            val: 1
                            selected: no
                            disabled: no
                        }
                        {
                            label: 'Промежуточный'
                            val: 2
                            selected: no
                            disabled: no
                        }
                        {
                            label: 'Высокий'
                            val: 3
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
                    text: 'Тип вмешательства'
                    desc: ''
                field:
                    complete: no
                    type: 'select'
                    placeholder: ''
                    val: ''
                    options: [
                        {
                            label: 'Гемитиреоидэктомия'
                            val: 1
                            selected: no
                            disabled: no
                        }
                        {
                            label: 'Тотальная тиреоидэктомия'
                            val: 2
                            selected: no
                            disabled: no
                        }
                    ]
            }
            # C4
            {
                active: no
                sum: no
                label:
                    text: 'Уровень ТГ'
                    desc: ''
                field:
                    complete: no
                    type: 'select'
                    val: ''
                    label: ''
                    options: [
                        {
                            label: 'Не определяется'
                            val: 1
                            selected: no
                            disabled: no
                        }
                        {
                            label: 'Низкий'
                            val: 2
                            selected: no
                            disabled: no
                        }
                        {
                            label: 'Повышенный'
                            val: 3
                            selected: no
                            disabled: no
                        }
                    ]
            }
            # D4
            {
                active: no
                sum: no
                label:
                    text: 'Проводилась ли аблация остаточной тиреоидной ткани'
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
                            disabled: no
                        }
                        {
                            label: 'Нет'
                            val: 0
                            selected: no
                            disabled: no
                        }
                    ]
            }
            # E4
            {
                active: no
                sum: no
                label:
                    text: 'Постменопауза'
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
                            disabled: no
                        }
                        {
                            label: 'Нет'
                            val: 0
                            selected: no
                            disabled: no
                        }
                    ]
            }
            # F4
            {
                active: no
                sum: no
                label:
                    text: 'Остеопороз'
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
                            disabled: no
                        }
                        {
                            label: 'Нет'
                            val: 0
                            selected: no
                            disabled: no
                        }
                    ]
            }
            # G4
            {
                active: no
                sum: no
                label:
                    text: 'Фибрилляция предсердий'
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
                            disabled: no
                        }
                        {
                            label: 'Нет'
                            val: 0
                            selected: no
                            disabled: no
                        }
                    ]
            }
            # H4
            {
                active: no
                sum: no
                label:
                    text: 'Тахикардия'
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
                            disabled: no
                        }
                        {
                            label: 'Нет'
                            val: 0
                            selected: no
                            disabled: no
                        }
                    ]
            }
            # {
            #     active: yes
            #     sum: yes
            #     label:
            #         text: 'Возраст'
            #         desc: ''
            #     field:
            #         complete: no
            #         type: 'readonly'
            #         val: ''
            # }
            # Возраст старше 60 лет
        ]
    }
]
