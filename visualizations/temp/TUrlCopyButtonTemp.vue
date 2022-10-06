<template>
  <div class="relative">
    
    <t-tooltip position="bottom" width="130px">
      <button
        class="h-[30px] w-[30px] rounded-[4px] flex items-center justify-center border border-[#C3C2CB] p-1 transition-colors"
        @click="copy"
        :class="{ 'bg-[#B4E4D9]': copied }"
        slot="trigger"
      >
        <t-loading-spinner v-if="loading" position="relative" />
        <check-icon :size="18" v-else-if="copied" />
        <link-icon :size="18" v-else />
        <span class="visually-hidden">{{ copied ? "URL Copied" : "Copy URL" }}</span>
      </button>
      {{ copied ? "URL Copied" : "Copy URL" }}
    </t-tooltip>
  </div>
</template>

<script>
  export default {
    data: () => ({
      copied: false,
      is_filter: true,
    }),
    computed: {
        org() {
            if (this.rows.length && this.whoami && this.whoami.custom_attributes.snyk_user_reports_org_ids.length == 1) {
                return this.rows[0].ORG_NAME.value;
            }
            return null;
        },
        group() {
            if (this.whoami && this.whoami.custom_attributes.snyk_user_reports_group_ids.length == 1) {
                return this.whoami.custom_attributes.snyk_user_reports_group_ids[0];
            }
            return null;
        },
        url() {
            if (window.location !== window.parent.location) {
              let url = '';
              if (this.org) {
                url = `https://app.snyk.io/org/${this.org}/reporting`;
              } else if (this.group) {
                url = `https://app.snyk.io/group/${this.group}/reporting`;
              }
              if (url) {
                const urlObject = new URL(url);
                urlObject.searchParams.set("context[page]", this.page.url);
                for (const [filter, value] of Object.entries(this.filters)) {
                  urlObject.searchParams.set(filter, encodeURIComponent(value));
                }
                return urlObject.toString();
              }
            }
            return window.location.href;
        }
    },
    methods: {
      copy() {
        if (this.loading) return;
        this.copied = true;

        const tempInput = document.createElement('input');
        document.body.appendChild(tempInput);
        tempInput.value = this.url;
        tempInput.select();

        document.execCommand('copy');
        document.body.removeChild(tempInput);

        setTimeout(() => {
          this.copied = false;
          // Timeout to show success message and hide it.
        }, 1000)
      }
    }
  }
</script>

<style>
/* 
 * Utility class to hide content visually while keeping it screen reader-accessible.
 * Source: https://www.scottohara.me/blog/2017/04/14/inclusively-hidden.html 
 */
  .visually-hidden:not(:focus):not(:active) {
    clip: rect(0 0 0 0); 
    clip-path: inset(100%); 
    height: 1px; 
    overflow: hidden; 
    position: absolute; 
    white-space: nowrap; 
    width: 1px; 
  }
</style>
