<template>
	<div class="relative w-max dropdown-filter">
		<label class="pb-1 text-sm font-medium" v-if="label">
			{{ label }}
		</label>
		<div
			@click="popup = !popup"
			class="border-[#C3C2CB] cursor-pointer bg-white text-[13px] text-[#555463] flex gap-1 items-center border-1 rounded py-1 px-3 hover:border-[#727184] hover:text-[#727184]"
			:class="{ 'mt-[5px]': label }"
		>
			All Products
			<i class="fas fa-caret-down" />
		</div>
		<div v-show="popup" class="base-dropdown-menu w-[254px] shadow-md absolute z-[9999] bg-white rounded-lg mt-1">
			<div class="px-[12px] pt-[16px] pb-[8px] flex justify-between items-center">
				<h6 class="text-[10px] text-[#727184] font-semibold uppercase leading-[15px]">Products</h6>
				<span class="text-[#145DEB] text-[13px] cursor-pointer font-normal leading-[18px]">Reset</span>
			</div>

			<div class="px-[8px] pt-[4px] pb-[6px]">
                <!-- <small v-if="activeSection === 'all' && !pages.all.length">No reports found.</small>
                <small v-else-if="activeSection === 'favorites' && !pages.favorites.length">No favorites found.</small>
                <small v-else-if="activeSection === 'recents' && !pages.recents.length">No recents found.</small> -->

				<ul class="max-h-[200px] overflow-auto">
					<li
						class="flex justify-between px-[8px] py-[6px] text-sm cursor-pointer text-[#555463]"
						v-for="(page, index) in pages[activeSection].filter(p => p.url.toLowerCase().includes(search))"
						:key='index'
						:class="navSelected(page.url, 'text-[#1c1c21]', 'text-[#555463]')"
					>
                        <a :href="page.url" class="flex items-center justify-between w-full hover:text-[#1C1C21] leading-[16.41px]">
						    {{ page.title }}
							<span
							 	v-if="selected === page.url"
								style="color: #0F47C6"
								class="flex items-center h-full"
							>
								<check-icon />
							</span>
                        </a>
						<div v-if="activeSection !== 'favorites'" class="flex items-center gap-1 selected-report">
							<span
								v-if="pages.favorites.filter(favorite => favorite.url === page.url).length > 0"
								style="color: #FFE792"
							>
								<star-icon @click="pages.favorites = pages.favorites.filter(favorite => favorite.url !== page.url)" />
							</span>
							<span v-else style="color: #C3C2CB">
								<star-outline-icon @click="pages.favorites = [...pages.favorites, page]" />
							</span>
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
            activeSectionKey: {
                type: String,
                default: 'active'
            },
			label: String,
            defaultValue: String,
            daysDifference: {
                type: Number,
                default: 7,
            },
		},
        mounted() {
            this.pages.all = this.project.nav;
        },
		data: () => ({
            activeSection: 'all',
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
                // {
                //     label: 'Favorites',
                //     key: 'favorites',
                // },
            ],
			popup: false,
			search: '',
		}),
		computed: {
            selected() {
                return window.location.pathname.substring(1);
            }
		},
	}
</script>

<style>
	.dropdown-filter .vue--search-input__field {
		@apply !rounded-md !bg-[#e4e3e8] !opacity-[0.5];
	}
</style>