import { LightningElement, track } from "lwc";
const columns = [
  { label: "Label", fieldName: "name", editable: true },
  { label: "Age", fieldName: "age", type: "text", editable: true }
];
export default class Datatable extends LightningElement {
  @track data = [];
  @track columns = columns;
  @track errors;

  // eslint-disable-next-line @lwc/lwc/no-async-await
  async connectedCallback() {
    const data = [
      {
        id: "ABC",
        name: "Test",
        age: "23"
      },
      {
        id: "YYZ",
        name: "Taro",
        age: "30"
      }
    ];
    this.data = data;
    this.errors = {
      rows: {
        YYZ: {
          title: "We found 2 errors.",
          messages: [
            "Enter a valid amount.",
            "Verify the email address and try again."
          ],
          fieldNames: ["name"]
        }
      },
      table: {
        title: "Your entry cannot be saved. Fix the errors and try again.",
        messages: ["Row 2 amount must be number", "Row 2 email is invalid"]
      }
    };
  }
  triggerError(event) {
    alert("aaaa");
  }
}
