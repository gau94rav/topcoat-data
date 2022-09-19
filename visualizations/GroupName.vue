<template>
    <div class="pr-10">
        <t-loading-spinner position="relative" v-if="loading" />
        <span v-else-if="label"><span v-if="!hideIssuesInLabel">Issues in</span> {{ label }}</span>
    </div>
</template>

<script>
    export default {
        props: {
            hideIssuesInLabel: {
                type: Boolean,
                default: false,
            }
        },
        data: () => ({
            is_filter: true,
        }),
        computed: {
            label() {
                if (this.rows && this.rows.length) {
                    return this.rows[0]['GROUP_NAME'].rendered;
                }
                return "";
            }
        },
        mounted() {
            this.fetchLayerData();
        }
    }
</script>