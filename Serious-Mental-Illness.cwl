cwlVersion: v1.0
steps:
  read-potential-cases-omop:
    run: read-potential-cases-omop.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
  serious-mental-illness-smi-schizophrenifrm---primary:
    run: serious-mental-illness-smi-schizophrenifrm---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-omop/output
  reactive-serious-mental-illness-smi---primary:
    run: reactive-serious-mental-illness-smi---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: serious-mental-illness-smi-schizophrenifrm---primary/output
  serious-mental-illness-smi-disord---primary:
    run: serious-mental-illness-smi-disord---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: reactive-serious-mental-illness-smi---primary/output
  serious-mental-illness-smi-depress---primary:
    run: serious-mental-illness-smi-depress---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: serious-mental-illness-smi-disord---primary/output
  delusional-serious-mental-illness-smi---primary:
    run: delusional-serious-mental-illness-smi---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: serious-mental-illness-smi-depress---primary/output
  serious-mental-illness-smi-recurr---primary:
    run: serious-mental-illness-smi-recurr---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: delusional-serious-mental-illness-smi---primary/output
  serious-mental-illness-smi-affect---primary:
    run: serious-mental-illness-smi-affect---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: serious-mental-illness-smi-recurr---primary/output
  mental---primary:
    run: mental---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: serious-mental-illness-smi-affect---primary/output
  serious-mental-illness-smi-unspec---primary:
    run: serious-mental-illness-smi-unspec---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: mental---primary/output
  persistent-serious-mental-illness-smi---primary:
    run: persistent-serious-mental-illness-smi---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule11
      potentialCases:
        id: potentialCases
        source: serious-mental-illness-smi-unspec---primary/output
  serious-mental-illness-smi-paranoia---primary:
    run: serious-mental-illness-smi-paranoia---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule12
      potentialCases:
        id: potentialCases
        source: persistent-serious-mental-illness-smi---primary/output
  hypomanic-serious-mental-illness-smi---primary:
    run: hypomanic-serious-mental-illness-smi---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule13
      potentialCases:
        id: potentialCases
        source: serious-mental-illness-smi-paranoia---primary/output
  serious-mental-illness-smi-querulan---primary:
    run: serious-mental-illness-smi-querulan---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule14
      potentialCases:
        id: potentialCases
        source: hypomanic-serious-mental-illness-smi---primary/output
  serious-mental-illness-smi-psychot---primary:
    run: serious-mental-illness-smi-psychot---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule15
      potentialCases:
        id: potentialCases
        source: serious-mental-illness-smi-querulan---primary/output
  serious-mental-illness-smi-induced---primary:
    run: serious-mental-illness-smi-induced---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule16
      potentialCases:
        id: potentialCases
        source: serious-mental-illness-smi-psychot---primary/output
  serious-mental-illness-smi-paraphrenia---primary:
    run: serious-mental-illness-smi-paraphrenia---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule17
      potentialCases:
        id: potentialCases
        source: serious-mental-illness-smi-induced---primary/output
  polymorphic-serious-mental-illness-smi---primary:
    run: polymorphic-serious-mental-illness-smi---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule18
      potentialCases:
        id: potentialCases
        source: serious-mental-illness-smi-paraphrenia---primary/output
  serious-mental-illness-smi-delirante---primary:
    run: serious-mental-illness-smi-delirante---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule19
      potentialCases:
        id: potentialCases
        source: polymorphic-serious-mental-illness-smi---primary/output
  nonorganic-serious-mental-illness-smi---primary:
    run: nonorganic-serious-mental-illness-smi---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule20
      potentialCases:
        id: potentialCases
        source: serious-mental-illness-smi-delirante---primary/output
  residual-serious-mental-illness-smi---primary:
    run: residual-serious-mental-illness-smi---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule21
      potentialCases:
        id: potentialCases
        source: nonorganic-serious-mental-illness-smi---primary/output
  serious-mental-illness-smi-stupor---primary:
    run: serious-mental-illness-smi-stupor---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule22
      potentialCases:
        id: potentialCases
        source: residual-serious-mental-illness-smi---primary/output
  hysterical-serious-mental-illness-smi---primary:
    run: hysterical-serious-mental-illness-smi---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule23
      potentialCases:
        id: potentialCases
        source: serious-mental-illness-smi-stupor---primary/output
  serious-mental-illness-smi---primary:
    run: serious-mental-illness-smi---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule24
      potentialCases:
        id: potentialCases
        source: hysterical-serious-mental-illness-smi---primary/output
  serious-mental-illness-smi-schizotypal---primary:
    run: serious-mental-illness-smi-schizotypal---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule25
      potentialCases:
        id: potentialCases
        source: serious-mental-illness-smi---primary/output
  current-serious-mental-illness-smi---primary:
    run: current-serious-mental-illness-smi---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule26
      potentialCases:
        id: potentialCases
        source: serious-mental-illness-smi-schizotypal---primary/output
  subchronic-serious-mental-illness-smi---primary:
    run: subchronic-serious-mental-illness-smi---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule27
      potentialCases:
        id: potentialCases
        source: current-serious-mental-illness-smi---primary/output
  brief-serious-mental-illness-smi---primary:
    run: brief-serious-mental-illness-smi---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule28
      potentialCases:
        id: potentialCases
        source: subchronic-serious-mental-illness-smi---primary/output
  transient-serious-mental-illness-smi---primary:
    run: transient-serious-mental-illness-smi---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule29
      potentialCases:
        id: potentialCases
        source: brief-serious-mental-illness-smi---primary/output
  cycloid-serious-mental-illness-smi---primary:
    run: cycloid-serious-mental-illness-smi---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule30
      potentialCases:
        id: potentialCases
        source: transient-serious-mental-illness-smi---primary/output
  serious-mental-illness-smi-personality---primary:
    run: serious-mental-illness-smi-personality---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule31
      potentialCases:
        id: potentialCases
        source: cycloid-serious-mental-illness-smi---primary/output
  serious-mental-illness-smi-cotard---primary:
    run: serious-mental-illness-smi-cotard---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule32
      potentialCases:
        id: potentialCases
        source: serious-mental-illness-smi-personality---primary/output
  serious-mental-illness-smi-capgras---primary:
    run: serious-mental-illness-smi-capgras---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule33
      potentialCases:
        id: potentialCases
        source: serious-mental-illness-smi-cotard---primary/output
  bipolar-serious-mental-illness-smi---primary:
    run: bipolar-serious-mental-illness-smi---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule34
      potentialCases:
        id: potentialCases
        source: serious-mental-illness-smi-capgras---primary/output
  serious-mental-illness-smi-undifferentiated---primary:
    run: serious-mental-illness-smi-undifferentiated---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule35
      potentialCases:
        id: potentialCases
        source: bipolar-serious-mental-illness-smi---primary/output
  partial-serious-mental-illness-smi---primary:
    run: partial-serious-mental-illness-smi---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule36
      potentialCases:
        id: potentialCases
        source: serious-mental-illness-smi-undifferentiated---primary/output
  serious-mental-illness-smi-mention---primary:
    run: serious-mental-illness-smi-mention---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule37
      potentialCases:
        id: potentialCases
        source: partial-serious-mental-illness-smi---primary/output
  serious-mental-illness-smi-mania---primary:
    run: serious-mental-illness-smi-mania---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule38
      potentialCases:
        id: potentialCases
        source: serious-mental-illness-smi-mention---primary/output
  serious-mental-illness-smi-psychosis---primary:
    run: serious-mental-illness-smi-psychosis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule39
      potentialCases:
        id: potentialCases
        source: serious-mental-illness-smi-mania---primary/output
  moderate-serious-mental-illness-smi---primary:
    run: moderate-serious-mental-illness-smi---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule40
      potentialCases:
        id: potentialCases
        source: serious-mental-illness-smi-psychosis---primary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule41
      potentialCases:
        id: potentialCases
        source: moderate-serious-mental-illness-smi---primary/output
