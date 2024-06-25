<script lang="coffee">

import { reactive, watch, ref, computed, onMounted } from 'vue'
import Block from '@/components/Block.vue'
import Btn from '@/components/Btn.vue'
import Modal from '@/components/Modal.vue'
import data from '@/data/b.coffee'
import results from '@/data/result.coffee'

export default
    name: 'AppB'
    components: {
        Block
        Btn
        Modal
    }
    # props:
    # emits:

    setup: (props, context) ->
        currentBlock = ref 0
        # currentBlock = ref 3
        nextBlock = 1
        prevBlock = 0
        blocks = reactive data()
        isOpenResult = ref no
        isResult = ref no
        isApply = ref no
        isOpenTirads = ref no
        # isResult = ref yes
        result = ref {}
        tiradsVal = 0

        # onMounted ->
        #     isOpenTirads.value = yes
        #     yes

        blockItems = -> {
            A1: blocks[0].items[0]# УЗИ щитовидной железы

            A2: blocks[1].items[0]# Введите уровень ТТГ
            B2: blocks[1].items[1]# Пол
            C2: blocks[1].items[2]# Возраст
            D2: blocks[1].items[3]# Кальцитонин
            E2: blocks[1].items[4]# TIRADS
            F2: blocks[1].items[5]# Размер узла
            G2: blocks[1].items[6]# Есть дополнительные подозрительные признаки
            H2: blocks[1].items[7]# Результаты ТАБ
            I2: blocks[1].items[8]# Есть факторы риска агрессивных форм

            A3: blocks[2].items[0]# Введите уровень ТТГ
            B3: blocks[2].items[1]
            C3: blocks[2].items[2]
            D3: blocks[2].items[3]
            E3: blocks[2].items[4]
            F3: blocks[2].items[5]
            G3: blocks[2].items[6]
            H3: blocks[2].items[7]

            A4: blocks[3].items[0]
            B4: blocks[3].items[1]
            C4: blocks[3].items[2]
            D4: blocks[3].items[3]
            E4: blocks[3].items[4]
        }

        watchFields = ->
            {
                A1
                A2, B2, C2, D2, E2, F2, G2, H2, I2
                A3, B3, C3, D3, E3, F3, G3, H3
                A4, B4, C4, D4, E4
            } = blockItems()

            A1: A1.field.val

            A2: A2.field.val
            B2: B2.field.val
            C2: C2.field.val
            D2: D2.field.val
            E2: E2.field.val
            F2: F2.field.val
            G2: G2.field.val
            H2: H2.field.val
            I2: I2.field.val

            A3: A3.field.val
            B3: B3.field.val
            C3: C3.field.val
            D3: D3.field.val
            E3: E3.field.val
            F3: F3.field.val
            G3: G3.field.val
            H3: H3.field.val

            A4: A4.field.val
            B4: B4.field.val
            C4: C4.field.val
            D4: D4.field.val
            E4: E4.field.val


        calculate = () ->
            {
                A1
                A2, B2, C2, D2, E2, F2, G2, H2, I2
                A3, B3, C3, D3, E3, F3, G3, H3
                A4, B4, C4, D4, E4
            } = blockItems()
            isResult.value = no
            isApply.value = no
            result.value = results().zero
            prevBlock = 0

            if currentBlock.value is 0
                if A1.field.val is 1
                    nextBlock = 1
                if A1.field.val is 2
                    nextBlock = 2
                return yes

            if currentBlock.value is 1
                isResult.value = yes
                D2.active = no
                F2.active = no
                E2.active = no
                G2.active = no
                H2.active = no
                I2.active = no
                A2val = Number String(A2.field.val).replace ',', '.'

                if 0 <= A2val < .4
                    result.value = results().A5

                if .4 < A2val
                    if tiradsVal
                        E2.field.val = tiradsVal
                        tiradsVal = 0
                    D2.active = yes
                    C2val = Number String(C2.field.val).replace ',', '.'
                    D2val = Number String(D2.field.val).replace ',', '.'
                    E2val = Number String(E2.field.val).replace ',', '.'
                    F2val = Number String(F2.field.val).replace ',', '.'
                    H2val = Number String(H2.field.val).replace ',', '.'
                    G2yes = G2.field.val is 1
                    G2no = G2.field.val is 0
                    isM = B2.field.val is 1
                    isW = B2.field.val is 2
                    if (isM and (12 <= D2val <= 100)) or (isW and (5 <= D2val <= 100))
                        result.value = results().f5
                    if 100 < D2val
                        result.value = results().g5
                    if (isM and 12 > D2val) or (isW and 5 > D2val)
                        if 20 > C2val
                            H2.active = yes
                            result.value = results().h5 if H2val is 0
                            result.value = results().i5 if H2val is 1
                            result.value = results().j5 if H2val is 2
                            result.value = results().k5 if H2val is 3
                            result.value = results().l5 if H2val is 4
                            result.value = results().m5 if H2val is 5
                            result.value = results().n5 if H2val is 6
                        if 20 <= C2val
                            E2.active = yes
                            F2.active = yes
                            if E2val is 2
                                result.value = results().o5 if 5 <= F2val < 10
                                result.value = results().p5 if 10 <= F2val
                            if E2val is 3
                                result.value = results().q5 if 5 <= F2val < 10
                                result.value = results().r5 if 10 <= F2val < 20
                                if 20 <= F2val
                                    H2.active = yes
                                    result.value = results().h5 if H2val is 0
                                    result.value = results().i5 if H2val is 1
                                    result.value = results().j5 if H2val is 2
                                    result.value = results().k5 if H2val is 3
                                    result.value = results().l5 if H2val is 4
                                    result.value = results().m5 if H2val is 5
                                    result.value = results().n5 if H2val is 6
                            if E2val is 4
                                result.value = results().s5 if 5 <= F2val < 15
                                if 15 <= F2val
                                    H2.active = yes
                                    result.value = results().h5 if H2val is 0
                                    result.value = results().i5 if H2val is 1
                                    result.value = results().j5 if H2val is 2
                                    result.value = results().k5 if H2val is 3
                                    result.value = results().l5 if H2val is 4
                                    result.value = results().m5 if H2val is 5
                                    result.value = results().n5 if H2val is 6
                            if E2val is 5
                                if 5 <= F2val < 10
                                    G2.active = yes
                                    result.value = results().t5 if G2no
                                    if G2yes
                                        H2.active = yes
                                        result.value = results().h5 if H2val is 0
                                        result.value = results().i5 if H2val is 1
                                        result.value = results().j5 if H2val is 2
                                        result.value = results().k5 if H2val is 3
                                        result.value = results().l5 if H2val is 4
                                        result.value = results().m5 if H2val is 5
                                        result.value = results().n5 if H2val is 6
                return yes

            if currentBlock.value is 2
                isResult.value = yes
                A3_val = Number String(A3.field.val).replace ',', '.'
                B3.active = no
                C3.active = no
                D3.active = no
                E3.active = no
                F3.active = no
                G3.active = no
                H3.active = no

                if 0 <= A3_val < .4
                    result.value = results().b5

                if 4 <= A3_val
                    result.value = results().c5

                if .4 <= A3_val < 4
                    B3.active = yes
                    C3.active = yes
                    D3.active = yes
                    E3.active = yes
                    F3.active = yes
                    G3.active = yes
                    H3.active = yes
                    B3yes = B3.field.val is 1
                    C3yes = C3.field.val is 1
                    D3yes = D3.field.val is 1
                    E3yes = E3.field.val is 1
                    F3yes = F3.field.val is 1
                    G3yes = G3.field.val is 1
                    H3yes = H3.field.val is 1
                    result.value = results().d5
                    if B3yes or C3yes or D3yes or E3yes or F3yes or G3yes or H3yes
                        result.value = results().e5

                return yes

            if currentBlock.value is 3
                prevBlock = 1
                isApply.value = yes
                tiradsVal = 0
                A4val = Number String(A4.field.val)
                B4val = Number String(B4.field.val)
                C4val = Number String(C4.field.val)
                D4val = Number String(D4.field.val)
                tiradsVal = 2 if A4val in [1,2,3,4]
                tiradsVal = 2 if B4val in [1]
                tiradsVal = 3 if B4val in [2,3]
                tiradsVal = 4 if B4val in [4]
                tiradsVal = 5 if B4val in [5]
                tiradsVal = 5 if C4val in [1,2]
                tiradsVal = 5 if D4val in [1,2,3,4]
                tiradsVal = 5 if E4.field.val is 1
                return yes
            yes

        watch watchFields, calculate

        onShowResult = () ->
            return yes unless blocks[currentBlock.value].isComplete
            isOpenResult.value = true
            yes

        onResetData = () ->
            # blocks[index] = dataDefault for dataDefault, index in data()
            yes

        onNavigate = (step) ->
            if step < 0
                currentBlock.value = prevBlock
            if step > 0
                currentBlock.value = nextBlock
            calculate()
            yes

        onItemEvent = (e) ->
            isOpenTirads.value = yes if e is 'block-tirads'
            yes

        onTirads = () ->
            isOpenTirads.value = no
            currentBlock.value = 3
            calculate()
            yes

        onApply = () ->
            onNavigate -1
            yes

        calculate()

        {
            currentBlock
            blocks
            onResetData
            onNavigate
            isOpenResult
            isResult
            isOpenTirads
            onTirads
            onApply
            isApply
            onShowResult
            onItemEvent
            result
        }

