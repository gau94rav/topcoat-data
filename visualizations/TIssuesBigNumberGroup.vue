<template>
    <t-container is-full-width is-justify-between>
        <t-grids column-count="2" style="width: 48.5%">
            <t-big-number
                :number-value="row ? row.TOTAL.rendered: '--'"
                label="TOTAL"
                :data-loading="loading"
                big-number-size="big"
            />

            <t-big-number
                :number-value="row ? row.TOTAL_UNIQUE.rendered: '--'"
                label="UNIQUE"
                :data-loading="loading"
                big-number-size="big"
            />
        </t-grids>
        <t-grids column-count="4" gap-x="1">
            <t-big-number
                :number-value="row ? row.CRITICAL.rendered: '--'"
                label="CRITICAL"
                :data-loading="loading"
                big-number-size="small"
                bg-color="#FFDAD866"
                text-color="#8F0018"
            >
                <shield-half-full-icon slot="icon" size="18" />
            </t-big-number/>

            <t-big-number
                :number-value="row ? row.HIGH.rendered: '--'"
                label="HIGH"
                :data-loading="loading"
                big-number-size="small"
                bg-color="#FFDBCC66"
                text-color="#9B3D15"
            >
                <shield-half-full-icon slot="icon" size="18" />
            </t-big-number>

            <t-big-number
                :number-value="row ? row.MEDIUM.rendered: '--'"
                label="MEDIUM"
                :data-loading="loading"
                big-number-size="small"
                bg-color="#FFE8CD66"
                text-color="#925C1E"
            >
                <shield-half-full-icon slot="icon" size="18" />
            </t-big-number>

            <t-big-number
                :number-value="row ? row.LOW.rendered: '--'"
                label="LOW"
                :data-loading="loading"
                big-number-size="small"
                bg-color="#EEEEEE66"
            >
                <shield-half-full-icon slot="icon" size="18" />
            </t-big-number>
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