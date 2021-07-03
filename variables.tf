# Copyright 2019 NephoSolutions SPRL, Sebastian Trebitz
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

variable "name" {
  description = "Name of the workspace"
  type        = string
}

variable "organization" {
  description = "Name of the organization."
  type        = string
}

variable "auto_apply" {
  description = "Whether to automatically apply changes when a Terraform plan is successful."
  default     = false
  type        = bool
}

variable "file_triggers_enabled" {
  description = "Whether to filter runs based on the changed files in a VCS push. If enabled, the working directory and trigger prefixes describe a set of paths which must contain changes for a VCS push to trigger a run. If disabled, any push will trigger a run."
  default     = true
  type        = bool
}

variable "notifications" {
  description = "Map of `tfe_notification_configurations` to define in the workspace."
  default = {
  }
  type = map(object({ configuration = map(string), triggers = list(string) }))
}

variable "queue_all_runs" {
  description = "Whether all runs should be queued. When set to false, runs triggered by a VCS change will not be queued until at least one run is manually queued."
  default     = true
  type        = bool
}

variable "ssh_key_id" {
  description = "The ID of an SSH key to assign to the workspace."
  default     = null
  type        = string
}

variable "team_access" {
  description = "Associate teams to permissions on the workspace."
  default = {
  }
  type = map(string)
}

variable "terraform_version" {
  description = "The version of Terraform to use for this workspace."
  default     = null
  type        = string
}

variable "trigger_prefixes" {
  description = "List of repository-root-relative paths which describe all locations to be tracked for changes. workspace. Defaults to the latest available version."
  default     = null
  type        = list(any)
}

variable "variables" {
  description = "Map of environment or Terraform variables to define in the workspace."
  default = {
  }
  type = map(map(string))
}

variable "vcs_repo" {
  description = "The VCS repository to configure."
  default = {
  }
  type = map(string)
}

variable "working_directory" {
  description = "A relative path that Terraform will execute within. Defaults to the root of your repository."
  default     = null
  type        = string
}

variable "global_remote_state" {
  description = "Whether the workspace allows all workspaces in the organization to access its state data during runs. If false, then only specifically approved workspaces can access its state (remote_state_consumer_ids)."
  type        = bool
  default     = false
}

variable "remote_state_consumer_ids" {
  description = "The set of workspace IDs set as explicit remote state consumers for the given workspace."
  type        = list(string)
  default     = []
}

variable "execution_mode" {
  description = "Which execution mode to use. Using Terraform Cloud, valid values are remote, local or agent. Using Terraform Enterprise, only remote and local execution modes are valid. When set to local, the workspace will be used for state storage only."
  type        = string
  default     = "remote"
}