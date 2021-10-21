import javascript

class CustomSource extends RemoteFlowSource, DataFlow::CallNode {
  CustomSource() { this.getCalleeName() = "source" }

  string getSourceType() { result = "a call to source" }
}
