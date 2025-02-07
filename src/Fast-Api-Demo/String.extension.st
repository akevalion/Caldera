Extension { #name : 'String' }

{ #category : '*Fast-Api-Demo' }
String >> asJson [
	^ NeoJSONObject fromString: self
]
