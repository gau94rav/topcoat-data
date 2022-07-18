<template>
    <div>
        <div class="px-10 py-5">
            <pdf-header />
            <div class="flex gap-4">
                <div class="w-3/5">
                    <div class="text-[#555463] text-base font-medium leading-6">
                        Group Name / {Organization Name}
                    </div>
                    <div class="text-[#1C1C21] text-[26px] font-semibold leading-[39px]">
                        {Saved report name}
                    </div>
                </div>
                <div class="w-2/5">
                    <div class="text-[#727184] text-[16px] font-normal leading-[29px]">
                        Report Generated
                    </div>
                    <div class="text-[#727184] text-xl font-normal leading-[29px]">
                        <span class="text-[#727184] text-xl font-bold leading-[29px]">2022 06 03</span> by <span class="text-[#727184] text-xl font-bold leading-[29px]">User Name</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="px-10 py-7">
            <div class="flex gap-4">
                <div class="w-3/5">
                    <div class="filters-aqpplied">
                        <div class="flex items-center gap-3 pb-[17px]">
                            <span class="text-[#441C99]">
                              <svg style="width:24px;height:24px" viewBox="0 0 24 24">
                                <path fill="currentColor" d="M6,13H18V11H6M3,6V8H21V6M10,18H14V16H10V18Z" />
                              </svg>
                            </span>
                            <span class="text-[#1C1C21] font-medium leading-6 text-xl">Filters Applied</span>
                        </div>
                        <div class="grid grid-cols-2 gap-4">
                          <div>
                            <table class="w-full">
                                <tbody>
                                    <tr class="align-top">
                                        <td class="text-[base] text-[#555463] font-semibold leading-[19px] tracking-[0.17px] py-2">
                                            Data Range
                                        </td>
                                        <td class="text-[base] text-[#727184] font-normal leading-[19px] tracking-[0.17px] py-2">
                                            <span>Open since Jun 1, 2021</span><br/>
                                            <span>Fixed before Jun 21, 2022</span>
                                        </td>
                                    </tr>
                                    <tr class="align-top">
                                        <td class="text-[base] text-[#555463] font-semibold leading-[19px] tracking-[0.17px] py-2">
                                            Product Type
                                        </td>
                                        <td class="text-[base] text-[#727184] font-normal leading-[19px] tracking-[0.17px] py-2">
                                            Open Source, Cloud
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="text-[base] text-[#555463] font-semibold leading-[19px] tracking-[0.17px] py-2">
                                            Severity Level
                                        </td>
                                        <td class="flex items-center gap-2 py-2">
                                            <div class="rounded items-center leading-[18px] flex px-2 py-[5px] text-[#AB1A1A] border border-[#AB1A1A]">
                                                Critical
                                            </div>
                                            <div class="rounded items-center leading-[18px] flex px-2 py-[5px] text-[#CE5019] border border-[#CE5019]">
                                                High
                                            </div>
                                            <div class="rounded items-center leading-[18px] flex px-2 py-[5px] text-[#D68000] border border-[#D68000]">
                                                Medium
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="text-[base] text-[#555463] font-semibold leading-[19px] tracking-[0.17px] py-2">
                                            Status
                                        </td>
                                        <td class="text-[base] text-[#727184] font-normal leading-[19px] tracking-[0.17px] py-2">
                                            Open, Patched, Ignored
                                        </td>
                                    </tr>
                                    <tr class="align-top">
                                        <td class="text-[base] text-[#555463] font-semibold leading-[19px] tracking-[0.17px] py-2">Project Scope</td>
                                        <td class="pt-[12px] pb-[17px]">
                                            <div class="tracking-[0.1px] border-b border-[#D3D3D9] text-sm text-normal text-[#727184] leading-[17px] py-2">path<span class="text-[#145DEB]">/package.json</span></div>
                                            <div class="tracking-[0.1px] border-b border-[#D3D3D9] text-sm text-normal text-[#727184] leading-[17px] py-2">path<span class="text-[#145DEB]">/package.json</span></div>
                                            <div class="tracking-[0.1px] border-b border-[#D3D3D9] text-sm text-normal text-[#727184] leading-[17px] py-2">path<span class="text-[#145DEB]">/package.json</span></div>
                                            <div class="tracking-[0.1px] border-b border-[#D3D3D9] text-sm text-normal text-[#727184] leading-[17px] py-2">path<span class="text-[#145DEB]">/package.json</span></div>
                                            <div class="tracking-[0.1px] border-b border-[#D3D3D9] text-sm text-normal text-[#727184] leading-[17px] py-2">path<span class="text-[#145DEB]">/package.json</span></div>
                                            <div class="tracking-[0.1px] border-b border-[#D3D3D9] text-sm text-normal text-[#727184] leading-[17px] py-2">path<span class="text-[#145DEB]">/package.json</span></div>
                                            <div class="tracking-[0.1px] border-b border-[#D3D3D9] text-sm text-normal text-[#727184] leading-[17px] py-2">path<span class="text-[#145DEB]">/package.json</span></div>
                                            <div class="tracking-[0.1px] border-b border-[#D3D3D9] text-sm text-normal text-[#727184] leading-[17px] py-2">path<span class="text-[#145DEB]">/package.json</span></div>
                                            <div class="tracking-[0.1px] border-b border-[#D3D3D9] text-sm text-normal text-[#727184] leading-[17px] py-2">path<span class="text-[#145DEB]">/package.json</span></div>
                                            <div class="tracking-[0.1px] border-b border-[#D3D3D9] text-sm text-normal text-[#727184] leading-[17px] py-2">path<span class="text-[#145DEB]">/package.json</span></div>
                                            <!-- More Projects Note -->
                                            <div class="text-sm text-[#A2A1AF] leading-[17px] tracking-[0.1px] py-2">+ 121 more projects</div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                          </div>
                          <div>
                            <table class="w-full">
                                <tbody>
                                    <tr class="align-middle">
                                        <td class="text-[base] text-[#555463] font-semibold leading-[19px] tracking-[0.17px] py-2">
                                            Priority Score
                                        </td>
                                        <td class="text-[base] text-[#727184] font-normal leading-[19px] tracking-[0.17px] py-2">
                                            200-600
                                        </td>
                                    </tr>
                                    <tr class="align-middle">
                                        <td class="text-[base] text-[#555463] font-semibold leading-[19px] tracking-[0.17px] py-2">
                                            Business Criticality
                                        </td>
                                        <td class="flex items-center gap-2 py-2">
                                            <div class="bg-[#F4F4F6] rounded items-center leading-[18px] flex px-2 py-[5px] text-[#727184] border border-[#727184]">
                                                Critical
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="text-[base] text-[#555463] font-semibold leading-[19px] tracking-[0.17px] py-2">
                                            Environment
                                        </td>
                                        <td class="flex items-center gap-2 py-2">
                                            <div class="bg-[#F4F4F6] rounded items-center leading-[18px] flex px-2 py-[5px] text-[#727184] border border-[#727184]">
                                                Production
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                          </div>
                        </div>
                    </div>
                </div>
                <div class="w-2/5">
                    <div class="flex items-center gap-2">
                        <span class="text-[#441C99]">
                          <svg style="width:24px;height:24px" viewBox="0 0 24 24">
                            <path fill="currentColor" d="M7 11H9V13H7V11M21 5V19C21 20.11 20.11 21 19 21H5C3.89 21 3 20.1 3 19V5C3 3.9 3.9 3 5 3H6V1H8V3H16V1H18V3H19C20.11 3 21 3.9 21 5M5 7H19V5H5V7M19 19V9H5V19H19M15 13H17V11H15V13M11 13H13V11H11V13Z" />
                          </svg>
                        </span> 
                        <span class="text-[#1C1C21] font-medium leading-6 text-xl">Issue Totals</span>
                    </div>
                    <div class="py-4 mb-4">
                        <slot name="mid"></slot>
                    </div>
                    <div class="breakdown">
                        <div class="text-base font-normal text-[#555463] leading-[19px]">
                            Breakdown by <span class="font-bold">Severity</span>
                        </div>
                        <div class="pt-4">
                            <slot name="bottom"></slot>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="border-t border-[#D3D3D9] px-10 pt-5 pb-52">
            <div class="flex gap-2 items-center">
                <span class="text-[#441C99] text-xl">
                    <svg style="width:24px;height:24px" viewBox="0 0 24 24">
                        <path fill="currentColor" d="M12,12H19C18.47,16.11 15.72,19.78 12,20.92V12H5V6.3L12,3.19M12,1L3,5V11C3,16.55 6.84,21.73 12,23C17.16,21.73 21,16.55 21,11V5L12,1Z" />
                    </svg>
                </span>
                <span class="text-[#1C1C21] text-xl font-medium leading-[24px]">Issue Details</span>
            </div>
            <div class="pt-4">
                <slot></slot>
            </div>
        </div>
    </div>
</template>

<script>
  export default {
    data:()=>({
      is_filter:true
    }),
  };
</script>
