<template>
    <t-pdf-template class="relative left-0 right-0 m-auto">
        
        <!-- Header info section -->
        <div class="relative poppins-fonts" slot="filters">

            <!-- Active Org/Group and report name section -->
            <div class="text-[#555463] text-base font-medium leading-6" v-if="whoami">
                <div v-if="whoami && whoami.custom_attributes.snyk_user_reports_group_ids.length == 1">
                    <group-name t-filter:param="groups" t-layer="selected_org" />
                </div> 
                <div v-else-if= "whoami && whoami.custom_attributes.snyk_user_reports_org_ids.length == 1">
                    <org-name t-filter:param="groups" t-layer="selected_org" />     
                </div> 
            </div>
            <div class="text-[#1C1C21] text-[26px] font-semibold leading-[39px]">
                <div v-for="(nav, index) in project.nav" :key="index">
                    <span v-if="nav.pdf_template && nav.pdf_template === 'vulnerabilities_pdf_template'">
                        {{ nav.title }}
                    </span>
                </div>
            </div>
        </div>
        <div slot="filters" class="roboto-fonts">

            <!-- Report generated Section -->
            <div class="text-[#727184] text-[16px] font-normal leading-[29px]">
                Report Generated
            </div>
            <div class="text-[#727184] text-xl font-normal leading-[29px] flex items-center gap-2">
                <span class="text-[#727184] text-xl font-bold leading-[29px]">
                   {{ window.Moment().format("MM/DD/YY") }}
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
                <span class="text-[#1C1C21] font-medium leading-6 text-xl roboto-fonts">Vulnerabilities Total</span>
            </div>

            <t-vis-grouper t-layer="vuln_big_num_issue_totals" t-class="grid grid-cols-2 gap-2">
                <t-big-number label="TOTAL ISSUES" t-value-column="TOTAL" has-underline has-tall-size />
                <t-big-number label="UNIQUE VULNS" t-value-column="TOTAL_UNIQUE" has-underline has-tall-size />
            </t-vis-grouper>

            <div class="text-base font-normal text-[#555463] leading-[19px] py-3 roboto-fonts" v-if="filters.vulnerabilities_by">
                Breakdown by <span class="font-bold">
                    {{ filters.vulnerabilities_by }}
                </span>
            </div>
            <t-vis-grouper
                v-if="filters && filters.vulnerabilities_by === 'Product Name'"
                t-layer="vuln_big_num_product_name"
                key='product'
                t-class="grid grid-cols-3 gap-2"
            >
                <t-big-number label="CODE" big-number-size="small" bg-color="#F9F9FA" t-value-column="SNYK_CODE" />
                <t-big-number label="CONTAINER" big-number-size="small" bg-color="#F9F9FA" t-value-column="SNYK_CONTAINER" />
                <t-big-number label="IAC" big-number-size="small" bg-color="#F9F9FA" t-value-column="SNYK_IAC" />
                <t-big-number label="OPEN SOURCE" big-number-size="small" bg-color="#F9F9FA" t-value-column="SNYK_OPEN_SOURCE" />      
            </t-vis-grouper>
            <t-vis-grouper
                v-else-if="filters && filters.vulnerabilities_by === 'Issue Type'"
                t-layer="vuln_big_num_issue_types"
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
        <div class="flex flex-col py-7 roboto-fonts" slot="filters">
            <div class="flex items-center gap-3 pb-3">
                <span class="text-[#441C99]">
                    <filter-variant-icon />
                </span>
                <span class="text-[#1C1C21] font-medium leading-6 text-xl roboto-fonts">Filters Applied</span>
            </div>
            <t-grids column-count="2" gap-x="10" gap-y="4">
                <t-issues-pdf-filters
                    v-if="filters.issue_severity"
                    :values="filters.issue_severity"
                    label="Issue severity"
                />

                <t-issues-pdf-filters
                    v-if="filters.issue_status"
                    :values="filters.issue_status"
                    label="Issue Status"
                />

                <t-issues-pdf-filters
                    v-if="filters.product_name"
                    :values="filters.product_name"
                    label="Snyk Product"
                />

                <t-issues-pdf-filters
                    v-if="filters.issue_type"
                    :values="filters.issue_type"
                    label="Issue Type"
                />

                <t-issues-pdf-filters
                    v-if="filters.autofixable"
                    :values="filters.autofixable"
                    label="Is Auto Fixable"
                />

                <t-issues-pdf-filters
                    v-if="filters.exploit_maturity"
                    :values="filters.exploit_maturity"
                    label="Exploit Maturity"
                />

                <t-issues-pdf-filters
                    v-if="filters.project_owner"
                    :values="filters.project_owner"
                    label="Project Owner"
                />

                <t-issues-pdf-filters
                    v-if="filters.project_origin"
                    :values="filters.project_origin"
                    label="Project Origin"
                />

                <t-issues-pdf-filters
                    v-if="filters.project_branch"
                    :values="filters.project_branch"
                    label="Project Branch"
                />

                <t-issues-pdf-filters
                    v-if="filters.package_name"
                    :values="filters.package_name"
                    label="Package Name"
                />

                <t-issues-pdf-filters
                    v-if="filters.package_version"
                    :values="filters.package_version"
                    label="Package Version"
                />

                <t-issues-pdf-filters
                    v-if="filters.problem_id"
                    :values="filters.problem_id"
                    label="Problem Id"
                />

                <t-issues-pdf-filters
                    v-if="filters.issue_reintroduced"
                    :values="filters.issue_reintroduced"
                    label="Is Issue Reintroduced"
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
                    v-if="filters.introduced_start && filters.introduced_end"
                    label="Introduced Date"
                    :dates="[
                        { label: 'Start', date: filters.introduced_start },
                        { label: 'End', date: filters.introduced_end }
                    ]"
                />

                <t-pdf-date
                    v-if="filters.last_introduced_start && filters.last_introduced_end"
                    label="Last Introduced Date"
                    :dates="[
                        { label: 'Start', date: filters.last_introduced_start },
                        { label: 'End', date: filters.last_introduced_end }
                    ]"
                />

                <t-pdf-date
                    v-if="filters.last_resolved_start && filters.last_resolved_end"
                    label="Last Resolved Date"
                    :dates="[
                        { label: 'Start', date: filters.last_resolved_start },
                        { label: 'End', date: filters.last_resolved_end }
                    ]"
                />

                <t-pdf-date
                    v-if="filters.last_ignored_start && filters.last_ignored_end"
                    label="Last Ignored Date"
                    :dates="[
                        { label: 'Start', date: filters.last_ignored_start },
                        { label: 'End', date: filters.last_ignored_end }
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
                    t-key-column="PROJECT_PUBLIC_ID"
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
        <TTable 
            title="Vulnerability details"
            t-layer="table_vuln_detail" 
            full_width
            :can-search="false" 
            :is-header-fixed="true" 
            :canPageServer="true"
            :rows-per-page="50"
            :layerColumnsToHide="['ISSUE_TYPE', 'AUTOFIXABLE', 'PROJECT_TYPE','INITIAL_ISSUE_TYPE','VULN_DB_URL','PROBLEM_ID','EXPLOIT_MATURITY','ORG_NAME']"
        >
           <t-column header=" " id-or-name="ISSUE_SEVERITY">
                <IssueSeverityIcon :severity="value" />
            </t-column>
            <t-column header="SCORE" id-or-name="PRIORITY_SCORE">
                {{ parseInt(rendered_value, 10) }}
            </t-column>
            <t-column header="ISSUE" id-or-name="PROBLEM_TITLE" >
                <div class="text-[#145DEB] text-sm font-medium leading-[15px] tracking-[0.1px]">{{row.ISSUE_TYPE.value}}</div>
                 <span v-if="row.INITIAL_ISSUE_TYPE.value == 'PACKAGE_VULNERABILITY'">
    				      <TUrl :url="row.VULN_DB_URL.value" :includeFilterParams="false" target="_blank"> {{rendered_value}} </TUrl>
				        </span> 
				<span v-else>
					{{rendered_value}}
				</span>
            <div class="text-[#145DEB] text-xs font-small leading-[15px] tracking-[0.1px]">{{row.PROBLEM_ID.value}}</div>
            </t-column> 
            <t-column header="CVE" id-or-name="CVE">
                <div class="text-[#145DEB] text-sm font-normal">
                    <span v-for=="CVE in JSON.parse(value)">
                        <TUrl :url="'https://www.cve.org/CVERecord?id='+CVE" :includeFilterParams="false"> {{ CVE }} </TUrl>
                    </span>
                </div>
            </t-column>
            <t-column header="CWE" id-or-name="CWE">
                <div class="text-[#145DEB] text-sm font-normal">
                    <span v-for=="CWE in JSON.parse(value)">
                        <TUrl :url="'https://cwe.mitre.org/data/definitions/'+CWE.replace('CWE-', '')"
                            :includeFilterParams="false"> {{ CWE }} </TUrl>
                    </span>
                </div>
            </t-column>
            
            <t-column header="SNYK PRODUCT" id-or-name="PRODUCT_NAME" />
            <t-column header="PROJECTS" id-or-name="PROJECT_COUNT">
                <span>
                    {{ rendered_value }}
                </span>
            </t-column>
            <t-column header="ISSUE COUNT" id-or-name="ISSUE_COUNT">
                <span v-if="whoami && whoami.custom_attributes?.snyk_user_reports_group_ids?.length == 1">
                <TURL 
                  :url="'https://app.snyk.io/group/'+whoami.custom_attributes.snyk_user_reports_group_ids[0]+'/reporting'"
                  :additionalUrlParams="{'context[page]': 'issues-detail', 'problem_id': row.PROBLEM_ID.value }" 
                  :includeUrlStyle="false"
                >
                  <span class="text-[#145DEB]">
                    {{ rendered_value }}
                  </span>
                    </TURL>
                </span>

                 <span v-else>
                <TURL 
                  :url="'https://app.snyk.io/org/'+row?.ORG_NAME?.value.replace(' - ', '-').replace(' ', '-').toLowerCase()+'/reporting'"
                  :additionalUrlParams="{'context[page]': 'issues-detail', 'problem_id': row.PROBLEM_ID.value }" 
                  :includeUrlStyle="false"
                >
                  <span class="text-[#145DEB]">
                    {{ rendered_value }}
                  </span>
                   </TURL>
                </span>
            </t-column>
            <template v-slot:footer="{ totalCount, visibleCount }">
              <div class="px-2 text-lg text-right w-full" v-if="totalCount > visibleCount">
                {{ 'Showing only ' + visibleCount + ' of ' + totalCount + ' results' }}
              </div>
            </template>
        </TTable>
        <!-- Table -->

    </t-pdf-template>
</template>
