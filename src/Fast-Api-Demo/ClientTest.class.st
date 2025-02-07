Class {
	#name : 'ClientTest',
	#superclass : 'TestCase',
	#category : 'Fast-Api-Demo',
	#package : 'Fast-Api-Demo'
}

{ #category : 'tests' }
ClientTest >> testCreateClient [
	| expected client result |
	expected := 'http://localhost:1701'.
	client := Client on: expected.
	result := client serverAddress.
	self assert: result equals: expected.
	
]

{ #category : 'tests' }
ClientTest >> testServerConection [
	| expected server client result |
	expected := 'Hello World!'.
	server := Teapot on
    GET: '/welcome' -> expected;
    start.
	client := Client on: 'http://localhost:1701'.
	
	result := client get: '/welcome'.
	self assert: result equals: expected.
	server stop.
	
]
