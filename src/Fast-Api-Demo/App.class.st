Class {
	#name : 'App',
	#superclass : 'Object',
	#instVars : [
		'teapotServer'
	],
	#category : 'Fast-Api-Demo',
	#package : 'Fast-Api-Demo'
}

{ #category : 'routes' }
App >> createRoute [
	<post: '/model' model: #Client>
	...
]

{ #category : 'routes' }
App >> hello [
	<get: '/welcome' output: #json>
	^ '{"message": "Server is running"}' asJson
]

{ #category : 'initialization' }
App >> initialize [
	super initialize.
	teapotServer := Teapot on.
	teapotServer onObject: self.
	
]

{ #category : 'accessing' }
App >> start [
	teapotServer start
]

{ #category : 'accessing' }
App >> stop [
	teapotServer ifNil: [ ^ self ].
	teapotServer stop
]

{ #category : 'routes' }
App >> time [
	<get: '/time' output: #json>
	^ ('{"message": "', DateAndTime now printString,'"}') asJson
]
