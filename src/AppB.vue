<script lang="coffee">

import { reactive, watch, ref, computed } from 'vue'
import Block from '@/components/Block.vue'
import Btn from '@/components/Btn.vue'
import ModalResult from '@/components/Modal.vue'
import data from '@/data/b.coffee'
import results from '@/data/result.coffee'

export default
    name: 'AppB'
    components: {
        Block
        Btn
        ModalResult
    }
    # props:
    # emits:

    setup: (props, context) ->
        currentBlock = ref 0
        # currentBlock = ref 1
        nextBlock = 1
        blocks = reactive data()
        isOpenResult = ref no
        isResult = ref no
        # isResult = ref yes
        result = ref {}

        blockItems = -> {
            A1: blocks[0].items[0]# УЗИ щитовидной железы

            A2: blocks[1].items[0]# Введите уровень ТТГ

            A3: blocks[2].items[0]# Введите уровень ТТГ
            B3: blocks[2].items[1]
            C3: blocks[2].items[2]
            D3: blocks[2].items[3]
            E3: blocks[2].items[4]
            F3: blocks[2].items[5]
            G3: blocks[2].items[6]
            H3: blocks[2].items[7]
        }

        watchFields = ->
            {
                A1
                A2
                A3, B3, C3, D3, E3, F3, G3, H3
            } = blockItems()

            A1: A1.field.val

            A2: A2.field.val

            A3: A3.field.val
            B3: B3.field.val
            C3: C3.field.val
            D3: D3.field.val
            E3: E3.field.val
            F3: F3.field.val
            G3: G3.field.val
            H3: H3.field.val


        calculate = () ->
            {
                A1
                A2
                A3, B3, C3, D3, E3, F3, G3, H3
            } = blockItems()
            isResult.value = no
            result.value = results().zero

            if currentBlock.value is 0
                if A1.field.val is 1
                    nextBlock = 1
                if A1.field.val is 2
                    nextBlock = 2
                return yes

            if currentBlock.value is 1
                isResult.value = yes
                A2_val = Number String(A2.field.val).replace ',', '.'

                if 0 <= A2_val < .4
                    result.value = results().a5

                if A2_val > 4
                    console.log 1


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

                if A3_val > 4
                    result.value = results().c5

                if .4 <= A3_val <= 4
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
                currentBlock.value = 0
            if step > 0
                currentBlock.value = nextBlock
            calculate()
            yes

        {
            currentBlock
            blocks
            onResetData
            onNavigate
            isOpenResult
            isResult
            onShowResult
            result
        }

</script>

<template>

<div class="c-wrapper">
    <block
        :model="blocks[currentBlock]"
        :is-result="isResult"
        @navigate="onNavigate"
        @show-result="onShowResult"
    />

    <modal-result
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
    </modal-result>

</div>

</template>