class: Workflow
inputs:
  inputModule1:
    id: inputModule1
    doc: Js implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
  inputModule11:
    id: inputModule11
    doc: Python implementation unit
    type: File
  inputModule12:
    id: inputModule12
    doc: Python implementation unit
    type: File
  inputModule13:
    id: inputModule13
    doc: Python implementation unit
    type: File
  inputModule14:
    id: inputModule14
    doc: Python implementation unit
    type: File
  inputModule15:
    id: inputModule15
    doc: Python implementation unit
    type: File
  inputModule16:
    id: inputModule16
    doc: Python implementation unit
    type: File
  inputModule17:
    id: inputModule17
    doc: Python implementation unit
    type: File
  inputModule18:
    id: inputModule18
    doc: Python implementation unit
    type: File
  inputModule19:
    id: inputModule19
    doc: Python implementation unit
    type: File
  inputModule20:
    id: inputModule20
    doc: Python implementation unit
    type: File
  inputModule21:
    id: inputModule21
    doc: Python implementation unit
    type: File
  inputModule22:
    id: inputModule22
    doc: Python implementation unit
    type: File
  inputModule23:
    id: inputModule23
    doc: Python implementation unit
    type: File
  inputModule24:
    id: inputModule24
    doc: Python implementation unit
    type: File
  inputModule25:
    id: inputModule25
    doc: Python implementation unit
    type: File
  inputModule26:
    id: inputModule26
    doc: Python implementation unit
    type: File
  inputModule27:
    id: inputModule27
    doc: Python implementation unit
    type: File
  inputModule28:
    id: inputModule28
    doc: Python implementation unit
    type: File
  inputModule29:
    id: inputModule29
    doc: Python implementation unit
    type: File
  inputModule30:
    id: inputModule30
    doc: Python implementation unit
    type: File
  inputModule31:
    id: inputModule31
    doc: Python implementation unit
    type: File
  inputModule32:
    id: inputModule32
    doc: Python implementation unit
    type: File
  inputModule33:
    id: inputModule33
    doc: Python implementation unit
    type: File
  inputModule34:
    id: inputModule34
    doc: Python implementation unit
    type: File
  inputModule35:
    id: inputModule35
    doc: Python implementation unit
    type: File
  inputModule36:
    id: inputModule36
    doc: Python implementation unit
    type: File
  inputModule37:
    id: inputModule37
    doc: Python implementation unit
    type: File
  inputModule38:
    id: inputModule38
    doc: Python implementation unit
    type: File
  inputModule39:
    id: inputModule39
    doc: Python implementation unit
    type: File
  inputModule40:
    id: inputModule40
    doc: Python implementation unit
    type: File
  inputModule41:
    id: inputModule41
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
