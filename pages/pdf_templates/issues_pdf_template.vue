<template>
    <t-pdf-template class="max-w-[1440px] relative left-0 right-0 m-auto">
        
        <!-- Header info section -->
        <div class="relative" slot="filters">

            <!-- Active Org/Group and report name section -->
            <div class="text-[#555463] text-base font-medium leading-6" v-if="whoami">
                <div v-if="whoami && whoami.custom_attributes.snyk_user_reports_group_ids.length == 1">
                    <group-name hide-issues-in-label t-filter:param="groups" t-layer="selected_group" />
                </div> 
                <div v-else-if= "whoami && whoami.custom_attributes.snyk_user_reports_org_ids.length == 1">
                    <org-name hide-issues-in-label t-filter:param="groups" t-layer="selected_org" />     
                </div> 
            </div>
            <div class="text-[#1C1C21] text-[26px] font-semibold leading-[39px]">
                <div v-for="(nav, index) in project.nav" :key="index">
                    <span v-if="nav.pdf_template && nav.pdf_template === 'issues_pdf_template'">
                        {{ nav.title }}
                    </span>
                </div>
            </div>
        </div>
        <div slot="filters">

            <!-- Report generated Section -->
            <div class="text-[#727184] text-[16px] font-normal leading-[29px]">
                Report Generated
            </div>
            <div class="text-[#727184] text-xl font-normal leading-[29px] flex items-center gap-2">
                <span class="text-[#727184] text-xl font-bold leading-[29px]">
                    <t-today />
                </span> by
                <span class="text-[#727184] text-xl font-bold leading-[29px]">
                    {{ project.user.firstname }} {{' '}} {{ project.user.lastname }}
                </span>
            </div>
        </div>
        <!-- Header info section -->

        <!-- Big Numbers -->
        <div class="flex flex-col py-7" slot="filters">
            <div class="flex items-center gap-3 w-max pb-2">
                <span class="text-[#441C99]">
                    <calendar-range-outline-icon />
                </span>
                <span class="text-[#1C1C21] font-medium leading-6 text-xl">Issues Total</span>
            </div>

            <t-vis-grouper t-layer="big_num_issue_totals" t-class="grid grid-cols-2 gap-2">
                <t-big-number label="TOTAL ISSUES" t-value-column="TOTAL" has-underline has-tall-size />
                <t-big-number label="UNIQUE VULNS" t-value-column="TOTAL_UNIQUE" has-underline has-tall-size />
            </t-vis-grouper>

            <div class="text-base font-normal text-[#555463] leading-[19px] py-3" v-if="filters.issue_by">
                Breakdown by <span class="font-bold">
                    {{ filters.issue_by }}
                </span>
            </div>

            <t-vis-grouper
                v-if="filters && filters.issue_by === 'Severity'"
                t-layer="big_number_severity"
                t-class="grid grid-cols-3 gap-2"
            >
                <t-big-number label="CRITICAL" big-number-size="small" t-value-column="CRITICAL" bg-color="#FFDAD866" text-color="#8F0018" has-tall-size>
                    <security-icon slot="icon" size="18" />
                </t-big-number>

                <t-big-number label="HIGH" big-number-size="small" t-value-column="HIGH" bg-color="#FFDBCC66" text-color="#9B3D15" has-tall-size>
                    <security-icon slot="icon" size="18" />
                </t-big-number>

                <t-big-number label="MEDIUM" big-number-size="small" t-value-column="MEDIUM" bg-color="#FFE8CD66" text-color="#925C1E" has-tall-size>
                    <security-icon slot="icon" size="18" />
                </t-big-number>

                <t-big-number label="LOW" big-number-size="small" t-value-column="LOW" bg-color="#EEEEEE66" has-tall-size>
                    <security-icon slot="icon" size="18" />
                </t-big-number>
            </t-vis-grouper>
            <t-vis-grouper
                v-else-if="filters && filters.issue_by === 'Product Name'"
                t-layer="big_num_product_name"
                key='product'
                t-class="grid grid-cols-3 gap-2"
            >
                <t-big-number label="CODE" big-number-size="small" bg-color="#F9F9FA" t-value-column="SNYK_CODE" />
                <t-big-number label="CONTAINER" big-number-size="small" bg-color="#F9F9FA" t-value-column="SNYK_CONTAINER" />
                <t-big-number label="IAC" big-number-size="small" bg-color="#F9F9FA" t-value-column="SNYK_IAC" />
                <t-big-number label="OPEN SOURCE" big-number-size="small" bg-color="#F9F9FA" t-value-column="SNYK_OPEN_SOURCE" />      
            </t-vis-grouper>
            <t-vis-grouper
                v-else-if="filters && filters.issue_by === 'Issue Type'"
                t-layer="big_num_issue_types"
                key='issue_type'
                t-class="grid grid-cols-3 gap-2"
            >
                <t-big-number label="VULNERABILITY" big-number-size="small" bg-color="#F9F9FA" t-value-column="VULNERABILITY" />
                <t-big-number label="CONFIGURATION" big-number-size="small" bg-color="#F9F9FA" t-value-column="CONFIGURATION" />
                <t-big-number label="LICENSE" big-number-size="small" bg-color="#F9F9FA" t-value-column="LICENSE" />    
            </t-vis-grouper>
        </div>
        <!-- Big Numbers -->
        
        <!-- Active filters -->
        <div class="flex flex-col py-7" slot="filters">
            <div class="flex items-center gap-3 pb-3">
                <span class="text-[#441C99]">
                    <filter-variant-icon />
                </span>
                <span class="text-[#1C1C21] font-medium leading-6 text-xl">Filters Applied</span>
            </div>
            <t-grids column-count="2" gap-x="10" gap-y="4">
                <t-issues-pdf-filters
                    v-if="filters.issue_severity"
                    :values="filters.issue_severity"
                    label="Issue severity"
                />

                <!-- <t-issues-pdf-filters
                    v-if="filters.status"
                    :values="filters.status"
                    label="Currently Present"
                />

                <t-issues-pdf-filters
                    v-if="filters.ignored"
                    :values="filters.ignored"
                    label="Currently Ignored"
                /> -->

                <t-issues-pdf-filters
                    v-if="filters.issue_status"
                    :values="filters.issue_status"
                    label="Issue Status"
                />

                <t-issues-pdf-filters
                    v-if="filters.reachability"
                    :values="filters.reachability"
                    label="Reachability"
                />

                <t-issues-pdf-filters
                    v-if="filters.product_name"
                    :values="filters.product_name"
                    label="Products"
                />

                <t-issues-pdf-filters
                    v-if="filters.issue_type"
                    :values="filters.issue_type"
                    label="Issue Type"
                />

                <t-issues-pdf-filters
                    v-if="filters.autofixable"
                    :values="filters.autofixable"
                    label="Auto Fixable"
                />

                <t-issues-pdf-filters
                    v-if="filters.exploit_maturity"
                    :values="filters.exploit_maturity"
                    label="Exploit Maturity"
                />

                <t-issues-pdf-filters
                    v-if="filters.cve"
                    :values="filters.cve"
                    label="CVE"
                    :is-list="false"
                    :visible-items-count="5"
                    has-tags
                    hide-tag-key
                />

                <t-issues-pdf-filters
                    v-if="filters.cwe"
                    :values="filters.cwe"
                    label="CWE"
                    :is-list="false"
                    :visible-items-count="5"
                    has-tags
                    hide-tag-key
                />

                <t-issues-pdf-filters
                    v-if="filters.min && filters.max"
                    :values="filters.min + '|' + filters.max"
                    label="Priority Score"
                    seperator="-"
                    are-items-condensed
                />

                <t-pdf-date
                    label="Introduced Date"
                    :dates="[
                        { label: 'Start', date: filters.introduced_start },
                        { label: 'End', date: filters.introduced_end }
                    ]"
                />

                <t-pdf-date
                    label="Last Introduced Date"
                    :dates="[
                        { label: 'Start', date: filters.last_introduced_start },
                        { label: 'End', date: filters.last_introduced_end }
                    ]"
                />

                <t-pdf-date
                    label="Last Resolved Date"
                    :dates="[
                        { label: 'Start', date: filters.last_resolved_start },
                        { label: 'End', date: filters.last_resolved_end }
                    ]"
                />

            </t-grids>

            <t-grids column-count="1" gap-x="10" gap-y="4" class="mt-4">
                
                <t-issues-pdf-filters
                    v-if="filters.orgs"
                    t-layer="filter_orgs"
                    t-value-column="ORG_DISPLAY_NAME"
                    t-key-column="ORG_PUBLIC_ID"
                    :values="filters.orgs"
                    label="Organizations"
                    is-list
                    :visible-items-count="5"
                />

                <t-issues-pdf-filters
                    v-if="filters.project_name"
                    t-layer="filter_project_name"
                    t-value-column="PROJECT_NAME"
                    t-key-column="PROJECT_ID"
                    :values="filters.project_name"
                    label="Project Name"
                    is-list
                    :visible-items-count="5"
                />

                <t-issues-pdf-filters
                    v-if="filters.project_type"
                    :values="filters.project_type"
                    label="Project Type"
                    is-list
                    :visible-items-count="5"
                />
                
                <t-issues-pdf-filters
                    v-if="filters.tags"
                    :values="filters.tags"
                    label="Project Tags"
                    :is-list="true"
                    :visible-items-count="5"
                    has-tags
                />

                <t-issues-pdf-filters
                    v-if="filters.criticality"
                    :values="filters.criticality"
                    label="Project Criticality"
                    :is-list="true"
                    :visible-items-count="5"
                    has-tags
                    hide-tag-key
                />

                <t-issues-pdf-filters
                    v-if="filters.environment"
                    :values="filters.environment"
                    label="Project Environment"
                    :is-list="true"
                    :visible-items-count="5"
                    has-tags
                    hide-tag-key
                />


                <t-issues-pdf-filters
                    v-if="filters.lifecycle"
                    :values="filters.lifecycle"
                    label="Project Lifecycle"
                    :is-list="true"
                    :visible-items-count="5"
                    has-tags
                    hide-tag-key
                />

            </t-grids>

        </div>
        <!-- Active filters -->


        <!-- Table -->
        <!-- <div class="pagebreak"></div> -->
            <div class="flex flex-wrap items-center gap-2">
                <div class="text-[#441C99]">
                    <security-icon :size="18" />
                </div>
                <h2 class="text-xl font-normal">Issue details</h2>
            </div>

            <TTable 
              full_width 
              t-layer="issue_table" 
              :can-search="false" 
              :is-header-fixed="true" 
              :can-sort="false"
			  sort-direction="desc" 
              :canPageServer="true" 
              :layerColumnsToHide="['ISSUE_TYPE','PROBLEM_ID','PROJECT_URL','ISSUE_URL','ISSUE_STATUS','LAST_INTRODUCED']">
			<t-column header=" " id-or-name="ISSUE_SEVERITY">
				<IssueSeverityIcon :severity="value" />
			</t-column>
			<t-column header="SCORE" id-or-name="PRIORITY_SCORE">
				{{ parseInt(rendered_value, 10) }}
			</t-column>
			<t-column header="ISSUE" id-or-name="PROBLEM_TITLE" >
                <div class="text-[#145DEB] text-sm font-medium leading-[15px] tracking-[0.1px]">{{row.ISSUE_TYPE.value}}</div>
                       <span v-if="row.ISSUE_STATUS.value == 'Open'">
    				      <TUrl :url="row.ISSUE_URL.value" :includeFilterParams="false"> {{rendered_value}} </TUrl>
                       </span>
                       <span v-else>
					     {{rendered_value}}
				       </span> 
            </t-column> 
			<t-column header="CVE" id-or-name="CVE">
                <div class="text-[#145DEB] text-sm font-normal">
                    <span v-for=="CVE in JSON.parse(value)" >
                    <TUrl :url="'https://www.cve.org/CVERecord?id='+CVE" :includeFilterParams="false"> {{ CVE }} </TUrl>
                 </span>
                </div>
            </t-column>
            <t-column header="CWE" id-or-name="CWE">
                <div class="text-[#145DEB] text-sm font-normal">
                <span v-for=="CWE in JSON.parse(value)">
                    <TUrl :url="'https://cwe.mitre.org/data/definitions/'+CWE.replace('CWE-', '')" :includeFilterParams="false"> {{ CWE }} </TUrl>
                </span>
                </div>
            </t-column>
			<t-column header="PROJECT" id-or-name="PROJECT_NAME">
            <TUrl :url="row.PROJECT_URL.value" :includeFilterParams="false"> {{rendered_value}} </TUrl>
            </t-column>   
			<t-column header="EXPLOIT MATURITY" id-or-name="EXPLOIT_MATURITY">
				<span v-if="rendered_value">
                    {{ rendered_value.split('-').map((w) => _.capitalize(w)).join(' ') }}
                </span>
			</t-column>
			<t-column header="AUTO FIXABLE" id-or-name="AUTOFIXABLE">
                <span v-if="value !== 'No' && value !== ''" class="flex text-sm text-normal text-[#727184] leading-[17px]">
                    <i class="fas fa-check-circle text-[#2D9283] mr-[6px]"></i> {{value}}
                </span>
                <span v-else class="flex text-sm text-normal text-[#727184] leading-[17px]">
                    <div>{{ value }}</div>
                </span>
            </t-column>
			<t-column header="INTRODUCED" id-or-name="INTRODUCED">
				<date-formatter :date="value" />
			</t-column>
			<t-column header="PRODUCT" id-or-name="PRODUCT_NAME" />
		</TTable>
        <!-- Table -->

    </t-pdf-template>
</template>