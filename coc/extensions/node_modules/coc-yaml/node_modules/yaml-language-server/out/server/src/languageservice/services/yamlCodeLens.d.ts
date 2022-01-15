import { TextDocument } from 'vscode-languageserver-textdocument';
import { CodeLens } from 'vscode-languageserver-types';
import { YAMLSchemaService } from './yamlSchemaService';
import { CodeLensParams } from 'vscode-languageserver-protocol';
import { Telemetry } from '../../languageserver/telemetry';
export declare class YamlCodeLens {
    private schemaService;
    private readonly telemetry;
    constructor(schemaService: YAMLSchemaService, telemetry: Telemetry);
    getCodeLens(document: TextDocument, params: CodeLensParams): Promise<CodeLens[]>;
    resolveCodeLens(param: CodeLens): Thenable<CodeLens> | CodeLens;
}
