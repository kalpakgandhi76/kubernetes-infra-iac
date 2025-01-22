terraform { 
  cloud { 
    
    organization = "ValueMomentumInc" 

    workspaces { 
      name = "agentapi-kubernetes" 
    } 
  } 
}