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