</script>

<template>

<div class="c-wrapper">
    <block
        :model="blocks[currentBlock]"
        :is-result="isResult"
        :is-apply="isApply"
        @navigate="onNavigate"
        @show-result="onShowResult"
        @item-event="onItemEvent"
        @apply="onApply"
    />

    <modal
        :open-modal="isOpenResult"
        wrapper-class="c-modal-result"
        @closed="isOpenResult = false"
    >
        <div class="row g-10">
            <div class="col-100 col-lg">
                <div class="c-result-body maxw-lg-5">
                    <div class="c-result-label">
                        Заключение
                    </div>
                    <div class="c-result-title" v-html="result.title"></div>
                    <div class="c-result-text" v-html="result.body"></div>
                    <div class="row g-5 mt-lg-35">
                        <div class="col-100 col-md">
                            <btn class="c-btn-red">
                                Рассчитать заново
                            </btn>
                        </div><!-- .col -->
                        <div class="col-100 col-md">
                            <btn class="c-btn-lgray">
                                На главную
                            </btn>
                        </div><!-- .col -->
                    </div><!-- .row -->
                </div>
            </div><!-- .col -->
            <div class="col-100 col-lg-auto ms-auto align-self-end">
                <div class="maxw-lg-4">
                    <div v-if="result.info">
                        <div class="c-result-info">
                            <img class="c-result-info-icon" width="23" height="23" src="@/img/i-info.svg">
                            <div>
                                {{result.info}}
                            </div>
                        </div>
                        <btn class="c-btn-primary">
                            Список литературы
                        </btn>
                    </div><!-- v-if -->
                    <div v-else>&nbsp;</div>
                </div>
            </div><!-- .col -->
        </div><!-- .row -->
    </modal>

    <modal
        :open-modal="isOpenTirads"
        wrapper-class="c-modal-tirads"
        @closed="isOpenTirads = false"
    >
            <div class="row g-10 align-items-center">
                <div class="col-100 col-md col-lg-auto d-none d-md-block">
                    <img class="c-img" src="@/img/tirads.jpg">
                </div><!-- .col -->
                <div class="col-100 col-md-50 col-lg">
                    <div class="c-tirads-body">
                        <div class="c-tirads-text mb-md-50">
                            Этот калькулятор основан на рекомендациях <span class="fw-6">European Thyroid Association</span> по ультразвуковой стратификации риска злокачественных новообразований щитовидной железы, однако он не является официальным и не был одобрен вышеупомянутой ассоциацией.
                        </div>
                        <btn class="c-btn-primary" @click="onTirads">
                            Хорошо, перейти к калькулятору
                        </btn>
                    </div>
                </div><!-- .col -->
            </div><!-- .row -->
    </modal>

</div>

</template>