"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", { value: true });
/*---------------------------------------------------------------------------------------------
 *  Copyright (c) Red Hat. All rights reserved.
 *  Licensed under the MIT License. See License.txt in the project root for license information.
 *--------------------------------------------------------------------------------------------*/
const serviceSetup_1 = require("./utils/serviceSetup");
const testHelper_1 = require("./utils/testHelper");
const assert = require("assert");
const vscode_languageserver_1 = require("vscode-languageserver");
const yamlSettings_1 = require("../src/yamlSettings");
const chai_1 = require("chai");
describe('Hover Tests', () => {
    let languageSettingsSetup;
    let languageHandler;
    let languageService;
    let yamlSettings;
    before(() => {
        languageSettingsSetup = new serviceSetup_1.ServiceSetup().withHover().withSchemaFileMatch({
            uri: 'http://google.com',
            fileMatch: ['bad-schema.yaml'],
        });
        const { languageService: langService, languageHandler: langHandler, yamlSettings: settings } = testHelper_1.setupLanguageService(languageSettingsSetup.languageSettings);
        languageService = langService;
        languageHandler = langHandler;
        yamlSettings = settings;
    });
    afterEach(() => {
        languageService.deleteSchema(testHelper_1.SCHEMA_ID);
    });
    describe('Hover', function () {
        function parseSetup(content, position) {
            const testTextDocument = testHelper_1.setupSchemaIDTextDocument(content);
            yamlSettings.documents = new yamlSettings_1.TextDocumentTestManager();
            yamlSettings.documents.set(testTextDocument);
            return languageHandler.hoverHandler({
                position: testTextDocument.positionAt(position),
                textDocument: testTextDocument,
            });
        }
        it('Hover on key on root', () => __awaiter(this, void 0, void 0, function* () {
            languageService.addSchema(testHelper_1.SCHEMA_ID, {
                type: 'object',
                properties: {
                    cwd: {
                        type: 'string',
                        description: 'The directory from which bower should run. All relative paths will be calculated according to this setting.',
                    },
                },
            });
            const content = 'cwd: test';
            const hover = yield parseSetup(content, 1);
            assert.strictEqual(vscode_languageserver_1.MarkupContent.is(hover.contents), true);
            assert.strictEqual(hover.contents.kind, 'markdown');
            assert.strictEqual(hover.contents.value, `The directory from which bower should run\\. All relative paths will be calculated according to this setting\\.\n\nSource: [${testHelper_1.SCHEMA_ID}](file:///${testHelper_1.SCHEMA_ID})`);
        }));
        it('Hover on value on root', () => __awaiter(this, void 0, void 0, function* () {
            languageService.addSchema(testHelper_1.SCHEMA_ID, {
                type: 'object',
                properties: {
                    cwd: {
                        type: 'string',
                        description: 'The directory from which bower should run. All relative paths will be calculated according to this setting.',
                    },
                },
            });
            const content = 'cwd: test';
            const result = yield parseSetup(content, 6);
            assert.strictEqual(vscode_languageserver_1.MarkupContent.is(result.contents), true);
            assert.strictEqual(result.contents.kind, 'markdown');
            assert.strictEqual(result.contents.value, `The directory from which bower should run\\. All relative paths will be calculated according to this setting\\.\n\nSource: [${testHelper_1.SCHEMA_ID}](file:///${testHelper_1.SCHEMA_ID})`);
        }));
        it('Hover on key with depth', () => __awaiter(this, void 0, void 0, function* () {
            languageService.addSchema(testHelper_1.SCHEMA_ID, {
                type: 'object',
                properties: {
                    scripts: {
                        type: 'object',
                        properties: {
                            postinstall: {
                                type: 'string',
                                description: 'A script to run after install',
                            },
                        },
                    },
                },
            });
            const content = 'scripts:\n  postinstall: test';
            const result = yield parseSetup(content, 15);
            assert.strictEqual(vscode_languageserver_1.MarkupContent.is(result.contents), true);
            assert.strictEqual(result.contents.kind, 'markdown');
            assert.strictEqual(result.contents.value, `A script to run after install\n\nSource: [${testHelper_1.SCHEMA_ID}](file:///${testHelper_1.SCHEMA_ID})`);
        }));
        it('Hover on value with depth', () => __awaiter(this, void 0, void 0, function* () {
            languageService.addSchema(testHelper_1.SCHEMA_ID, {
                type: 'object',
                properties: {
                    scripts: {
                        type: 'object',
                        properties: {
                            postinstall: {
                                type: 'string',
                                description: 'A script to run after install',
                            },
                        },
                    },
                },
            });
            const content = 'scripts:\n  postinstall: test';
            const result = yield parseSetup(content, 26);
            assert.strictEqual(vscode_languageserver_1.MarkupContent.is(result.contents), true);
            assert.strictEqual(result.contents.kind, 'markdown');
            assert.strictEqual(result.contents.value, `A script to run after install\n\nSource: [${testHelper_1.SCHEMA_ID}](file:///${testHelper_1.SCHEMA_ID})`);
        }));
        it('Hover works on both root node and child nodes works', () => __awaiter(this, void 0, void 0, function* () {
            languageService.addSchema(testHelper_1.SCHEMA_ID, {
                type: 'object',
                properties: {
                    scripts: {
                        type: 'object',
                        properties: {
                            postinstall: {
                                type: 'string',
                                description: 'A script to run after install',
                            },
                        },
                        description: 'Contains custom hooks used to trigger other automated tools',
                    },
                },
            });
            const content = 'scripts:\n  postinstall: test';
            const firstHover = yield parseSetup(content, 3);
            assert.strictEqual(vscode_languageserver_1.MarkupContent.is(firstHover.contents), true);
            assert.strictEqual(firstHover.contents.kind, 'markdown');
            assert.strictEqual(firstHover.contents.value, `Contains custom hooks used to trigger other automated tools\n\nSource: [${testHelper_1.SCHEMA_ID}](file:///${testHelper_1.SCHEMA_ID})`);
            const secondHover = yield parseSetup(content, 15);
            assert.strictEqual(vscode_languageserver_1.MarkupContent.is(secondHover.contents), true);
            assert.strictEqual(secondHover.contents.value, `A script to run after install\n\nSource: [${testHelper_1.SCHEMA_ID}](file:///${testHelper_1.SCHEMA_ID})`);
        }));
        it('Hover does not show results when there isnt description field', () => __awaiter(this, void 0, void 0, function* () {
            languageService.addSchema(testHelper_1.SCHEMA_ID, {
                type: 'object',
                properties: {
                    analytics: {
                        type: 'boolean',
                    },
                },
            });
            const content = 'analytics: true';
            const result = yield parseSetup(content, 3);
            assert.strictEqual(vscode_languageserver_1.MarkupContent.is(result.contents), true);
            assert.strictEqual(result.contents.value, '');
        }));
        it('Hover on first document in multi document', () => __awaiter(this, void 0, void 0, function* () {
            languageService.addSchema(testHelper_1.SCHEMA_ID, {
                type: 'object',
                properties: {
                    analytics: {
                        type: 'boolean',
                    },
                },
            });
            const content = '---\nanalytics: true\n...\n---\njson: test\n...';
            const result = yield parseSetup(content, 10);
            assert.strictEqual(vscode_languageserver_1.MarkupContent.is(result.contents), true);
            assert.strictEqual(result.contents.value, '');
        }));
        it('Hover on second document in multi document', () => __awaiter(this, void 0, void 0, function* () {
            languageService.addSchema(testHelper_1.SCHEMA_ID, {
                type: 'object',
                properties: {
                    analytics: {
                        type: 'boolean',
                    },
                    json: {
                        type: 'string',
                        description: 'A file path to the configuration file',
                    },
                },
            });
            const content = '---\nanalytics: true\n...\n---\njson: test\n...';
            const result = yield parseSetup(content, 30);
            assert.strictEqual(vscode_languageserver_1.MarkupContent.is(result.contents), true);
            assert.strictEqual(result.contents.value, `A file path to the configuration file\n\nSource: [${testHelper_1.SCHEMA_ID}](file:///${testHelper_1.SCHEMA_ID})`);
        }));
        it('Hover should not return anything on key', () => __awaiter(this, void 0, void 0, function* () {
            languageService.addSchema(testHelper_1.SCHEMA_ID, {
                type: 'object',
                properties: {},
            });
            const content = 'my_unknown_hover: test';
            const result = yield parseSetup(content, 1);
            assert.strictEqual(vscode_languageserver_1.MarkupContent.is(result.contents), true);
            assert.strictEqual(result.contents.value, '');
        }));
        it('Hover should not return anything on value', () => __awaiter(this, void 0, void 0, function* () {
            languageService.addSchema(testHelper_1.SCHEMA_ID, {
                type: 'object',
                properties: {},
            });
            const content = 'my_unknown_hover: test';
            const result = yield parseSetup(content, 21);
            assert.strictEqual(vscode_languageserver_1.MarkupContent.is(result.contents), true);
            assert.strictEqual(result.contents.value, '');
        }));
        it('Hover works on array nodes', () => __awaiter(this, void 0, void 0, function* () {
            languageService.addSchema(testHelper_1.SCHEMA_ID, {
                type: 'object',
                properties: {
                    authors: {
                        type: 'array',
                        items: {
                            type: 'object',
                            properties: {
                                name: {
                                    type: 'string',
                                    description: 'Full name of the author.',
                                },
                            },
                        },
                    },
                },
            });
            const content = 'authors:\n  - name: Josh';
            const result = yield parseSetup(content, 14);
            assert.strictEqual(vscode_languageserver_1.MarkupContent.is(result.contents), true);
            assert.strictEqual(result.contents.value, `Full name of the author\\.\n\nSource: [${testHelper_1.SCHEMA_ID}](file:///${testHelper_1.SCHEMA_ID})`);
        }));
        it('Hover works on additional array nodes', () => __awaiter(this, void 0, void 0, function* () {
            languageService.addSchema(testHelper_1.SCHEMA_ID, {
                type: 'object',
                properties: {
                    authors: {
                        type: 'array',
                        items: {
                            type: 'object',
                            properties: {
                                name: {
                                    type: 'string',
                                    description: 'Full name of the author.',
                                },
                                email: {
                                    type: 'string',
                                    description: 'Email address of the author.',
                                },
                            },
                        },
                    },
                },
            });
            const content = 'authors:\n  - name: Josh\n  - email: jp';
            const result = yield parseSetup(content, 28);
            assert.strictEqual(vscode_languageserver_1.MarkupContent.is(result.contents), true);
            assert.strictEqual(result.contents.value, `Email address of the author\\.\n\nSource: [${testHelper_1.SCHEMA_ID}](file:///${testHelper_1.SCHEMA_ID})`);
        }));
        it('Hover on null property', () => __awaiter(this, void 0, void 0, function* () {
            languageService.addSchema(testHelper_1.SCHEMA_ID, {
                type: 'object',
                properties: {
                    childObject: {
                        type: 'object',
                        description: 'should return this description',
                    },
                },
            });
            const content = 'childObject: \n';
            const result = yield parseSetup(content, 1);
            assert.strictEqual(vscode_languageserver_1.MarkupContent.is(result.contents), true);
            assert.strictEqual(result.contents.value, `should return this description\n\nSource: [${testHelper_1.SCHEMA_ID}](file:///${testHelper_1.SCHEMA_ID})`);
        }));
        it('should work with bad schema', () => __awaiter(this, void 0, void 0, function* () {
            const doc = testHelper_1.setupSchemaIDTextDocument('foo:\n bar', 'bad-schema.yaml');
            yamlSettings.documents = new yamlSettings_1.TextDocumentTestManager();
            yamlSettings.documents.set(doc);
            const result = yield languageHandler.hoverHandler({
                position: vscode_languageserver_1.Position.create(0, 1),
                textDocument: doc,
            });
            chai_1.expect(result).to.be.null;
        }));
    });
});
//# sourceMappingURL=hover.test.js.map