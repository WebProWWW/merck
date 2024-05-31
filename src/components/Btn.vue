<script lang="coffee">

import {computed} from 'vue'
# import AppComp from '@/components/AppComp.vue'

export default
    name: 'Btn'
    # components: {}
    props:
        disabled:
            type: Boolean
            default: no
    # emits:

    setup: (props, context) ->
        {}

</script>

<template>
<div class="c-btn" :class="{'c-btn-disabled': disabled}">
    <slot></slot>
</div>
</template>

<style lang="stylus" scoped>

// @require '@/style/lib/fun'

// // color #212121

// .c-btn
//     trans()
//     mpd(0 0 15px, 15px 20px)
//     border-radius 50px
//     font-size 14px
//     text-align center
//     user-select none
//     cursor pointer

// .c-btn-transparent
//     b(#656565)
//     background transparetn

// .c-btn-transparent:not(.c-btn-disabled):hover
//     b(#39B8CE)
//     background #39B8CE
//     color white

// .c-btn-primary
//     background #522583
//     color white

// .c-btn-primary:not(.c-btn-disabled):hover
//     background #E8308A

// .c-btn-red
//     background #E8308A
//     color white

// .c-btn-red:not(.c-btn-disabled):hover
//     background #522583

// .c-btn-lgray
//     background #F7F7F7
//     color #212121

// .c-btn-lgray:not(.c-btn-disabled):hover
//     background #522583
//     color white

// .c-btn-gray
//     background #656565
//     color white

// .c-btn-gray:not(.c-btn-disabled):hover
//     background #522583

// .c-btn-disabled
//     background #656565
//     color white
//     cursor not-allowed

// /*
// * Small devices (phones, 576px and up)                          ≥ 576px
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
// // @media (min-width: 576px)

// /*
// * Medium devices (tablets, 768px and up)                        ≥ 768px
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
// @media (min-width: 768px)
//     .c-btn
//         padding 13px 20px
//         font-size 18px

// /*
// * Large devices (desktops, 992px and up)                        ≥ 992px
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
// // @media (min-width: 992px)

// /*
// * Extra large devices (large desktops, 1200px and up)          ≥ 1200px
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
// // @media (min-width: 1200px)

</style>