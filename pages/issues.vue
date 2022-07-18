<template>
    <report
        show-header
    >
        <!-- Filters -->
        <div class="flex flex-wrap gap-2 sm:mt-2 md:mt-2 lg:mt-0 xl:mt-0 2xl:mt-0" slot="filters">
            <t-nav-dropdown 
                label="Selected Report Name"
            />
            <t-new-select
                label="Products"
                t-layer="product_layer"
                t-filter:dropdown="selected"
                menu-label="Products"
            />
            <t-expandable-grouping />
        </div>     
        <report-export-button slot="filters" />
        <t-new-select
            label="Severity"
            t-layer="product_layer"
            t-filter:dropdown="selected"
            menu-label="Products"
            slot="status-filter"
        />
        <!-- Lower Visualizations -->
        <div class="flex gap-2" slot="action-filters">
          <t-new-select
            label="Group by none"
            t-layer="table_group_by"
            t-filter:dropdown="selected"
            menu-label="Group by"
            slot="status-filter"
          />
          <t-new-select
            label="Modify Columns"
            t-layer="product_layer"
            t-filter:dropdown="selected"
            menu-label="Products"
            slot="status-filter"
          />
          <t-button />
        </div>
        <!-- <activity />
        <t-grids column-count="2" gap-x="4">
            <activity />
            <activity />
        </t-grids>
        <activity /> -->
        <!-- <t-base-table /> -->
        <t-issue-table />
    </report>
</template>