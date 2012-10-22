<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://ands.org.au/standards/rif-cs/registryObjects" version="2.0">


    <!-- author: Cyrus Keong-->
    <xsl:output method="xml" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>
    <xsl:variable name="internalOrg" select="document('VU_Orgs.xml')/*"/>
    <xsl:variable name="externalOrg" select="document('Externals.xml')/*"/>
    <xsl:variable name="group_description" select="'Victoria University research data'"/>
    <xsl:variable name="originating_source" select="'thinkred.com.au'"/>

    <!-- all rif-cs field_key variables-->
    <xsl:variable name="project_title_fieldkey" select="'project_title'"/>
    <xsl:variable name="projectBriefDesc_fieldkey" select="'project_brief_desc'"/>
    <xsl:variable name="collection_title_fieldkey" select="'collection_title'"/>
    <xsl:variable name="collectionBriefDesc_fieldkey" select="'coll_description'"/>
    <xsl:variable name="rightsStatement_fieldkey" select="'rightsStatement'"/>
    <xsl:variable name="licence_fieldkey" select="'collection_license'"/>
    <xsl:variable name="accessRights_fieldkey" select="'collection_accessrights'"/>

    <xsl:template match="pma_xml_export/database">

        <registryObjects xmlns="http://ands.org.au/standards/rif-cs/registryObjects"
            xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
            xsi:schemaLocation="http://ands.org.au/standards/rif-cs/registryObjects http://services.ands.org.au/documentation/rifcs/schema/registryObjects.xsd">
            <xsl:for-each-group select="table" group-by="distinct-values(column[@name='id'])">

                <xsl:comment>
                    <VU_research_item>
                        <xsl:value-of select="current-grouping-key()"/>
                    </VU_research_item>
                </xsl:comment>
               
                <!-- create RIFCS items only if status is 'publish'-->
                <xsl:if
                    test="current-group()/column[@name= 'field_key' and text()='internal_status']/parent::node()/column[@name= 'meta_value']/text()='publish'">

                    <xsl:call-template name="primaryInvestigator"/>

                    <xsl:call-template name="vu_organization">
                        <xsl:with-param name="org_school_name">
                            <xsl:value-of
                                select="current-group()//column[@name= 'field_key' and text()='p1_school']/parent::node()/column[@name= 'meta_value']/text()"
                                disable-output-escaping="yes"/>
                        </xsl:with-param>
                        <xsl:with-param name="org_faculty_name">
                            <xsl:value-of
                                select="current-group()//column[@name= 'field_key' and text()='p1_faculty']/parent::node()/column[@name= 'meta_value']/text()"
                                disable-output-escaping="yes"/>
                        </xsl:with-param>
                        <xsl:with-param name="external_org_name">
                            <xsl:value-of
                                select="current-group()//column[@name= 'field_key' and text()='p1_external_org_name']/parent::node()/column[@name= 'meta_value']/text()"
                                disable-output-escaping="yes"/>
                        </xsl:with-param>
                    </xsl:call-template>

                    <xsl:if
                        test="current-group()//column[@name='field_key'and text()='has_co1']/parent::node()/column[@name= 'meta_value']/text()='Yes'">
                        <xsl:call-template name="CoInvestigator_1"/>

                        <xsl:call-template name="vu_organization">
                            <xsl:with-param name="org_school_name">
                                <xsl:value-of
                                    select="current-group()//column[@name= 'field_key' and text()='co1_school']/parent::node()/column[@name= 'meta_value']/text()"
                                    disable-output-escaping="yes"/>
                            </xsl:with-param>
                            <xsl:with-param name="org_faculty_name">
                                <xsl:value-of
                                    select="current-group()//column[@name= 'field_key' and text()='co1_faculty']/parent::node()/column[@name= 'meta_value']/text()"
                                    disable-output-escaping="yes"/>
                            </xsl:with-param>
                        </xsl:call-template>

                    </xsl:if>
                    <xsl:if
                        test="current-group()//column[@name='field_key'and text()='has_co2']/parent::node()/column[@name= 'meta_value']/text()='Yes'">
                        <xsl:call-template name="CoInvestigator_2"/>

                        <xsl:call-template name="vu_organization">
                            <xsl:with-param name="org_school_name">
                                <xsl:value-of
                                    select="current-group()//column[@name= 'field_key' and text()='co2_school']/parent::node()/column[@name= 'meta_value']/text()"
                                    disable-output-escaping="yes"/>
                            </xsl:with-param>
                            <xsl:with-param name="org_faculty_name">
                                <xsl:value-of
                                    select="current-group()//column[@name= 'field_key' and text()='co2_faculty']/parent::node()/column[@name= 'meta_value']/text()"
                                    disable-output-escaping="yes"/>
                            </xsl:with-param>
                        </xsl:call-template>

                    </xsl:if>
                    <xsl:if
                        test="current-group()//column[@name='field_key'and text()='has_co3']/parent::node()/column[@name= 'meta_value']/text()='Yes'">
                        <xsl:call-template name="CoInvestigator_3"/>

                        <xsl:call-template name="vu_organization">
                            <xsl:with-param name="org_school_name">
                                <xsl:value-of
                                    select="current-group()//column[@name= 'field_key' and text()='co3_school']/parent::node()/column[@name= 'meta_value']/text()"
                                    disable-output-escaping="yes"/>
                            </xsl:with-param>
                            <xsl:with-param name="org_faculty_name">
                                <xsl:value-of
                                    select="current-group()//column[@name= 'field_key' and text()='co3_faculty']/parent::node()/column[@name= 'meta_value']/text()"
                                    disable-output-escaping="yes"/>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:if>
                    <xsl:if
                        test="current-group()//column[@name='field_key'and text()='has_co4']/parent::node()/column[@name= 'meta_value']/text()='Yes'">
                        <xsl:call-template name="CoInvestigator_4"/>

                        <xsl:call-template name="vu_organization">
                            <xsl:with-param name="org_school_name">
                                <xsl:value-of
                                    select="current-group()//column[@name= 'field_key' and text()='co4_school']/parent::node()/column[@name= 'meta_value']/text()"
                                    disable-output-escaping="yes"/>
                            </xsl:with-param>
                            <xsl:with-param name="org_faculty_name">
                                <xsl:value-of
                                    select="current-group()//column[@name= 'field_key' and text()='co4_faculty']/parent::node()/column[@name= 'meta_value']/text()"
                                    disable-output-escaping="yes"/>
                            </xsl:with-param>
                        </xsl:call-template>

                    </xsl:if>
                    <xsl:call-template name="project"/>
                    <xsl:call-template name="collection"/>


                </xsl:if>

            </xsl:for-each-group>
        </registryObjects>
    </xsl:template>




    <xsl:template name="primaryInvestigator">

        <!-- Party Record for primary investigator-->
        <xsl:if
            test="current-group()//column[@name='field_key']='p1_title' or current-group()//column[@name='field_key']='p1_firstname' or current-group()//column[@name='field_key']='p1_lastname' or current-group()//column[@name='field_key']='p1_nla'">
            <registryObject group="Victoria University">
                <key>vu/person/<xsl:value-of
                        select="current-group()/column[@name= 'field_key' and text()='p1_firstname']/parent::node()/column[@name= 'meta_value']/text()"
                        />_<xsl:value-of
                        select="current-group()/column[@name= 'field_key' and text()='p1_lastname']/parent::node()/column[@name= 'meta_value']/text()"
                    /></key>

                <originatingSource>
                    <xsl:value-of select="$originating_source"/>
                </originatingSource>

                <party type="person">

                    <name type="primary">

                        <xsl:call-template name="partyTitle">
                            <xsl:with-param name="fieldkey" select="'p1_title'"/>
                        </xsl:call-template>

                        <xsl:call-template name="partyFirstname">
                            <xsl:with-param name="fieldkey" select="'p1_firstname'"/>
                        </xsl:call-template>

                        <xsl:call-template name="partyLastname">
                            <xsl:with-param name="fieldkey" select="'p1_lastname'"/>
                        </xsl:call-template>


                    </name>

                    <!--person is a member of an organization -->
                    <relatedObject>
                        <key>vu/project/<xsl:value-of select="current-grouping-key()"/></key>
                        <relation type="isMemeberOf"/>
                    </relatedObject>

                    <xsl:call-template name="partyNLA">
                        <xsl:with-param name="fieldkey" select="'p1_nla'"/>
                    </xsl:call-template>

                    <xsl:if test="current-group()//column[@name='field_key']='p1_relationship'">
                        <relatedObject>
                            <key>vu/project/<xsl:value-of select="current-grouping-key()"/></key>

                            <xsl:if
                                test="current-group()/column[@name= 'field_key' and text()='p1_relationship']/parent::node()/column[@name= 'meta_value']/text()='Project Owner'">
                                <relation type="isOwnerOf"/>
                            </xsl:if>
                            <xsl:if
                                test="current-group()/column[@name= 'field_key' and text()='p1_relationship']/parent::node()/column[@name= 'meta_value']/text()='Manager / Contact'">
                                <relation type="isManagerOf"/>
                            </xsl:if>
                        </relatedObject>
                    </xsl:if>
                    <xsl:call-template name="rifcs_location">
                        <xsl:with-param name="email_fieldkey" select="'p1_email'"/>
                    </xsl:call-template>
                </party>
            </registryObject>
        </xsl:if>
    </xsl:template>


    <xsl:template name="CoInvestigator_1">

        <!-- Party Record for co-investigator_1-->
        <xsl:if
            test="current-group()//column[@name='field_key']='co1_title' or current-group()//column[@name='field_key']='co1_firstname' or current-group()//column[@name='field_key']='co1_lastname' or current-group()//column[@name='field_key']='co1_nla'">
            <registryObject group="Victoria University">
                <key>vu/person/<xsl:value-of
                        select="current-group()/column[@name= 'field_key' and text()='co1_firstname']/parent::node()/column[@name= 'meta_value']/text()"
                        />_<xsl:value-of
                        select="current-group()/column[@name= 'field_key' and text()='co1_lastname']/parent::node()/column[@name= 'meta_value']/text()"
                    /></key>

                <originatingSource>
                    <xsl:value-of select="$originating_source"/>
                </originatingSource>
                <party type="person">

                    <name type="primary">

                        <xsl:call-template name="partyTitle">
                            <xsl:with-param name="fieldkey" select="'co1_title'"/>
                        </xsl:call-template>

                        <xsl:call-template name="partyFirstname">
                            <xsl:with-param name="fieldkey" select="'co1_firstname'"/>
                        </xsl:call-template>

                        <xsl:call-template name="partyLastname">
                            <xsl:with-param name="fieldkey" select="'co1_lastname'"/>
                        </xsl:call-template>

                    </name>

                    <xsl:call-template name="partyNLA">
                        <xsl:with-param name="fieldkey" select="'co1_nla'"/>
                    </xsl:call-template>

                    <xsl:call-template name="rifcs_location">
                        <xsl:with-param name="email_fieldkey" select="'co1_email'"/>
                    </xsl:call-template>

                    <relatedObject>
                        <key>vu/project/<xsl:value-of select="current-grouping-key()"/></key>
                        <relation type="isParticipantIn"/>
                    </relatedObject>

                </party>
            </registryObject>
        </xsl:if>
    </xsl:template>


    <xsl:template name="CoInvestigator_2">

        <!-- Party Record for co-investigator_2-->
        <xsl:if
            test="current-group()//column[@name='field_key']='co2_title' or current-group()//column[@name='field_key']='co2_firstname' or current-group()//column[@name='field_key']='co2_lastname' or current-group()//column[@name='field_key']='co2_nla'">
            <registryObject group="Victoria University">
                <key>vu/person/<xsl:value-of
                        select="current-group()/column[@name= 'field_key' and text()='co2_firstname']/parent::node()/column[@name= 'meta_value']/text()"
                        />_<xsl:value-of
                        select="current-group()/column[@name= 'field_key' and text()='co2_lastname']/parent::node()/column[@name= 'meta_value']/text()"
                    /></key>

                <originatingSource>
                    <xsl:value-of select="$originating_source"/>
                </originatingSource>
                <party type="person">

                    <name type="primary">

                        <xsl:call-template name="partyTitle">
                            <xsl:with-param name="fieldkey" select="'co2_title'"/>
                        </xsl:call-template>

                        <xsl:call-template name="partyFirstname">
                            <xsl:with-param name="fieldkey" select="'co2_firstname'"/>
                        </xsl:call-template>

                        <xsl:call-template name="partyLastname">
                            <xsl:with-param name="fieldkey" select="'co2_lastname'"/>
                        </xsl:call-template>

                    </name>
                    <xsl:call-template name="partyNLA">
                        <xsl:with-param name="fieldkey" select="'co2_nla'"/>
                    </xsl:call-template>

                    <xsl:call-template name="rifcs_location">
                        <xsl:with-param name="email_fieldkey" select="'co2_email'"/>
                    </xsl:call-template>

                    <relatedObject>
                        <key>vu/project/<xsl:value-of select="current-grouping-key()"/></key>
                        <relation type="isParticipantIn"/>
                    </relatedObject>

                </party>
            </registryObject>
        </xsl:if>
    </xsl:template>


    <xsl:template name="CoInvestigator_3">

        <!-- Party Record for co-investigator_3-->
        <xsl:if
            test="current-group()//column[@name='field_key']='co3_title' or current-group()//column[@name='field_key']='co3_firstname' or current-group()//column[@name='field_key']='co3_lastname' or current-group()//column[@name='field_key']='co3_nla'">
            <registryObject group="Victoria University">
                <key>vu/person/<xsl:value-of
                        select="current-group()/column[@name= 'field_key' and text()='co3_firstname']/parent::node()/column[@name= 'meta_value']/text()"
                        />_<xsl:value-of
                        select="current-group()/column[@name= 'field_key' and text()='co3_lastname']/parent::node()/column[@name= 'meta_value']/text()"
                    /></key>

                <originatingSource>
                    <xsl:value-of select="$originating_source"/>
                </originatingSource>
                <party type="person">

                    <name type="primary">

                        <xsl:call-template name="partyTitle">
                            <xsl:with-param name="fieldkey" select="'co3_title'"/>
                        </xsl:call-template>

                        <xsl:call-template name="partyFirstname">
                            <xsl:with-param name="fieldkey" select="'co3_firstname'"/>
                        </xsl:call-template>

                        <xsl:call-template name="partyLastname">
                            <xsl:with-param name="fieldkey" select="'co3_lastname'"/>
                        </xsl:call-template>

                    </name>
                    <xsl:call-template name="partyNLA">
                        <xsl:with-param name="fieldkey" select="'co3_nla'"/>
                    </xsl:call-template>

                    <xsl:call-template name="rifcs_location">
                        <xsl:with-param name="email_fieldkey" select="'co3_email'"/>
                    </xsl:call-template>
                    <relatedObject>
                        <key>vu/project/<xsl:value-of select="current-grouping-key()"/></key>
                        <relation type="isParticipantIn"/>
                    </relatedObject>
                </party>
            </registryObject>
        </xsl:if>
    </xsl:template>


    <xsl:template name="CoInvestigator_4">

        <!-- Party Record for co-investigator_4-->
        <xsl:if
            test="current-group()//column[@name='field_key']='co4_title' or current-group()//column[@name='field_key']='co4_firstname' or current-group()//column[@name='field_key']='co4_lastname' or current-group()//column[@name='field_key']='co4_nla'">
            <registryObject group="Victoria University">
                <key>vu/person/<xsl:value-of
                        select="current-group()/column[@name= 'field_key' and text()='co4_firstname']/parent::node()/column[@name= 'meta_value']/text()"
                        />_<xsl:value-of
                        select="current-group()/column[@name= 'field_key' and text()='co4_lastname']/parent::node()/column[@name= 'meta_value']/text()"
                    /></key>
                <originatingSource>
                    <xsl:value-of select="$originating_source"/>
                </originatingSource>
                <party type="person">

                    <name type="primary">

                        <xsl:call-template name="partyTitle">
                            <xsl:with-param name="fieldkey" select="'co4_title'"/>
                        </xsl:call-template>

                        <xsl:call-template name="partyFirstname">
                            <xsl:with-param name="fieldkey" select="'co4_firstname'"/>
                        </xsl:call-template>

                        <xsl:call-template name="partyLastname">
                            <xsl:with-param name="fieldkey" select="'co4_lastname'"/>
                        </xsl:call-template>
                    </name>
                    <xsl:call-template name="partyNLA">
                        <xsl:with-param name="fieldkey" select="'co4_nla'"/>
                    </xsl:call-template>

                    <xsl:call-template name="rifcs_location">
                        <xsl:with-param name="email_fieldkey" select="'co4_email'"/>
                    </xsl:call-template>

                    <relatedObject>
                        <key>vu/project/<xsl:value-of
                                select="current-group()/column[@name= 'field_key' and text()=$project_title_fieldkey]/parent::node()/column[@name= 'meta_value']/text()"
                            /></key>
                        <relation type="isParticipantIn"/>
                    </relatedObject>

                </party>
            </registryObject>
        </xsl:if>
    </xsl:template>


    <xsl:template name="project">

        <!-- Activity Record for project-->
        <registryObject group="Victoria University">
            <key>vu/project/<xsl:value-of
                    select="current-group()/column[@name= 'field_key' and text()=$project_title_fieldkey]/parent::node()/column[@name= 'meta_value']/text()"
                /></key>
            <originatingSource>
                <xsl:value-of select="$originating_source"/>
            </originatingSource>
            <activity type="project">

                <xsl:call-template name="projectTitle">
                    <xsl:with-param name="fieldkey" select="$project_title_fieldkey"/>
                </xsl:call-template>

                <xsl:call-template name="projectBriefDesc">
                    <xsl:with-param name="fieldkey" select="$projectBriefDesc_fieldkey"/>
                </xsl:call-template>

                <xsl:call-template name="anzsrc-for_code">
                    <xsl:with-param name="fieldkey" select="'primary_for_code'"/>
                </xsl:call-template>

                <xsl:call-template name="anzsrc-for_code">
                    <xsl:with-param name="fieldkey" select="'forcode_1'"/>
                </xsl:call-template>

                <xsl:call-template name="anzsrc-for_code">
                    <xsl:with-param name="fieldkey" select="'forcode_2'"/>
                </xsl:call-template>

                <xsl:call-template name="anzsrc-for_code">
                    <xsl:with-param name="fieldkey" select="'forcode_3'"/>
                </xsl:call-template>

                <xsl:call-template name="project_coverage"/>

                <relatedObject>
                    <key>vu/collection/<xsl:value-of select="current-grouping-key()"/></key>
                    <relation type="hasOutput"/>
                </relatedObject>

            </activity>
        </registryObject>
    </xsl:template>

    <xsl:template name="collection">
        <!-- Collection Record for research data-->
        <registryObject group="Victoria University">
            <key>vu/collection/<xsl:value-of select="current-grouping-key()"/></key>
            <originatingSource>
                <xsl:value-of select="$originating_source"/>
            </originatingSource>
            <collection type="collection">

                <xsl:call-template name="projectTitle">
                    <xsl:with-param name="fieldkey" select="$collection_title_fieldkey"/>
                </xsl:call-template>

                <xsl:call-template name="projectBriefDesc">
                    <xsl:with-param name="fieldkey" select="$collectionBriefDesc_fieldkey"/>
                </xsl:call-template>

                <xsl:call-template name="rifcs_rights"/>
                <xsl:call-template name="collection_coverage"/>
                <xsl:call-template name="collection_url"/>

                <xsl:call-template name="rifcs_location">
                    <xsl:with-param name="email_fieldkey" select="'collection_email'"/>
                </xsl:call-template>
                <xsl:call-template name="collection_publication"/>
                <xsl:call-template name="collection_citation"/>
                <xsl:call-template name="collection_identifier"/>

            </collection>
        </registryObject>
    </xsl:template>

    <xsl:template name="partyTitle">
        <xsl:param name="fieldkey"/>
        <xsl:if test="current-group()//column[@name='field_key']=$fieldkey">
            <namePart type="title">
                <xsl:value-of
                    select="current-group()/column[@name= 'field_key' and text()=$fieldkey]/parent::node()/column[@name= 'meta_value']/text()"
                />
            </namePart>
        </xsl:if>
    </xsl:template>

    <xsl:template name="partyFirstname">
        <xsl:param name="fieldkey"/>
        <xsl:if test="current-group()//column[@name='field_key']=$fieldkey">
            <namePart type="given">
                <xsl:value-of
                    select="current-group()/column[@name= 'field_key' and text()=$fieldkey]/parent::node()/column[@name= 'meta_value']/text()"
                />
            </namePart>
        </xsl:if>
    </xsl:template>

    <xsl:template name="partyLastname">
        <xsl:param name="fieldkey"/>
        <xsl:if test="current-group()//column[@name='field_key']=$fieldkey">
            <namePart type="family">
                <xsl:value-of
                    select="current-group()/column[@name= 'field_key' and text()=$fieldkey]/parent::node()/column[@name= 'meta_value']/text()"
                />
            </namePart>
        </xsl:if>
    </xsl:template>

    <xsl:template name="partyNLA">
        <xsl:param name="fieldkey"/>
        <xsl:if test="current-group()//column[@name='field_key']=$fieldkey">
            <identifier type="AU-ANL:PEAU">
                <xsl:value-of
                    select="current-group()/column[@name= 'field_key' and text()=$fieldkey]/parent::node()/column[@name= 'meta_value']/text()"
                />
            </identifier>
        </xsl:if>
    </xsl:template>

    <xsl:template name="projectTitle">
        <xsl:param name="fieldkey"/>
        <xsl:if test="current-group()//column[@name='field_key']=$fieldkey">
            <name type="primary">
                <namePart>
                    <xsl:value-of
                        select="current-group()/column[@name= 'field_key' and text()=$fieldkey]/parent::node()/column[@name= 'meta_value']/text()"
                    />
                </namePart>
            </name>
        </xsl:if>
    </xsl:template>

    <xsl:template name="projectBriefDesc">
        <xsl:param name="fieldkey"/>
        <xsl:if test="current-group()//column[@name='field_key']=$fieldkey">
            <description type="brief">
                <xsl:value-of
                    select="current-group()/column[@name= 'field_key' and text()=$fieldkey]/parent::node()/column[@name= 'meta_value']/text()"
                />
            </description>
        </xsl:if>
    </xsl:template>

    <xsl:template name="anzsrc-for_code">
        <xsl:param name="fieldkey"/>
        <xsl:if test="current-group()//column[@name='field_key']=$fieldkey">
            <subject type="anzsrc-for">
                <xsl:value-of
                    select="current-group()/column[@name= 'field_key' and text()=$fieldkey]/parent::node()/column[@name= 'meta_value']/text()"
                />
            </subject>
        </xsl:if>
    </xsl:template>

    <xsl:template name="rifcs_rights">
        <rights>
            <xsl:if test="current-group()//column[@name='field_key']=$rightsStatement_fieldkey">
                <rightsStatement>
                    <xsl:value-of
                        select="current-group()/column[@name= 'field_key' and text()=$rightsStatement_fieldkey]/parent::node()/column[@name= 'meta_value']/text()"
                    />
                </rightsStatement>
            </xsl:if>

            <xsl:if test="current-group()//column[@name='field_key']=$licence_fieldkey">
                <licence>
                    <xsl:value-of
                        select="current-group()/column[@name= 'field_key' and text()=$licence_fieldkey]/parent::node()/column[@name= 'meta_value']/text()"
                    />
                </licence>
            </xsl:if>
            <xsl:if test="current-group()//column[@name='field_key']=$accessRights_fieldkey">
                <accessRights>
                    <xsl:if
                        test="current-group()/column[@name= 'field_key' and text()=$accessRights_fieldkey]/parent::node()/column[@name= 'meta_value']/text()='Other'">
                        <xsl:value-of
                            select="current-group()/column[@name= 'field_key' and text()='collection_accessrights_others']/parent::node()/column[@name= 'meta_value']/text()"
                        />
                    </xsl:if>
                    <xsl:if
                        test="current-group()/column[@name= 'field_key' and text()=$accessRights_fieldkey]/parent::node()/column[@name= 'meta_value']/text()!='Other'">
                        <xsl:value-of
                            select="current-group()/column[@name= 'field_key' and text()=$accessRights_fieldkey]/parent::node()/column[@name= 'meta_value']/text()"
                        />
                    </xsl:if>
                </accessRights>
            </xsl:if>
        </rights>
    </xsl:template>

    <xsl:template name="project_coverage">
        <xsl:if
            test="current-group()//column[@name='field_key']='project_start_date' or current-group()//column[@name='field_key']='project_end_date'">
            <coverage>
                <temporal>
                    <xsl:if test="current-group()//column[@name='field_key']='project_start_date'">
                        <text>
                            <xsl:value-of
                                select="current-group()/column[@name= 'field_key' and text()='project_start_date']/parent::node()/column[@name= 'meta_value']/text()"
                            />
                        </text>
                    </xsl:if>
                    <xsl:if test="current-group()//column[@name='field_key']='project_end_date'">
                        <text>
                            <xsl:value-of
                                select="current-group()/column[@name= 'field_key' and text()='project_end_date']/parent::node()/column[@name= 'meta_value']/text()"
                            />
                        </text>
                    </xsl:if>
                </temporal>
            </coverage>
        </xsl:if>
    </xsl:template>

    <xsl:template name="collection_coverage">
        <xsl:if
            test="current-group()//column[@name='field_key']='collection_start_date' or current-group()//column[@name='field_key']='collection_end_date'">
            <coverage>
                <temporal>
                    <xsl:if
                        test="current-group()//column[@name='field_key']='collection_start_date'">
                        <text>
                            <xsl:value-of
                                select="current-group()/column[@name= 'field_key' and text()='collection_start_date']/parent::node()/column[@name= 'meta_value']/text()"
                            />
                        </text>
                    </xsl:if>
                    <xsl:if test="current-group()//column[@name='field_key']='collection_end_date'">
                        <text>
                            <xsl:value-of
                                select="current-group()/column[@name= 'field_key' and text()='collection_end_date']/parent::node()/column[@name= 'meta_value']/text()"
                            />
                        </text>
                    </xsl:if>
                </temporal>
                <xsl:if test="current-group()//column[@name='field_key']='collection_location'">
                    <spatial type="text">
                        <xsl:value-of
                            select="current-group()/column[@name= 'field_key' and text()='collection_location']/parent::node()/column[@name= 'meta_value']/text()"
                        />
                    </spatial>
                </xsl:if>
            </coverage>
        </xsl:if>
    </xsl:template>

    <xsl:template name="collection_publication">

        <xsl:if
            test="current-group()//column[@name='field_key']='collection_textref' or current-group()//column[@name='field_key']='collection_ref'">
            <relatedInfo type="publication">

                <xsl:element name="identifier">
                    <xsl:attribute name="type">
                        <xsl:value-of
                            select="current-group()/column[@name= 'field_key' and text()='collection_ref_type']/parent::node()/column[@name= 'meta_value']/text()"
                        />
                    </xsl:attribute>
                    <xsl:value-of
                        select="current-group()/column[@name= 'field_key' and text()='collection_ref']/parent::node()/column[@name= 'meta_value']/text()"
                    />
                </xsl:element>

                <title>
                    <xsl:value-of
                        select="current-group()/column[@name= 'field_key' and text()='collection_textref']/parent::node()/column[@name= 'meta_value']/text()"
                    />
                </title>
            </relatedInfo>
        </xsl:if>
    </xsl:template>

    <xsl:template name="collection_citation">
        <xsl:if test="current-group()//column[@name='field_key']='collection_citation'">
            <citationInfo>
                <fullCitation>
                    <xsl:value-of
                        select="current-group()/column[@name= 'field_key' and text()='collection_citation']/parent::node()/column[@name= 'meta_value']/text()"
                    />
                </fullCitation>
            </citationInfo>
        </xsl:if>
    </xsl:template>

    <xsl:template name="collection_identifier">
        <xsl:if
            test="current-group()//column[@name='field_key']='collection_id' and current-group()//column[@name='field_key']='collection_id_type'">
            <xsl:element name="identifier">
                <xsl:attribute name="type">
                    <xsl:value-of
                        select="current-group()/column[@name= 'field_key' and text()='collection_id_type']/parent::node()/column[@name= 'meta_value']/text()"
                    />
                </xsl:attribute>
                <xsl:value-of
                    select="current-group()/column[@name= 'field_key' and text()='collection_id']/parent::node()/column[@name= 'meta_value']/text()"
                />
            </xsl:element>
        </xsl:if>
    </xsl:template>

    <xsl:template name="collection_url">

        <xsl:if test="current-group()//column[@name='field_key']='collection_url'">
            <relatedInfo>
                <identifier type="website">
                    <xsl:value-of
                        select="current-group()/column[@name= 'field_key' and text()='collection_url']/parent::node()/column[@name= 'meta_value']/text()"
                    />
                </identifier>
                <title>URL of Collection / Data Set</title>
            </relatedInfo>
        </xsl:if>
    </xsl:template>

    <xsl:template name="rifcs_location">
        <xsl:param name="email_fieldkey"/>
        <xsl:if
            test="current-group()//column[@name='field_key']=$email_fieldkey or current-group()//column[@name='field_key']='location_details'">
            <location>
                <address>
                    <xsl:if test="current-group()//column[@name='field_key']=$email_fieldkey">   
                        <electronic type="email">
                            <value>
                                <xsl:value-of select="current-group()/column[@name= 'field_key' and text()=$email_fieldkey]/parent::node()/column[@name= 'meta_value']/text()"/>
                            </value>
                        </electronic>
                    </xsl:if>
                    <xsl:if test="current-group()//column[@name='field_key']='location_details'">   
                        <physical type="streetAddress">
                            <addressPart type="text">
                                <xsl:value-of select="current-group()/column[@name= 'field_key' and text()='location_details']/parent::node()/column[@name= 'meta_value']/text()"/>
                            </addressPart>
                        </physical>
                    </xsl:if>
                </address>
            </location>
        </xsl:if>
    </xsl:template>


    <xsl:template name="vu_organization">
        <xsl:param name="org_school_name"/>
        <xsl:param name="org_faculty_name"/>
        <xsl:param name="external_org_name"/>

        <xsl:if test="current-group()//column[@name='field_key']='p1_external_org_name'">


            <xsl:variable name="org_ext_displayname"
                select="$externalOrg//Department[Faculty=$external_org_name]/DisplayName/text()"/>
            <xsl:variable name="org_description"
                select="$externalOrg//Department[Faculty=$external_org_name]/Description/text()"/>
            <xsl:variable name="org_website"
                select="$externalOrg//Department[Faculty=$external_org_name]/Website/text()"/>
            <xsl:variable name="org_email"
                select="$externalOrg//Department[Faculty=$external_org_name]/Email/text()"/>
            <xsl:variable name="org_address"
                select="$externalOrg//Department[Faculty=$external_org_name]/Address/text()"/>
            <xsl:variable name="org_phone"
                select="$externalOrg//Department[Faculty=$external_org_name]/Phone/text()"/>

            <xsl:comment> external organization </xsl:comment>
            <registryObject group="Victoria University">
                <key>vu/org/</key>
                <originatingSource>
                    <xsl:value-of select="$originating_source"/>
                </originatingSource>
                <party type="group">
                    <name>
                        <namePart type="title">
                            <xsl:value-of select="$org_ext_displayname"/>
                        </namePart>
                    </name>
                    <description type="brief">
                        <xsl:value-of select="$org_description"/>
                    </description>
                    <location>
                        <address>
                    <xsl:if test="$org_email">   
                        <electronic type="email">
                            <value>
                                <xsl:value-of select="$org_email"/>
                            </value>
                        </electronic>
                    </xsl:if>
                     <xsl:if test="$org_phone">   
                        <electronic type="phone">
                            <value>
                                <xsl:value-of select="$org_phone"/>
                            </value>
                        </electronic>
                    </xsl:if>
                    <xsl:if test="org_address">   
                        <physical type="streetAddress">
                            <addressPart type="text">
                                <xsl:value-of select="org_address"/>
                            </addressPart>
                        </physical>
                    </xsl:if>
                </address>
                    </location>
                    <xsl:if test="$org_website">
                        <relatedInfo>
                            <identifier type="website">
                                <xsl:value-of select="$org_website"/>
                            </identifier>
                            <title>URL of Faculty / School/ Institute </title>
                        </relatedInfo>
                    </xsl:if>
                </party>
            </registryObject>
        </xsl:if>




        <xsl:if test="current-group()//column[@name='field_key']='p1_faculty'">


            <xsl:variable name="org_displayname"
                select="$internalOrg//Department[Faculty=$org_faculty_name and Name=$org_school_name]/DisplayName/text()"/>

            <xsl:variable name="org_description"
                select="$internalOrg//Department[Faculty=$org_faculty_name]/Description/text()"/>
            <xsl:variable name="org_website"
                select="$internalOrg//Department[Faculty=$org_faculty_name]/Website/text()"/>
            <xsl:variable name="org_email"
                select="$internalOrg//Department[Faculty=$org_faculty_name]/Email/text()"/>
            <xsl:variable name="org_address"
                select="$internalOrg//Department[Faculty=$org_faculty_name]/Address/text()"/>
            <xsl:variable name="org_phone"
                select="$internalOrg//Department[Faculty=$org_faculty_name]/Phone/text()"/>

            <xsl:comment> internal organization </xsl:comment>
            <registryObject group="Victoria University">
                <key>vu/org/</key>
                <originatingSource>
                    <xsl:value-of select="$originating_source"/>
                </originatingSource>
                <party type="group">
                    <name>
                        <namePart type="title">
                            <xsl:value-of select="$org_displayname"/>
                        </namePart>
                    </name>
                    <description type="brief">
                        <xsl:value-of select="$org_description"/>
                    </description>
                    <location>
                        <address>
                    <xsl:if test="$org_email">   
                        <electronic type="email">
                            <value>
                                <xsl:value-of select="$org_email"/>
                            </value>
                        </electronic>
                    </xsl:if>
                     <xsl:if test="$org_phone">   
                        <electronic type="phone">
                            <value>
                                <xsl:value-of select="$org_phone"/>
                            </value>
                        </electronic>
                    </xsl:if>
                    <xsl:if test="org_address">   
                        <physical type="streetAddress">
                            <addressPart type="text">
                                <xsl:value-of select="org_address"/>
                            </addressPart>
                        </physical>
                    </xsl:if>
                </address>
                    </location>
                    <xsl:if test="$org_website">
                        <relatedInfo>
                            <identifier type="website">
                                <xsl:value-of select="$org_website"/>
                            </identifier>
                            <title>URL of Faculty / School/ Institute </title>
                        </relatedInfo>
                    </xsl:if>
                </party>
            </registryObject>


        </xsl:if>

    </xsl:template>



</xsl:stylesheet>