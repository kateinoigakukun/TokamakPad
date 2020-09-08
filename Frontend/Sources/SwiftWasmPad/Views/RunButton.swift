import TokamakDOM
import TokamakStaticHTML
import JavaScriptKit

struct RunButton: View {
    let action: () -> Void
    
    @EnvironmentObject
    var runner: Runner

    var body: some View {
        let attributes = [
            "id": "run-button",
            "className": runner.isRunnable ? "" : "disabled-run-button",
        ]
        return DynamicHTML("button", attributes, listeners: ["click": onClick]) {
            HTML("span") { Text("RUN").foregroundColor(.white) }
        }
    }
    
    func onClick(_: JSObjectRef) {
        action()
    }
}
