# Wag Code Challenge

## Libraries

### KSPromise
I use this promise library because of familiarity. It's been a staple promise library for me. I use promises because I think it's the most sophisticated and object-oriented way to do asynchronous callbacks

### AFNetworking
I use AFNetworking because it helps abstract away many of the annoying networking undercarriage (such as managing NSURLSessions) and works nicely with KSPromise. I've never not used AFNetworking on any serious objective-c app.

- Includes image caching by URL as part of UIImageView+AFNetworking

### UILabel+FormattedText
Seemed like a nice, convenient extension for adding some colors to the application. 

## Patterns
### DIContainer
This is a dependency management technique that is basically just raw DI but with a container. No fancy frameworks. The container is only initialized once and then should be passed in to all objects that require a (static) dependency. There is nothing preventing DIContainer from being created more than once and we could create some kind of enforement, but I figured that was beyond the scope of this exercise.

Take a look at how other objects reference this object. They generally don't reference it by class, but rather by the protocols it implements. Each protocol describes how an object can get a dependency of a certain type off of this object and in this way, we can pass around the whole container, but objects receiving the container will only be able to get their discretely required dependencies off of it.