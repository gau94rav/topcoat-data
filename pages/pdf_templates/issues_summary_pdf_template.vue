<template>
    <t-pdf-issues class="relative left-0 right-0 m-auto">

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
                    <span v-if="nav.pdf_template && nav.pdf_template === 'issues_summary_pdf_template'">
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
                <span class="text-[#1C1C21] font-medium leading-6 text-xl roboto-fonts">Issues Total</span>
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
        <div class="flex flex-col py-7 roboto-fonts" slot="filters">
            <div class="flex items-center gap-3 pb-3">
                <span class="text-[#441C99]">
                    <filter-variant-icon />
                </span>
                <span class="text-[#1C1C21] font-medium leading-6 text-xl roboto-fonts">Filters Applied</span>
            </div>

            <t-grids column-count="2" gap-x="10" gap-y="4">

                <t-pdf-date
                    v-if="filters.issue_summary_start && filters.issue_summary_end"
                    label="Date Range"
                    :dates="[
                        { label: 'Start', date: filters.issue_summary_start },
                        { label: 'End', date: filters.issue_summary_end }
                    ]"
                />

                <t-issues-pdf-filters
                    v-if="filters.product_name"
                    :values="filters.product_name"
                    label="Snyk Product"
                />

                <t-issues-pdf-filters
                    v-if="filters.min && filters.max"
                    :values="filters.min + '|' + filters.max"
                    label="Priority Score"
                    seperator="-"
                    are-items-condensed
                />

                <t-issues-pdf-filters
                    v-if="filters.autofixable"
                    :values="filters.autofixable"
                    label="Is Auto Fixable"
                />

                <t-issues-pdf-filters
                    v-if="filters.is_currently_ignored"
                    :values="filters.is_currently_ignored"
                    label="Is Currently Ignored"
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

        <!-- Charts -->
        <div class="flex flex-col">
            <span class="text-base font-bold">Issues Identified and Resolved</span>
            <modified_line_chart style="width: 1920px; height: 800px;" t-layer="line_identified_resolved" borderless />
        </div>
        <div class="page-break"></div>
        <t-grids gap-x="3" column-count="2">
            <div class="flex flex-col">
                <span class="text-base font-bold p-2.5">Exposure Window</span>
                <modified_line_chart style="width: 960px; height: 800px;" t-layer="line_exposure_window" borderless />
            </div>
            
            <div class="flex flex-col">
                <span class="text-base font-bold p-2.5">Time to Resolve by Week</span>
                <modified_line_chart style="width: 960px; height: 800px;" t-layer="line_mtr" borderless />
            </div>
        </t-grids>
        <div class="page-break"></div>
        <!-- Charts -->

        <!-- Table -->
        <t-table
            class="roboto-fonts"
            v-show="whoami && whoami.custom_attributes?.snyk_user_reports_group_ids?.length !== 1"
            title="Risk Breakdown"
            t-layer="table_project"
            full_width
            :can-search="false"
            :is-header-fixed="true"
            :canPageServer="true" 
            :rows-per-page="50"
            :layerColumnsToHide="['ORG_DISPLAY_NAME', 'project_public_id', 'OPEN_PREVIOUS','NEW_PREVIOUS','RESOLVED_PREVIOUS','MTR_PREVIOUS','ORG_NAME']"
            style="color: black; padding-top: 10px"
        >
        <t-column header="PROJECT NAME" id-or-name="PROJECT_NAME">
            {{value}}
        </t-column>
        <t-column header="OPEN ISSUES" id-or-name="OPEN_CURRENT">
            <CurrentAndPast :current="value" :past="row.OPEN_PREVIOUS.value"/>
        </t-column>
        <t-column header="NEW ISSUES" id-or-name="NEW_CURRENT">
            <TURL :url="'https://app.snyk.io/org/'+row?.ORG_NAME?.value.replace(' - ', '-').replace(' ', '-').toLowerCase()+'/reporting'"
                :additionalUrlParams="{'context[page]': 'issues-detail', 'project_name': row.PROJECT_PUBLIC_ID.value, 'last_introduced_start': filters?.issue_summary_start, 'last_introduced_end': filters?.issue_summary_end, 'issue_status': 'Open%257CResolved' }" 
                :includeUrlStyle="false"
                :includeContextParam="true"
                t-layer="selected_org">
                <CurrentAndPast :current="value" :past="row.NEW_PREVIOUS.value" style="color: #145DEB"  />
            </TURL>
        </t-column>
        <t-column header="RESOLVED ISSUES" id-or-name="RESOLVED_CURRENT">
            <TURL :url="'https://app.snyk.io/org/'+row?.ORG_NAME?.value.replace(' - ', '-').replace(' ', '-').toLowerCase()+'/reporting'"
                :additionalUrlParams="{'context[page]': 'issues-detail', 'project_name': row.PROJECT_PUBLIC_ID.value,'last_disappeared_start': filters?.issue_summary_start, 'last_disappeared_end': filters?.issue_summary_end, 'issue_status': 'Open%257CResolved' }" 
                :includeUrlStyle="false"
                :includeContextParam="true"
                t-layer="selected_org">
            <CurrentAndPast :current="value" :past="row.RESOLVED_PREVIOUS.value" style="color: #145DEB" />
            </TURL>
        </t-column>
        <t-column header="MEAN TIME TO RESOLVE" id-or-name="MTR_CURRENT">
            <CurrentAndPast :current="value" :past="row?.MTR_PREVIOUS?.value" unit="d" zeroDisplay="" />
        </t-column>

            <template v-slot:footer="{ totalCount, visibleCount }">
                <div class="px-2 text-lg text-right w-full" v-if="totalCount > visibleCount">
                    {{ 'Showing only ' + visibleCount + ' of ' + totalCount + ' results' }}
                </div>
            </template>
        </t-table>

        <t-table
            v-show="whoami && whoami.custom_attributes.snyk_user_reports_group_ids.length == 1"
            title="Risk Breakdown"
            t-layer="table_org"
            full_width
            :can-search="false"
            :is-header-fixed="true"
            :canPageServer="true"
            :rows-per-page="50"
            :layerColumnsToHide="['ORG_PUBLIC_ID', 'OPEN_PREVIOUS','NEW_PREVIOUS','RESOLVED_PREVIOUS','MTR_PREVIOUS','ORG_NAME']"
            style="color: black; padding-top: 10px"
        >
            <t-column header="ORGANIZATION NAME" id-or-name="ORG_DISPLAY_NAME">
                {{value}}
            </t-column>
            <t-column header="OPEN ISSUES" id-or-name="OPEN_CURRENT">
                <CurrentAndPast :current="value" :past="row?.OPEN_PREVIOUS?.value" />
            </t-column>
            <t-column header="NEW ISSUES" id-or-name="NEW_CURRENT">
                    <TURL :url="'https://app.snyk.io/group/'+whoami.custom_attributes.snyk_user_reports_group_ids[0]+'/reporting'" 
                    :additionalUrlParams="{'context[page]': 'issues-detail', 'orgs': row.ORG_PUBLIC_ID.value, 'last_introduced_start': filters?.issue_summary_start, 'last_introduced_end': filters?.issue_summary_end, 'issue_status': 'Open%257CResolved' }" 
                    :includeUrlStyle="false">
                    <CurrentAndPast :current="value" :past="row.NEW_PREVIOUS.value" style="color: #145DEB" />
                </TURL>
            </t-column>
            <t-column header="RESOLVED ISSUES" id-or-name="RESOLVED_CURRENT">
                    <TURL :url="'https://app.snyk.io/group/'+whoami.custom_attributes.snyk_user_reports_group_ids[0]+'/reporting'" 
                    :additionalUrlParams="{'context[page]': 'issues-detail', 'orgs': row.ORG_PUBLIC_ID.value, 'last_disappeared_start': filters?.issue_summary_start, 'last_disappeared_end': filters?.issue_summary_end, 'issue_status': 'Open%257CResolved' }" 
                    :includeUrlStyle="false">
                    <CurrentAndPast :current="value" :past="row?.RESOLVED_PREVIOUS?.value" style="color: #145DEB" />
                </TURL>
            </t-column>
            <t-column header="MEAN TIME TO RESOLVE" id-or-name="MTR_CURRENT">
                <CurrentAndPast :current="value" :past="row?.MTR_PREVIOUS?.value" unit="d" zeroDisplay="" />
            </t-column>

            <template v-slot:footer="{ totalCount, visibleCount }">
              <div class="px-2 text-lg text-right w-full" v-if="totalCount > visibleCount">
                {{ 'Showing only ' + visibleCount + ' of ' + totalCount + ' results' }}
              </div>
            </template>
        </t-table>
    <!-- Table -->

    </t-pdf-issues>
</template>