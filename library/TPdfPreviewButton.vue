<template>
    <button
        class="bg-[#145DEB] border-[#145DEB] text-white text-sm px-2 py-[5px] rounded-[4px]"
        style="height: fit-content;"
        @click="openPdf"
    >
        Preview PDF
    </button>
</template>

<script>
    export default {
        methods: {
            openPdf() {
                const u = window.location;
				const url = `${u.protocol}//${u.host}${u.pathname}/pdf${u.search}`;
                window.open(url, "_blank");
            }
        }
    }
</script>