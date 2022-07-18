<template>
    <pdf2 class="max-w-[1440px] relative left-0 right-0 m-auto">
        <t-container slot="mid">
            <t-grids column-count="2" gap-x="2">
                <t-big-number number-value="7525" label="TOTAL" big-number-size="big" />
                <t-big-number number-value="3221" label="UNIQUE" big-number-size="big" />
            </t-grids>
        </t-container>
        <t-container slot="bottom">
            <t-grids column-count="4" gap-x="1">
                <t-big-number label="CRITICAL" big-number-size="small" bg-color="#FFDAD866" text-color="#8F0018" number-value="272">
                    <shield-half-full-icon slot="icon" size="18" />
                </t-big-number/>

                <t-big-number label="HIGH" big-number-size="small" bg-color="#FFDBCC66" text-color="#9B3D15" number-value="3,545">
                    <shield-half-full-icon slot="icon" size="18" />
                </t-big-number>

                <t-big-number label="MEDIUM" big-number-size="small" bg-color="#FFE8CD66" text-color="#925C1E" number-value="3,372">
                    <shield-half-full-icon slot="icon" size="18" />
                </t-big-number>
            </t-grids>
        </t-container>
        <t-table full_width 
            t-layer="issue_table"
            :can-search="false" 
            :is-header-fixed="true" 
            :can-sort="true" 
            sort-direction="desc" 
            :canPageServer="true" 
            :rows-per-page="5"
        />
    </pdf2>
</template>