import ruby
import codeql.ruby.dataflow.RemoteFlowSources

class CustomSource extends RemoteFlowSource::Range {
  CustomSource() { this.(MethodCall).getMethodName() = "source" }
}
