package v1alpha1

import (
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

// AppDeploymentSpec defines the desired state of AppDeployment
type AppDeploymentSpec struct {
	// Replicas is the desired number of pod instances
	Replicas *int32 `json:"replicas"`

	// Image is the container image reference to run
	Image string `json:"image"`

	// Port is the target container port
	Port int32 `json:"port,omitempty"`

	// CanaryPercent defines the percentage of traffic routed to canary pods (0-100)
	CanaryPercent *int32 `json:"canaryPercent,omitempty"`

	// AutoFailover enables automatic fallback to secondary deployments on health failure
	AutoFailover bool `json:"autoFailover,omitempty"`
}

// AppDeploymentStatus defines the observed state of AppDeployment
type AppDeploymentStatus struct {
	// ReadyReplicas represents the current count of healthy running pods
	ReadyReplicas int32 `json:"readyReplicas"`

	// Phase represents the current operational stage (e.g., Deploying, Healthy, Degraded, FailingOver)
	Phase string `json:"phase"`

	// Conditions details state updates and errors during operator reconciliation
	Conditions []metav1.Condition `json:"conditions,omitempty"`
}

// +kubebuilder:object:root=true
// +kubebuilder:subresource:status
// +kubebuilder:printcolumn:name="Replicas",type="integer",JSONPath=".spec.replicas"
// +kubebuilder:printcolumn:name="Ready",type="integer",JSONPath=".status.readyReplicas"
// +kubebuilder:printcolumn:name="Phase",type="string",JSONPath=".status.phase"

// AppDeployment is the Schema for the appdeployments API
type AppDeployment struct {
	metav1.TypeMeta   `json:",inline"`
	metav1.ObjectMeta `json:"metadata,omitempty"`

	Spec   AppDeploymentSpec   `json:"spec,omitempty"`
	Status AppDeploymentStatus `json:"status,omitempty"`
}

// +kubebuilder:object:root=true

// AppDeploymentList contains a list of AppDeployment
type AppDeploymentList struct {
	metav1.TypeMeta `json:",inline"`
	metav1.ListMeta `json:"metadata,omitempty"`
	Items           []AppDeployment `json:"items"`
}

func init() {
	SchemeBuilder.Register(&AppDeployment{}, &AppDeploymentList{})
}