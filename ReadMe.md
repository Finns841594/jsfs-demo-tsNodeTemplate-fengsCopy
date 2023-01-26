# Inherited from [here](https://github.com/Finns841594/jsfs-demo-tsNodeTemplate-fengsCopy) to setup envrionmrnt for everyday mob-porgramming

Added salt-typescript lint setting, vscode debugger setting.

## Manual setup

You can set it up in a new directory, by using these commands:

```bash
npm init --yes
npm i -D eslint-config-salt-typescript
npm i -D typescript ts-node mocha chai nodemon
npm i -D @tsconfig/node16 @types/mocha @types/node @types/chai @types/nodemon eslint-config-salt-typescript
mkdir src
touch src/index.ts
touch src/index.test.ts

echo "{
  \"extends\": \"@tsconfig/node16/tsconfig.json\",
  \"compilerOptions\": {
    \"outDir\": \"dist\"
  },
  \"include\": [\"src\"],
  \"exclude\": [\"node_modules\"]
}" > tsconfig.json

echo "{
  \"extends\": \"salt-typescript\",
  \"parserOptions\": {
    \"project\": \"tsconfig.json\"
  }
}
" > .estlintrc

npx scradd . "test" "mocha -r ts-node/register src/**/*.test.ts" -o
npx scradd . dev "ts-node src/index.ts"
npx scradd . build tsc
npx scradd . lint "eslint ./src/**/*.ts"
npx scradd . lint-watch "nodemon --exec 'npm run lint --silent'"
npx gitignore node
```

## Set up debugger

```bash
mkdir .vscode

echo "{
  \"version\": \"0.2.0\",
  \"configurations\": [
    {
      \"name\": \"Run Tests\",
      \"request\": \"launch\",
      \"runtimeArgs\": [
        \"run\",
        \"test\"
      ],
      \"runtimeExecutable\": \"npm\",
      \"skipFiles\": [
        \"<node_internals>/**\"
      ],
      \"type\": \"node\"
    }
  ]
}
" > .vscod/launch.json

```

## Verifying setup

You can then test the commands using

```bash
npm ci # reinstall
npm run test
npm run build
npm run lint
npm run dev
```

These should all work, although they don't do much
