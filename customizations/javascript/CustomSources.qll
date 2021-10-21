import javascript

class CustomSource extends RemoteFlowSource, DataFlow::CallNode {
  CustomSource() { this.getCalleeName() = "source" }

  override string getSourceType() { result = "a call to source" }
}
