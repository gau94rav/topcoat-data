<template>
  <div
    class="cursor-pointer bg-white flex gap-1 items-center border-1 rounded py-1 px-2 text-xs text-[#555463] border-[#C3C2CB] text-[#555463] hover:border-[#727184] hover:text-[#727184]"
  >
    <img :src="'/static/' + whoami.instance_name + '/images/card.svg'" />
    {{ label }}
    <i class="fas fa-caret-down"></i>
  </div>
</template>

<script>
  export default {
    props: {
      label: String,
    }
  }
</script>