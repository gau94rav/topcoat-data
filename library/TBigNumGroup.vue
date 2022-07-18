<template>
    <t-container is-full-width is-justify-between>
        <t-grids column-count="4" style="width: 100%">
            <!-- <t-big-number
                number-value="703"
                label="OPEN"
                big-number-size="big"
            />

            <t-big-number
                number-value="80"
                label="NEW IDENTIFIED"
                big-number-size="big"
            />

            <t-big-number
                number-value="55"
                label="RESOLVED"
                big-number-size="big"
            />

            <t-big-number
                number-value="15 days"
                label="MEAN TIME TO RESOLVE"
                big-number-size="big"
            /> -->
            <div class="w-full lg:p-5 md:p-3 p-1 rounded-[2px] break-all">
                <div class="flex items-center gap-1">
                    <span class="text-xs font-semibold leading-4 tracking-widest uppercase text-[#555463]">
                        OPEN
                    </span>
                </div>
                <div class="mt-3">
                    <span>
                        <div class="flex items-center gap-2">
                            <span class="text-[#1C1C21] font-normal leading-[60px] text-[40px]">703</span>
                            <span>
                                <svg width="22" height="22" viewBox="0 0 22 22" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path d="M3.6665 11L4.959 12.2925L10.0832 7.17746V18.3333H11.9165V7.17746L17.0315 12.3016L18.3332 11L10.9998 3.66663L3.6665 11Z" fill="#555463"/>
                                </svg>
                            </span>
                        </div>
                        <div class="flex items-center gap-1">
                            <span class="next-period text-sm text-[#1C1C21] leading-[18px] tracking-[0.1px] font-medium">650</span>
                            <span class="operator text-sm text-[#555463] leading-[18px] tracking-[0.1px] font-normal">+</span>
                            <span class="previous-period text-sm text-[#555463] leading-[18px] tracking-[0.1px] font-normal">8% previous period</span>
                        </div>
                    </span>
                </div>
            </div>
            <div class="w-full lg:p-5 md:p-3 p-1 rounded-[2px] break-all">
                <div class="flex items-center gap-1">
                    <span class="text-xs font-semibold leading-4 tracking-widest uppercase text-[#555463]">
                        NEW IDENTIFIED
                    </span>
                </div>
                <div class="mt-3">
                    <span>
                        <div class="flex items-center gap-2">
                            <span class="text-[#1C1C21] font-normal leading-[60px] text-[40px]">80</span>
                            <span>
                                <svg width="22" height="22" viewBox="0 0 22 22" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path d="M3.6665 11L4.959 12.2925L10.0832 7.17746V18.3333H11.9165V7.17746L17.0315 12.3016L18.3332 11L10.9998 3.66663L3.6665 11Z" fill="#555463"/>
                                </svg>
                            </span>
                        </div>
                        <div class="flex items-center gap-1">
                            <span class="next-period text-sm text-[#1C1C21] leading-[18px] tracking-[0.1px] font-medium">76</span>
                            <span class="operator text-sm text-[#555463] leading-[18px] tracking-[0.1px] font-normal">+</span>
                            <span class="previous-period text-sm text-[#555463] leading-[18px] tracking-[0.1px] font-normal">2% previous period</span>
                        </div>
                    </span>
                </div>
            </div>
            <div class="w-full lg:p-5 md:p-3 p-1 rounded-[2px] break-all">
                <div class="flex items-center gap-1">
                    <span class="text-xs font-semibold leading-4 tracking-widest uppercase text-[#555463]">
                        RESOLVED
                    </span>
                    <span class="relative">
                        <div class="base-tooltip text-center absolute -top-[70px] -left-[110px] w-[240px] bg-[#1C1C21] rounded pt-[6px] px-[10px] pb-2">
                            <div class="text-[#ffffff] text-sm font-normal leading-[18px] traking-[0.1px]">Additional info on what this means perhaps with a <a href="#" class="pointer underline hover:underline">link to docs</a></div>
                            <div class="tooltip-arrow">
                            </div>
                         </div>
                        <svg width="12" height="12" viewBox="0 0 12 12" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M5.5 9H6.5V8H5.5V9ZM6 1C3.24 1 1 3.24 1 6C1 8.76 3.24 11 6 11C8.76 11 11 8.76 11 6C11 3.24 8.76 1 6 1ZM6 10C3.795 10 2 8.205 2 6C2 3.795 3.795 2 6 2C8.205 2 10 3.795 10 6C10 8.205 8.205 10 6 10ZM6 3C4.895 3 4 3.895 4 5H5C5 4.45 5.45 4 6 4C6.55 4 7 4.45 7 5C7 6 5.5 5.875 5.5 7.5H6.5C6.5 6.375 8 6.25 8 5C8 3.895 7.105 3 6 3Z" fill="#727184"/>
                        </svg>
                    </span>
                </div>
                <div class="mt-3">
                    <span>
                        <div class="flex items-center gap-2">
                            <span class="text-[#1C1C21] font-normal leading-[60px] text-[40px]">55</span>
                            <span>
                                <svg width="22" height="22" viewBox="0 0 22 22" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path d="M4.84368 10.0834L15.9995 10.0834L15.9995 11.9167L4.84368 11.9167L4.84368 10.0834Z" fill="#B3B2BD"/>
                                </svg>
                            </span>
                        </div>
                        <div class="flex items-center gap-1">
                            <span class="next-period text-sm text-[#1C1C21] leading-[18px] tracking-[0.1px] font-medium">55</span>
                            <span class="operator text-sm text-[#555463] leading-[18px] tracking-[0.1px] font-normal"></span>
                            <span class="previous-period text-sm text-[#555463] leading-[18px] tracking-[0.1px] font-normal">No change</span>
                        </div>
                    </span>
                </div>
            </div>
            <div class="w-full lg:p-5 md:p-3 p-1 rounded-[2px] break-all">
                <div class="flex items-center gap-1">
                    <span class="text-xs font-semibold leading-4 tracking-widest uppercase text-[#555463]">
                        MEAN TIME TO RESOLVE
                    </span>
                    <span>
                        <svg width="12" height="12" viewBox="0 0 12 12" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M5.5 9H6.5V8H5.5V9ZM6 1C3.24 1 1 3.24 1 6C1 8.76 3.24 11 6 11C8.76 11 11 8.76 11 6C11 3.24 8.76 1 6 1ZM6 10C3.795 10 2 8.205 2 6C2 3.795 3.795 2 6 2C8.205 2 10 3.795 10 6C10 8.205 8.205 10 6 10ZM6 3C4.895 3 4 3.895 4 5H5C5 4.45 5.45 4 6 4C6.55 4 7 4.45 7 5C7 6 5.5 5.875 5.5 7.5H6.5C6.5 6.375 8 6.25 8 5C8 3.895 7.105 3 6 3Z" fill="#727184"/>
                        </svg>
                    </span>
                </div>
                <div class="mt-3">
                    <span>
                        <div class="flex items-center gap-2">
                            <span class="text-[#1C1C21] font-normal leading-[60px] text-[40px]">15 days</span>
                            <span>
                                <svg width="22" height="22" viewBox="0 0 22 22" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path d="M3.6665 11L4.959 12.2925L10.0832 7.17746V18.3333H11.9165V7.17746L17.0315 12.3016L18.3332 11L10.9998 3.66663L3.6665 11Z" fill="#555463"/>
                                </svg>
                            </span>
                        </div>
                        <div class="flex items-center gap-1">
                            <span class="next-period text-sm text-[#1C1C21] leading-[18px] tracking-[0.1px] font-medium">18 days</span>
                            <span class="operator text-sm text-[#555463] leading-[18px] tracking-[0.1px] font-normal">+</span>
                            <span class="previous-period text-sm text-[#555463] leading-[18px] tracking-[0.1px] font-normal">12% previous period</span>
                        </div>
                    </span>
                </div>
            </div>
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