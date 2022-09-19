<template>
    <div :style="{ color: textColor }" class="grid gap-x-8" :class="isList ? 'grid-cols-4' : 'grid-cols-2'">
        <div v-if="label" class="flex-wrap text-base font-semibold whitespace-nowrap h-max">{{ label }}</div>
        <!-- Is object -->
        <div
            v-if="hasTags"
            class="relative flex flex-wrap items-start w-full text-base gap-x-1 whitespace-nowrap"
            :class="isList && 'col-span-3 flex-col'"
        >
            <div
                v-for="(key, index) in Object.keys(items)"
                :key="key + index"
                class="flex gap-1 items-center"
                :class="isList && 'py-1 text-sm border-b border-[#D3D3D9] w-full'"
            >
                <b v-if="!hideTagKey">{{key}}: </b>
                <div class="flex flex-wrap items-center gap-1">
                    <base-chip :text="tItem" v-for="tItem of items[key]" :key="tItem" />
                </div>
            </div>
            <span v-if="truncatedItemsCount" class="text-[#A2A1AF] py-2 text-sm">
                &nbsp;+ {{ truncatedItemsCount }} more {{ label }}
            </span>
        </div>

        <!-- Is array -->
        <div
            v-else
            class="relative flex flex-wrap items-start w-full text-base whitespace-nowrap"
            :class="[isList && 'col-span-3 flex-col', !areItemsCondensed && 'gap-x-1']"
        >
            <div
                v-for="(item, index) in items"
                :key="item + index"
                :class="isList && 'py-1 text-sm border-b border-[#D3D3D9] w-full'"
            >
                {{ item }}<span v-if="index < items.length - 1 && !isList">{{ seperator }}</span>
            </div>
            <span v-if="truncatedItemsCount" class="text-[#A2A1AF] py-2 text-sm">
                &nbsp;+ {{ truncatedItemsCount }} more {{ label }}
            </span>
        </div>
    </div>
</template>

<script>
    export default {
        props: {
            label: String,
			seperator: {
				type: String,
				default: ','
			},
            visibleItemsCount: {
                type: Number,
                default: 0,
            },
            textColor: {
                type: String,
                default: "#555463",
            },
            isList: {
                type: Boolean,
                default: false,
            },
            hasTags: {
                type: Boolean,
                default: false,
            },
            hideTagKey: {
                type: Boolean,
                default: false,
            },
            values: {
                type: String,
				default: ''
            },
            tValueColumn: {
                type: String,
                default: '',
            },
            tKeyColumn: {
                type: String,
                default: '',
            },
            areItemsCondensed: {
                type: Boolean,
                default: false,
            }
        },
        data: () => ({
            truncatedItemsCount: 0,
            is_filter: true,
        }),
        computed: {
            items() {
                if (this.hasTags) {
                    let tags = this.filterValues.split('|');
                    let items = {};
                    for (let tag of tags) {
                        const split = tag.split('_');
                        const key = split.length > 1 ? split[1] : split[0];
                        const value = split[0];

                        if (items[key]) {
                            items[key].push(value);
                        } else {
                            items[key] = [value];
                        }
                    }

                    let totalCount = Object.keys(items).length;
                    if (this.visibleItemsCount > 0 && totalCount > this.visibleItemsCount) {
                        items = Object.fromEntries(
                            Object.entries(items)
                                .slice(0, this.visibleItemsCount)
                        )
                        this.truncatedItemsCount = totalCount - this.visibleItemsCount;
                    }
                    return items;
                } else {
                    let items = this.filterValues.split('|');
                    if (this.visibleItemsCount > 0 && items.length > this.visibleItemsCount) {
                        this.truncatedItemsCount = items.length - this.visibleItemsCount;
                        items = items.slice(0, this.visibleItemsCount);
                    }
                    return items;
                }
            },
            filterValues() {
                if (this.layer) {
                    return this.layerItems;
                } else {
                    return this.values;
                }
            },
            layerItems() {
                let values = '';
                let selectedIds = this.values.split('|');

                if (this.rows.length && this.tValueColumn && this.tKeyColumn) {
                    for (let index in this.rows) {
                        const row = this.rows[index];
                        const key = row[this.tKeyColumn];
                        const value = row[this.tValueColumn];
                        if (key && value && selectedIds.indexOf(key.value.toString()) > -1) {
                            values += `${value.rendered}|`;
                        }
                    }
                }
                if (values[values.length - 1] == '|') return values.slice(0, -1);
                return values;
            }
        },
    }
</script>