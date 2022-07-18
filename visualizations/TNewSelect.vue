<template>
	<div
		class="relative font-sans cursor-pointer w-max dropdown-filter"
		@mouseover="setActiveState"
		@mouseleave="setActiveState($event, false)"
		ref="dropdownFilter"
	>
		<div
			@click="setPopup(!popup)"
			class="flex items-center gap-1 py-1 pl-1 text-sm rounded cursor-pointer border-1"
			:class="active ? 'active' : 'in-active'"
		>
			<div class="pl-1">
				<slot name="icon"></slot>
			</div>
			<span>{{ label }}</span>

			<t-loading-spinner v-if="loading" position="relative" />
			<menu-down-icon v-else size="20" class="pr-1" />
		</div>
		<div
			v-show="popup"
			ref="popup"
			class="base-dropdown-menu w-[254px] shadow-md absolute z-[9999] bg-white rounded-lg mt-1"
			:class="alignClass"
		>
			<div class="px-[12px] pt-[16px] pb-[8px] flex justify-between items-center" v-if="menuLabel">
				<h6 class="text-[10px] text-[#727184] font-semibold uppercase leading-[15px]">
                    {{ menuLabel }}
                </h6>
			</div>
			<div class="px-[8px] pt-[4px] pb-[6px]">
				<ul class="max-h-[200px] overflow-auto">
					<li
                        class="flex justify-between px-[8px] py-[6px] text-sm cursor-pointer text-[#555463]"
                        v-for="item in menu"
                        :key="item"
						@click="selectItem(item)"
                    >
                        <div class="flex items-center justify-between w-full hover:text-[#1C1C21] leading-[16.41px]">
						    {{ item.title }}
							<span
								style="color: #0F47C6"
								class="flex items-center h-full"
								v-show="selected_internal === item.value"
								class="absolute m-auto right-2"
							>
								<check-icon />
							</span>
                        </div>
					</li>
                    <small v-if="!options.length && !loading">
                        No items found
                    </small>
				</ul>
			</div>
		</div>
	</div>
</template>

<script>
	export default {
		props: {
			label: {
				type: String,
				default: 'Select'
			},
            menuLabel: {
                type: String,
				default: ''
            }
		},
		data: () => ({
            active: false,
			alignClass: '',
			popup: false,
			is_filter: true,
            selected_internal: '',
		}),
		computed: {
            labels() {
                try {
                    const column_name = this.findColumnByTag('labels');
                    return this.getColumn(column_name);
                } catch (err) {
                    return []
                }
            },
            options() {
                try {
                    const column_name = this.findColumnByTag('options');
                    return this.getColumn(column_name);
                } catch (err) {
                    return []
                }
            },
			menu() {
                const values = this.options;
                const titles = this.labels;
                const menu = [];

                if (values && titles) {
                    for (let index in values) {
                        const value = values[index];
                        const title = titles[index];
                        menu.push({ value, title });
                    }
                }
                return menu;
            }
		},
		methods: {
			alignPopup() {
				const element = this.$refs.popup;

				if (element) {
					const bounding = element.getBoundingClientRect();
					const availableWidth = window.innerWidth;

					if (bounding.x < 0) {
						return this.alignClass = 'left-0';
					} else if (bounding.x + bounding.width > availableWidth) {
						return this.alignClass = 'right-0';
					}
				}
				return this.alignClass = '';
			},
			handleOutsideClick(event) {
				const container = this.$refs.dropdownFilter;
				if (container && event && !container.contains(event.target)) {
					this.popup = false;
					this.active = false;

					document.body.removeEventListener("click", this.handleOutsideClick);

					this.$nextTick(() => {
						this.alignPopup();
					})
				}
			},
            onVisualizationInit() {
                // See if the page was loaded with a url param value
                const initial_value = this.getFilterValue("dropdown");
                const column_name = this.findColumnByTag('labels');

                if (initial_value) {
                    this.selected_internal = initial_value;
                } else if (this.config.default_value) {
                    this.selected_internal = this.config.default_value;
                }
                this.setFilterValue("dropdown", this.selected_internal, true);
            },
			setActiveState(e, state = true) {
				if (!state && this.popup) return;
				this.active = state;
			},
            selectItem(item) {
                this.selected_internal = item.value;
                this.setFilterValue("dropdown", this.selected_internal, true);
                this.showMenu = false;
            },
			setPopup(toggle) {
				if (toggle) {
					document.body.addEventListener("click", this.handleOutsideClick);
				} else {
					document.body.removeEventListener("click", this.handleOutsideClick);
				}
				this.popup = toggle;
				this.active = toggle;
				this.$nextTick(() => {
					this.alignPopup();
				})
			},
		}
	}
</script>

<style>
	.dropdown-filter .vue--search-input__field {
		@apply !rounded-md !bg-[#e4e3e8] !opacity-[0.5];
	}

	.dropdown-filter .active {
		@apply border-[#145DEB] text-[#145DEB] bg-[#EAF1FF];
	}

	.dropdown-filter .in-active {
		@apply border-[#C3C2CB] text-[#555463] bg-white;
	}
</style>