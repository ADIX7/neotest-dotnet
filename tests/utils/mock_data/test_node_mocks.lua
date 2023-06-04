local M = {}

M.xunit_parameterized_tests_simple = {
  node_list = {
    {
      id = "/home/issafalcon/repos/learning-dotnet/UnitTesting/XUnitSamples/ParameterizedTests.cs::XUnitSamples::ParameterizedTests::Test1",
      full_name = "XUnitSamples.ParameterizedTests.Test1",
      is_class = false,
      name = "Test1",
      path = "/home/issafalcon/repos/learning-dotnet/UnitTesting/XUnitSamples/ParameterizedTests.cs",
      range = { 6, 1, 13, 2 },
      type = "test",
    },
    {
      {
        id = "/home/issafalcon/repos/learning-dotnet/UnitTesting/XUnitSamples/ParameterizedTests.cs::XUnitSamples::ParameterizedTests::Test1(value: 1)",
        is_class = false,
        full_name = "XUnitSamples.ParameterizedTests.Test1(value: 1)",
        name = "Test1(value: 1)",
        path = "/home/issafalcon/repos/learning-dotnet/UnitTesting/XUnitSamples/ParameterizedTests.cs",
        range = { 7, 12, 7, 15 },
        type = "test",
      },
    },
    {
      {
        id = "/home/issafalcon/repos/learning-dotnet/UnitTesting/XUnitSamples/ParameterizedTests.cs::XUnitSamples::ParameterizedTests::Test1(value: 2)",
        is_class = false,
        full_name = "XUnitSamples.ParameterizedTests.Test1(value: 2)",
        name = "Test1(value: 2)",
        path = "/home/issafalcon/repos/learning-dotnet/UnitTesting/XUnitSamples/ParameterizedTests.cs",
        range = { 8, 12, 8, 15 },
        type = "test",
      },
    },
    {
      {
        id = "/home/issafalcon/repos/learning-dotnet/UnitTesting/XUnitSamples/ParameterizedTests.cs::XUnitSamples::ParameterizedTests::Test1(value: 3)",
        is_class = false,
        full_name = "XUnitSamples.ParameterizedTests.Test1(value: 3)",
        name = "Test1(value: 3)",
        path = "/home/issafalcon/repos/learning-dotnet/UnitTesting/XUnitSamples/ParameterizedTests.cs",
        range = { 9, 12, 9, 15 },
        type = "test",
      },
    },
  },
  intermediate_results = {
    {
      raw_output = "passed",
      status = "passed",
      test_name = "XUnitSamples.ParameterizedTests.Test1(value: 1)",
    },
    {
      error_info = "Assert.True() Failure\nExpected: True\nActual:   False\nat XUnitSamples.ParameterizedTests.Test1(Int32 value) in /home/issafalcon/repos/learning-dotnet/UnitTesting/XUnitSamples/ParameterizedTests.cs:line 13",
      raw_output = "failed",
      status = "failed",
      test_name = "XUnitSamples.ParameterizedTests.Test1(value: 3)",
    },
    {
      raw_output = "passed",
      status = "passed",
      test_name = "XUnitSamples.ParameterizedTests.Test1(value: 2)",
    },
  },
}

return M
