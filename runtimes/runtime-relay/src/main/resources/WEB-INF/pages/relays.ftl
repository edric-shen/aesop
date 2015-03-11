<#include "header.ftl">

    <div class="section">
	<h2>Registered Relays</h2>
	<table cellspacing=0 cellpadding=0 class="relays">
		<tr>
			<th colspan="2">Physical Source</th>
			<th rowspan="2">Logical Source</th>
			<th colspan="3">Producer</th>
			<th rowspan="2">Consumers</th>
		</tr>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Name</th>
            <th>Consumers</th>
            <th>Last SCN</th>
        </tr>
		<#list relayInfos as relay>
			<tr>

                <td >${relay.getpSourceId()}</td>
                <td >${relay.getpSourceName()}</td>
				<#if (relay.lSourceInfos?size > 0)>
                    <td>
                        ${relay.lSourceInfos?size}
                    </td>
				<#else>
                      <td>
                          None
                      </td>
                </#if>

				    <td class="v">${relay.getProducerName()}</td>
                    <td class="v">${relay.clientInfos?size}</td>
                    <td class="v">${relay.getProducerSinceSCN()}</td>

				<#if (relay.clientInfos?size > 0)>
				<td>
				    <table cellspacing=0 cellpadding=0 class="consumers">
                        <tr>
                            <th>
                                Host
                            </th>
                            <th>
                                Last SCN
                            </th>
                        </tr>
                    <#list relay.clientInfos as clientInfo>
                        <tr>
                            <td>${clientInfo.getClientName()}</td>
                            <td>${clientInfo.getClientSinceSCN()}</td>
                        </tr>
                    </#list>
                    </table>
                </td>
                <#else>
                    <td>None</td>
                </#if>
			</tr>		
		</#list>		
	</table>
	</div>


<#include "footer.ftl">
