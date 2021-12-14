import ruby
import codeql.ruby.dataflow.RemoteFlowSources

class CustomSource extends RemoteFlowSource::Range, MethodCall {
  CustomSource() { this.getMethodName() = "source" }
}
