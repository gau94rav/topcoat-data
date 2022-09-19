<template>
	<a :href="fullUrl" :target="openInNewTab ? '_blank' : '_top'" rel="noopener noreferrer">
		<slot></slot>
	</a>
</template>

<script>
	export default {
  name: "TUrl",
  props: {
      isGroup:{
        type: Boolean,
        required: true,
      },
    includeFilterParams: {
      type: Boolean,
      default: true,
    },
    additionalUrlParams: {
      type: Object,
      default() {
        return {};
      },
    },
    openInNewTab:{
      type: Boolean,
      default: true,
    },
  },
  computed: {            
    orgName() {
        const orgElement=document.getElementById('OrgNameLabel')
        if (orgElement) {
            return orgElement.innerHTML.replace(' - ', '-').replace(' ', '-').toLowerCase();
        }
        return "";
    },
    groupName() {
        const groupElement=document.getElementById('GroupNameLabel')
        if (groupElement) {
            return groupElement.innerHTML.replace(' - ', '-').replace(' ', '-').toLowerCase();
        }
        return "";
    },
    fullUrl() {
        console.log('this from GroupOrOrg', this)
        console.log('groupName', this.groupName)
        console.log('orgName', this.orgName)
      let url = 'https://app.snyk.io/'
      if(this.orgName){
          url += `org/${this.orgName}/reporting`
      }else{
        return `${this.url}?${urlParamString}`;
          url += `group/${this.groupName}/reporting`
      }
        console.log('url', url)
      let allUrlParams = {};
      const { 'context[org]': org, 'context[group]': group, ...restOfFilters } = this.getFiltersState;

      if (this.includeFilterParams ) {
        // Sometimes the additional URL params will include the same filter as one of the filters already in the URL
        // So the order of the url params below is important, any duplicated keys will end up being the last one added. 
        // 
        // example: in the executive summary page there is a filter for project name but in a table each row
        // is for a project, so when the user clicks a link in that row to go to the issues-detail page, the
        // url should go to the page with the issues-details filtered on the row's project, not the page where
        // all of the projects selected in the filter are present.
        allUrlParams = {
          ...restOfFilters,
          ...this.additionalUrlParams,
        };
      }

      const urlParamString = new URLSearchParams(allUrlParams).toString();

      if (urlParamString.length > 0) {
        return `${url}?${urlParamString}`;
      }

      return url;
    },
  }
};
</script>