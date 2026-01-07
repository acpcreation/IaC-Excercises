#!/bin/bash

# EKS Pod Status Checker Script
# This script checks the status of pods and services in the EKS cluster

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}=== EKS Cluster Pod Status Checker ===${NC}"
echo ""

# Function to check if kubectl is available and cluster is accessible
check_cluster_connectivity() {
    echo -e "${YELLOW}Checking cluster connectivity...${NC}"
    if ! kubectl cluster-info >/dev/null 2>&1; then
        echo -e "${RED}❌ Cannot connect to Kubernetes cluster${NC}"
        echo "Make sure your kubectl is configured and EKS cluster is running"
        exit 1
    fi
    echo -e "${GREEN}✅ Cluster connection OK${NC}"
    echo ""
}

# Function to show cluster info
show_cluster_info() {
    echo -e "${YELLOW}Cluster Information:${NC}"
    echo "Context: $(kubectl config current-context)"
    echo "Server: $(kubectl cluster-info | grep 'Kubernetes control plane' | awk '{print $NF}')"
    echo ""
}

# Function to check nginx-ingress namespace
check_nginx_ingress() {
    echo -e "${YELLOW}=== NGINX Ingress Controller Status ===${NC}"
    
    if kubectl get namespace nginx-ingress >/dev/null 2>&1; then
        echo -e "${GREEN}✅ nginx-ingress namespace exists${NC}"
        
        # Check pods
        echo ""
        echo -e "${YELLOW}Pods in nginx-ingress namespace:${NC}"
        kubectl get pods -n nginx-ingress -o wide
        
        # Check services
        echo ""
        echo -e "${YELLOW}Services in nginx-ingress namespace:${NC}"
        kubectl get svc -n nginx-ingress
        
        # Check LoadBalancer status
        echo ""
        echo -e "${YELLOW}LoadBalancer External IP:${NC}"
        EXTERNAL_IP=$(kubectl get svc nginx-ingress-controller -n nginx-ingress -o jsonpath='{.status.loadBalancer.ingress[0].hostname}' 2>/dev/null || echo "Not available")
        if [ "$EXTERNAL_IP" != "Not available" ] && [ ! -z "$EXTERNAL_IP" ]; then
            echo -e "${GREEN}✅ External IP: $EXTERNAL_IP${NC}"
        else
            echo -e "${RED}❌ LoadBalancer external IP not available${NC}"
        fi
        
    else
        echo -e "${RED}❌ nginx-ingress namespace not found${NC}"
        echo "Run the Helm deployment first"
    fi
    echo ""
}

# Function to check all pods in all namespaces
check_all_pods() {
    echo -e "${YELLOW}=== All Pods Status ===${NC}"
    kubectl get pods --all-namespaces -o wide
    echo ""
}

# Function to check nodes
check_nodes() {
    echo -e "${YELLOW}=== Node Status ===${NC}"
    kubectl get nodes -o wide
    echo ""
}

# Function to show pod logs
show_nginx_logs() {
    echo -e "${YELLOW}=== NGINX Ingress Controller Logs (last 20 lines) ===${NC}"
    if kubectl get pods -n nginx-ingress -l app.kubernetes.io/name=nginx-ingress >/dev/null 2>&1; then
        kubectl logs -n nginx-ingress -l app.kubernetes.io/name=nginx-ingress --tail=20
    else
        echo -e "${RED}❌ No NGINX Ingress Controller pods found${NC}"
    fi
    echo ""
}

# Function to test connectivity
test_connectivity() {
    echo -e "${YELLOW}=== Connectivity Test ===${NC}"
    EXTERNAL_IP=$(kubectl get svc nginx-ingress-controller -n nginx-ingress -o jsonpath='{.status.loadBalancer.ingress[0].hostname}' 2>/dev/null || echo "")
    
    if [ ! -z "$EXTERNAL_IP" ]; then
        echo "Testing HTTP connectivity to $EXTERNAL_IP..."
        if curl -s -o /dev/null -w "%{http_code}" --connect-timeout 10 http://$EXTERNAL_IP | grep -q "404\|200\|503"; then
            echo -e "${GREEN}✅ LoadBalancer is responding${NC}"
        else
            echo -e "${RED}❌ LoadBalancer not responding or timeout${NC}"
        fi
    else
        echo -e "${RED}❌ No external IP available for testing${NC}"
    fi
    echo ""
}

# Main execution
main() {
    check_cluster_connectivity
    show_cluster_info
    check_nginx_ingress
    check_nodes
    
    # Ask user what they want to see
    while true; do
        echo -e "${BLUE}Choose an option:${NC}"
        echo "1) Show all pods in all namespaces"
        echo "2) Show NGINX logs"
        echo "3) Test LoadBalancer connectivity"
        echo "4) Refresh status"
        echo "5) Exit"
        echo ""
        read -p "Enter your choice (1-5): " choice
        
        case $choice in
            1)
                check_all_pods
                ;;
            2)
                show_nginx_logs
                ;;
            3)
                test_connectivity
                ;;
            4)
                clear
                main
                return
                ;;
            5)
                echo -e "${GREEN}Goodbye!${NC}"
                exit 0
                ;;
            *)
                echo -e "${RED}Invalid option. Please choose 1-5.${NC}"
                ;;
        esac
    done
}

# Run the main function
main