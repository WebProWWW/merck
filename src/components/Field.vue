<script lang="coffee">

import { computed, ref, watch } from 'vue'
# import AppComp from '@/components/AppComp'

openedSelect = null

window.document.onclick = () ->
    openedSelect?.value = no
    openedSelect = null
    yes

export default
    name: 'Field'
    # components: {}
    props:
        model:
            type: Object
    # emits:

    setup: (props, context) ->
        isSelectOpen = ref no

        uid = computed ->
            randomString = ''
            for i in [1..5]
                char = 'qwertyuiopasdfghjklzxcvbnm'.charAt Math.floor Math.random() * 25
                randomString = "#{randomString}#{char}"
            "field-#{randomString}"

        type = computed ->
            modelType = props.model?.type
            isText: modelType is 'text'
            isRadio: modelType is 'radio'
            isReadonly: modelType is 'readonly'
            isSelect: modelType is 'select'


        watch (-> props.model.val), (val) ->
            model = props.model
            if type.value.isText
                model.complete = model.validate? val
                return yes
            if type.value.isSelect
                model.complete = no
                for option in model.options
                    option.selected = no
                    if val is option.val
                        model.label = option.label
                        option.selected = yes
                        model.complete = yes
                return yes
            if type.value.isRadio
                model.complete = no
                for option in model.options
                    option.selected = no
                    if val is option.val
                        option.selected = yes
                        model.complete = yes
                return yes
            yes

        onSelecClick = () ->
            if isSelectOpen.value
                isSelectOpen.value = no
                openedSelect = null
                return yes
            openedSelect?.value = no
            isSelectOpen.value = yes
            openedSelect = isSelectOpen
            yes

        {
            type
            onSelecClick
            isSelectOpen
        }

</script>

<template>

<div v-if="type.isText">
    <input
        type="text"
        class="c-field-input"
        v-model="model.val"
        :placeholder="model.placeholder"
    >
</div>

<div v-if="type.isSelect">
    <div class="c-field-select" @click.prevent.stop="onSelecClick">
        <div class="c-field-select-value" :class="{'c-active':isSelectOpen}">
            {{ model.label }}&nbsp;
        </div>
        <div class="c-field-select-options" :class="{'c-active': isSelectOpen}">
            <div
                class="c-field-select-option"
                v-for="option in model.options"
                :class="{'c-active': option.selected, 'd-none': option.disabled}"
                @click="model.val = option.val"
            >{{ option.label }}</div>
        </div>
    </div>
</div>

<div v-if="type.isReadonly">
    <div class="c-field-input">
        {{model.val}}&nbsp;
    </div>
</div>

<div v-if="type.isRadio">
    <div class="c-field-radio">
        <div
            class="c-field-radio-btn"
            v-for="option in model.options"
            :class="{active: option.selected}"
            @click="model.val = option.val"
        >
            {{option.label}}
        </div>
    </div>
</div>

</template>