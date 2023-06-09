/**
 * Copyright 2022 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/******************************************
  Essential Contact configuration
 *****************************************/

resource "google_essential_contacts_contact" "contact" {
  for_each = var.essential_contacts

  parent                              = "projects/${var.project_id}"
  email                               = each.key
  language_tag                        = var.language_tag
  notification_category_subscriptions = each.value
  lifecycle {
    ignore_changes = all
  }
}
