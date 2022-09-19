<template>
    <div class="grid gap-x-8 grid-cols-2">
        <div v-if="label" class="flex-wrap text-base font-semibold whitespace-nowrap h-max">{{ label }}</div>
        <div class="relative flex flex-wrap items-start w-full text-base whitespace-nowrap">
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
                default: []
            },
            label: {
                type: String,
                default: ""
            }
        },
        data: () => ({
            is_filter: true,
        })
    }
</script>