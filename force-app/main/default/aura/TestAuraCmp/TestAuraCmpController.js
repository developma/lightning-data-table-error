({
  init: function(component, event, helper) {
    console.log("get", component.get("v.pageReference"));
    console.log("state", component.get("v.pageReference").state);
    console.log("foo", component.get("v.pageReference").state.c__foo);
  },

  handleLoad: function(cmp, event, helper) {
    cmp.set("v.showSpinner", false);
  },

  handleSubmit: function(cmp, event, helper) {
    console.log("handleSubmit");
    console.log("cmp", cmp);
    console.log("event", event);
    cmp.set("v.disabled", true);
    cmp.set("v.showSpinner", true);

    // 送信前のデータはこれで取れる
    console.log("★★★    fields Name", event.getParam("fields").Name);
    debugger;
    var eventFields = event.getParam("fields");
    delete eventFields.Name;

    event.preventDefault();
    cmp.find("editForm").submit(eventFields);
  },

  handleError: function(cmp, event, helper) {
    console.log("handleError");
    console.log("cmp", cmp);
    console.log("event", event);

    // errors are handled by lightning:inputField and lightning:nessages
    // so this just hides the spinnet
    cmp.set("v.showSpinner", false);
  },

  handleSuccess: function(cmp, event, helper) {
    console.log("handleSuccess");
    console.log("cmp", cmp);
    console.log("event", event);

    cmp.set("v.showSpinner", false);
    cmp.set("v.saved", true);
  }
});
