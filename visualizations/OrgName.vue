<template>
    <span>
        <t-loading-spinner position="relative" v-if="loading" />
        <span v-else>Issues in {{ label }}</span>
    </span>
</template>

<script>
    export default {
        data: () => ({
            is_filter: true,
        }),
        computed: {
            label() {
                if (this.rows && this.rows.length) {
                    return this.rows[0]['ORG_DISPLAY_NAME'].rendered;
                }
                return "";
            }
        }
    }
</script>