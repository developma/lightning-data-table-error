({
  init: function(component, event, helper) {
    console.log("init");
    var pageReference = {
      type: "standard__component",
      attributes: {
        componentName: "c__TestAuraCmp"
      },
      state: {
        c__foo: "John"
      }
    };
    component.set("v.pageReference", pageReference);
    console.log("pageReference", pageReference);
  },
  myAction: function(component, event, helper) {
    alert("aaaaaa");
    var navService = component.find("navService");
    var pageReference = component.get("v.pageReference");
    event.preventDefault();
    navService.navigate(pageReference);
  },
  start: function(component, event, helper) {
    alert("cccc");
  }
});
