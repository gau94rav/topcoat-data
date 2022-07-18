<template>
	<div class="relative w-max dropdown-filter bg-[#ffffff]">
		<label class="pb-1 text-sm font-medium" v-if="label">
			{{ label }}
		</label>
		<div
			@click="popup = !popup"
			class="border-[#C3C2CB] cursor-pointer text-[13px] text-[#555463] flex gap-1 items-center border-1 rounded py-1 px-3 hover:border-[#727184] hover:text-[#727184]"
			:class="{ 'mt-[5px]': label }"
		>
			Filters
			<i class="fas fa-caret-down" />
		</div>
		<div v-show="popup" class="base-dropdown-menu w-[294px] shadow-md absolute z-[9999] bg-white rounded-lg mt-1">
			<div class="px-[12px] pt-[16px] pb-[8px] flex justify-between items-center">
				<h6 class="text-[10px] text-[#727184] font-semibold uppercase leading-[15px]">Filters</h6>
				<span class="text-[#145DEB] text-[13px] cursor-pointer font-normal leading-[18px]">Clear All</span>
			</div>

			<div class="px-[12px] pt-[4px] pb-[9px]">
				<base-search-input
					class="mt-0 text-sm" 
					placeholder="Search for a filter"
					size="small"
					clearable
					v-model="search"
				/>
			</div>
			<div class="expandable-list relative px-[16px] py-[9px] border-[#E4E3E8] border-t">
				<div class="expandable-list-item flex justify-between items-center cursor-pointer">
					<div class=""><span class="text-[#A2A1AF] mr-[8px]"><i class="fas fa-chevron-right"></i></span> <span class="text-[#555463] text-[14px] font-normal leading-4 tracking-[0.1px]">Introduced Date</span></div>
				</div>
			</div>
			<div class="expandable-list relative border-[#E4E3E8] border-t">
				<div class="expandable-list-item active flex justify-between items-center px-[16px] py-[9px] cursor-pointer">
					<div class=""><span class="text-[#A2A1AF] mr-[8px]"><i class="fas fa-chevron-right"></i></span> <span class="text-[#1C1C21] text-[14px] font-medium leading-4 tracking-[0.1px]">Issue Status</span></div>
					<div class="text-[#145DEB] text-[8px]"><i class="fas fa-circle"></i></div>
				</div>
				<div class="expandable-menu px-[16px] pb-[8px]">
					<span class="text-[#7FA7F5] text-[13px] font-normal cursor-pointer">Clear</span>
				</div>
				<div class="py-[8px] px-[16px]">
					<slot></slot>
				</div>
			</div>
			<div class="expandable-list relative px-[16px] py-[9px] border-[#E4E3E8] border-t">
				<div class="expandable-list-item flex justify-between items-center cursor-pointer">
					<div class=""><span class="text-[#A2A1AF] mr-[8px]"><i class="fas fa-chevron-right"></i></span> <span class="text-[#555463] text-[14px] font-normal leading-4 tracking-[0.1px]">Priority Score</span></div>
					<div class="text-[#145DEB] text-[8px]"><i class="fas fa-circle"></i></div>
				</div>
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