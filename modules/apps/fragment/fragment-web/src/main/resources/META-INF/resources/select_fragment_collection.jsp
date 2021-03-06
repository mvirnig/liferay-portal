<%--
/**
 * Copyright (c) 2000-present Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */
--%>

<%@ include file="/init.jsp" %>

<%
SelectFragmentCollectionDisplayContext selectFragmentCollectionDisplayContext = new SelectFragmentCollectionDisplayContext(renderRequest, renderResponse, request);

SelectFragmentCollectionManagementToolbarDisplayContext selectFragmentCollectionManagementToolbarDisplayContext = new SelectFragmentCollectionManagementToolbarDisplayContext(liferayPortletRequest, liferayPortletResponse, request, selectFragmentCollectionDisplayContext.getFragmentCollectionsSearchContainer());
%>

<clay:management-toolbar
	displayContext="<%= selectFragmentCollectionManagementToolbarDisplayContext %>"
/>

<aui:form cssClass="container-fluid-1280" name="selectFragmentCollectionFm">
	<liferay-ui:search-container
		searchContainer="<%= selectFragmentCollectionDisplayContext.getFragmentCollectionsSearchContainer() %>"
	>
		<liferay-ui:search-container-row
			className="com.liferay.fragment.model.FragmentCollection"
			keyProperty="fragmentCollectionId"
			modelVar="fragmentCollection"
		>

			<%
			row.setCssClass("entry-card lfr-asset-folder");
			%>

			<liferay-ui:search-container-column-text>
				<liferay-ui:search-container-column-text
					colspan="<%= 2 %>"
				>

					<%
					Map<String, Object> data = new HashMap<String, Object>();

					data.put("id", fragmentCollection.getFragmentCollectionId());
					data.put("name", fragmentCollection.getName());
					%>

					<liferay-frontend:horizontal-card
						cssClass="selector-button"
						data="<%= data %>"
						resultRow="<%= row %>"
						text="<%= HtmlUtil.escape(fragmentCollection.getName()) %>"
						url="javascript:;"
					>
						<liferay-frontend:horizontal-card-col>
							<liferay-frontend:horizontal-card-icon
								icon="documents-and-media"
							/>
						</liferay-frontend:horizontal-card-col>
					</liferay-frontend:horizontal-card>
				</liferay-ui:search-container-column-text>
			</liferay-ui:search-container-column-text>
		</liferay-ui:search-container-row>

		<liferay-ui:search-iterator
			displayStyle="icon"
			markupView="lexicon"
		/>
	</liferay-ui:search-container>
</aui:form>

<aui:script>
	Liferay.Util.selectEntityHandler('#<portlet:namespace />selectFragmentCollectionFm', '<%= HtmlUtil.escapeJS(selectFragmentCollectionDisplayContext.getEventName()) %>');
</aui:script>