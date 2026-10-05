import { defineConfig } from 'vite-plus';

export default defineConfig({
	staged: {
		'*': 'vp check --fix',
	},
	fmt: {
		printWidth: 100,
		quoteProps: 'consistent',
		singleQuote: true,
		sortImports: { newlinesBetween: false },
		sortPackageJson: true,
		svelte: true,
		trailingComma: 'all',
		useTabs: true,
	},
	lint: {
		options: {
			typeAware: true,
			typeCheck: true,
		},
		jsPlugins: [
			{
				name: 'vite-plus',
				specifier: 'vite-plus/oxlint-plugin',
			},
		],
		rules: {
			'vite-plus/prefer-vite-plus-imports': 'error',
		},
	},
});
