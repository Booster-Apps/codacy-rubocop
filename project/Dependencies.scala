import sbt._

object Dependencies {

  val seed = ("com.codacy" %% "codacy-engine-scala-seed" % "3.0.141").withSources()

  val jacksonDataformatYaml =
    ("com.fasterxml.jackson.dataformat" % "jackson-dataformat-yaml" % "2.8.4").withSources()

}
