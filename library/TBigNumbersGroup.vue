<template>
    <t-container is-full-width is-justify-between>
        <t-grids column-count="4" style="width: 100%">
            <!-- <t-big-number
                :number-value="row ? row.TOTAL.rendered: '--'"
                label="TOTAL"
                :data-loading="loading"
                big-number-size="big"
            /> -->

            <t-big-number
                number-value="703"
                label="OPEN"
                big-number-size="big"
            />

            <t-big-number
                number-value="80"
                label="NEW IDENTIFIED"
                big-number-size="big"
            />

            <t-big-number
                number-value="55"
                label="RESOLVED"
                big-number-size="big"
            />

            <t-big-number
                number-value="15 days"
                label="MEAN TIME TO RESOLVE"
                big-number-size="big"
            />

        </t-grids>
    </t-container>
</template>

<script>
    export default {
        data: () => ({
            is_filter: true,
        }),
        computed: {
            row() {
                if (this.rows && this.rows.length && !this.loading) {
                    return this.rows[0];
                }
                return null;
            }
        }
    }
</script>