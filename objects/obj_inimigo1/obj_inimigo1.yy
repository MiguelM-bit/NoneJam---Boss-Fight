{
  "spriteId": {
    "name": "spr_inimigo1_dir",
    "path": "sprites/spr_inimigo1_dir/spr_inimigo1_dir.yy",
  },
  "solid": false,
  "visible": true,
  "spriteMaskId": null,
  "persistent": false,
  "parentObjectId": {
    "name": "obj_morte",
    "path": "objects/obj_morte/obj_morte.yy",
  },
  "physicsObject": false,
  "physicsSensor": false,
  "physicsShape": 1,
  "physicsGroup": 1,
  "physicsDensity": 0.5,
  "physicsRestitution": 0.1,
  "physicsLinearDamping": 0.1,
  "physicsAngularDamping": 0.1,
  "physicsFriction": 0.2,
  "physicsStartAwake": true,
  "physicsKinematic": false,
  "physicsShapePoints": [],
  "eventList": [
    {"isDnD":false,"eventNum":0,"eventType":0,"collisionObjectId":null,"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMEvent",},
    {"isDnD":false,"eventNum":0,"eventType":3,"collisionObjectId":null,"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMEvent",},
    {"isDnD":false,"eventNum":0,"eventType":8,"collisionObjectId":null,"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMEvent",},
  ],
  "properties": [
    {"varType":6,"value":"\"avanca\"","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[
        "\"avanca\"",
        "\"parado\"",
      ],"multiselect":false,"filters":[],"resourceVersion":"1.0","name":"estado","tags":[],"resourceType":"GMObjectProperty",},
    {"varType":6,"value":"0","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[
        "0",
        "90",
        "180",
        "270",
      ],"multiselect":false,"filters":[],"resourceVersion":"1.0","name":"dir","tags":[],"resourceType":"GMObjectProperty",},
    {"varType":1,"value":"0","rangeEnabled":true,"rangeMin":0.0,"rangeMax":9.0,"listItems":[],"multiselect":false,"filters":[],"resourceVersion":"1.0","name":"vel","tags":[],"resourceType":"GMObjectProperty",},
    {"varType":1,"value":"0","rangeEnabled":true,"rangeMin":-5.0,"rangeMax":5.0,"listItems":[],"multiselect":false,"filters":[],"resourceVersion":"1.0","name":"rot","tags":[],"resourceType":"GMObjectProperty",},
    {"varType":1,"value":"0","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[],"resourceVersion":"1.0","name":"limite","tags":[],"resourceType":"GMObjectProperty",},
  ],
  "overriddenProperties": [],
  "parent": {
    "name": "Inimigo",
    "path": "folders/Objects/Inimigo.yy",
  },
  "resourceVersion": "1.0",
  "name": "obj_inimigo1",
  "tags": [],
  "resourceType": "GMObject",
}