import dataclasses
import json

from prophecy.cb.sql.MacroBuilderBase import *
from prophecy.cb.ui.uispec import *

class Float_MakeGridTool(MacroSpec):
    name: str = "Float_MakeGridTool"
    projectName: str = "andre_spatial_07"
    category: str = "Spatial"
    minNumOfInputPorts: int = 1
    
    @dataclass(frozen=True)
    class Float_MakeGridToolProperties(MacroProperties):
        # properties for the component with default values
        relation_name: List[str] = field(default_factory=list)
        schema: str = ''
        cell_size: float = 0.1
        unit: str = "kms"
        polygonColumnName: str = ""

    def get_relation_names(self, component: Component, context: SqlContext):
        all_upstream_nodes = []
        for inputPort in component.ports.inputs:
            upstreamNode = None
            for connection in context.graph.connections:
                if connection.targetPort == inputPort.id:
                    upstreamNodeId = connection.source
                    upstreamNode = context.graph.nodes.get(upstreamNodeId)
            all_upstream_nodes.append(upstreamNode)

        relation_name = []
        for upstream_node in all_upstream_nodes:
            if upstream_node is None or upstream_node.label is None:
                relation_name.append("")
            else:
                relation_name.append(upstream_node.label)

        return relation_name

    def dialog(self) -> Dialog:
        return Dialog("Float_MakeGridTool").addElement(
            ColumnsLayout(gap="1rem", height="100%")
            .addColumn(
                Ports(allowInputAddOrDelete=True),
                "content"
            )
            .addColumn(
                StackLayout()
                .addElement(
                    SchemaColumnsDropdown("Polygon Column Input")
                        .bindSchema("component.ports.inputs[0].schema")
                        .bindProperty("polygonColumnName")
                )                               
                .addElement(
                    NumberBox("Cell size",placeholder="1",minValueVar=1).bindProperty("cell_size")
                )                
                .addElement(
                    SelectBox("Units").addOption("Miles", "miles").addOption("Kilometers", "kms").bindProperty("unit")
                )                                
           )
       )

    def validate(self, context: SqlContext, component: Component) -> List[Diagnostic]:
        # Validate the component's state
        return super().validate(context,component)

    def onChange(self, context: SqlContext, oldState: Component, newState: Component) -> Component:
        # Handle changes in the component's state and return the new state
        schema = json.loads(str(newState.ports.inputs[0].schema).replace("'", '"'))
        fields_array = [{"name": field["name"], "dataType": field["dataType"]["type"]} for field in schema["fields"]]
        relation_name = self.get_relation_names(newState, context)

        newProperties = dataclasses.replace(
            newState.properties,
            schema=json.dumps(fields_array),
            relation_name=relation_name
        )
        return newState.bindProperties(newProperties)

    def apply(self, props: Float_MakeGridToolProperties) -> str:
        # Get the table name
        table_name: str = ",".join(str(rel) for rel in props.relation_name)

        # generate the actual macro call given the component's
        resolved_macro_name = f"{self.projectName}.{self.name}"

        arguments = [
            "'" + table_name + "'",
            props.schema,
            "'" + props.polygonColumnName + "'",            
            str(props.cell_size),
            "'" + props.unit + "'"
        ]

        params = ",".join([param for param in arguments])
        return f'{{{{ {resolved_macro_name}({params}) }}}}'


    def loadProperties(self, properties: MacroProperties) -> PropertiesType:
        # load the component's state given default macro property representation
        parametersMap = self.convertToParameterMap(properties.parameters)
        return Float_MakeGridTool.Float_MakeGridToolProperties(
            relation_name=parametersMap.get('relation_name'),
            schema=parametersMap.get('schema'),
            polygonColumnName=parametersMap.get('polygonColumnName'),
            cell_size=float(parametersMap.get('cell_size')),
            unit=str(parametersMap.get('unit'))
        )

    def unloadProperties(self, properties: PropertiesType) -> MacroProperties:
        # convert component's state to default macro property representation
        return BasicMacroProperties(
            macroName=self.name,
            projectName=self.projectName,
            parameters=[
                MacroParameter("relation_name", str(properties.relation_name)),
                MacroParameter("schema", str(properties.schema)),
                MacroParameter("destinationColumnNames", properties.polygonColumnName),
                MacroParameter("cell_size", str(properties.cell_size)),
                MacroParameter("unit", properties.unit)
            ],
        )

    def updateInputPortSlug(self, component: Component, context: SqlContext):
        schema = json.loads(str(component.ports.inputs[0].schema).replace("'", '"'))
        fields_array = [{"name": field["name"], "dataType": field["dataType"]["type"]} for field in schema["fields"]]
        relation_name = self.get_relation_names(component, context)

        newProperties = dataclasses.replace(
            component.properties,
            schema=json.dumps(fields_array),
            relation_name=relation_name
        )
        return component.bindProperties(newProperties)
