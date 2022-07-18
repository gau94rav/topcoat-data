<template>
    <div>
        <div class="px-10 py-5">
            <pdf-header />
            <div class="grid grid-cols-2 gap-4">
                <div>
                    <div class="text-[#555463] text-base font-medium leading-6">
                        {Organization Name}
                    </div>
                    <div class="text-[#1C1C21] text-[26px] font-semibold leading-[39px]">
                        {Saved report name}
                    </div>
                </div>
                <div>
                    <div class="text-[#727184] text-[16px] font-normal leading-[29px]">
                        Report Generated
                    </div>
                    <div class="text-[#727184] text-xl font-normal leading-[29px]">
                        <span class="text-[#727184] text-xl font-bold leading-[29px]">Jun 3 2022</span> by <span class="text-[#727184] text-xl font-bold leading-[29px]">Account Name</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="px-10 py-7">
            <div class="grid grid-cols-2 gap-4">
                <div>
                    <div class="flex items-center gap-3">
                        <span class="text-[#441C99]"><i class="fas fa-calendar"></i></span> <span class="text-[#1C1C21] font-medium leading-6 text-xl">Since Jun 1, 2021</span>
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
                <div class="issue-composer">
                    <div class="flex items-center gap-3">
                        <span class="text-[#441C99]"><i class="fas fa-filter"></i></span> <span class="text-[#1C1C21] font-medium leading-6 text-xl">Issue Composure</span>
                    </div>
                    <table class="w-full">
                        <tbody>
                            <tr class="align-middle">
                                <td class="text-[base] text-[#727184] font-normal leading-[19px] tracking-[0.17px] py-3">
                                    Product type
                                </td>
                                <td class="text-[base] text-[#727184] font-normal leading-[19px] tracking-[0.17px] py-3">
                                    All Products
                                </td>
                            </tr>
                            <tr class="align-middle">
                                <td class="text-[base] text-[#727184] font-normal leading-[19px] tracking-[0.17px] py-3">
                                    Severity Level
                                </td>
                                <td class="flex items-center gap-2 py-3">
                                    <div class="bg-[#AB1A1A] rounded items-center flex px-2 py-[6px] text-[#ffffff] border border-[#AB1A1A]">
                                        Critical
                                    </div>
                                    <div class="bg-[#CE5019] rounded items-center flex px-2 py-[6px] text-[#ffffff] border border-[#CE5019]">
                                        High
                                    </div>
                                    <div class="bg-[#D68000] rounded items-center flex px-2 py-[6px] text-[#ffffff] border border-[#D68000]">
                                        Medium
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="text-[base] text-[#727184] font-normal leading-[19px] tracking-[0.17px] py-3">
                                    Status
                                </td>
                                <td class="text-[base] text-[#727184] font-normal leading-[19px] tracking-[0.17px] py-3">
                                    Open, Patched, Ignored
                                </td>
                            </tr>
                            <tr>
                                <td class="text-[base] text-[#727184] font-normal leading-[19px] tracking-[0.17px] py-3">
                                    Priority Score
                                </td>
                                <td class="text-[base] text-[#727184] font-normal leading-[19px] tracking-[0.17px] py-3">
                                    200-600
                                </td>
                            </tr>
                            <tr>
                                <td class="text-[base] text-[#727184] font-normal leading-[19px] tracking-[0.17px] py-3">
                                    Business Criticality
                                </td>
                                <td class="flex items-center gap-2 py-3">
                                    <div class="bg-[#F4F4F6] rounded items-center flex px-2 py-[6px] text-[#727184] border border-[#727184]">
                                        Critical
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="text-[base] text-[#727184] font-normal leading-[19px] tracking-[0.17px] py-3">
                                    Environment
                                </td>
                                <td class="flex items-center gap-2 py-3">
                                    <div class="bg-[#F4F4F6] rounded items-center flex px-2 py-[6px] text-[#727184] border border-[#727184]">
                                        Production
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="border-t border-[#D3D3D9] px-10 pt-5 pb-52">
            <div class="flex gap-2 items-center">
                <span class="text-[#441C99] text-xl"><i class="fas fa-shield-alt"></i></span><span class="text-[#1C1C21] text-xl font-medium leading-[24px]">Full Issue List</span>
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
