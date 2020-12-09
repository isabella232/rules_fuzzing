# Copyright 2020 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

"""Support for OSS-Fuzz."""

def _oss_fuzz_repository(repository_ctx):
    fuzzing_engine_library = repository_ctx.os.environ.get("LIB_FUZZING_ENGINE")
    if not fuzzing_engine_library:
        fail("$LIB_FUZZING_ENGINE is not set. Not running in an OSS-Fuzz environment?")

oss_fuzz_repository = repository_rule(
    implementation = _oss_fuzz_repository,
    environ = [
        "LIB_FUZZING_ENGINE",
    ],
    local = True,
    doc = """
Generates an OSS-Fuzz engine.
""",
)
