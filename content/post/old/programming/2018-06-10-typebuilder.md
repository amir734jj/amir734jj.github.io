+++
title = "Dynamic-type-builder C# library"
description = "Create types in run-time"
date = "2018-06-09"
categories = [ "programming-blog" ]
+++

I really wanted to create a type on the fly by extending an existing type and then add some extra properties to
it. Thanks to `System.Reflection.Emit` written by Mono team it is possible to achieve this in dotnet core. This
package comes with a `TypeBuilder` class but using it is really not a straightforward thing to do. Hence I created
this small library to do the job ([repo url with nuget package too][repo-url]).

Example:

```csharp
// Start the type building
var type = Builders.CustomTypeBuilder.New()
    // Useful while generating nested types, you can re-use `moduleBuilder`
    .GetModuleBuilder(out var moduleBuilder)
    .SetModuleBuilder(moduleBuilder)
    // Extend an existing type
    .FinalizeOptionsBuilder().Extend<DummyClass>()
    // Add properties
    .AddProperty<string>("Name")
    .AddProperty<int>("Age")
    // Class level attribute
    .AddAttribute(new RequiredAttribute())
    .Compile();
    // Or instantiate this type and cast to DummyClass, or use `Activator.CreateInstance`
    // .Instantiate<DummyClass>()
```

After type is created, we can use `Activator.CreateInstance(type)` to instantiate an instance of type
and also we can use reflection to set properties. In our example because we extended `DummyClass`, we can
up-cast the object to `DummyClass` in order to access `DummyClass` fields statically without using reflection.
One thing I noticed is that types don't really show up while debugging in Rider, but they show perfectly in
Visual Studio.

As always, I appreciate any feedback or contribution.


[repo-url]: "https://github.com/amir734jj/CustomTypeBuilder"
