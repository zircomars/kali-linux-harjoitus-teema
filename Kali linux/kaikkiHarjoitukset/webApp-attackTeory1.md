# Web app attacks
Current as in the future development frameworks and hosting solutions have simplified the process of the building and deploying web-based applications. These applications usually expose a large attack surface because of a lack of mature application code, multiple dependencies and insecure server configurations.

Web applications can be written in a many variety of programming languages and framework e.g. nodejs, react and ect. each of which can introduce specific types of vulnerabilities. Most vulnerabilities are similar in concept, regardless of the underlying technology stack.

The attack vectors will server as basic building blocks as used to construct more advanced attacks.


## Web app assessment methodology
Before start doing basic web app penetration testing methodology. At first, gather information about the application. What does the application do? 

What language is it written in? What server software is the application running on? The answers to  these and other basic questions will help guide us towards our first (or next) potential attack vector

Many of penetration testing steps, the goal of each attempt attack or exploit is to increase the permissions within the application or pivot to another application or the target.  Each successful exploit along the way may grant access to new functionality or components within the application. It may need to successfully execute several exploits to advance from an unauthenticated user account access to any kind of shell on the system.

Enumeration of new functionality is important each step of the way especially since attacks previously failed may succeed in a new context. As the penetration tester must continue to enumaret and continue adapt until got exchausted all attacks avnues or compromised the system.

<hr> 

## web app enumeration

Identify the components that make up a web applications before attempting to blindy exploit it.  Many of the web application vulnerabilities are technology-agnostic. Sort of exploits and payloads need to be crated based on the technological underpinnings of the application, such as the database software or operating system. Before trying to do any attacks on a web application, should  attempt to discover the technology stack in use, which generally consists of the following components;
- Programming language and frameworks
- Web server software
- Database software
- Server operating system

There exist several techniques that can use to gather this information directly from the browser. Most modern browsers include developer tools that can assist in the enumeration process. Like focusing on firefox browser sincie it is the default software in the Kali Linux.

## Inspecting URL(s)













