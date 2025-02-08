Extension { #name : 'Teapot' }

{ #category : '*Fast-Api-Demo' }
Teapot >> onObject: anObject [
	| objectClass methods pragmaSelector |
	objectClass := anObject class.
	pragmaSelector := #get:output:.
	methods := objectClass methods 
		select: [ :met | met hasPragmaNamed: pragmaSelector ]
		thenDo: [ :met | 
			| pragma getRoute output |
			pragma := met pragmaAt: pragmaSelector. 
			
			getRoute := pragma arguments first.
			output := pragma arguments second.
			self GET: getRoute -> [ :req | anObject perform: met selector ]; output: output
			].
	
	
	
]
