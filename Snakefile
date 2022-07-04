from snakemake import rules

rule first_rule:
	input:
		file1="input.txt",
		file2="input2.txt",
		file3="input3.txt"
	output:
		"output.txt",
		"output2.txt",
		output3="output3.txt"
	shell:
		#"echo hello world"
		"cat {input[0]} > {output[0]};"
		"cat {input[1]} > {output[1]};"
		"cat {input.file3} > {output.output3}"

rule second_rule:
	input:
		rule2_input=rules.first_rule.output.output3
	output:
		rule2_output="rules_output.txt"
	shell:
		"cat {input.rule2_input} > {output.rule2_output};"
		
