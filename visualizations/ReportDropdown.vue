<template>
	<div class="relative cursor-pointer w-max reports-drodown-filter">
		<label class="pb-1 text-sm font-medium" v-if="label">
			{{ label }}
		</label>
		<div
			@click="popup = !popup"
			class="border-[#C3C2CB] bg-white text-sm text-[#555463] flex gap-1 items-center border-1 rounded py-2 px-3 hover:border-[#727184] hover:text-[#727184]"
			:class="{ 'mt-[5px]': label }"
		>
			<img src="https://snyk-insights.topcoatdata.app/static/snyk-insights/report/images/report.svg" />
			Selected Report
			<t-loading-spinner v-if="loading" position="relative" />
			<i class="fas fa-caret-down" v-else />
		</div>
		<div v-show="popup" class="absolute z-[9999] mt-1 bg-white rounded-lg shadow-md base-dropdown-menu w-max">
			<div class="px-2 pt-4 pb-2 border-b border-[#E4E3E8]">
				<h6 class="text-xs text-[#727184] tracking-[0.1em]">CHOOSE REPORT</h6>
				<ul class="inline-flex gap-2 mt-2 base-tabs">
					<li
						class="p-2 rounded-lg text-xs cursor-pointer text-[#1c1c21]"
						v-for="pane in panes"
						:key="pane.key"
						:class="activeSection === pane.key ? 'bg-[#eaf1ff] text-[#0F47C6]' : 'text-[#1c1c21]'"
						@click="activeSection = pane.key"
					>
                        {{ pane.label }}
					</li>
				</ul>
			</div>

			<div class="px-2 py-2">
				<base-search-input
					class="mt-0 mb-3 text-sm search-report !rounded-md" 
					placeholder="Search Reports"
					size="small"
					clearable
					v-model="search"
				/>
				<small v-if="!items.length && !loading">
					<span v-if="activeSection === 'all'">No reports found.</span>
					<span v-else-if="activeSection === 'favorites'">No favorites found.</span>
					<span v-else>No recents found.</span>
				</small>
				<ul class="px-2 max-h-[200px] overflow-auto col-right">
					<li
						class="flex justify-between mb-3 text-sm cursor-pointer"
						v-for="item in items"
						:key="item"
						:class="selected == item.id ? 'text-[#1c1c21]' : 'text-[#555463]'"
					>
                        <div @click="selected = item.id" class="flex items-center justify-between w-full">
						    {{ item.name }}
                            <img v-if="selected == item.id" class="w-4 h-3" src="https://snyk-insights.topcoatdata.app/static/snyk-insights/report/images/tick.svg" />
                        </div>
						<div class="flex items-center gap-1 selected-report">
                            <div v-if="showFavorites && activeSection !== 'favorites'">
                                <img
                                    src="https://snyk-insights.topcoatdata.app/static/snyk-insights/report/images/star.svg"
                                    @click="favorites = favorites.filter(id => id !== item.id)"
                                    v-if="favorites.filter(id => id === item.id).length > 0"
                                />
                                <img
                                    src="https://snyk-insights.topcoatdata.app/static/snyk-insights/report/images/star-outline.svg"
                                    @click="favorites = [...favorites, item.id]"
                                    v-else
                                />
                            </div>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
</template>

<script>
	export default {
		props: {
			label: String,
            defaultValue: String,
            daysDifference: {
                type: Number,
                default: 7,
            },
            showFavorites: {
                type: Boolean,
                default: false,
            },
		},
		data: () => ({
			activeSection: 'all',
			favorites_internal: [],
			is_filter: true,
			popup: false,
			search: '',
            selected_internal: null,
		}),
		computed: {
			items() {
				const idColumn = this.findColumnByTag('ids');
                const nameColumn = this.findColumnByTag('names');
				const dateColumn = this.findColumnByTag('dates');

                const ids = this.getColumn(idColumn);
                const names = this.getColumn(nameColumn);
				const dates = this.getColumn(dateColumn);

                const data = [];
                if (ids && names) {
                    for (let index in ids) {
                        const id = ids[index];

                        if (this.activeSection === 'favorites' && this.favorites_internal.indexOf(id) < 0) continue;

                        const name = names[index];
						const date = dates[index] || null;

						if (this.search && name) {
							if (!name.toLowerCase().includes(this.search.toLowerCase())) continue;
						}

                        if (this.activeSection === 'recents') {
                            if (date) {
                                const dateObject = new Date(date);
                                const currentDate = new Date();
                                const timeDifference = currentDate.getTime() - dateObject.getTime();
                                const daysDifference = Math.floor(timeDifference / (1000 * 3600 * 24));
                                if (daysDifference > this.daysDifference) continue;
                            } else continue;
                        }
                        data.push({
							id,
							name,
							date,
						});
                    }
                }
                return data;
			},
            panes() {
                let panes = [
                    {
                        label: 'All',
                        key: 'all',
                    },
                    {
                        label: 'Favorites',
                        key: 'favorites',
                    },
                    {
                        label: 'Recents',
                        key: 'recents',
                    },
                ]
                if (!this.showFavorites) {
                    return panes.filter(pane => pane.key !== 'favorites');
                }
                return panes;
            },
			selected: {
				get() {
                    return this.selected_internal;
				},
				set(id) {
                    this.selected_internal = id;
                    this.setFilterValue("selected_report", id, true);
				}
			},
            favorites: {
                get() {
                    return this.favorites_internal || [];
                },
                set(ids) {
                    this.favorites_internal = ids;
                    this.setFilterValue("favorite_reports", ids.join("|"), true);
                }
            }
		},
		methods: {
			onVisualizationInit() {
                this.handleSelectedItems();
                this.handleFavoriteItems();
			},
            handleSelectedItems() {
                const initial_value = this.getFilterValue("selected_report");

                if (initial_value) {
                    this.selected_internal = initial_value;
                } else if (this.config.default_value) {
                    this.selected_internal = this.config.default_value;
                } else if (this.defaultValue) {
                    this.selected_internal = this.defaultValue;
                } else {
                    return null;
                }
                this.setFilterValue("selected_report", this.selected_internal, true);
            },
            handleFavoriteItems() {
                const initial_value = this.getFilterValue("favorite_reports");

                if (initial_value) {
                    this.favorites_internal = initial_value.split('|');
                } else if (this.config.default_value) {
                    this.favorites_internal = this.config.default_value;
                } else if (this.defaultValue) {
                    this.favorites_internal = this.defaultValue;
                } else {
                    return null;
                }
                this.setFilterValue("favorite_reports", this.favorites_internal, true);
            }
		},
	}
</script>

<style>
	.reports-drodown-filter .vue--search-input__field {
		@apply !rounded-md !bg-[#e4e3e8] !opacity-[0.5];
	}
  /* ----------------------------- scroll bar ----------------------- */
  .col-right::-webkit-scrollbar-track {
    border-radius: 10px;
    margin: 4px;
  }
  .col-right::-webkit-scrollbar {
    width: 6px;
  }
  .col-right::-webkit-scrollbar-thumb {
    border-radius: 10px;
    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,.3);
    background-color: #F6F7FB;
  }
</style>