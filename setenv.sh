npm init --yes
npm i -D eslint-config-salt-typescript
npm i -D typescript ts-node mocha chai nodemon
npm i -D @tsconfig/node16 @types/mocha @types/node @types/chai @types/nodemon
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
" > .eslintrc

npx scradd . "test" "mocha -r ts-node/register src/**/*.test.ts" -o
npx scradd . dev "ts-node src/index.ts"
npx scradd . build tsc
npx scradd . lint "eslint ./src/**/*.ts"
npx scradd . lint-watch "nodemon --exec 'npm run lint --silent'"
npx gitignore node