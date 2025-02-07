Class {
	#name : 'AppTest',
	#superclass : 'TestCase',
	#instVars : [
		'client',
		'server'
	],
	#category : 'Fast-Api-Demo',
	#package : 'Fast-Api-Demo'
}

{ #category : 'running' }
AppTest >> setUp [
	super setUp.
	client := Client on: 'http://localhost:1701'.
	server := App new.
	server start.
]

{ #category : 'running' }
AppTest >> tearDown [
	server ifNil: [ ^ self ].
	server stop.
	super tearDown
]

{ #category : 'tests' }
AppTest >> testHello [
	| result expected |
	result := client get: '/welcome'.
	expected := '{"message":"Server is running"}'.
	self assert: result equals: expected

]
