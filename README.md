# Custom CodeQL Bundle

The Custom CodeQL Bundle repository can be used in combination with GitHub
Actions to automate customizing the behavior of the queries in the CodeQL
standard library for a variety of target languages. It is currently considered
the best practice for customizing the built-in CodeQL queries. 

At current this repository will work with the following languages:

- Java
- Javascript
- Python 
- C# 
- Go

Support for Ruby is being added. 

# Using the Custom CodeQL Bundle

Using the Custom CodeQL bundle involves two main steps:

1. Creating a copy of the `custom-codeql-bundle` repository within your
   organization. 
2. Modifying your CodeQL action to retrieve your custom bundle during query
   execution. 

The tooling within this repository takes care of combining your customizations
here with the main codeql-bundle distribution. It uses the `Customizations.qll`
mechanism which ensures that upstream changes are never made, thus making it
possible to rebase your clone of this repository on newer versions of CodeQL
without conflict. 

1. To use this repository, first start by clicking the `Use This Template` button
on GitHub.com interface located here:
https://github.com/advanced-security/custom-codeql-bundle

This will allow you to create a copy of this repository that you will customize
with your additions. 

2. Modify `bundles.json` in the root of this repository. This controls the
   CodeQL version that will be used with your queries. 

3. Add your customizations to the `customizations/<language>` directory within
   the root of this repository. You may add as many independent `.ql` and `.qll`
   files in these directories as you wish. They will be combined and added to
   the appropriate extension points within your target language. 

4. Modify your `codeql-analysis.yml` file to point at your custom bundle. Please
   see the following file for an example: https://github.com/advanced-security/custom-codeql-bundle-test/blob/develop/.github/workflows/codeql-analysis.yml

The relevant portion of that file is the following: 

```yml
steps:
    - name: Checkout repository
      uses: actions/checkout@v2
      
    - name: Download CodeQL bundle
      env:
        GITHUB_TOKEN: ${{ secrets.CODEQL_BUNDLE_PAT }}
      run: |
        gh release -R <your-clone-of-custom-codeql-bundle> download <tag>
```

In the above, you set the location of your bundle as well as the tag. 

Once these steps are performed, you will be able to analyze your project using
your custom CodeQL bundle with your customizations in place. 

To get an idea of the sorts of source customizations that are possible, please
see: 

https://github.com/advanced-security/custom-codeql-bundle/blob/main/customizations/javascript/CustomSources.qll


# Limitations 

This repository may be used to refine the behavior of the out of the box queries
by: 
- Extending existing classes
- Adding additional sinks and sources specific to your organization

It may not be used for replacing classes within CodeQL. 

# Contributing 

Please direct your contributions to us by opening up a pull request. 


