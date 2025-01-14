terraform { 
  cloud { 
    
    organization = "ValueMomentumInc" 

    workspaces { 
      name = "kubernetes-workspace" 
    } 
  } 
}