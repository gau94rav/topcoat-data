<SidebarFilters>
    <t-checkbox-group
        t-layer='key_value_layer'
        slot="filters"
        is-label-capitalized
        label="Tags"
        t-filter:selected_items="tags"
        :is-expanded="false"
        :is-inline="false"
    />
</SidebarFilters>