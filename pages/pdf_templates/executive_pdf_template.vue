<template>
    <t-pdf-issues class="relative left-0 right-0 m-auto px-7">

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
                    <span v-if="nav.pdf_template && nav.pdf_template === 'executive_pdf_template'">
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

            <div class="grid grid-cols-2 gap-2">
                <t-big-number custom-class="h-[130px]" label="OPEN" t-layer="big_num_open_issues" t-value-column="OPEN_C" t-previous-column="OPEN_P" has-underline big-number-size="small" />
                <t-big-number custom-class="h-[130px]" label="TOTAL IDENTIFIED" t-layer="big_num_new_issues" t-value-column="NEW_VULN_C" t-previous-column="NEW_VULN_P" has-underline big-number-size="small" />
                <t-big-number custom-class="h-[130px]" label="RESOLVED" t-layer="big_num_resolved_issues" t-value-column="RESOLVED_VULN_C" t-previous-column="RESOLVED_VULN_P" has-underline big-number-size="small" />
                <t-big-number custom-class="h-[130px]" label="MEAN TIME TO RESOLVE" t-layer="big_num_mtr" t-value-column="MTR_C" t-previous-column="MTR_P" value-text="days" has-underline big-number-size="small" />                
            </div>
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

                <t-pdf-date
                    label="Date Range"
                    :dates="[
                        { label: 'Start', date: filters.exec_summary_start },
                        { label: 'End', date: filters.exec_summary_end }
                    ]"
                />

                <t-issues-pdf-filters
                    v-if="filters.product_name"
                    :values="filters.product_name"
                    label="Products"
                />

                <t-issues-pdf-filters
                    v-if="filters.min && filters.max"
                    :values="filters.min + '|' + filters.max"
                    label="Priority Score"
                    seperator="-"
                    are-items-condensed
                />

                <t-issues-pdf-filters
                    v-if="filters.reachability"
                    :values="filters.reachability"
                    label="Reachability"
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

        <!-- Charts -->
        <div class="flex flex-col">
            <span class="text-base font-bold">Issues Identification and Resolution</span>
            <exec_line_chart style="width: 1440px; height: 800px;" t-layer="line_identified_resolved" borderless />
        </div>
        <div class="page-break"></div>
        <t-grids gap-x="3" column-count="2">
            <div class="flex flex-col">
                <span class="text-base font-bold p-2.5">Exposure Window</span>
                <exec_line_chart style="width: 720px; height: 800px;" t-layer="line_exposure_window" borderless />
            </div>
            
            <div class="flex flex-col">
                <span class="text-base font-bold p-2.5">Mean Time to Resolve</span>
                <exec_line_chart style="width: 720px; height: 800px;" t-layer="line_mtr" borderless />
            </div>
        </t-grids>
        <div class="page-break"></div>
        <!-- Charts -->

        <!-- Table -->
        <t-table
            v-show="whoami && whoami.custom_attributes?.snyk_user_reports_group_ids?.length !== 1"
            title="Top sources of risk"
            t-layer="table_project"
            full_width
            :can-search="false"
            :is-header-fixed="true"
            :can-sort="false"
            :canPageServer="true" 
            :layerColumnsToHide="['ORG_DISPLAY_NAME', 'PROJECT_ID', 'OPEN_P','NEW_P','RESOLVED_P','MTR_P']"
            style="color: black; padding-top: 10px"
        >
        <t-column header="PROJECT NAME" id-or-name="PROJECT_NAME">
            {{value}}
        </t-column>
        <t-column header="OPEN ISSUES" id-or-name="OPEN_C">
            <CurrentAndPast :current="value" :past="row.OPEN_P.value"/>
        </t-column>
        <t-column header="NEW ISSUES" id-or-name="NEW_C">
            <TURL :url="'https://app.snyk.io/org/'+row?.ORG_DISPLAY_NAME?.value.replace(' - ', '-').replace(' ', '-').toLowerCase()+'/reporting'"
                :additionalUrlParams="{'context[page]': 'issues-detail', 'project_name': row.PROJECT_ID.value, 'last_introduced_start': filters?.exec_summary_start, 'last_introduced_end': filters?.exec_summary_end, 'issue_status': 'Open%257CResolved' }" 
                :includeUrlStyle="false"
                :includeContextParam="true"
                t-layer="selected_org">
                <CurrentAndPast :current="value" :past="row.NEW_P.value" style="color: #145DEB"  />
            </TURL>
        </t-column>
        <t-column header="RESOLVED ISSUES" id-or-name="RESOLVED_C">
            <TURL :url="'https://app.snyk.io/org/'+row?.ORG_DISPLAY_NAME?.value.replace(' - ', '-').replace(' ', '-').toLowerCase()+'/reporting'"
                :additionalUrlParams="{'context[page]': 'issues-detail', 'project_name': row.PROJECT_ID.value,'last_disappeared_start': filters?.exec_summary_start, 'last_disappeared_end': filters?.exec_summary_end, 'issue_status': 'Open%257CResolved' }" 
                :includeUrlStyle="false"
                :includeContextParam="true"
                t-layer="selected_org">
            <CurrentAndPast :current="value" :past="row.RESOLVED_P.value" style="color: #145DEB" />
            </TURL>
        </t-column>
        <t-column header="MEAN TIME TO RESOLVE" id-or-name="MTR_C">
            <CurrentAndPast :current="value" :past="row.MTR_P.value" unit="d" />
        </t-column>
        </t-table>

        <t-table
            v-show="whoami && whoami.custom_attributes.snyk_user_reports_group_ids.length == 1"
            title="Top sources of risk"
            t-layer="table_org"
            full_width
            :can-search="false"
            :is-header-fixed="true"
            :can-sort="false"
            :canPageServer="true"
            :layerColumnsToHide="['ORG_PUBLIC_ID', 'OPEN_P','NEW_P','RESOLVED_P','MTR_P']"
            style="color: black; padding-top: 10px"
        >
            <t-column header="ORGANIZATION NAME" id-or-name="ORG_DISPLAY_NAME">
                {{value}}
            </t-column>
            <t-column header="OPEN ISSUES" id-or-name="OPEN_C">
                <CurrentAndPast :current="value" :past="row?.OPEN_P?.value" />
            </t-column>
            <t-column header="NEW ISSUES" id-or-name="NEW_C">
                    <TURL :url="'https://app.snyk.io/group/'+whoami.custom_attributes.snyk_user_reports_group_ids[0]+'/reporting'" 
                    :additionalUrlParams="{'context[page]': 'issues-detail', 'orgs': row.ORG_PUBLIC_ID.value, 'last_introduced_start': filters?.exec_summary_start, 'last_introduced_end': filters?.exec_summary_end, 'issue_status': 'Open%257CResolved' }" 
                    :includeUrlStyle="false">
                    <CurrentAndPast :current="value" :past="row.NEW_P.value" style="color: #145DEB" />
                </TURL>
            </t-column>
            <t-column header="RESOLVED ISSUES" id-or-name="RESOLVED_C">
                    <TURL :url="'https://app.snyk.io/group/'+whoami.custom_attributes.snyk_user_reports_group_ids[0]+'/reporting'" 
                    :additionalUrlParams="{'context[page]': 'issues-detail', 'orgs': row.ORG_PUBLIC_ID.value, 'last_disappeared_start': filters?.exec_summary_start, 'last_disappeared_end': filters?.exec_summary_end, 'issue_status': 'Open%257CResolved' }" 
                    :includeUrlStyle="false">
                    <CurrentAndPast :current="value" :past="row?.RESOLVED_P?.value" style="color: #145DEB" />
                </TURL>
            </t-column>
            <t-column header="MEAN TIME TO RESOLVE" id-or-name="MTR_C">
                <CurrentAndPast :current="value" :past="row?.MTR_P?.value" unit="d" />
            </t-column>
        </t-table>
    <!-- Table -->

    </t-pdf-issues>
</template>