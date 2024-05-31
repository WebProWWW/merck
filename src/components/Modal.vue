<script lang="coffee">

import { watch, ref, onMounted } from 'vue'
import { Fancybox } from '@fancyapps/ui'

export default
    name: 'Modal'
    # components: {}
    props:
        openModal:
            type: [Boolean, Number]
            default: no
        wrapperClass:
            type: String
            default: ''
    emits: ['changed', 'closed']

    setup: (props, context) ->
        modalContent = ref ''
        modal = null

        openModal = () ->
            modal = new Fancybox [type: 'inline'], {autoFocus: no}
            modal.on 'destroy', () ->
                modal = null
                context.emit 'closed'
                yes
            modal.on 'Carousel.createSlide', (fb, carousel, slide) ->
                fb.setContent slide, modalContent.value
            yes

        watch (-> props.openModal), (val) ->
            openModal() if val
            yes

        # onMounted ->
        #     openModal()

        # onCancel = () ->
        #     modal?.close()
        #     context.emit 'changed', no
        #     yes

        # onAccept = () ->
        #     modal?.close()
        #     context.emit 'changed', yes
        #     yes

        {
            modalContent
        }

</script>

<template>
<div class="d-none">

<div class="c-modal" :class="wrapperClass" ref="modalContent">
    <slot></slot>
</div>

</div>
</template>

<style lang="stylus" scoped>

// // @require '@/style/lib/fun'

// .c-modal
//     padding 20px 20px 5px
//     background-color #D7D9E5
//     background-repeat no-repeat
//     background-position center
//     background-size cover
//     background-image url('@/img/modal-bg.jpg')
//     border-radius 25px
//     line-height 1.1
//     // max-width 500px

// .d-none
//     display none

// /*
// * Small devices (phones, 576px and up)                          ≥ 576px
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
// @media (min-width: 576px)
//     .c-modal
//         padding 30px 30px 15px
//         margin-left 20px
//         margin-right 20px

// /*
// * Medium devices (tablets, 768px and up)                        ≥ 768px
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
// // @media (min-width: 768px)
// //     .c-modal
// //         max-width 700px

// /*
// * Large devices (desktops, 992px and up)                        ≥ 992px
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
// // @media (min-width: 992px)

// /*
// * Extra large devices (large desktops, 1200px and up)          ≥ 1200px
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
// // @media (min-width: 1200px)

</style>