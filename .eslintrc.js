module.exports = {
  root: true,
  env: {
    // https://eslint.org/docs/latest/use/configure/language-options#specifying-environments
    node: true, // Node.js global variables and Node.js scoping.
    jest: true, // Jest global variables.
  },
  parser: '@typescript-eslint/parser',
  parserOptions: {
    // https://typescript-eslint.io/architecture/parser/
    project: true, // find the tsconfig.json nearest each source file
    tsconfigRootDir: __dirname, // provide the root directory for relative TSConfig paths specified in the project option
  },
  plugins: ['@typescript-eslint'],
  extends: [
    'eslint:recommended',
    'plugin:@typescript-eslint/recommended',
    'plugin:@typescript-eslint/recommended-requiring-type-checking',
    'plugin:@typescript-eslint/strict',
    'prettier',
  ],
  rules: {
    '@typescript-eslint/no-unused-vars': ['warn', { argsIgnorePattern: '^_' }],
    eqeqeq: [
      'error',
      'always',
      {
        null: 'never',
      },
    ],
    '@typescript-eslint/no-extraneous-class': [
      'warn',
      {
        allowEmpty: true,
      },
    ],
  },
};
