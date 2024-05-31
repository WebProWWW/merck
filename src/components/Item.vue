<script lang="coffee">

import Field from '@/components/Field.vue'
import Btn from '@/components/Btn.vue'

export default
    name: 'Item'
    components: {
        Field
        Btn
    }
    props:
        model:
            type: Object
        index:
            type: Number
    # emits:

    setup: (props, context) -> {}

</script>

<template>
<div v-if="model">

    <div class="row g-5">
        <div class="col-auto d-none d-lg-block mb-10">
            <div class="c-item-num">
                {{index + 1}}
            </div>
        </div><!-- .col -->

        <div class="col-100 col-lg">
            <div class="c-item-group">
                <div class="row g-6 align-items-center">
                    <div class="col-100 col-lg">
                        <div class="row g-7 align-items-center">
                            <div class="col-auto d-lg-none">
                                <div class="c-item-num">
                                    {{index + 1}}
                                </div>
                            </div><!-- .col -->
                            <div class="col">
                                <div class="c-item-label-text" v-if="model.label.text">
                                    {{model.label.text}}
                                </div>
                            </div><!-- .col -->
                            <div class="col-100">
                                <div class="c-item-label-desc" v-if="model.label.desc">
                                    {{model.label.desc}}
                                </div>
                            </div><!-- .col -->
                        </div><!-- .row -->
                    </div><!-- .col -->
                    <div class="col-100 col-lg-50 col-xxl-45">
                        <div class="c-item-field">
                            <field :model="model.field"/>
                            <div v-if="model.btn">
                                <btn class="c-btn-primary" @click="$emit(model.btn.event)">
                                    {{model.btn.label}}
                                </btn>
                            </div>
                        </div>
                    </div><!-- .col -->
                </div><!-- .row -->
            </div><!-- .c-item-group -->
        </div><!-- .col -->
    </div><!-- .row -->
</div>
</template>