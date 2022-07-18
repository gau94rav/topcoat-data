<template>
  <div class="w-56 sticky mb-auto top-[80px] z-[9999]">
    <h3 class="px-3 py-1 font-semibold text-[#727184] text-xs tracking-[0.1em] p-2">INSIGHTS</h3>
    <ul class="menu-list">
      <li 
        v-for="page in project.nav"
        :key="page"
        class="px-2 py-2 rounded-sm">
        <a :href="'/' + page.url">{{page.title}}</a>
      </li>
    </ul>
  </div>
</template>

<style scoped>
  .menu-list li:hover {
    @apply bg-[#732eca1a] text-[#471694] cursor-pointer;
  }
  .menu-list li {
    @apply text-[#555463];
  }
</style>