<template>
	<div
		class="relative font-sans cursor-pointer w-max dropdown-filter"
		@mouseover="setActiveState"
		@mouseleave="setActiveState($event, false)"
		ref="dropdownFilter"
	>
		<div
			@click="setPopup(!popup)"
			class="flex items-center gap-1 py-1 text-sm rounded cursor-pointer border-1"
			:class="active ? 'active' : 'in-active'"
		>
      <span style="color: #145DEB" class="pl-2">
        <chart-timeline-variant-shimmer-icon size="18" />
      </span>
      {{ label }}
      <menu-down-icon size="20" class="pr-1" />
		</div>
		<div
			v-show="popup"
			ref="popup"
			class="base-dropdown-menu w-max shadow-md absolute z-[9999] bg-white rounded-lg mt-1"
			:class="alignClass"
		>
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

			<div class="px-2 pt-2">
				<base-search-input
					class="mt-0 mb-3 text-sm search-report !rounded-md" 
					placeholder="Search Reports"
					size="small"
					clearable
					v-model="search"
				/>

          <small v-if="activeSection === 'all' && !pages.all.length">No reports found.</small>
          <small v-else-if="activeSection === 'favorites' && !pages.favorites.length">No favorites found.</small>
          <small v-else-if="activeSection === 'recents' && !pages.recents.length">No recents found.</small>
				<ul class="px-2 max-h-[200px] overflow-auto">
					<li
						class="flex justify-between mb-3 text-sm cursor-pointer hover:text-[#1c1c21]"
						v-for="(page, index) in pages[activeSection].filter(p => p.url.toLowerCase().includes(search))"
						:key='index'
						:class="navSelected(page.url, 'text-[#1c1c21]', 'text-[#555463]')"
					>
            <a :href="page.url" class="flex items-center justify-between w-full">
						  {{ page.title }}
							<span
							 	v-if="selected === page.url"
								style="color: #0F47C6"
								class="flex items-center h-full"
							>
								<check-icon />
							</span>
            </a>
					</li>
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
		},
        mounted() {
			if (this.pages) {
            	this.pages.all = this.project.nav;
			}
        },
		data: () => ({
			active: false,
            activeSection: 'all',
			alignClass: '',
            favorites: [],
            pages: {
                all: [],
                favorites: [],
            },
            panes: [
                {
                    label: 'All',
                    key: 'all',
                },
            ],
			popup: false,
			search: '',
		}),
		computed: {
            selected() {
                return window.location.pathname.substring(1);
            },
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
			setActiveState(e, state = true) {
				if (!state && this.popup) return;
				this.active = state;
			},
			setPopup(toggle) {
				this.popup = toggle;
				this.active = toggle;

				if (toggle) {
					console.log('active')
					document.body.addEventListener("click", this.handleOutsideClick);
				} else {
					console.log('in-active')
					document.body.removeEventListener("click", this.handleOutsideClick);
				}

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