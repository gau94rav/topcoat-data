<template>
    <span>
        <t-loading-spinner position="relative" v-if="loading" />
        <span v-else-if="label">Issues in {{ label }}</span>
    </span>
</template>

<script>
    export default {
        data: () => ({
            is_filter: true,
        }),
        computed: {
            label() {
                console.log(this.rows)
                if (this.rows && this.rows.length) {
                    return this.rows[0]['GROUP_NAME'].rendered;
                }
                return "";
            }
        }
    }
</script>