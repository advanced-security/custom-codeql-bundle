import ruby
import codeql.ruby.dataflow.RemoteFlowSources

class CustomSource extends RemoteFlowSource::Range {
  CustomSource() { this.asExpr().getExpr().(MethodCall).getMethodName() = "source" }

  override string getSourceType() { result = "test" }
}
