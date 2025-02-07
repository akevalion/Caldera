Class {
	#name : 'Client',
	#superclass : 'Object',
	#instVars : [
		'serverAddress'
	],
	#category : 'Fast-Api-Demo',
	#package : 'Fast-Api-Demo'
}

{ #category : 'instance creation' }
Client class >> on: aString [
	^ self new 
		serverAddress: aString;
		yourself
		 
]

{ #category : 'private - requesting' }
Client >> get: aString [ 
	^ (ZnEasy get: serverAddress , aString) entity string.
]

{ #category : 'accessing' }
Client >> serverAddress [

	^ serverAddress
]

{ #category : 'accessing' }
Client >> serverAddress: anString [

	serverAddress := anString
]
