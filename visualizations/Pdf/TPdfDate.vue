<template>
  <div class="grid grid-cols-2 gap-x-8">
    <div
      v-if="label"
      class="flex-wrap text-base whitespace-nowrap h-max font-semibold"
    >
      {{ label }}
    </div>
    <div
      class="relative flex flex-col flex-wrap items-start w-full text-base whitespace-nowrap"
    >
      <div v-for="(date, index) in dates" :key="index">
        {{ date.label }} {{ window.Moment(date.date).format("MMM D, YYYY") }}
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    // Accepts values as array of objects
    // Object format { date: '2022-06-06', label: "Open Since" }
    dates: {
      type: Array,
      default: [],
    },
    label: {
      type: String,
      default: "",
    },
  },
  data: () => ({
    is_filter: true,
  }),
};
</script>
