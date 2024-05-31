<script lang="coffee">

import { computed, ref } from 'vue'
import Item from '@/components/Item.vue'
import Btn from '@/components/Btn.vue'

export default
    name: 'Block'
    components: {
        Item
        Btn
    }
    props:
        model:
            type: Object
        isResult:
            type: [Boolean, Number]
    emits: ['navigate', 'show-result']

    setup: (props, context) ->

        items = computed ->
            item for item in props.model.items when item.active

        totalLength = computed ->
            length = 0
            length++ for item in props.model.items when item.active and not item.sum
            length

        completedLength = computed ->
            completed = 0
            for item in props.model.items
                if not item.sum and item.active and item.field.complete is yes
                    completed++
            completed

        completePct = computed ->
            pct = completedLength.value / totalLength.value * 100
            props.model.isComplete = pct is 100
            "#{pct}%"

        onNavigate = (step) ->
            return yes if step is 1 and not props.model.isComplete
            context.emit 'navigate', step
            yes

        {
            items
            completedLength
            completePct
            totalLength
            onNavigate
        }

</script>

<template>
<div v-if="model">

    <div class="row g-5 g-sm-10 align-items-sm-center">
        <div class="col-auto">
            <div class="c-header-badge">
                {{model.label}}
            </div>
            <div class="row g-5" v-if="false">
                <div class="col-auto">
                    <div class="c-header-badge">
                        {{model.name}}
                    </div>
                </div>
                <div class="col-auto">
                    <div class="c-header-badge">
                        {{model.label}}
                    </div>
                </div>
            </div>
        </div><!-- .col -->
        <div class="col d-sm-none">
            <div class="c-header-space">&nbsp;</div>
        </div><!-- .col -->
        <div class="col-sm">
            <div class="c-progress">
                <div class="c-progress-line">
                    <div
                        class="c-progress-level"
                        :style="{width: completePct}"
                    ></div>
                    <div class="c-progress-text">
                        Вопрос
                        {{ completedLength }}
                        из
                        {{ totalLength }}
                    </div><!-- .c-progress -->
                </div><!-- .c-progress-line -->
            </div><!-- .c-progress -->
        </div><!-- .col -->

    </div><!-- .row -->

    <div class="c-block-body">
        <div class="c-title">
            {{model.title}}
        </div>

        <div v-for="(item, i) in items">
            <item :model="item" :index="i"/>
        </div>

        <div class="row g-5 justify-content-center mt-sm-15">
            <div class="col-100 col-sm-auto order-sm-2">
                <div v-if="isResult">
                    <btn
                        class="c-btn-primary"
                        :disabled="!model.isComplete"
                        @click="$emit('show-result')"
                    >Узнать результат</btn>
                </div>
                <div v-else>
                    <btn
                        class="c-btn-primary"
                        :disabled="!model.isComplete"
                        @click="onNavigate(1)"
                    >Следующий блок</btn>
                </div>
            </div><!-- .col -->

            <div class="col-100 col-sm-auto order-sm-1">
                <div v-if="model.num !== 1">
                    <btn
                        class="c-btn-transparent"
                        @click="onNavigate(-1)"
                    >Назад</btn>
                </div>
            </div><!-- .col -->

        </div><!-- .row -->
    </div><!-- .c-block-body -->

</div><!-- .c-block -->
</template>