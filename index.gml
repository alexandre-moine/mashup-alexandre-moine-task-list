<gm:page title="Task List" class="tasksTheme" css="./resources/tasks.css" authenticate="true">
 
  <!-- The advanced task list application is a simple task list that stores
       tasks per user in the ${user} feed. The application uses hierarchy to 
       display projects and tasks contained in each of those projects. The date
       picker control is also featured in this app.
       @author: GME Team
  --> 
 


<!-- Table for the header -->
<table width="100%" >
  <tr>
    <td valign="top">
      <div id="header" style="padding-left:15px;padding-top:10px;">
       <div id="logo">
         <img src="./resources/tasks_120_60.png" /> 
       </div>
      </div>
     </td>
   </tr>
</table>

<table width="100%" >
  <tr valign="top" >
    <td width="200" class="sideTabs" style="padding-left:15px;padding-top:20px;">
      <gm:list id="projList" data="${user}/projects2" template="projForm">
        <gm:handleEvent event="select" execute="onSelect(this.object);"/>
      </gm:list>
    </td>
    <td style="padding-right:15px;padding-top:20px;">
      <div id="taskContainer">
        <gm:list id="taskList" data="${projList}/tasks" template="taskForm">
          <gm:sort ref="gd:when/@startTime" name="date" reverse="true"/>
          <gm:sort ref="atom:title" name="task" reverse="false"/>
          <gm:handleEvent src="projList"/>
        </gm:list>
       </div>
    </td>
  </tr>
</table>

<gm:template id="projForm">
  <gm:create label="New Task List"/>
   <div style="padding-top:10px;">
   <table width="100%">
     <tbody repeat="true">
       <tr>
         <td width="160" style="padding:5px:"><gm:text style="width:140px;color:blue;text-decoration:underline;" ref="atom:title"/></td>
         <td width="40" style="padding:5px:" nowrap="true"><gm:editButtons class="gm-select-only"/></td>
       </tr>
     </tbody>
    </table>
  </div>
</gm:template>

<gm:template id="taskForm">
  <table width="100%" >
    <tr>
      <td colspan="7" height="30px" style="background-color:#C3D9FF;padding:5px;height:30px;-moz-border-radius: 4 4 0 0;">
        <gm:create label="New Task"/>
      </td>
    </tr>
   </table>
   <table width="100%" class="blue-theme">
      <tr width="100%">
        <td width="20" class="gm-header" ></td>
          <td width="75" class="gm-header" >Done</td>
          <td width="100" class="gm-header" ><gm:header sort="date">Due</gm:header></td>
          <td class="gm-header" ><gm:header sort="task">Task</gm:header></td>
          <td width="150" nowrap="true" class="gm-header" >Assigned To</td>
          <td width="100" class="gm-header" >Priority</td>
          <td width="60" class="gm-header" ></td>
     </tr>
     <tbody repeat="true" width="100%">
       <tr class="tasks">
         <td width="20" valign="top" align="left" ><gm:toggle/></td>
         <td width="75" align="left" ><gm:checkbox ref="gd:status/@value"/></td>
         <td width="100" align="left" ><gm:date ref="gd:when/@startTime"/></td>
         <td ><gm:text ref="atom:title" gm-focus="true"/></td>
         <td width="150" ><gm:text ref="gd:assignedTo/@email"/></td>
         <td width="100" ><gm:rating ref="gd:priority"/></td>
         <td width="60" ><gm:editButtons/></td>
        </tr>
        <tr class="gm-toggled" width="100%">
          <td colspan="7" ><gm:textarea ref="atom:content" style="white-space:pre"/></td>
        </tr>
     </tbody>
  </table>
  <div id="message" style="text-align:center;color:gray;margin-top:4em;">Click a list to see the tasks or create a new task list</div>

   <table width="100%" style="margin-top:4em" >
    <tr>
     <td colspan="7" style="background-color:#C3D9FF;padding:5px;height:30px;-moz-border-radius: 0 0 4 4" >
        <gm:create label="New Task"/>
     </td>
    </tr>
  </table>
</gm:template>

<script>
function onSelect(o) {
  var div = document.getElementById("taskContainer");
  if (div.style.display == "none"){
     div.style.display ="block";
  }

  var div2 = document.getElementById("message");
  div2.style["display"] = "none";
}
</script>
  
<script src="http://www.google-analytics.com/urchin.js" type="text/javascript">
</script>
<script type="text/javascript">
_uacct = "UA-2309767-1";
urchinTracker();
</script>

</gm:page>
