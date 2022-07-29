<template>
    <report-pdf class="relative left-0 right-0 m-auto px-7">
        
        <!-- Header info section -->
        <div class="relative" slot="filters">

            <!-- Active Org/Group and report name section -->
            <div class="text-[#555463] text-base font-medium leading-6" v-if="whoami">
                <span v-if="whoami.custom_attributes.snyk_user_reports_group_ids.length == 1">
                    <t-group-and-org
                        t-layer="filter_group"
                        :itemId="whoami.custom_attributes.snyk_user_reports_group_ids[0]"
                        t-key-column="GROUP_PUBLIC_ID"
                        t-value-column="GROUP_NAME"
                        class="text-[#555463] text-base font-medium"
                    />
                </span>
                <span v-if="whoami.custom_attributes.snyk_user_reports_org_ids.length == 1">
                    <span v-if="whoami.custom_attributes.snyk_user_reports_group_ids.length == 1">
                        /
                    </span>
                    <span>
                        <t-group-and-org
                            t-layer="filter_orgs"
                            :itemId="whoami.custom_attributes.snyk_user_reports_org_ids[0]"
                            t-key-column="ORG_PUBLIC_ID"
                            t-value-column="ORG_DISPLAY_NAME"
                            class="text-[#555463] text-base font-medium"
                        />
                    </span>
                </span>
            </div>
            <div class="text-[#1C1C21] text-[26px] font-semibold leading-[39px]">
                <div v-for="(nav, index) in project.nav" :key="index">
                    <span v-if="nav.pdf_template && nav.pdf_template === 'issues_pdf'">
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

            <t-vis-grouper t-layer="all_severity_issues" t-class="grid grid-cols-2 gap-2">
                <t-big-number label="TOTAL" t-value-column="TOTAL" has-underline has-tall-size />
                <t-big-number label="UNIQUE" t-value-column="TOTAL_UNIQUE" has-underline has-tall-size />
            </t-vis-grouper>

            <div class="text-base font-normal text-[#555463] leading-[19px] py-3">
                Breakdown by <span class="font-bold">Severity</span>
            </div>

            <t-vis-grouper t-layer="all_severity_issues" t-class="grid grid-cols-3 gap-2">
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

                <t-filter-values
                    t-key-column="OPTION"
                    t-value-column="OPTION"
                    t-filter:selected_items="issue_by"
                    t-layer="filter_layer_type"
                    label="Issues by"
                    v-if="(new URLSearchParams(window.location.search)).get('issue_by')"
                />

                <t-filter-values
                    t-key-column="ISSUE_SEVERITY"
                    t-value-column="ISSUE_SEVERITY"
                    t-filter:selected_items="issue_severity"
                    t-layer="m_filter_issue_severity"
                    label="Issue severity"
                    v-if="(new URLSearchParams(window.location.search)).get('issue_severity')"
                />

                <t-filter-values
                    t-key-column="IS_CURRENTLY_IGNORED"
                    t-value-column="IS_CURRENTLY_IGNORED"
                    t-filter:selected_items="status"
                    t-layer="m_filter_status"
                    label="Currently Present"
                    v-if="(new URLSearchParams(window.location.search)).get('status')"
                />

                <t-filter-values
                    t-key-column="IS_CURRENTLY_IGNORED"
                    t-value-column="IS_CURRENTLY_IGNORED"
                    t-filter:selected_items="ignored"
                    t-layer="m_filter_ignored"
                    label="Currently Ignored"
                    v-if="(new URLSearchParams(window.location.search)).get('ignored')"
                />

                <t-filter-values
                    t-key-column="REACHABILITY"
                    t-value-column="REACHABILITY"
                    t-filter:selected_items="reachability"
                    t-layer="m_filter_reachability"
                    label="Reachability"
                    v-if="(new URLSearchParams(window.location.search)).get('reachability')"
                />

                <t-filter-values
                    t-key-column="PRODUCT_NAME"
                    t-value-column="PRODUCT_NAME"
                    t-filter:selected_items="product_name"
                    t-layer="m_filter_product_name"
                    label="Products"
                    v-if="(new URLSearchParams(window.location.search)).get('product_name')"
                />

                <t-filter-values
                    t-key-column="ISSUE_TYPE"
                    t-value-column="ISSUE_TYPE"
                    t-filter:selected_items="issue_type"
                    t-layer="m_filter_issue_type"
                    label="Issue Type"
                    v-if="(new URLSearchParams(window.location.search)).get('issue_type')"
                />

                <t-filter-values
                    t-key-column="AUTOFIXABLE"
                    t-value-column="AUTOFIXABLE"
                    t-filter:selected_items="autofixable"
                    t-layer="m_filter_autofixable"
                    label="Auto Fixable"
                    v-if="(new URLSearchParams(window.location.search)).get('autofixable')"
                />

                <t-filter-values
                    t-key-column="EXPLOIT_MATURITY"
                    t-value-column="EXPLOIT_MATURITY"
                    t-filter:selected_items="exploit_maturity"
                    t-layer="m_filter_exploit_maturity"
                    label="Exploit Maturity"
                    v-if="(new URLSearchParams(window.location.search)).get('exploit_maturity')"
                />

            </t-grids>

            <t-grids column-count="1" gap-x="10" gap-y="4" class="mt-4">

                <t-filter-values
                    t-key-column="PROJECT_ID"
                    t-value-column="PROJECT_NAME"
                    t-filter:selected_items="project_name"
                    t-layer="m_filter_project_name"
                    label="Project Name"
                    v-if="(new URLSearchParams(window.location.search)).get('project_name')"
                    is-list
                    :visible-items-count="5"
                />

                <t-filter-values
                    t-key-column="PROJECT_TYPE"
                    t-value-column="PROJECT_TYPE"
                    t-filter:selected_items="project_type"
                    t-layer="m_filter_project_type"
                    label="Project Type"
                    v-if="(new URLSearchParams(window.location.search)).get('project_type')"
                    is-list
                    :visible-items-count="5"
                />
                
                <t-tag-filter-values
                    t-key-column="KEY"
                    t-value-column="VALUE"
                    t-filter:selected_items="tags"
                    t-layer="filter_tags"
                    label="Project Tags"
                    v-if="(new URLSearchParams(window.location.search)).get('tags')"
                    :is-list="true"
                    :visible-items-count="5"
                />

                <!-- <t-tag-filter-values
                    t-key-column="KEY"
                    t-value-column="VALUE"
                    t-filter:selected_items="cve"
                    t-layer="filter_cve"
                    label="CVE"
                    v-if="(new URLSearchParams(window.location.search)).get('cve')"
                    :is-list="true"
                    :visible-items-count="5"
                /> -->

                <t-tag-filter-values
                    t-key-column="KEY"
                    t-value-column="VALUE"
                    t-filter:selected_items="cwe"
                    t-layer="filter_cwe"
                    label="CWE"
                    v-if="(new URLSearchParams(window.location.search)).get('cwe')"
                    :is-list="true"
                    :visible-items-count="5"
                />

                <t-tag-filter-values
                    t-key-column="KEY"
                    t-value-column="VALUE"
                    t-filter:selected_items="criticality"
                    t-layer="m_filter_project_criticality"
                    label="Project Criticality"
                    v-if="(new URLSearchParams(window.location.search)).get('criticality')"
                    :is-list="true"
                    :visible-items-count="5"
                />

                <t-tag-filter-values
                    t-key-column="KEY"
                    t-value-column="VALUE"
                    t-filter:selected_items="environment"
                    t-layer="m_filter_project_environment"
                    label="Project Environment"
                    v-if="(new URLSearchParams(window.location.search)).get('environment')"
                    :is-list="true"
                    :visible-items-count="5"
                />


                <t-tag-filter-values
                    t-key-column="KEY"
                    t-value-column="VALUE"
                    t-filter:selected_items="lifecycle"
                    t-layer="m_filter_project_lifecycle"
                    label="Project Lifecycle"
                    v-if="(new URLSearchParams(window.location.search)).get('lifecycle')"
                    :is-list="true"
                    :visible-items-count="5"
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

            <t-table
              full_width t-layer="issue_table"
              :can-search="false"
              :is-header-fixed="true"
              :can-sort="false"
              sort-direction="desc"
              :canPageServer="true"
              :exludeFromColumns="['ISSUE_TYPE','CVE','PROBLEM_ID']"
            >
                <t-column header=" " id-or-name="ISSUE_SEVERITY">
                    <IssueSeverityIcon :severity="value" />
                </t-column>
                <t-column header="SCORE" id-or-name="PRIORITY_SCORE">
                    {{ parseInt(rendered_value, 10) }}
                </t-column>
                <t-column header="ISSUE" id-or-name="PROBLEM_TITLE" >
                    <div class="text-[#145DEB] text-sm font-medium leading-[15px] tracking-[0.1px]">{{row.ISSUE_TYPE.value}}</div>
                    <span v-if="row.ISSUE_TYPE.value == 'Vulnerability'">
                        <TUrl :url="'https://security.snyk.io/vuln/'+row.PROBLEM_ID.value" target="_blank"> {{rendered_value}} </TUrl>
                    </span>
                    <span v-else>
                        {{rendered_value}}
                    </span>
                </t-column> 
                <t-column header="IDENTIFIERS" id-or-name="CWE">
                    <div class="text-[#145DEB] text-sm font-normal">
                        {{ JSON.parse(row.CWE.value).concat(JSON.parse(row.CVE.value)).join() }}
                    </div>
                </t-column>
                <t-column header="PROJECT" id-or-name="PROJECT_NAME" />
                <t-column header="EXPLOIT MATURITY" id-or-name="EXPLOIT_MATURITY">
                    <span v-if="rendered_value">
                        {{ rendered_value.split('-').map((w) => _.capitalize(w)).join(' ') }}
                    </span>
                </t-column>
                <t-column header="AUTO FIXABLE" id-or-name="AUTOFIXABLE">
                    <span class="flex text-sm text-normal text-[#727184] leading-[17px]">
                        <CheckOrX :value="value !== 'Not Auto Fixable'" />
                        <div>{{ value }}</div>
                    </span>
                </t-column>
                <t-column header="LAST INTRODUCED" id-or-name="LAST_INTRODUCED">
                    <date-formatter :date="value" />
                </t-column>
                <t-column header="STATUS" id-or-name="IS_CURRENTLY_PRESENT">
                    <open-or-fixed :isOpen="value" />
                </t-column>
                <t-column header="PRODUCT" id-or-name="PRODUCT_NAME" />
            </t-table>
        <!-- Table -->

    </report-pdf>
</template>