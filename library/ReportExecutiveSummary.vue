<template>
  <div>
    <report-header v-if="hasHeader" />
    <div class="bg-[#F9F9FA]">
      <div class="flex w-full gap-10 content-block">
        <div class="w-full relative">
          <!-- <div class="z-1 fixed opacity-20 w-full flex justify-center mt-[100px]">
            <svg style="width:500px;height:500px" viewBox="0 0 24 24">
              <path fill="currentColor" d="M1 11H4V13H1V11M10 22C10 22.6 10.4 23 11 23H13C13.6 23 14 22.6 14 22V21H10V22M13 1H11V4H13V1M4.9 3.5L3.5 4.9L5.6 7L7 5.6L4.9 3.5M20 11V13H23V11H20M19.1 3.5L17 5.6L18.4 7L20.5 4.9L19.1 3.5M18 12C18 14.2 16.8 16.2 15 17.2V19C15 19.6 14.6 20 14 20H10C9.4 20 9 19.6 9 19V17.2C7.2 16.2 6 14.2 6 12C6 8.7 8.7 6 12 6S18 8.7 18 12M8 12C8 12.35 8.05 12.68 8.14 13H15.86C15.95 12.68 16 12.35 16 12C16 9.79 14.21 8 12 8S8 9.79 8 12Z" />
            </svg>
          </div> -->
          <div class="flex flex-wrap justify-between items-center w-full py-4 px-6 border-b border-[#E4E3E8] md:flex-row flex-col gap-1">
            <slot name="filters"></slot>
          </div>
          <div class="w-full px-6 py-5 border-b border-[#E4E3E8]">
           <div class="pb-[18px]">
              <span class="base-heading text-xl font-normal text-[#211F47] leading-6">Issues in {Group}</span>
           </div>   
           <t-big-num-group></t-big-num-group>
          </div>
          <div class="pt-6 pb-4 w-full px-6 bg-[#ffffff]">
              <span class="text-base font-medium text-[#211F47] leading-6">Issues Identification and Resolution</span>
              <div class="w-full">
                <img :src="'/static/' + whoami.instance_name + '/images/line-chart.jpg'" />
              </div>
          </div>
          <div class="pt-6 pb-4 w-full px-6 bg-[#ffffff]">
            <div class="grid grid-cols-2">
              <div>
                <span class="text-base font-medium text-[#211F47] leading-6">Exposure Window</span>
                <div class="w-full">
                  <img :src="'/static/' + whoami.instance_name + '/images/Chart.jpg'" />
                </div>
              </div>
              <div>
                <span class="text-base font-medium text-[#211F47] leading-6">Mean time to resolve</span>
                <div class="w-full">
                  <img :src="'/static/' + whoami.instance_name + '/images/Chart 2.jpg'" />
                </div>
              </div>
            </div>
          </div>
          <div class="py-5 px-6 bg-[#ffffff] border-t border-[#E4E3E8]">
            <div class=" pb-[18px] justify-between flex">
              <span  class="base-heading text-xl font-normal text-[#211F47] leading-6">Top Sources of Risk</span>
              <t-button></t-button>
            </div>
            <!-- Start Table -->
            <t-sources-risk-table />
            <!-- End Table -->
          </div>
        </div>
      </div>
    </div>
    <report-footer />
  </div>
</template>
<style>
  body {
  @apply bg-[#F6F7FB];
  }
</style>
<script>
  export default {
    data:()=>({
      is_filter:true,
      popup:false
    }),
    props: {
      // to hide header use this prop
      hasHeader: {
        type: Boolean,
        default: false,
      },
      showSidebar: {
        type: Boolean,
        default: false,
      }
    },
  };
</script>