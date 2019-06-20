<%inherit file="/base.mako"/>
<%namespace file="/message.mako" import="render_msg" />

%if message:
    ${render_msg( message, 'done' )}
%endif

<div class="report">
    <div class="reportBody">
        <h3 align="center">
            Samples with Genotype
        </h3>
        <h4>
            Coral MLG Clonal ID: <b>${coral_mlg_clonal_id}</b><br/>
            Coral MLG Rep Sample ID: <b>${coral_mlg_rep_sample_id}</b><br/>
            Genetic Coral Species Call: <b>${genetic_coral_species_call}</b><br/>
            Bcoral Genet ID: <b>${bcoral_genet_id}</b>
        </h4>
        <table align="center" class="colored">
            %if len(samples) == 0:
                <tr>
                    <td colspan="2">
                        There are no samples with this genotype
                    </td>
                </tr>
            %else:
                <tr class="header">
                    <td>Affy ID</td>
                    <td>Sample ID</td>
                    <td>Field Call</td>
                    <td>Colony Loc</td>
                    <td>Collect Date</td>
                    <td>User Specimen ID</td>
                    <td>Registry ID</td>
                    <td>Depth</td>
                    <td>DNA Extract Method</td>
                    <td>DNA Concentration</td>
                    <td>Public After</td>
                    <td>% Miss</td>
                    <td>% Ref</td>
                    <td>% Alt</td>
                    <td>% Het</td>
                    <td>Pheno ID</td>
                    <td>Collect ID</td>
                </tr>
                <% ctr = 0 %>
                %for sample in samples:
                    %if ctr % 2 == 1:
                        <tr class="odd_row">
                    %else:
                        <tr class="tr">
                    %endif
                        <td>${sample[0]}</td>
                        <td>${sample[1]}</td>
                        <td>${sample[2]}</td>
                        <td>${sample[3]}</td>
                        <td>${sample[4]}</td>
                        <td>${sample[5]}</td>
                        <td>${sample[6]}</td>
                        <td>${sample[7]}</td>
                        <td>${sample[8]}</td>
                        <td>${sample[9]}</td>
                        <td>${sample[10]}</td>
                        <td>${sample[11]}</td>
                        <td>${sample[12]}</td>
                        <td>${sample[13]}</td>
                        <td>${sample[14]}</td>
                        <td>${sample[15]}</td>
                        <td><a href="${h.url_for(controller='collectors', action='of_sample', sort_id='default', order='default', collector_id=sample[16], affy_id=sample[0])}">${sample[16]}</a></td>
                    </tr>
                    <% ctr += 1 %>
                %endfor
            %endif
        </table>
    </div>
</div>

