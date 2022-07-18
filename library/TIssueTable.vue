<template>
  <div>
    <table class="w-full">
      <thead>
        <tr>
          <th class="py-2 text-center"></th>
          <th class="py-2 text-center border-b border-[#D3D3D9] border-b-0 text-[10px] text-[#555463] font-semibold leading-[15px] tracking-[0.12em] uppercase">
            <div class="inline-flex items-center">
              <svg width="9" height="12" viewBox="0 0 9 12" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M4.66667 0.166748L8.83333 4.33341L0.5 4.33341L4.66667 0.166748ZM4.66667 11.4167L0.5 7.25008H8.83333L4.66667 11.4167Z" fill="#A2A1AF"/>
              </svg>
            </div>
          </th>
          <th class="py-2 border-b border-[#D3D3D9] border-b-0  text-[10px] text-[#555463] font-semibold leading-[15px] tracking-[0.12em] uppercase">
            <div class="inline-flex items-center">
              <span class="text-[10px] text-[#555463] mr-[10px] ">SCORE</span> 
              <svg width="9" height="12" viewBox="0 0 9 12" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M4.66667 0.166748L8.83333 4.33341L0.5 4.33341L4.66667 0.166748ZM4.66667 11.4167L0.5 7.25008H8.83333L4.66667 11.4167Z" fill="#A2A1AF"/>
              </svg>
            </div>
          </th>
          <th class="py-2 border-b border-[#D3D3D9] border-b-0  text-[10px] text-[#555463] font-semibold leading-[15px] tracking-[0.12em] uppercase">
            <div class="inline-flex items-center">
              <span class="text-[10px] text-[#555463] mr-[10px] ">ISSUE</span>
              <svg width="9" height="12" viewBox="0 0 9 12" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M4.66667 0.166748L8.83333 4.33341L0.5 4.33341L4.66667 0.166748ZM4.66667 11.4167L0.5 7.25008H8.83333L4.66667 11.4167Z" fill="#A2A1AF"/>
              </svg>
            </div>
          </th>
          <th class="py-2 border-b border-[#D3D3D9] border-b-0  text-[10px] text-[#555463] font-semibold leading-[15px] tracking-[0.12em] uppercase"><span class="text-[10px] text-[#555463] mr-[10px] ">Identifiers</span></th>
          <th class="py-2 border-b border-[#D3D3D9] border-b-0  text-[10px] text-[#555463] font-semibold leading-[15px] tracking-[0.12em] uppercase">
            <div class="inline-flex items-center">
              <span class="text-[10px] text-[#555463] mr-[10px] ">EXPLOIT MATURITY</span>
              <svg width="9" height="12" viewBox="0 0 9 12" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M4.66667 0.166748L8.83333 4.33341L0.5 4.33341L4.66667 0.166748ZM4.66667 11.4167L0.5 7.25008H8.83333L4.66667 11.4167Z" fill="#A2A1AF"/>
              </svg>
            </div>
          </th>
          <th class="py-2 border-b border-[#D3D3D9] border-b-0  text-[10px] text-[#555463] font-semibold leading-[15px] tracking-[0.12em] uppercase">
            <div class="inline-flex items-center">
              <span class="text-[10px] text-[#555463] mr-[10px] ">PRODUCT</span>
              <svg width="9" height="12" viewBox="0 0 9 12" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M4.66667 0.166748L8.83333 4.33341L0.5 4.33341L4.66667 0.166748ZM4.66667 11.4167L0.5 7.25008H8.83333L4.66667 11.4167Z" fill="#A2A1AF"/>
              </svg>
            </div>
          </th>
        </tr>
      </thead>
      <tbody>
        <tr class="bg-[#F9F9FA] table-group relative">
          <td class="text-center border-b border-t border-[#D3D3D9] align-top pt-[12px] pb-[17px] text-[#1C1C21]"><i class="fas fa-chevron-down"></i></td>
          <td class="pl-3 text-center border-b border-t border-[#D3D3D9] align-top pt-[12px] pb-[17px]">
            <div class="severity-item-critical text-[11px] bg-[#AB1A1A] w-[20px] h-[20px] text-[#ffffff] inline-flex items-center justify-center rounded-[2px]" title="Critical Issues">C</div>
          </td>
          <td class="border-b border-t border-[#D3D3D9] align-top pt-[12px] pb-[17px]">
            <div class="text-[#555463] text-base">123</div>
          </td>
          <td class="border-b border-t border-[#D3D3D9] align-top pt-[12px] pb-[17px]">
            <div class="text-[#145DEB] text-sm font-medium leading-[15px] tracking-[0.1px]">npmconf</div>
            <div class="text-[#727184] text-[13px] font-normal leading-5 tracking-[0.1px]">Uninitialized Memory Exposure</div>
          </td>
          <td class="border-b border-t border-[#D3D3D9] align-top pt-[12px] pb-[17px]">
            <div class="text-[#145DEB] text-sm font-normal">CVE-2015-65, CWE-264</div>
          </td>
          <td class="border-b border-t border-[#D3D3D9] align-top pt-[12px] pb-[17px]">
            <div class="text-sm text-normal text-[#727184] leading-[17px]">None Known</div>
          </td>
          <td class="border-b border-t border-[#D3D3D9] align-top pt-[12px] pb-[17px]">
            <div class="text-sm text-normal text-[#727184] leading-[17px]">Open Source</div>
          </td>
        </tr>
      </tbody>
    </table>
    <div class="mx-[32px]">
      <table class="w-full">
        <thead>
          <tr>
            <th class="py-2 border-b border-[#D3D3D9] text-[10px] text-[#555463] font-semibold leading-[15px] tracking-[0.12em] uppercase"><div class="inline-flex items-center"><span class="text-[10px] text-[#555463] mr-[10px]">PROJECT</span><svg width="9" height="12" viewBox="0 0 9 12" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M4.66667 0.166748L8.83333 4.33341L0.5 4.33341L4.66667 0.166748ZM4.66667 11.4167L0.5 7.25008H8.83333L4.66667 11.4167Z" fill="#A2A1AF"/>
              </svg></div></th>
            <th class="py-2 border-b border-[#D3D3D9] text-[10px] text-[#555463] font-semibold leading-[15px] tracking-[0.12em] uppercase"><div class="inline-flex items-center"><span class="text-[10px] text-[#555463] mr-[10px]">AUTOFIXABLE</span><svg width="9" height="12" viewBox="0 0 9 12" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M4.66667 0.166748L8.83333 4.33341L0.5 4.33341L4.66667 0.166748ZM4.66667 11.4167L0.5 7.25008H8.83333L4.66667 11.4167Z" fill="#A2A1AF"/>
              </svg></div></th>
            <th class="py-2 border-b border-[#D3D3D9] text-[10px] text-[#555463] font-semibold leading-[15px] tracking-[0.12em] uppercase"><div class="inline-flex items-center"><span class="text-[10px] text-[#555463] mr-[10px]">INTRODUCED</span><svg width="9" height="12" viewBox="0 0 9 12" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M4.66667 0.166748L8.83333 4.33341L0.5 4.33341L4.66667 0.166748ZM4.66667 11.4167L0.5 7.25008H8.83333L4.66667 11.4167Z" fill="#A2A1AF"/>
              </svg></div></th>
            <th class="py-2 border-b border-[#D3D3D9] text-[10px] text-[#555463] font-semibold leading-[15px] tracking-[0.12em] uppercase"><div class="inline-flex items-center"><span class="text-[10px] text-[#555463] mr-[10px]">STATUS</span><svg width="9" height="12" viewBox="0 0 9 12" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M4.66667 0.166748L8.83333 4.33341L0.5 4.33341L4.66667 0.166748ZM4.66667 11.4167L0.5 7.25008H8.83333L4.66667 11.4167Z" fill="#A2A1AF"/>
              </svg></div></th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="border-b border-[#D3D3D9] align-top pt-[12px] pb-[17px]">
              <div class="text-sm text-normal text-[#727184] leading-[17px] tracking-[0.1px]">path<span class="text-[#145DEB]">/package.json</span></div>
              <div class="text-[#727184] font-normal text-xs leading-[20px] tracking-[0.1px]">Github</div>
            </td>
            <td class="border-b border-[#D3D3D9] align-top pt-[12px] pb-[17px]">
              <div class="text-sm text-normal text-[#727184] leading-[17px]"><span class="text-[#2D9283] mr-[6px]"><i class="fas fa-check-circle"></i></span>Upgrade,Patch</div>
            </td>
            <td class="border-b border-[#D3D3D9] align-top pt-[12px] pb-[17px]">
              <div class="text-sm text-normal text-[#727184] leading-[17px]">24 Nov 2021</div>
            </td>
            <td class="border-b border-[#D3D3D9] align-top pt-[12px] pb-[17px]">
              <div class="text-[10px] text-normal text-[#B9002C] leading-[17px]"><span class="badge-error bg-[#FFEEF2] rounded px-[6px] py-1 border-[#F15366] border text-[10px] font-medium tracking-[0.02em] uppercase leading-[11px]">OPEN</span></div>
            </td>
          </tr>
          <tr>
            <td class="border-b border-[#D3D3D9] align-top pt-[12px] pb-[17px]">
              <div class="text-sm text-normal text-[#727184] leading-[17px] tracking-[0.1px]">path<span class="text-[#145DEB]">/package.json</span></div>
              <div class="text-[#727184] font-normal text-xs leading-[20px] tracking-[0.1px]">Github</div>
            </td>
            <td class="border-b border-[#D3D3D9] align-top pt-[12px] pb-[17px]">
              <div class="text-sm text-normal text-[#727184] leading-[17px]"><span class="text-[#2D9283] mr-[6px]"><i class="fas fa-check-circle"></i></span>Upgrade,Patch</div>
            </td>
            <td class="border-b border-[#D3D3D9] align-top pt-[12px] pb-[17px]">
              <div class="text-sm text-normal text-[#727184] leading-[17px]">24 Nov 2021</div>
            </td>
            <td class="border-b border-[#D3D3D9] align-top pt-[12px] pb-[17px]">
              <div class="text-[10px] text-normal text-[#B9002C] leading-[17px]"><span class="badge-error bg-[#FFEEF2] rounded px-[6px] py-1 border-[#F15366] border text-[10px] font-medium tracking-[0.02em] uppercase leading-[11px]">OPEN</span></div>
            </td>
          </tr>
          <tr>
            <td class="border-b border-[#D3D3D9] align-top pt-[12px] pb-[17px]">
              <div class="text-sm text-normal text-[#727184] leading-[17px] tracking-[0.1px]">path<span class="text-[#145DEB]">/package.json</span></div>
              <div class="text-[#727184] font-normal text-xs leading-[20px] tracking-[0.1px]">Github</div>
            </td>
            <td class="border-b border-[#D3D3D9] align-top pt-[12px] pb-[17px]">
              <div class="text-sm text-normal text-[#727184] leading-[17px]"><span class="text-[#2D9283] mr-[6px]"><i class="fas fa-check-circle"></i></span>Upgrade,Patch</div>
            </td>
            <td class="border-b border-[#D3D3D9] align-top pt-[12px] pb-[17px]">
              <div class="text-sm text-normal text-[#727184] leading-[17px]">24 Nov 2021</div>
            </td>
            <td class="border-b border-[#D3D3D9] align-top pt-[12px] pb-[17px]">
              <div class="text-[10px] text-normal text-[#B9002C] leading-[17px]"><span class="badge-error bg-[#FFEEF2] rounded px-[6px] py-1 border-[#F15366] border text-[10px] font-medium tracking-[0.02em] uppercase leading-[11px]">OPEN</span></div>
            </td>
          </tr>
          <tr>
            <td class="border-b border-[#D3D3D9] align-top pt-[12px] pb-[17px]">
              <div class="text-sm text-normal text-[#727184] leading-[17px] tracking-[0.1px]">path<span class="text-[#145DEB]">/package.json</span></div>
              <div class="text-[#727184] font-normal text-xs leading-[20px] tracking-[0.1px]">Github</div>
            </td>
            <td class="border-b border-[#D3D3D9] align-top pt-[12px] pb-[17px]">
              <div class="text-sm text-normal text-[#727184] leading-[17px]"><span class="text-[#2D9283] mr-[6px]"><i class="fas fa-check-circle"></i></span>Upgrade,Patch</div>
            </td>
            <td class="border-b border-[#D3D3D9] align-top pt-[12px] pb-[17px]">
              <div class="text-sm text-normal text-[#727184] leading-[17px]">24 Nov 2021</div>
            </td>
            <td class="border-b border-[#D3D3D9] align-top pt-[12px] pb-[17px]">
              <div class="text-[10px] text-normal text-[#B9002C] leading-[17px]"><span class="badge-error bg-[#FFEEF2] rounded px-[6px] py-1 border-[#F15366] border text-[10px] font-medium tracking-[0.02em] uppercase leading-[11px]">OPEN</span></div>
            </td>
          </tr>
          <tr>
            <td class="border-b border-[#D3D3D9] align-top pt-[12px] pb-[17px]">
              <div class="text-sm text-normal text-[#727184] leading-[17px] tracking-[0.1px]">path<span class="text-[#145DEB]">/package.json</span></div>
              <div class="text-[#727184] font-normal text-xs leading-[20px] tracking-[0.1px]">Github</div>
            </td>
            <td class="border-b border-[#D3D3D9] align-top pt-[12px] pb-[17px]">
              <div class="text-sm text-normal text-[#727184] leading-[17px]"><span class="text-[#2D9283] mr-[6px]"><i class="fas fa-check-circle"></i></span>Upgrade,Patch</div>
            </td>
            <td class="border-b border-[#D3D3D9] align-top pt-[12px] pb-[17px]">
              <div class="text-sm text-normal text-[#727184] leading-[17px]">24 Nov 2021</div>
            </td>
            <td class="border-b border-[#D3D3D9] align-top pt-[12px] pb-[17px]">
              <div class="text-[10px] text-normal text-[#B9002C] leading-[17px]"><span class="badge-error bg-[#FFEEF2] rounded px-[6px] py-1 border-[#F15366] border text-[10px] font-medium tracking-[0.02em] uppercase leading-[11px]">OPEN</span></div>
            </td>
          </tr>
          <tr>
            <td class="border-b border-[#D3D3D9] align-top pt-[12px] pb-[17px]">
              <div class="text-sm text-normal text-[#727184] leading-[17px] tracking-[0.1px]">path<span class="text-[#145DEB]">/package.json</span></div>
              <div class="text-[#727184] font-normal text-xs leading-[20px] tracking-[0.1px]">Github</div>
            </td>
            <td class="border-b border-[#D3D3D9] align-top pt-[12px] pb-[17px]">
              <div class="text-sm text-normal text-[#727184] leading-[17px]"><span class="text-[#2D9283] mr-[6px]"><i class="fas fa-check-circle"></i></span>Upgrade,Patch</div>
            </td>
            <td class="border-b border-[#D3D3D9] align-top pt-[12px] pb-[17px]">
              <div class="text-sm text-normal text-[#727184] leading-[17px]">24 Nov 2021</div>
            </td>
            <td class="border-b border-[#D3D3D9] align-top pt-[12px] pb-[17px]">
              <div class="text-[10px] text-normal text-[#B9002C] leading-[17px]"><span class="badge-error bg-[#FFEEF2] rounded px-[6px] py-1 border-[#F15366] border text-[10px] font-medium tracking-[0.02em] uppercase leading-[11px]">OPEN</span></div>
            </td>
          </tr>
          <tr>
            <td class="border-b border-[#D3D3D9] align-top pt-[12px] pb-[17px]">
              <div class="text-sm text-normal text-[#727184] leading-[17px] tracking-[0.1px]">path<span class="text-[#145DEB]">/package.json</span></div>
              <div class="text-[#727184] font-normal text-xs leading-[20px] tracking-[0.1px]">Github</div>
            </td>
            <td class="border-b border-[#D3D3D9] align-top pt-[12px] pb-[17px]">
              <div class="text-sm text-normal text-[#727184] leading-[17px]"><span class="text-[#2D9283] mr-[6px]"><i class="fas fa-check-circle"></i></span>Upgrade,Patch</div>
            </td>
            <td class="border-b border-[#D3D3D9] align-top pt-[12px] pb-[17px]">
              <div class="text-sm text-normal text-[#727184] leading-[17px]">24 Nov 2021</div>
            </td>
            <td class="border-b border-[#D3D3D9] align-top pt-[12px] pb-[17px]">
              <div class="text-[10px] text-normal text-[#B9002C] leading-[17px]"><span class="badge-error bg-[#FFEEF2] rounded px-[6px] py-1 border-[#F15366] border text-[10px] font-medium tracking-[0.02em] uppercase leading-[11px]">OPEN</span></div>
            </td>
          </tr>
          <tr>
            <td class="border-b border-[#D3D3D9] align-top pt-[12px] pb-[17px]">
              <div class="text-sm text-normal text-[#727184] leading-[17px] tracking-[0.1px]">path<span class="text-[#145DEB]">/package.json</span></div>
              <div class="text-[#727184] font-normal text-xs leading-[20px] tracking-[0.1px]">Github</div>
            </td>
            <td class="border-b border-[#D3D3D9] align-top pt-[12px] pb-[17px]">
              <div class="text-sm text-normal text-[#727184] leading-[17px]"><span class="text-[#2D9283] mr-[6px]"><i class="fas fa-check-circle"></i></span>Upgrade,Patch</div>
            </td>
            <td class="border-b border-[#D3D3D9] align-top pt-[12px] pb-[17px]">
              <div class="text-sm text-normal text-[#727184] leading-[17px]">24 Nov 2021</div>
            </td>
            <td class="border-b border-[#D3D3D9] align-top pt-[12px] pb-[17px]">
              <div class="text-[10px] text-normal text-[#B9002C] leading-[17px]"><span class="badge-error bg-[#FFEEF2] rounded px-[6px] py-1 border-[#F15366] border text-[10px] font-medium tracking-[0.02em] uppercase leading-[11px]">OPEN</span></div>
            </td>
          </tr>
          <tr>
            <td class="border-b border-[#D3D3D9] align-top pt-[12px] pb-[17px]">
              <div class="text-sm text-normal text-[#727184] leading-[17px] tracking-[0.1px]">path<span class="text-[#145DEB]">/package.json</span></div>
              <div class="text-[#727184] font-normal text-xs leading-[20px] tracking-[0.1px]">Github</div>
            </td>
            <td class="border-b border-[#D3D3D9] align-top pt-[12px] pb-[17px]">
              <div class="text-sm text-normal text-[#727184] leading-[17px]"><span class="text-[#2D9283] mr-[6px]"><i class="fas fa-check-circle"></i></span>Upgrade,Patch</div>
            </td>
            <td class="border-b border-[#D3D3D9] align-top pt-[12px] pb-[17px]">
              <div class="text-sm text-normal text-[#727184] leading-[17px]">24 Nov 2021</div>
            </td>
            <td class="border-b border-[#D3D3D9] align-top pt-[12px] pb-[17px]">
              <div class="text-[10px] text-normal text-[#B9002C] leading-[17px]"><span class="badge-error bg-[#FFEEF2] rounded px-[6px] py-1 border-[#F15366] border text-[10px] font-medium tracking-[0.02em] uppercase leading-[11px]">OPEN</span></div>
            </td>
          </tr>
          <tr>
            <td class="border-b border-[#D3D3D9] align-top pt-[12px] pb-[17px]">
              <div class="text-sm text-normal text-[#727184] leading-[17px] tracking-[0.1px]">path<span class="text-[#145DEB]">/package.json</span></div>
              <div class="text-[#727184] font-normal text-xs leading-[20px] tracking-[0.1px]">Github</div>
            </td>
            <td class="border-b border-[#D3D3D9] align-top pt-[12px] pb-[17px]">
              <div class="text-sm text-normal text-[#727184] leading-[17px]"><span class="text-[#2D9283] mr-[6px]"><i class="fas fa-check-circle"></i></span>Upgrade,Patch</div>
            </td>
            <td class="border-b border-[#D3D3D9] align-top pt-[12px] pb-[17px]">
              <div class="text-sm text-normal text-[#727184] leading-[17px]">24 Nov 2021</div>
            </td>
            <td class="border-b border-[#D3D3D9] align-top pt-[12px] pb-[17px]">
              <div class="text-[10px] text-normal text-[#B9002C] leading-[17px]"><span class="badge-error bg-[#FFEEF2] rounded px-[6px] py-1 border-[#F15366] border text-[10px] font-medium tracking-[0.02em] uppercase leading-[11px]">OPEN</span></div>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
    <table class="w-full">
      <tbody>
        <tr class="bg-[#F9F9FA] table-group">
          <td class="text-center border-b border-t border-[#D3D3D9] align-top pt-[12px] pb-[17px] text-[#1C1C21]"><i class="fas fa-chevron-down"></i></td>
          <td class="text-center border-b border-t border-[#D3D3D9] align-top pt-[12px] pb-[17px]">
            <div class="severity-item-critical text-[11px] bg-[#AB1A1A] w-[20px] h-[20px] text-[#ffffff] inline-flex items-center justify-center rounded-[2px]" title="Critical Issues">C</div>
          </td>
          <td class="border-b border-t border-[#D3D3D9] align-top pt-[12px] pb-[17px]">
            <div class="text-[#555463] text-base">123</div>
          </td>
          <td class="border-b border-t border-[#D3D3D9] align-top pt-[12px] pb-[17px]">
            <div class="text-[#145DEB] text-sm font-medium leading-[15px] tracking-[0.1px]">npmconf</div>
            <div class="text-[#727184] text-[13px] font-normal leading-5 tracking-[0.1px]">Uninitialized Memory Exposure</div>
          </td>
          <td class="border-b border-t border-[#D3D3D9] align-top pt-[12px] pb-[17px]">
            <div class="text-[#145DEB] text-sm font-normal">CVE-2015-65, CWE-264</div>
          </td>
          <td class="border-b border-t border-[#D3D3D9] align-top pt-[12px] pb-[17px]">
            <div class="text-sm text-normal text-[#727184] leading-[17px]">None Known</div>
          </td>
          <td class="border-b border-t border-[#D3D3D9] align-top pt-[12px] pb-[17px]">
            <div class="text-sm text-normal text-[#727184] leading-[17px]">Open Source</div>
          </td>
        </tr>
      </tbody>
    </table>
    <table class="w-full">
      <tbody>
        <tr class="bg-[#F9F9FA] table-group">
          <td class="text-center border-b border-t border-[#D3D3D9] align-top pt-[12px] pb-[17px] text-[#1C1C21]"><i class="fas fa-chevron-down"></i></td>
          <td class="text-center border-b border-t border-[#D3D3D9] align-top pt-[12px] pb-[17px]">
            <div class="severity-item-critical text-[11px] bg-[#AB1A1A] w-[20px] h-[20px] text-[#ffffff] inline-flex items-center justify-center rounded-[2px]" title="Critical Issues">C</div>
          </td>
          <td class="border-b border-t border-[#D3D3D9] align-top pt-[12px] pb-[17px]">
            <div class="text-[#555463] text-base">123</div>
          </td>
          <td class="border-b border-t border-[#D3D3D9] align-top pt-[12px] pb-[17px]">
            <div class="text-[#145DEB] text-sm font-medium leading-[15px] tracking-[0.1px]">npmconf</div>
            <div class="text-[#727184] text-[13px] font-normal leading-5 tracking-[0.1px]">Uninitialized Memory Exposure</div>
          </td>
          <td class="border-b border-t border-[#D3D3D9] align-top pt-[12px] pb-[17px]">
            <div class="text-[#145DEB] text-sm font-normal">CVE-2015-65, CWE-264</div>
          </td>
          <td class="border-b border-t border-[#D3D3D9] align-top pt-[12px] pb-[17px]">
            <div class="text-sm text-normal text-[#727184] leading-[17px]">None Known</div>
          </td>
          <td class="border-b border-t border-[#D3D3D9] align-top pt-[12px] pb-[17px]">
            <div class="text-sm text-normal text-[#727184] leading-[17px]">Open Source</div>
          </td>
        </tr>
      </tbody>
    </table>
    <table class="w-full">
      <tbody>
        <tr class="bg-[#F9F9FA] table-group">
          <td class="text-center border-b border-t border-[#D3D3D9] align-top pt-[12px] pb-[17px] text-[#1C1C21]"><i class="fas fa-chevron-down"></i></td>
          <td class="text-center border-b border-t border-[#D3D3D9] align-top pt-[12px] pb-[17px]">
            <div class="severity-item-critical text-[11px] bg-[#AB1A1A] w-[20px] h-[20px] text-[#ffffff] inline-flex items-center justify-center rounded-[2px]" title="Critical Issues">C</div>
          </td>
          <td class="border-b border-t border-[#D3D3D9] align-top pt-[12px] pb-[17px]">
            <div class="text-[#555463] text-base">123</div>
          </td>
          <td class="border-b border-t border-[#D3D3D9] align-top pt-[12px] pb-[17px]">
            <div class="text-[#145DEB] text-sm font-medium leading-[15px] tracking-[0.1px]">npmconf</div>
            <div class="text-[#727184] text-[13px] font-normal leading-5 tracking-[0.1px]">Uninitialized Memory Exposure</div>
          </td>
          <td class="border-b border-t border-[#D3D3D9] align-top pt-[12px] pb-[17px]">
            <div class="text-[#145DEB] text-sm font-normal">CVE-2015-65, CWE-264</div>
          </td>
          <td class="border-b border-t border-[#D3D3D9] align-top pt-[12px] pb-[17px]">
            <div class="text-sm text-normal text-[#727184] leading-[17px]">None Known</div>
          </td>
          <td class="border-b border-t border-[#D3D3D9] align-top pt-[12px] pb-[17px]">
            <div class="text-sm text-normal text-[#727184] leading-[17px]">Open Source</div>
          </td>
        </tr>
      </tbody>
    </table>
    <div class="pagination-footer flex justify-center relative">
      <ul class="pagination-nav pagination-selector inline-flex pt-[16px]">
        <li class="pagination-nav-item">
          <button class="h-8 w-8 text-[#145DEB] text-[15px] mr-[8px] focus:outline-none"><i class="fas fa-arrow-left"></i></button>
        </li>
        <li class="pagination-nav-item">
          <button class="h-8 w-8 border active border-[#7FA7F5] bg-[#EAF1FF] rounded text-[#145DEB] text-[15px] font-medium leading-5 focus:outline-none">1</button>
        </li>
        <li class="pagination-nav-item">
          <button class="h-8 w-8 text-[#0F47C6] text-[15px] font-medium leading-5 focus:outline-none">2</button>
        </li>
        <li class="pagination-nav-item">
          <button class="h-8 w-8 text-[#0F47C6] text-[15px] font-medium leading-5 focus:outline-none">3</button>
        </li>
        <li class="pagination-nav-item">
          <button class="h-8 w-8 text-[#0F47C6] text-[15px] font-medium leading-5 focus:outline-none">4</button>
        </li>
        <li class="pagination-nav-item">
          <button class="h-8 w-8 text-[#0F47C6] text-[15px] font-medium leading-5 focus:outline-none"><i class="fas fa-ellipsis-h"></i></button>
        </li>
        <li class="pagination-nav-item">
          <button class="h-8 w-8 text-[#0F47C6] text-[15px] font-medium leading-5 focus:outline-none">56</button>
        </li>
        <li class="pagination-nav-item">
          <button class="h-8 w-8 text-[#145DEB] text-[15px] ml-[8px] font-medium leading-5 focus:outline-none"><i class="fas fa-arrow-right"></i></button>
        </li>
      </ul>
      <div class="absolute right-2 top-5 font-normal text-[#727184] text-[13px] leading-[18px]">Showing 1-50 of 500</div>
    </div>
  </div>
</template>

