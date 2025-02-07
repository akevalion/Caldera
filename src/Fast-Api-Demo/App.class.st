Class {
	#name : 'App',
	#superclass : 'Object',
	#instVars : [
		'teapotServer'
	],
	#category : 'Fast-Api-Demo',
	#package : 'Fast-Api-Demo'
}

{ #category : 'initialization' }
App >> initialize [
	super initialize.
	teapotServer := Teapot on.
	teapotServer GET: '/welcome' -> '{"message": "Server is running"}' asJson; output: #json
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
