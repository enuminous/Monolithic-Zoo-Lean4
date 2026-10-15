import Extensions

namespace Zoo.ExtensionFixtures
open Zoo.Extensions

theorem chimera_0000 : Chimera.tags ⟨false, false, false, false, false, false, false⟩ = ["U"] := by decide
theorem chimera_0001 : Chimera.tags ⟨false, false, false, false, false, false, true⟩ = ["D"] := by decide
theorem chimera_0002 : Chimera.tags ⟨false, false, false, false, false, true, false⟩ = ["U"] := by decide
theorem chimera_0003 : Chimera.tags ⟨false, false, false, false, false, true, true⟩ = ["U"] := by decide
theorem chimera_0004 : Chimera.tags ⟨false, false, false, false, true, false, false⟩ = ["U", "R"] := by decide
theorem chimera_0005 : Chimera.tags ⟨false, false, false, false, true, false, true⟩ = ["R", "D"] := by decide
theorem chimera_0006 : Chimera.tags ⟨false, false, false, false, true, true, false⟩ = ["U", "R"] := by decide
theorem chimera_0007 : Chimera.tags ⟨false, false, false, false, true, true, true⟩ = ["R"] := by decide
theorem chimera_0008 : Chimera.tags ⟨false, false, false, true, false, false, false⟩ = ["U"] := by decide
theorem chimera_0009 : Chimera.tags ⟨false, false, false, true, false, false, true⟩ = ["D"] := by decide
theorem chimera_0010 : Chimera.tags ⟨false, false, false, true, false, true, false⟩ = ["U"] := by decide
theorem chimera_0011 : Chimera.tags ⟨false, false, false, true, false, true, true⟩ = ["U"] := by decide
theorem chimera_0012 : Chimera.tags ⟨false, false, false, true, true, false, false⟩ = ["U", "R"] := by decide
theorem chimera_0013 : Chimera.tags ⟨false, false, false, true, true, false, true⟩ = ["R", "D"] := by decide
theorem chimera_0014 : Chimera.tags ⟨false, false, false, true, true, true, false⟩ = ["U", "R"] := by decide
theorem chimera_0015 : Chimera.tags ⟨false, false, false, true, true, true, true⟩ = ["R"] := by decide
theorem chimera_0016 : Chimera.tags ⟨false, false, true, false, false, false, false⟩ = ["U"] := by decide
theorem chimera_0017 : Chimera.tags ⟨false, false, true, false, false, false, true⟩ = ["D"] := by decide
theorem chimera_0018 : Chimera.tags ⟨false, false, true, false, false, true, false⟩ = ["U"] := by decide
theorem chimera_0019 : Chimera.tags ⟨false, false, true, false, false, true, true⟩ = ["U"] := by decide
theorem chimera_0020 : Chimera.tags ⟨false, false, true, false, true, false, false⟩ = ["U", "R"] := by decide
theorem chimera_0021 : Chimera.tags ⟨false, false, true, false, true, false, true⟩ = ["R", "D"] := by decide
theorem chimera_0022 : Chimera.tags ⟨false, false, true, false, true, true, false⟩ = ["U", "R"] := by decide
theorem chimera_0023 : Chimera.tags ⟨false, false, true, false, true, true, true⟩ = ["R"] := by decide
theorem chimera_0024 : Chimera.tags ⟨false, false, true, true, false, false, false⟩ = ["U", "K"] := by decide
theorem chimera_0025 : Chimera.tags ⟨false, false, true, true, false, false, true⟩ = ["K", "D"] := by decide
theorem chimera_0026 : Chimera.tags ⟨false, false, true, true, false, true, false⟩ = ["U", "K"] := by decide
theorem chimera_0027 : Chimera.tags ⟨false, false, true, true, false, true, true⟩ = ["K"] := by decide
theorem chimera_0028 : Chimera.tags ⟨false, false, true, true, true, false, false⟩ = ["U", "K", "R"] := by decide
theorem chimera_0029 : Chimera.tags ⟨false, false, true, true, true, false, true⟩ = ["K", "R", "D"] := by decide
theorem chimera_0030 : Chimera.tags ⟨false, false, true, true, true, true, false⟩ = ["U", "K", "R"] := by decide
theorem chimera_0031 : Chimera.tags ⟨false, false, true, true, true, true, true⟩ = ["K", "R"] := by decide
theorem chimera_0032 : Chimera.tags ⟨false, true, false, false, false, false, false⟩ = ["U", "Q"] := by decide
theorem chimera_0033 : Chimera.tags ⟨false, true, false, false, false, false, true⟩ = ["Q", "D"] := by decide
theorem chimera_0034 : Chimera.tags ⟨false, true, false, false, false, true, false⟩ = ["U", "Q"] := by decide
theorem chimera_0035 : Chimera.tags ⟨false, true, false, false, false, true, true⟩ = ["Q"] := by decide
theorem chimera_0036 : Chimera.tags ⟨false, true, false, false, true, false, false⟩ = ["U", "Q", "R"] := by decide
theorem chimera_0037 : Chimera.tags ⟨false, true, false, false, true, false, true⟩ = ["Q", "R", "D"] := by decide
theorem chimera_0038 : Chimera.tags ⟨false, true, false, false, true, true, false⟩ = ["U", "Q", "R"] := by decide
theorem chimera_0039 : Chimera.tags ⟨false, true, false, false, true, true, true⟩ = ["Q", "R"] := by decide
theorem chimera_0040 : Chimera.tags ⟨false, true, false, true, false, false, false⟩ = ["U", "Q"] := by decide
theorem chimera_0041 : Chimera.tags ⟨false, true, false, true, false, false, true⟩ = ["Q", "D"] := by decide
theorem chimera_0042 : Chimera.tags ⟨false, true, false, true, false, true, false⟩ = ["U", "Q"] := by decide
theorem chimera_0043 : Chimera.tags ⟨false, true, false, true, false, true, true⟩ = ["Q"] := by decide
theorem chimera_0044 : Chimera.tags ⟨false, true, false, true, true, false, false⟩ = ["U", "Q", "R"] := by decide
theorem chimera_0045 : Chimera.tags ⟨false, true, false, true, true, false, true⟩ = ["Q", "R", "D"] := by decide
theorem chimera_0046 : Chimera.tags ⟨false, true, false, true, true, true, false⟩ = ["U", "Q", "R"] := by decide
theorem chimera_0047 : Chimera.tags ⟨false, true, false, true, true, true, true⟩ = ["Q", "R"] := by decide
theorem chimera_0048 : Chimera.tags ⟨false, true, true, false, false, false, false⟩ = ["U", "Q"] := by decide
theorem chimera_0049 : Chimera.tags ⟨false, true, true, false, false, false, true⟩ = ["Q", "D"] := by decide
theorem chimera_0050 : Chimera.tags ⟨false, true, true, false, false, true, false⟩ = ["U", "Q"] := by decide
theorem chimera_0051 : Chimera.tags ⟨false, true, true, false, false, true, true⟩ = ["Q"] := by decide
theorem chimera_0052 : Chimera.tags ⟨false, true, true, false, true, false, false⟩ = ["U", "Q", "R"] := by decide
theorem chimera_0053 : Chimera.tags ⟨false, true, true, false, true, false, true⟩ = ["Q", "R", "D"] := by decide
theorem chimera_0054 : Chimera.tags ⟨false, true, true, false, true, true, false⟩ = ["U", "Q", "R"] := by decide
theorem chimera_0055 : Chimera.tags ⟨false, true, true, false, true, true, true⟩ = ["Q", "R"] := by decide
theorem chimera_0056 : Chimera.tags ⟨false, true, true, true, false, false, false⟩ = ["U", "Q", "K"] := by decide
theorem chimera_0057 : Chimera.tags ⟨false, true, true, true, false, false, true⟩ = ["Q", "K", "D"] := by decide
theorem chimera_0058 : Chimera.tags ⟨false, true, true, true, false, true, false⟩ = ["U", "Q", "K"] := by decide
theorem chimera_0059 : Chimera.tags ⟨false, true, true, true, false, true, true⟩ = ["Q", "K"] := by decide
theorem chimera_0060 : Chimera.tags ⟨false, true, true, true, true, false, false⟩ = ["U", "Q", "K", "R"] := by decide
theorem chimera_0061 : Chimera.tags ⟨false, true, true, true, true, false, true⟩ = ["Q", "K", "R", "D"] := by decide
theorem chimera_0062 : Chimera.tags ⟨false, true, true, true, true, true, false⟩ = ["U", "Q", "K", "R"] := by decide
theorem chimera_0063 : Chimera.tags ⟨false, true, true, true, true, true, true⟩ = ["Q", "K", "R"] := by decide
theorem chimera_0064 : Chimera.tags ⟨true, false, false, false, false, false, false⟩ = ["U", "C"] := by decide
theorem chimera_0065 : Chimera.tags ⟨true, false, false, false, false, false, true⟩ = ["C", "D"] := by decide
theorem chimera_0066 : Chimera.tags ⟨true, false, false, false, false, true, false⟩ = ["U", "C"] := by decide
theorem chimera_0067 : Chimera.tags ⟨true, false, false, false, false, true, true⟩ = ["C"] := by decide
theorem chimera_0068 : Chimera.tags ⟨true, false, false, false, true, false, false⟩ = ["U", "C", "R"] := by decide
theorem chimera_0069 : Chimera.tags ⟨true, false, false, false, true, false, true⟩ = ["C", "R", "D"] := by decide
theorem chimera_0070 : Chimera.tags ⟨true, false, false, false, true, true, false⟩ = ["U", "C", "R"] := by decide
theorem chimera_0071 : Chimera.tags ⟨true, false, false, false, true, true, true⟩ = ["C", "R"] := by decide
theorem chimera_0072 : Chimera.tags ⟨true, false, false, true, false, false, false⟩ = ["U", "C"] := by decide
theorem chimera_0073 : Chimera.tags ⟨true, false, false, true, false, false, true⟩ = ["C", "D"] := by decide
theorem chimera_0074 : Chimera.tags ⟨true, false, false, true, false, true, false⟩ = ["U", "C"] := by decide
theorem chimera_0075 : Chimera.tags ⟨true, false, false, true, false, true, true⟩ = ["C"] := by decide
theorem chimera_0076 : Chimera.tags ⟨true, false, false, true, true, false, false⟩ = ["U", "C", "R"] := by decide
theorem chimera_0077 : Chimera.tags ⟨true, false, false, true, true, false, true⟩ = ["C", "R", "D"] := by decide
theorem chimera_0078 : Chimera.tags ⟨true, false, false, true, true, true, false⟩ = ["U", "C", "R"] := by decide
theorem chimera_0079 : Chimera.tags ⟨true, false, false, true, true, true, true⟩ = ["C", "R"] := by decide
theorem chimera_0080 : Chimera.tags ⟨true, false, true, false, false, false, false⟩ = ["U", "C"] := by decide
theorem chimera_0081 : Chimera.tags ⟨true, false, true, false, false, false, true⟩ = ["C", "D"] := by decide
theorem chimera_0082 : Chimera.tags ⟨true, false, true, false, false, true, false⟩ = ["U", "C"] := by decide
theorem chimera_0083 : Chimera.tags ⟨true, false, true, false, false, true, true⟩ = ["C"] := by decide
theorem chimera_0084 : Chimera.tags ⟨true, false, true, false, true, false, false⟩ = ["U", "C", "R"] := by decide
theorem chimera_0085 : Chimera.tags ⟨true, false, true, false, true, false, true⟩ = ["C", "R", "D"] := by decide
theorem chimera_0086 : Chimera.tags ⟨true, false, true, false, true, true, false⟩ = ["U", "C", "R"] := by decide
theorem chimera_0087 : Chimera.tags ⟨true, false, true, false, true, true, true⟩ = ["C", "R"] := by decide
theorem chimera_0088 : Chimera.tags ⟨true, false, true, true, false, false, false⟩ = ["U", "C", "K"] := by decide
theorem chimera_0089 : Chimera.tags ⟨true, false, true, true, false, false, true⟩ = ["C", "K", "D"] := by decide
theorem chimera_0090 : Chimera.tags ⟨true, false, true, true, false, true, false⟩ = ["U", "C", "K"] := by decide
theorem chimera_0091 : Chimera.tags ⟨true, false, true, true, false, true, true⟩ = ["C", "K"] := by decide
theorem chimera_0092 : Chimera.tags ⟨true, false, true, true, true, false, false⟩ = ["U", "C", "K", "R"] := by decide
theorem chimera_0093 : Chimera.tags ⟨true, false, true, true, true, false, true⟩ = ["C", "K", "R", "D"] := by decide
theorem chimera_0094 : Chimera.tags ⟨true, false, true, true, true, true, false⟩ = ["U", "C", "K", "R"] := by decide
theorem chimera_0095 : Chimera.tags ⟨true, false, true, true, true, true, true⟩ = ["C", "K", "R"] := by decide
theorem chimera_0096 : Chimera.tags ⟨true, true, false, false, false, false, false⟩ = ["U", "Q", "C"] := by decide
theorem chimera_0097 : Chimera.tags ⟨true, true, false, false, false, false, true⟩ = ["Q", "C", "D"] := by decide
theorem chimera_0098 : Chimera.tags ⟨true, true, false, false, false, true, false⟩ = ["U", "Q", "C"] := by decide
theorem chimera_0099 : Chimera.tags ⟨true, true, false, false, false, true, true⟩ = ["Q", "C"] := by decide
theorem chimera_0100 : Chimera.tags ⟨true, true, false, false, true, false, false⟩ = ["U", "Q", "C", "R"] := by decide
theorem chimera_0101 : Chimera.tags ⟨true, true, false, false, true, false, true⟩ = ["Q", "C", "R", "D"] := by decide
theorem chimera_0102 : Chimera.tags ⟨true, true, false, false, true, true, false⟩ = ["U", "Q", "C", "R"] := by decide
theorem chimera_0103 : Chimera.tags ⟨true, true, false, false, true, true, true⟩ = ["Q", "C", "R"] := by decide
theorem chimera_0104 : Chimera.tags ⟨true, true, false, true, false, false, false⟩ = ["U", "Q", "C"] := by decide
theorem chimera_0105 : Chimera.tags ⟨true, true, false, true, false, false, true⟩ = ["Q", "C", "D"] := by decide
theorem chimera_0106 : Chimera.tags ⟨true, true, false, true, false, true, false⟩ = ["U", "Q", "C"] := by decide
theorem chimera_0107 : Chimera.tags ⟨true, true, false, true, false, true, true⟩ = ["Q", "C"] := by decide
theorem chimera_0108 : Chimera.tags ⟨true, true, false, true, true, false, false⟩ = ["U", "Q", "C", "R"] := by decide
theorem chimera_0109 : Chimera.tags ⟨true, true, false, true, true, false, true⟩ = ["Q", "C", "R", "D"] := by decide
theorem chimera_0110 : Chimera.tags ⟨true, true, false, true, true, true, false⟩ = ["U", "Q", "C", "R"] := by decide
theorem chimera_0111 : Chimera.tags ⟨true, true, false, true, true, true, true⟩ = ["Q", "C", "R"] := by decide
theorem chimera_0112 : Chimera.tags ⟨true, true, true, false, false, false, false⟩ = ["U", "Q", "C"] := by decide
theorem chimera_0113 : Chimera.tags ⟨true, true, true, false, false, false, true⟩ = ["Q", "C", "D"] := by decide
theorem chimera_0114 : Chimera.tags ⟨true, true, true, false, false, true, false⟩ = ["U", "Q", "C"] := by decide
theorem chimera_0115 : Chimera.tags ⟨true, true, true, false, false, true, true⟩ = ["Q", "C"] := by decide
theorem chimera_0116 : Chimera.tags ⟨true, true, true, false, true, false, false⟩ = ["U", "Q", "C", "R"] := by decide
theorem chimera_0117 : Chimera.tags ⟨true, true, true, false, true, false, true⟩ = ["Q", "C", "R", "D"] := by decide
theorem chimera_0118 : Chimera.tags ⟨true, true, true, false, true, true, false⟩ = ["U", "Q", "C", "R"] := by decide
theorem chimera_0119 : Chimera.tags ⟨true, true, true, false, true, true, true⟩ = ["Q", "C", "R"] := by decide
theorem chimera_0120 : Chimera.tags ⟨true, true, true, true, false, false, false⟩ = ["U", "Q", "C", "K"] := by decide
theorem chimera_0121 : Chimera.tags ⟨true, true, true, true, false, false, true⟩ = ["Q", "C", "K", "D"] := by decide
theorem chimera_0122 : Chimera.tags ⟨true, true, true, true, false, true, false⟩ = ["U", "Q", "C", "K"] := by decide
theorem chimera_0123 : Chimera.tags ⟨true, true, true, true, false, true, true⟩ = ["Q", "C", "K"] := by decide
theorem chimera_0124 : Chimera.tags ⟨true, true, true, true, true, false, false⟩ = ["U", "Q", "C", "K", "R"] := by decide
theorem chimera_0125 : Chimera.tags ⟨true, true, true, true, true, false, true⟩ = ["Q", "C", "K", "R", "D"] := by decide
theorem chimera_0126 : Chimera.tags ⟨true, true, true, true, true, true, false⟩ = ["U", "Q", "C", "K", "R"] := by decide
theorem chimera_0127 : Chimera.tags ⟨true, true, true, true, true, true, true⟩ = ["Q", "C", "K", "R"] := by decide
theorem circus_0000 : Circus.decideGate ⟨false, false, false, false, false, false, false, false⟩ = .na := by decide
theorem circus_0001 : Circus.decideGate ⟨false, false, false, false, false, false, false, true⟩ = .pass := by decide
theorem circus_0002 : Circus.decideGate ⟨false, false, false, false, false, false, true, true⟩ = .na := by decide
theorem circus_0003 : Circus.decideGate ⟨false, false, false, false, false, true, true, true⟩ = .fail := by decide
theorem circus_0004 : Circus.decideGate ⟨false, false, false, false, true, false, false, false⟩ = .fail := by decide
theorem circus_0005 : Circus.decideGate ⟨false, false, false, false, true, false, false, true⟩ = .fail := by decide
theorem circus_0006 : Circus.decideGate ⟨false, false, false, false, true, false, true, true⟩ = .fail := by decide
theorem circus_0007 : Circus.decideGate ⟨false, false, false, false, true, true, true, true⟩ = .fail := by decide
theorem circus_0008 : Circus.decideGate ⟨false, false, false, true, false, false, false, false⟩ = .fail := by decide
theorem circus_0009 : Circus.decideGate ⟨false, false, false, true, false, false, false, true⟩ = .fail := by decide
theorem circus_0010 : Circus.decideGate ⟨false, false, false, true, false, false, true, true⟩ = .fail := by decide
theorem circus_0011 : Circus.decideGate ⟨false, false, false, true, false, true, true, true⟩ = .fail := by decide
theorem circus_0012 : Circus.decideGate ⟨false, false, false, true, true, false, false, false⟩ = .fail := by decide
theorem circus_0013 : Circus.decideGate ⟨false, false, false, true, true, false, false, true⟩ = .fail := by decide
theorem circus_0014 : Circus.decideGate ⟨false, false, false, true, true, false, true, true⟩ = .fail := by decide
theorem circus_0015 : Circus.decideGate ⟨false, false, false, true, true, true, true, true⟩ = .fail := by decide
theorem circus_0016 : Circus.decideGate ⟨false, false, true, false, false, false, false, false⟩ = .na := by decide
theorem circus_0017 : Circus.decideGate ⟨false, false, true, false, false, false, false, true⟩ = .na := by decide
theorem circus_0018 : Circus.decideGate ⟨false, false, true, false, false, false, true, true⟩ = .na := by decide
theorem circus_0019 : Circus.decideGate ⟨false, false, true, false, false, true, true, true⟩ = .fail := by decide
theorem circus_0020 : Circus.decideGate ⟨false, false, true, false, true, false, false, false⟩ = .fail := by decide
theorem circus_0021 : Circus.decideGate ⟨false, false, true, false, true, false, false, true⟩ = .fail := by decide
theorem circus_0022 : Circus.decideGate ⟨false, false, true, false, true, false, true, true⟩ = .fail := by decide
theorem circus_0023 : Circus.decideGate ⟨false, false, true, false, true, true, true, true⟩ = .fail := by decide
theorem circus_0024 : Circus.decideGate ⟨false, false, true, true, false, false, false, false⟩ = .fail := by decide
theorem circus_0025 : Circus.decideGate ⟨false, false, true, true, false, false, false, true⟩ = .fail := by decide
theorem circus_0026 : Circus.decideGate ⟨false, false, true, true, false, false, true, true⟩ = .fail := by decide
theorem circus_0027 : Circus.decideGate ⟨false, false, true, true, false, true, true, true⟩ = .fail := by decide
theorem circus_0028 : Circus.decideGate ⟨false, false, true, true, true, false, false, false⟩ = .fail := by decide
theorem circus_0029 : Circus.decideGate ⟨false, false, true, true, true, false, false, true⟩ = .fail := by decide
theorem circus_0030 : Circus.decideGate ⟨false, false, true, true, true, false, true, true⟩ = .fail := by decide
theorem circus_0031 : Circus.decideGate ⟨false, false, true, true, true, true, true, true⟩ = .fail := by decide
theorem circus_0032 : Circus.decideGate ⟨false, true, false, false, true, false, false, false⟩ = .fail := by decide
theorem circus_0033 : Circus.decideGate ⟨false, true, false, false, true, false, false, true⟩ = .fail := by decide
theorem circus_0034 : Circus.decideGate ⟨false, true, false, false, true, false, true, true⟩ = .fail := by decide
theorem circus_0035 : Circus.decideGate ⟨false, true, false, false, true, true, true, true⟩ = .fail := by decide
theorem circus_0036 : Circus.decideGate ⟨false, true, false, true, true, false, false, false⟩ = .fail := by decide
theorem circus_0037 : Circus.decideGate ⟨false, true, false, true, true, false, false, true⟩ = .fail := by decide
theorem circus_0038 : Circus.decideGate ⟨false, true, false, true, true, false, true, true⟩ = .fail := by decide
theorem circus_0039 : Circus.decideGate ⟨false, true, false, true, true, true, true, true⟩ = .fail := by decide
theorem circus_0040 : Circus.decideGate ⟨false, true, true, false, true, false, false, false⟩ = .fail := by decide
theorem circus_0041 : Circus.decideGate ⟨false, true, true, false, true, false, false, true⟩ = .fail := by decide
theorem circus_0042 : Circus.decideGate ⟨false, true, true, false, true, false, true, true⟩ = .fail := by decide
theorem circus_0043 : Circus.decideGate ⟨false, true, true, false, true, true, true, true⟩ = .fail := by decide
theorem circus_0044 : Circus.decideGate ⟨false, true, true, true, true, false, false, false⟩ = .fail := by decide
theorem circus_0045 : Circus.decideGate ⟨false, true, true, true, true, false, false, true⟩ = .fail := by decide
theorem circus_0046 : Circus.decideGate ⟨false, true, true, true, true, false, true, true⟩ = .fail := by decide
theorem circus_0047 : Circus.decideGate ⟨false, true, true, true, true, true, true, true⟩ = .fail := by decide
theorem circus_0048 : Circus.decideGate ⟨true, false, false, false, false, false, false, false⟩ = .na := by decide
theorem circus_0049 : Circus.decideGate ⟨true, false, false, false, false, false, false, true⟩ = .na := by decide
theorem circus_0050 : Circus.decideGate ⟨true, false, false, false, false, false, true, true⟩ = .na := by decide
theorem circus_0051 : Circus.decideGate ⟨true, false, false, false, false, true, true, true⟩ = .fail := by decide
theorem circus_0052 : Circus.decideGate ⟨true, false, false, false, true, false, false, false⟩ = .fail := by decide
theorem circus_0053 : Circus.decideGate ⟨true, false, false, false, true, false, false, true⟩ = .fail := by decide
theorem circus_0054 : Circus.decideGate ⟨true, false, false, false, true, false, true, true⟩ = .fail := by decide
theorem circus_0055 : Circus.decideGate ⟨true, false, false, false, true, true, true, true⟩ = .fail := by decide
theorem circus_0056 : Circus.decideGate ⟨true, false, false, true, false, false, false, false⟩ = .fail := by decide
theorem circus_0057 : Circus.decideGate ⟨true, false, false, true, false, false, false, true⟩ = .fail := by decide
theorem circus_0058 : Circus.decideGate ⟨true, false, false, true, false, false, true, true⟩ = .fail := by decide
theorem circus_0059 : Circus.decideGate ⟨true, false, false, true, false, true, true, true⟩ = .fail := by decide
theorem circus_0060 : Circus.decideGate ⟨true, false, false, true, true, false, false, false⟩ = .fail := by decide
theorem circus_0061 : Circus.decideGate ⟨true, false, false, true, true, false, false, true⟩ = .fail := by decide
theorem circus_0062 : Circus.decideGate ⟨true, false, false, true, true, false, true, true⟩ = .fail := by decide
theorem circus_0063 : Circus.decideGate ⟨true, false, false, true, true, true, true, true⟩ = .fail := by decide
theorem circus_0064 : Circus.decideGate ⟨true, false, true, false, false, false, false, false⟩ = .na := by decide
theorem circus_0065 : Circus.decideGate ⟨true, false, true, false, false, false, false, true⟩ = .na := by decide
theorem circus_0066 : Circus.decideGate ⟨true, false, true, false, false, false, true, true⟩ = .na := by decide
theorem circus_0067 : Circus.decideGate ⟨true, false, true, false, false, true, true, true⟩ = .fail := by decide
theorem circus_0068 : Circus.decideGate ⟨true, false, true, false, true, false, false, false⟩ = .fail := by decide
theorem circus_0069 : Circus.decideGate ⟨true, false, true, false, true, false, false, true⟩ = .fail := by decide
theorem circus_0070 : Circus.decideGate ⟨true, false, true, false, true, false, true, true⟩ = .fail := by decide
theorem circus_0071 : Circus.decideGate ⟨true, false, true, false, true, true, true, true⟩ = .fail := by decide
theorem circus_0072 : Circus.decideGate ⟨true, false, true, true, false, false, false, false⟩ = .fail := by decide
theorem circus_0073 : Circus.decideGate ⟨true, false, true, true, false, false, false, true⟩ = .fail := by decide
theorem circus_0074 : Circus.decideGate ⟨true, false, true, true, false, false, true, true⟩ = .fail := by decide
theorem circus_0075 : Circus.decideGate ⟨true, false, true, true, false, true, true, true⟩ = .fail := by decide
theorem circus_0076 : Circus.decideGate ⟨true, false, true, true, true, false, false, false⟩ = .fail := by decide
theorem circus_0077 : Circus.decideGate ⟨true, false, true, true, true, false, false, true⟩ = .fail := by decide
theorem circus_0078 : Circus.decideGate ⟨true, false, true, true, true, false, true, true⟩ = .fail := by decide
theorem circus_0079 : Circus.decideGate ⟨true, false, true, true, true, true, true, true⟩ = .fail := by decide
theorem circus_0080 : Circus.decideGate ⟨true, true, false, false, true, false, false, false⟩ = .fail := by decide
theorem circus_0081 : Circus.decideGate ⟨true, true, false, false, true, false, false, true⟩ = .fail := by decide
theorem circus_0082 : Circus.decideGate ⟨true, true, false, false, true, false, true, true⟩ = .fail := by decide
theorem circus_0083 : Circus.decideGate ⟨true, true, false, false, true, true, true, true⟩ = .fail := by decide
theorem circus_0084 : Circus.decideGate ⟨true, true, false, true, true, false, false, false⟩ = .fail := by decide
theorem circus_0085 : Circus.decideGate ⟨true, true, false, true, true, false, false, true⟩ = .fail := by decide
theorem circus_0086 : Circus.decideGate ⟨true, true, false, true, true, false, true, true⟩ = .fail := by decide
theorem circus_0087 : Circus.decideGate ⟨true, true, false, true, true, true, true, true⟩ = .fail := by decide
theorem circus_0088 : Circus.decideGate ⟨true, true, true, false, true, false, false, false⟩ = .fail := by decide
theorem circus_0089 : Circus.decideGate ⟨true, true, true, false, true, false, false, true⟩ = .fail := by decide
theorem circus_0090 : Circus.decideGate ⟨true, true, true, false, true, false, true, true⟩ = .fail := by decide
theorem circus_0091 : Circus.decideGate ⟨true, true, true, false, true, true, true, true⟩ = .fail := by decide
theorem circus_0092 : Circus.decideGate ⟨true, true, true, true, true, false, false, false⟩ = .fail := by decide
theorem circus_0093 : Circus.decideGate ⟨true, true, true, true, true, false, false, true⟩ = .fail := by decide
theorem circus_0094 : Circus.decideGate ⟨true, true, true, true, true, false, true, true⟩ = .fail := by decide
theorem circus_0095 : Circus.decideGate ⟨true, true, true, true, true, true, true, true⟩ = .fail := by decide
theorem monster_0000 : Monster.decideGate ⟨false, false, false, false, false, false, false, false, false, false⟩ = .na := by decide
theorem monster_0001 : Monster.decideGate ⟨false, false, false, false, false, false, false, false, false, true⟩ = .na := by decide
theorem monster_0002 : Monster.decideGate ⟨false, false, false, false, false, false, false, true, false, false⟩ = .na := by decide
theorem monster_0003 : Monster.decideGate ⟨false, false, false, false, false, false, false, true, false, true⟩ = .na := by decide
theorem monster_0004 : Monster.decideGate ⟨false, false, false, false, true, false, false, false, false, false⟩ = .na := by decide
theorem monster_0005 : Monster.decideGate ⟨false, false, false, false, true, false, false, false, false, true⟩ = .na := by decide
theorem monster_0006 : Monster.decideGate ⟨false, false, false, false, true, false, false, true, false, false⟩ = .na := by decide
theorem monster_0007 : Monster.decideGate ⟨false, false, false, false, true, false, false, true, false, true⟩ = .na := by decide
theorem monster_0008 : Monster.decideGate ⟨false, false, false, false, true, true, false, false, false, false⟩ = .na := by decide
theorem monster_0009 : Monster.decideGate ⟨false, false, false, false, true, true, false, false, false, true⟩ = .na := by decide
theorem monster_0010 : Monster.decideGate ⟨false, false, false, false, true, true, false, false, true, false⟩ = .na := by decide
theorem monster_0011 : Monster.decideGate ⟨false, false, false, false, true, true, false, false, true, true⟩ = .na := by decide
theorem monster_0012 : Monster.decideGate ⟨false, false, false, false, true, true, false, true, false, false⟩ = .na := by decide
theorem monster_0013 : Monster.decideGate ⟨false, false, false, false, true, true, false, true, false, true⟩ = .na := by decide
theorem monster_0014 : Monster.decideGate ⟨false, false, false, false, true, true, false, true, true, false⟩ = .na := by decide
theorem monster_0015 : Monster.decideGate ⟨false, false, false, false, true, true, false, true, true, true⟩ = .na := by decide
theorem monster_0016 : Monster.decideGate ⟨false, false, false, false, true, true, true, false, false, false⟩ = .na := by decide
theorem monster_0017 : Monster.decideGate ⟨false, false, false, false, true, true, true, false, false, true⟩ = .na := by decide
theorem monster_0018 : Monster.decideGate ⟨false, false, false, false, true, true, true, false, true, false⟩ = .na := by decide
theorem monster_0019 : Monster.decideGate ⟨false, false, false, false, true, true, true, false, true, true⟩ = .na := by decide
theorem monster_0020 : Monster.decideGate ⟨false, false, false, false, true, true, true, true, false, false⟩ = .na := by decide
theorem monster_0021 : Monster.decideGate ⟨false, false, false, false, true, true, true, true, false, true⟩ = .na := by decide
theorem monster_0022 : Monster.decideGate ⟨false, false, false, false, true, true, true, true, true, false⟩ = .na := by decide
theorem monster_0023 : Monster.decideGate ⟨false, false, false, false, true, true, true, true, true, true⟩ = .na := by decide
theorem monster_0024 : Monster.decideGate ⟨false, false, false, true, false, false, false, false, false, false⟩ = .na := by decide
theorem monster_0025 : Monster.decideGate ⟨false, false, false, true, false, false, false, false, false, true⟩ = .na := by decide
theorem monster_0026 : Monster.decideGate ⟨false, false, false, true, false, false, false, true, false, false⟩ = .na := by decide
theorem monster_0027 : Monster.decideGate ⟨false, false, false, true, false, false, false, true, false, true⟩ = .na := by decide
theorem monster_0028 : Monster.decideGate ⟨false, false, false, true, true, false, false, false, false, false⟩ = .na := by decide
theorem monster_0029 : Monster.decideGate ⟨false, false, false, true, true, false, false, false, false, true⟩ = .na := by decide
theorem monster_0030 : Monster.decideGate ⟨false, false, false, true, true, false, false, true, false, false⟩ = .na := by decide
theorem monster_0031 : Monster.decideGate ⟨false, false, false, true, true, false, false, true, false, true⟩ = .na := by decide
theorem monster_0032 : Monster.decideGate ⟨false, false, false, true, true, true, false, false, false, false⟩ = .na := by decide
theorem monster_0033 : Monster.decideGate ⟨false, false, false, true, true, true, false, false, false, true⟩ = .na := by decide
theorem monster_0034 : Monster.decideGate ⟨false, false, false, true, true, true, false, false, true, false⟩ = .na := by decide
theorem monster_0035 : Monster.decideGate ⟨false, false, false, true, true, true, false, false, true, true⟩ = .na := by decide
theorem monster_0036 : Monster.decideGate ⟨false, false, false, true, true, true, false, true, false, false⟩ = .na := by decide
theorem monster_0037 : Monster.decideGate ⟨false, false, false, true, true, true, false, true, false, true⟩ = .na := by decide
theorem monster_0038 : Monster.decideGate ⟨false, false, false, true, true, true, false, true, true, false⟩ = .na := by decide
theorem monster_0039 : Monster.decideGate ⟨false, false, false, true, true, true, false, true, true, true⟩ = .na := by decide
theorem monster_0040 : Monster.decideGate ⟨false, false, false, true, true, true, true, false, false, false⟩ = .na := by decide
theorem monster_0041 : Monster.decideGate ⟨false, false, false, true, true, true, true, false, false, true⟩ = .na := by decide
theorem monster_0042 : Monster.decideGate ⟨false, false, false, true, true, true, true, false, true, false⟩ = .na := by decide
theorem monster_0043 : Monster.decideGate ⟨false, false, false, true, true, true, true, false, true, true⟩ = .na := by decide
theorem monster_0044 : Monster.decideGate ⟨false, false, false, true, true, true, true, true, false, false⟩ = .na := by decide
theorem monster_0045 : Monster.decideGate ⟨false, false, false, true, true, true, true, true, false, true⟩ = .na := by decide
theorem monster_0046 : Monster.decideGate ⟨false, false, false, true, true, true, true, true, true, false⟩ = .na := by decide
theorem monster_0047 : Monster.decideGate ⟨false, false, false, true, true, true, true, true, true, true⟩ = .na := by decide
theorem monster_0048 : Monster.decideGate ⟨false, false, true, false, false, false, false, false, false, false⟩ = .na := by decide
theorem monster_0049 : Monster.decideGate ⟨false, false, true, false, false, false, false, false, false, true⟩ = .na := by decide
theorem monster_0050 : Monster.decideGate ⟨false, false, true, false, false, false, false, true, false, false⟩ = .na := by decide
theorem monster_0051 : Monster.decideGate ⟨false, false, true, false, false, false, false, true, false, true⟩ = .na := by decide
theorem monster_0052 : Monster.decideGate ⟨false, false, true, false, true, false, false, false, false, false⟩ = .na := by decide
theorem monster_0053 : Monster.decideGate ⟨false, false, true, false, true, false, false, false, false, true⟩ = .na := by decide
theorem monster_0054 : Monster.decideGate ⟨false, false, true, false, true, false, false, true, false, false⟩ = .na := by decide
theorem monster_0055 : Monster.decideGate ⟨false, false, true, false, true, false, false, true, false, true⟩ = .na := by decide
theorem monster_0056 : Monster.decideGate ⟨false, false, true, false, true, true, false, false, false, false⟩ = .na := by decide
theorem monster_0057 : Monster.decideGate ⟨false, false, true, false, true, true, false, false, false, true⟩ = .na := by decide
theorem monster_0058 : Monster.decideGate ⟨false, false, true, false, true, true, false, false, true, false⟩ = .na := by decide
theorem monster_0059 : Monster.decideGate ⟨false, false, true, false, true, true, false, false, true, true⟩ = .na := by decide
theorem monster_0060 : Monster.decideGate ⟨false, false, true, false, true, true, false, true, false, false⟩ = .na := by decide
theorem monster_0061 : Monster.decideGate ⟨false, false, true, false, true, true, false, true, false, true⟩ = .na := by decide
theorem monster_0062 : Monster.decideGate ⟨false, false, true, false, true, true, false, true, true, false⟩ = .na := by decide
theorem monster_0063 : Monster.decideGate ⟨false, false, true, false, true, true, false, true, true, true⟩ = .na := by decide
theorem monster_0064 : Monster.decideGate ⟨false, false, true, false, true, true, true, false, false, false⟩ = .na := by decide
theorem monster_0065 : Monster.decideGate ⟨false, false, true, false, true, true, true, false, false, true⟩ = .na := by decide
theorem monster_0066 : Monster.decideGate ⟨false, false, true, false, true, true, true, false, true, false⟩ = .na := by decide
theorem monster_0067 : Monster.decideGate ⟨false, false, true, false, true, true, true, false, true, true⟩ = .na := by decide
theorem monster_0068 : Monster.decideGate ⟨false, false, true, false, true, true, true, true, false, false⟩ = .na := by decide
theorem monster_0069 : Monster.decideGate ⟨false, false, true, false, true, true, true, true, false, true⟩ = .na := by decide
theorem monster_0070 : Monster.decideGate ⟨false, false, true, false, true, true, true, true, true, false⟩ = .na := by decide
theorem monster_0071 : Monster.decideGate ⟨false, false, true, false, true, true, true, true, true, true⟩ = .na := by decide
theorem monster_0072 : Monster.decideGate ⟨false, false, true, true, false, false, false, false, false, false⟩ = .na := by decide
theorem monster_0073 : Monster.decideGate ⟨false, false, true, true, false, false, false, false, false, true⟩ = .na := by decide
theorem monster_0074 : Monster.decideGate ⟨false, false, true, true, false, false, false, true, false, false⟩ = .na := by decide
theorem monster_0075 : Monster.decideGate ⟨false, false, true, true, false, false, false, true, false, true⟩ = .na := by decide
theorem monster_0076 : Monster.decideGate ⟨false, false, true, true, true, false, false, false, false, false⟩ = .na := by decide
theorem monster_0077 : Monster.decideGate ⟨false, false, true, true, true, false, false, false, false, true⟩ = .na := by decide
theorem monster_0078 : Monster.decideGate ⟨false, false, true, true, true, false, false, true, false, false⟩ = .na := by decide
theorem monster_0079 : Monster.decideGate ⟨false, false, true, true, true, false, false, true, false, true⟩ = .na := by decide
theorem monster_0080 : Monster.decideGate ⟨false, false, true, true, true, true, false, false, false, false⟩ = .na := by decide
theorem monster_0081 : Monster.decideGate ⟨false, false, true, true, true, true, false, false, false, true⟩ = .na := by decide
theorem monster_0082 : Monster.decideGate ⟨false, false, true, true, true, true, false, false, true, false⟩ = .na := by decide
theorem monster_0083 : Monster.decideGate ⟨false, false, true, true, true, true, false, false, true, true⟩ = .na := by decide
theorem monster_0084 : Monster.decideGate ⟨false, false, true, true, true, true, false, true, false, false⟩ = .na := by decide
theorem monster_0085 : Monster.decideGate ⟨false, false, true, true, true, true, false, true, false, true⟩ = .na := by decide
theorem monster_0086 : Monster.decideGate ⟨false, false, true, true, true, true, false, true, true, false⟩ = .na := by decide
theorem monster_0087 : Monster.decideGate ⟨false, false, true, true, true, true, false, true, true, true⟩ = .na := by decide
theorem monster_0088 : Monster.decideGate ⟨false, false, true, true, true, true, true, false, false, false⟩ = .na := by decide
theorem monster_0089 : Monster.decideGate ⟨false, false, true, true, true, true, true, false, false, true⟩ = .na := by decide
theorem monster_0090 : Monster.decideGate ⟨false, false, true, true, true, true, true, false, true, false⟩ = .na := by decide
theorem monster_0091 : Monster.decideGate ⟨false, false, true, true, true, true, true, false, true, true⟩ = .na := by decide
theorem monster_0092 : Monster.decideGate ⟨false, false, true, true, true, true, true, true, false, false⟩ = .na := by decide
theorem monster_0093 : Monster.decideGate ⟨false, false, true, true, true, true, true, true, false, true⟩ = .na := by decide
theorem monster_0094 : Monster.decideGate ⟨false, false, true, true, true, true, true, true, true, false⟩ = .na := by decide
theorem monster_0095 : Monster.decideGate ⟨false, false, true, true, true, true, true, true, true, true⟩ = .na := by decide
theorem monster_0096 : Monster.decideGate ⟨false, true, false, false, false, false, false, false, false, false⟩ = .na := by decide
theorem monster_0097 : Monster.decideGate ⟨false, true, false, false, false, false, false, false, false, true⟩ = .na := by decide
theorem monster_0098 : Monster.decideGate ⟨false, true, false, false, false, false, false, true, false, false⟩ = .na := by decide
theorem monster_0099 : Monster.decideGate ⟨false, true, false, false, false, false, false, true, false, true⟩ = .na := by decide
theorem monster_0100 : Monster.decideGate ⟨false, true, false, false, true, false, false, false, false, false⟩ = .na := by decide
theorem monster_0101 : Monster.decideGate ⟨false, true, false, false, true, false, false, false, false, true⟩ = .na := by decide
theorem monster_0102 : Monster.decideGate ⟨false, true, false, false, true, false, false, true, false, false⟩ = .na := by decide
theorem monster_0103 : Monster.decideGate ⟨false, true, false, false, true, false, false, true, false, true⟩ = .na := by decide
theorem monster_0104 : Monster.decideGate ⟨false, true, false, false, true, true, false, false, false, false⟩ = .na := by decide
theorem monster_0105 : Monster.decideGate ⟨false, true, false, false, true, true, false, false, false, true⟩ = .na := by decide
theorem monster_0106 : Monster.decideGate ⟨false, true, false, false, true, true, false, false, true, false⟩ = .na := by decide
theorem monster_0107 : Monster.decideGate ⟨false, true, false, false, true, true, false, false, true, true⟩ = .na := by decide
theorem monster_0108 : Monster.decideGate ⟨false, true, false, false, true, true, false, true, false, false⟩ = .na := by decide
theorem monster_0109 : Monster.decideGate ⟨false, true, false, false, true, true, false, true, false, true⟩ = .na := by decide
theorem monster_0110 : Monster.decideGate ⟨false, true, false, false, true, true, false, true, true, false⟩ = .na := by decide
theorem monster_0111 : Monster.decideGate ⟨false, true, false, false, true, true, false, true, true, true⟩ = .na := by decide
theorem monster_0112 : Monster.decideGate ⟨false, true, false, false, true, true, true, false, false, false⟩ = .na := by decide
theorem monster_0113 : Monster.decideGate ⟨false, true, false, false, true, true, true, false, false, true⟩ = .na := by decide
theorem monster_0114 : Monster.decideGate ⟨false, true, false, false, true, true, true, false, true, false⟩ = .na := by decide
theorem monster_0115 : Monster.decideGate ⟨false, true, false, false, true, true, true, false, true, true⟩ = .na := by decide
theorem monster_0116 : Monster.decideGate ⟨false, true, false, false, true, true, true, true, false, false⟩ = .na := by decide
theorem monster_0117 : Monster.decideGate ⟨false, true, false, false, true, true, true, true, false, true⟩ = .na := by decide
theorem monster_0118 : Monster.decideGate ⟨false, true, false, false, true, true, true, true, true, false⟩ = .na := by decide
theorem monster_0119 : Monster.decideGate ⟨false, true, false, false, true, true, true, true, true, true⟩ = .na := by decide
theorem monster_0120 : Monster.decideGate ⟨false, true, false, true, false, false, false, false, false, false⟩ = .na := by decide
theorem monster_0121 : Monster.decideGate ⟨false, true, false, true, false, false, false, false, false, true⟩ = .na := by decide
theorem monster_0122 : Monster.decideGate ⟨false, true, false, true, false, false, false, true, false, false⟩ = .na := by decide
theorem monster_0123 : Monster.decideGate ⟨false, true, false, true, false, false, false, true, false, true⟩ = .na := by decide
theorem monster_0124 : Monster.decideGate ⟨false, true, false, true, true, false, false, false, false, false⟩ = .na := by decide
theorem monster_0125 : Monster.decideGate ⟨false, true, false, true, true, false, false, false, false, true⟩ = .na := by decide
theorem monster_0126 : Monster.decideGate ⟨false, true, false, true, true, false, false, true, false, false⟩ = .na := by decide
theorem monster_0127 : Monster.decideGate ⟨false, true, false, true, true, false, false, true, false, true⟩ = .na := by decide
theorem monster_0128 : Monster.decideGate ⟨false, true, false, true, true, true, false, false, false, false⟩ = .na := by decide
theorem monster_0129 : Monster.decideGate ⟨false, true, false, true, true, true, false, false, false, true⟩ = .na := by decide
theorem monster_0130 : Monster.decideGate ⟨false, true, false, true, true, true, false, false, true, false⟩ = .na := by decide
theorem monster_0131 : Monster.decideGate ⟨false, true, false, true, true, true, false, false, true, true⟩ = .na := by decide
theorem monster_0132 : Monster.decideGate ⟨false, true, false, true, true, true, false, true, false, false⟩ = .na := by decide
theorem monster_0133 : Monster.decideGate ⟨false, true, false, true, true, true, false, true, false, true⟩ = .na := by decide
theorem monster_0134 : Monster.decideGate ⟨false, true, false, true, true, true, false, true, true, false⟩ = .na := by decide
theorem monster_0135 : Monster.decideGate ⟨false, true, false, true, true, true, false, true, true, true⟩ = .na := by decide
theorem monster_0136 : Monster.decideGate ⟨false, true, false, true, true, true, true, false, false, false⟩ = .na := by decide
theorem monster_0137 : Monster.decideGate ⟨false, true, false, true, true, true, true, false, false, true⟩ = .na := by decide
theorem monster_0138 : Monster.decideGate ⟨false, true, false, true, true, true, true, false, true, false⟩ = .na := by decide
theorem monster_0139 : Monster.decideGate ⟨false, true, false, true, true, true, true, false, true, true⟩ = .na := by decide
theorem monster_0140 : Monster.decideGate ⟨false, true, false, true, true, true, true, true, false, false⟩ = .na := by decide
theorem monster_0141 : Monster.decideGate ⟨false, true, false, true, true, true, true, true, false, true⟩ = .na := by decide
theorem monster_0142 : Monster.decideGate ⟨false, true, false, true, true, true, true, true, true, false⟩ = .na := by decide
theorem monster_0143 : Monster.decideGate ⟨false, true, false, true, true, true, true, true, true, true⟩ = .na := by decide
theorem monster_0144 : Monster.decideGate ⟨false, true, true, false, false, false, false, false, false, false⟩ = .na := by decide
theorem monster_0145 : Monster.decideGate ⟨false, true, true, false, false, false, false, false, false, true⟩ = .na := by decide
theorem monster_0146 : Monster.decideGate ⟨false, true, true, false, false, false, false, true, false, false⟩ = .na := by decide
theorem monster_0147 : Monster.decideGate ⟨false, true, true, false, false, false, false, true, false, true⟩ = .na := by decide
theorem monster_0148 : Monster.decideGate ⟨false, true, true, false, true, false, false, false, false, false⟩ = .na := by decide
theorem monster_0149 : Monster.decideGate ⟨false, true, true, false, true, false, false, false, false, true⟩ = .na := by decide
theorem monster_0150 : Monster.decideGate ⟨false, true, true, false, true, false, false, true, false, false⟩ = .na := by decide
theorem monster_0151 : Monster.decideGate ⟨false, true, true, false, true, false, false, true, false, true⟩ = .na := by decide
theorem monster_0152 : Monster.decideGate ⟨false, true, true, false, true, true, false, false, false, false⟩ = .na := by decide
theorem monster_0153 : Monster.decideGate ⟨false, true, true, false, true, true, false, false, false, true⟩ = .na := by decide
theorem monster_0154 : Monster.decideGate ⟨false, true, true, false, true, true, false, false, true, false⟩ = .na := by decide
theorem monster_0155 : Monster.decideGate ⟨false, true, true, false, true, true, false, false, true, true⟩ = .na := by decide
theorem monster_0156 : Monster.decideGate ⟨false, true, true, false, true, true, false, true, false, false⟩ = .na := by decide
theorem monster_0157 : Monster.decideGate ⟨false, true, true, false, true, true, false, true, false, true⟩ = .na := by decide
theorem monster_0158 : Monster.decideGate ⟨false, true, true, false, true, true, false, true, true, false⟩ = .na := by decide
theorem monster_0159 : Monster.decideGate ⟨false, true, true, false, true, true, false, true, true, true⟩ = .na := by decide
theorem monster_0160 : Monster.decideGate ⟨false, true, true, false, true, true, true, false, false, false⟩ = .na := by decide
theorem monster_0161 : Monster.decideGate ⟨false, true, true, false, true, true, true, false, false, true⟩ = .na := by decide
theorem monster_0162 : Monster.decideGate ⟨false, true, true, false, true, true, true, false, true, false⟩ = .na := by decide
theorem monster_0163 : Monster.decideGate ⟨false, true, true, false, true, true, true, false, true, true⟩ = .na := by decide
theorem monster_0164 : Monster.decideGate ⟨false, true, true, false, true, true, true, true, false, false⟩ = .na := by decide
theorem monster_0165 : Monster.decideGate ⟨false, true, true, false, true, true, true, true, false, true⟩ = .na := by decide
theorem monster_0166 : Monster.decideGate ⟨false, true, true, false, true, true, true, true, true, false⟩ = .na := by decide
theorem monster_0167 : Monster.decideGate ⟨false, true, true, false, true, true, true, true, true, true⟩ = .na := by decide
theorem monster_0168 : Monster.decideGate ⟨false, true, true, true, false, false, false, false, false, false⟩ = .na := by decide
theorem monster_0169 : Monster.decideGate ⟨false, true, true, true, false, false, false, false, false, true⟩ = .na := by decide
theorem monster_0170 : Monster.decideGate ⟨false, true, true, true, false, false, false, true, false, false⟩ = .na := by decide
theorem monster_0171 : Monster.decideGate ⟨false, true, true, true, false, false, false, true, false, true⟩ = .na := by decide
theorem monster_0172 : Monster.decideGate ⟨false, true, true, true, true, false, false, false, false, false⟩ = .na := by decide
theorem monster_0173 : Monster.decideGate ⟨false, true, true, true, true, false, false, false, false, true⟩ = .na := by decide
theorem monster_0174 : Monster.decideGate ⟨false, true, true, true, true, false, false, true, false, false⟩ = .na := by decide
theorem monster_0175 : Monster.decideGate ⟨false, true, true, true, true, false, false, true, false, true⟩ = .na := by decide
theorem monster_0176 : Monster.decideGate ⟨false, true, true, true, true, true, false, false, false, false⟩ = .na := by decide
theorem monster_0177 : Monster.decideGate ⟨false, true, true, true, true, true, false, false, false, true⟩ = .na := by decide
theorem monster_0178 : Monster.decideGate ⟨false, true, true, true, true, true, false, false, true, false⟩ = .na := by decide
theorem monster_0179 : Monster.decideGate ⟨false, true, true, true, true, true, false, false, true, true⟩ = .na := by decide
theorem monster_0180 : Monster.decideGate ⟨false, true, true, true, true, true, false, true, false, false⟩ = .na := by decide
theorem monster_0181 : Monster.decideGate ⟨false, true, true, true, true, true, false, true, false, true⟩ = .na := by decide
theorem monster_0182 : Monster.decideGate ⟨false, true, true, true, true, true, false, true, true, false⟩ = .na := by decide
theorem monster_0183 : Monster.decideGate ⟨false, true, true, true, true, true, false, true, true, true⟩ = .na := by decide
theorem monster_0184 : Monster.decideGate ⟨false, true, true, true, true, true, true, false, false, false⟩ = .na := by decide
theorem monster_0185 : Monster.decideGate ⟨false, true, true, true, true, true, true, false, false, true⟩ = .na := by decide
theorem monster_0186 : Monster.decideGate ⟨false, true, true, true, true, true, true, false, true, false⟩ = .na := by decide
theorem monster_0187 : Monster.decideGate ⟨false, true, true, true, true, true, true, false, true, true⟩ = .na := by decide
theorem monster_0188 : Monster.decideGate ⟨false, true, true, true, true, true, true, true, false, false⟩ = .na := by decide
theorem monster_0189 : Monster.decideGate ⟨false, true, true, true, true, true, true, true, false, true⟩ = .na := by decide
theorem monster_0190 : Monster.decideGate ⟨false, true, true, true, true, true, true, true, true, false⟩ = .na := by decide
theorem monster_0191 : Monster.decideGate ⟨false, true, true, true, true, true, true, true, true, true⟩ = .na := by decide
theorem monster_0192 : Monster.decideGate ⟨true, false, false, false, false, false, false, false, false, false⟩ = .na := by decide
theorem monster_0193 : Monster.decideGate ⟨true, false, false, false, false, false, false, false, false, true⟩ = .na := by decide
theorem monster_0194 : Monster.decideGate ⟨true, false, false, false, false, false, false, true, false, false⟩ = .na := by decide
theorem monster_0195 : Monster.decideGate ⟨true, false, false, false, false, false, false, true, false, true⟩ = .na := by decide
theorem monster_0196 : Monster.decideGate ⟨true, false, false, false, true, false, false, false, false, false⟩ = .na := by decide
theorem monster_0197 : Monster.decideGate ⟨true, false, false, false, true, false, false, false, false, true⟩ = .na := by decide
theorem monster_0198 : Monster.decideGate ⟨true, false, false, false, true, false, false, true, false, false⟩ = .na := by decide
theorem monster_0199 : Monster.decideGate ⟨true, false, false, false, true, false, false, true, false, true⟩ = .na := by decide
theorem monster_0200 : Monster.decideGate ⟨true, false, false, false, true, true, false, false, false, false⟩ = .na := by decide
theorem monster_0201 : Monster.decideGate ⟨true, false, false, false, true, true, false, false, false, true⟩ = .na := by decide
theorem monster_0202 : Monster.decideGate ⟨true, false, false, false, true, true, false, false, true, false⟩ = .na := by decide
theorem monster_0203 : Monster.decideGate ⟨true, false, false, false, true, true, false, false, true, true⟩ = .na := by decide
theorem monster_0204 : Monster.decideGate ⟨true, false, false, false, true, true, false, true, false, false⟩ = .na := by decide
theorem monster_0205 : Monster.decideGate ⟨true, false, false, false, true, true, false, true, false, true⟩ = .na := by decide
theorem monster_0206 : Monster.decideGate ⟨true, false, false, false, true, true, false, true, true, false⟩ = .na := by decide
theorem monster_0207 : Monster.decideGate ⟨true, false, false, false, true, true, false, true, true, true⟩ = .na := by decide
theorem monster_0208 : Monster.decideGate ⟨true, false, false, false, true, true, true, false, false, false⟩ = .na := by decide
theorem monster_0209 : Monster.decideGate ⟨true, false, false, false, true, true, true, false, false, true⟩ = .na := by decide
theorem monster_0210 : Monster.decideGate ⟨true, false, false, false, true, true, true, false, true, false⟩ = .na := by decide
theorem monster_0211 : Monster.decideGate ⟨true, false, false, false, true, true, true, false, true, true⟩ = .na := by decide
theorem monster_0212 : Monster.decideGate ⟨true, false, false, false, true, true, true, true, false, false⟩ = .na := by decide
theorem monster_0213 : Monster.decideGate ⟨true, false, false, false, true, true, true, true, false, true⟩ = .na := by decide
theorem monster_0214 : Monster.decideGate ⟨true, false, false, false, true, true, true, true, true, false⟩ = .na := by decide
theorem monster_0215 : Monster.decideGate ⟨true, false, false, false, true, true, true, true, true, true⟩ = .na := by decide
theorem monster_0216 : Monster.decideGate ⟨true, false, false, true, false, false, false, false, false, false⟩ = .na := by decide
theorem monster_0217 : Monster.decideGate ⟨true, false, false, true, false, false, false, false, false, true⟩ = .na := by decide
theorem monster_0218 : Monster.decideGate ⟨true, false, false, true, false, false, false, true, false, false⟩ = .na := by decide
theorem monster_0219 : Monster.decideGate ⟨true, false, false, true, false, false, false, true, false, true⟩ = .na := by decide
theorem monster_0220 : Monster.decideGate ⟨true, false, false, true, true, false, false, false, false, false⟩ = .na := by decide
theorem monster_0221 : Monster.decideGate ⟨true, false, false, true, true, false, false, false, false, true⟩ = .na := by decide
theorem monster_0222 : Monster.decideGate ⟨true, false, false, true, true, false, false, true, false, false⟩ = .na := by decide
theorem monster_0223 : Monster.decideGate ⟨true, false, false, true, true, false, false, true, false, true⟩ = .na := by decide
theorem monster_0224 : Monster.decideGate ⟨true, false, false, true, true, true, false, false, false, false⟩ = .na := by decide
theorem monster_0225 : Monster.decideGate ⟨true, false, false, true, true, true, false, false, false, true⟩ = .na := by decide
theorem monster_0226 : Monster.decideGate ⟨true, false, false, true, true, true, false, false, true, false⟩ = .na := by decide
theorem monster_0227 : Monster.decideGate ⟨true, false, false, true, true, true, false, false, true, true⟩ = .na := by decide
theorem monster_0228 : Monster.decideGate ⟨true, false, false, true, true, true, false, true, false, false⟩ = .na := by decide
theorem monster_0229 : Monster.decideGate ⟨true, false, false, true, true, true, false, true, false, true⟩ = .na := by decide
theorem monster_0230 : Monster.decideGate ⟨true, false, false, true, true, true, false, true, true, false⟩ = .na := by decide
theorem monster_0231 : Monster.decideGate ⟨true, false, false, true, true, true, false, true, true, true⟩ = .na := by decide
theorem monster_0232 : Monster.decideGate ⟨true, false, false, true, true, true, true, false, false, false⟩ = .na := by decide
theorem monster_0233 : Monster.decideGate ⟨true, false, false, true, true, true, true, false, false, true⟩ = .na := by decide
theorem monster_0234 : Monster.decideGate ⟨true, false, false, true, true, true, true, false, true, false⟩ = .na := by decide
theorem monster_0235 : Monster.decideGate ⟨true, false, false, true, true, true, true, false, true, true⟩ = .na := by decide
theorem monster_0236 : Monster.decideGate ⟨true, false, false, true, true, true, true, true, false, false⟩ = .na := by decide
theorem monster_0237 : Monster.decideGate ⟨true, false, false, true, true, true, true, true, false, true⟩ = .na := by decide
theorem monster_0238 : Monster.decideGate ⟨true, false, false, true, true, true, true, true, true, false⟩ = .na := by decide
theorem monster_0239 : Monster.decideGate ⟨true, false, false, true, true, true, true, true, true, true⟩ = .na := by decide
theorem monster_0240 : Monster.decideGate ⟨true, false, true, false, false, false, false, false, false, false⟩ = .na := by decide
theorem monster_0241 : Monster.decideGate ⟨true, false, true, false, false, false, false, false, false, true⟩ = .na := by decide
theorem monster_0242 : Monster.decideGate ⟨true, false, true, false, false, false, false, true, false, false⟩ = .na := by decide
theorem monster_0243 : Monster.decideGate ⟨true, false, true, false, false, false, false, true, false, true⟩ = .na := by decide
theorem monster_0244 : Monster.decideGate ⟨true, false, true, false, true, false, false, false, false, false⟩ = .na := by decide
theorem monster_0245 : Monster.decideGate ⟨true, false, true, false, true, false, false, false, false, true⟩ = .na := by decide
theorem monster_0246 : Monster.decideGate ⟨true, false, true, false, true, false, false, true, false, false⟩ = .na := by decide
theorem monster_0247 : Monster.decideGate ⟨true, false, true, false, true, false, false, true, false, true⟩ = .na := by decide
theorem monster_0248 : Monster.decideGate ⟨true, false, true, false, true, true, false, false, false, false⟩ = .na := by decide
theorem monster_0249 : Monster.decideGate ⟨true, false, true, false, true, true, false, false, false, true⟩ = .na := by decide
theorem monster_0250 : Monster.decideGate ⟨true, false, true, false, true, true, false, false, true, false⟩ = .na := by decide
theorem monster_0251 : Monster.decideGate ⟨true, false, true, false, true, true, false, false, true, true⟩ = .na := by decide
theorem monster_0252 : Monster.decideGate ⟨true, false, true, false, true, true, false, true, false, false⟩ = .na := by decide
theorem monster_0253 : Monster.decideGate ⟨true, false, true, false, true, true, false, true, false, true⟩ = .na := by decide
theorem monster_0254 : Monster.decideGate ⟨true, false, true, false, true, true, false, true, true, false⟩ = .na := by decide
theorem monster_0255 : Monster.decideGate ⟨true, false, true, false, true, true, false, true, true, true⟩ = .na := by decide
theorem monster_0256 : Monster.decideGate ⟨true, false, true, false, true, true, true, false, false, false⟩ = .na := by decide
theorem monster_0257 : Monster.decideGate ⟨true, false, true, false, true, true, true, false, false, true⟩ = .na := by decide
theorem monster_0258 : Monster.decideGate ⟨true, false, true, false, true, true, true, false, true, false⟩ = .na := by decide
theorem monster_0259 : Monster.decideGate ⟨true, false, true, false, true, true, true, false, true, true⟩ = .na := by decide
theorem monster_0260 : Monster.decideGate ⟨true, false, true, false, true, true, true, true, false, false⟩ = .na := by decide
theorem monster_0261 : Monster.decideGate ⟨true, false, true, false, true, true, true, true, false, true⟩ = .na := by decide
theorem monster_0262 : Monster.decideGate ⟨true, false, true, false, true, true, true, true, true, false⟩ = .na := by decide
theorem monster_0263 : Monster.decideGate ⟨true, false, true, false, true, true, true, true, true, true⟩ = .na := by decide
theorem monster_0264 : Monster.decideGate ⟨true, false, true, true, false, false, false, false, false, false⟩ = .na := by decide
theorem monster_0265 : Monster.decideGate ⟨true, false, true, true, false, false, false, false, false, true⟩ = .na := by decide
theorem monster_0266 : Monster.decideGate ⟨true, false, true, true, false, false, false, true, false, false⟩ = .na := by decide
theorem monster_0267 : Monster.decideGate ⟨true, false, true, true, false, false, false, true, false, true⟩ = .na := by decide
theorem monster_0268 : Monster.decideGate ⟨true, false, true, true, true, false, false, false, false, false⟩ = .na := by decide
theorem monster_0269 : Monster.decideGate ⟨true, false, true, true, true, false, false, false, false, true⟩ = .na := by decide
theorem monster_0270 : Monster.decideGate ⟨true, false, true, true, true, false, false, true, false, false⟩ = .na := by decide
theorem monster_0271 : Monster.decideGate ⟨true, false, true, true, true, false, false, true, false, true⟩ = .na := by decide
theorem monster_0272 : Monster.decideGate ⟨true, false, true, true, true, true, false, false, false, false⟩ = .na := by decide
theorem monster_0273 : Monster.decideGate ⟨true, false, true, true, true, true, false, false, false, true⟩ = .na := by decide
theorem monster_0274 : Monster.decideGate ⟨true, false, true, true, true, true, false, false, true, false⟩ = .na := by decide
theorem monster_0275 : Monster.decideGate ⟨true, false, true, true, true, true, false, false, true, true⟩ = .na := by decide
theorem monster_0276 : Monster.decideGate ⟨true, false, true, true, true, true, false, true, false, false⟩ = .na := by decide
theorem monster_0277 : Monster.decideGate ⟨true, false, true, true, true, true, false, true, false, true⟩ = .na := by decide
theorem monster_0278 : Monster.decideGate ⟨true, false, true, true, true, true, false, true, true, false⟩ = .na := by decide
theorem monster_0279 : Monster.decideGate ⟨true, false, true, true, true, true, false, true, true, true⟩ = .na := by decide
theorem monster_0280 : Monster.decideGate ⟨true, false, true, true, true, true, true, false, false, false⟩ = .na := by decide
theorem monster_0281 : Monster.decideGate ⟨true, false, true, true, true, true, true, false, false, true⟩ = .na := by decide
theorem monster_0282 : Monster.decideGate ⟨true, false, true, true, true, true, true, false, true, false⟩ = .na := by decide
theorem monster_0283 : Monster.decideGate ⟨true, false, true, true, true, true, true, false, true, true⟩ = .na := by decide
theorem monster_0284 : Monster.decideGate ⟨true, false, true, true, true, true, true, true, false, false⟩ = .na := by decide
theorem monster_0285 : Monster.decideGate ⟨true, false, true, true, true, true, true, true, false, true⟩ = .na := by decide
theorem monster_0286 : Monster.decideGate ⟨true, false, true, true, true, true, true, true, true, false⟩ = .na := by decide
theorem monster_0287 : Monster.decideGate ⟨true, false, true, true, true, true, true, true, true, true⟩ = .na := by decide
theorem monster_0288 : Monster.decideGate ⟨true, true, false, false, false, false, false, false, false, false⟩ = .na := by decide
theorem monster_0289 : Monster.decideGate ⟨true, true, false, false, false, false, false, false, false, true⟩ = .na := by decide
theorem monster_0290 : Monster.decideGate ⟨true, true, false, false, false, false, false, true, false, false⟩ = .na := by decide
theorem monster_0291 : Monster.decideGate ⟨true, true, false, false, false, false, false, true, false, true⟩ = .na := by decide
theorem monster_0292 : Monster.decideGate ⟨true, true, false, false, true, false, false, false, false, false⟩ = .na := by decide
theorem monster_0293 : Monster.decideGate ⟨true, true, false, false, true, false, false, false, false, true⟩ = .na := by decide
theorem monster_0294 : Monster.decideGate ⟨true, true, false, false, true, false, false, true, false, false⟩ = .na := by decide
theorem monster_0295 : Monster.decideGate ⟨true, true, false, false, true, false, false, true, false, true⟩ = .na := by decide
theorem monster_0296 : Monster.decideGate ⟨true, true, false, false, true, true, false, false, false, false⟩ = .na := by decide
theorem monster_0297 : Monster.decideGate ⟨true, true, false, false, true, true, false, false, false, true⟩ = .na := by decide
theorem monster_0298 : Monster.decideGate ⟨true, true, false, false, true, true, false, false, true, false⟩ = .na := by decide
theorem monster_0299 : Monster.decideGate ⟨true, true, false, false, true, true, false, false, true, true⟩ = .na := by decide
theorem monster_0300 : Monster.decideGate ⟨true, true, false, false, true, true, false, true, false, false⟩ = .na := by decide
theorem monster_0301 : Monster.decideGate ⟨true, true, false, false, true, true, false, true, false, true⟩ = .na := by decide
theorem monster_0302 : Monster.decideGate ⟨true, true, false, false, true, true, false, true, true, false⟩ = .na := by decide
theorem monster_0303 : Monster.decideGate ⟨true, true, false, false, true, true, false, true, true, true⟩ = .na := by decide
theorem monster_0304 : Monster.decideGate ⟨true, true, false, false, true, true, true, false, false, false⟩ = .na := by decide
theorem monster_0305 : Monster.decideGate ⟨true, true, false, false, true, true, true, false, false, true⟩ = .na := by decide
theorem monster_0306 : Monster.decideGate ⟨true, true, false, false, true, true, true, false, true, false⟩ = .na := by decide
theorem monster_0307 : Monster.decideGate ⟨true, true, false, false, true, true, true, false, true, true⟩ = .na := by decide
theorem monster_0308 : Monster.decideGate ⟨true, true, false, false, true, true, true, true, false, false⟩ = .na := by decide
theorem monster_0309 : Monster.decideGate ⟨true, true, false, false, true, true, true, true, false, true⟩ = .na := by decide
theorem monster_0310 : Monster.decideGate ⟨true, true, false, false, true, true, true, true, true, false⟩ = .na := by decide
theorem monster_0311 : Monster.decideGate ⟨true, true, false, false, true, true, true, true, true, true⟩ = .na := by decide
theorem monster_0312 : Monster.decideGate ⟨true, true, false, true, false, false, false, false, false, false⟩ = .na := by decide
theorem monster_0313 : Monster.decideGate ⟨true, true, false, true, false, false, false, false, false, true⟩ = .na := by decide
theorem monster_0314 : Monster.decideGate ⟨true, true, false, true, false, false, false, true, false, false⟩ = .na := by decide
theorem monster_0315 : Monster.decideGate ⟨true, true, false, true, false, false, false, true, false, true⟩ = .na := by decide
theorem monster_0316 : Monster.decideGate ⟨true, true, false, true, true, false, false, false, false, false⟩ = .na := by decide
theorem monster_0317 : Monster.decideGate ⟨true, true, false, true, true, false, false, false, false, true⟩ = .na := by decide
theorem monster_0318 : Monster.decideGate ⟨true, true, false, true, true, false, false, true, false, false⟩ = .na := by decide
theorem monster_0319 : Monster.decideGate ⟨true, true, false, true, true, false, false, true, false, true⟩ = .na := by decide
theorem monster_0320 : Monster.decideGate ⟨true, true, false, true, true, true, false, false, false, false⟩ = .na := by decide
theorem monster_0321 : Monster.decideGate ⟨true, true, false, true, true, true, false, false, false, true⟩ = .na := by decide
theorem monster_0322 : Monster.decideGate ⟨true, true, false, true, true, true, false, false, true, false⟩ = .na := by decide
theorem monster_0323 : Monster.decideGate ⟨true, true, false, true, true, true, false, false, true, true⟩ = .na := by decide
theorem monster_0324 : Monster.decideGate ⟨true, true, false, true, true, true, false, true, false, false⟩ = .na := by decide
theorem monster_0325 : Monster.decideGate ⟨true, true, false, true, true, true, false, true, false, true⟩ = .na := by decide
theorem monster_0326 : Monster.decideGate ⟨true, true, false, true, true, true, false, true, true, false⟩ = .na := by decide
theorem monster_0327 : Monster.decideGate ⟨true, true, false, true, true, true, false, true, true, true⟩ = .na := by decide
theorem monster_0328 : Monster.decideGate ⟨true, true, false, true, true, true, true, false, false, false⟩ = .na := by decide
theorem monster_0329 : Monster.decideGate ⟨true, true, false, true, true, true, true, false, false, true⟩ = .na := by decide
theorem monster_0330 : Monster.decideGate ⟨true, true, false, true, true, true, true, false, true, false⟩ = .na := by decide
theorem monster_0331 : Monster.decideGate ⟨true, true, false, true, true, true, true, false, true, true⟩ = .na := by decide
theorem monster_0332 : Monster.decideGate ⟨true, true, false, true, true, true, true, true, false, false⟩ = .na := by decide
theorem monster_0333 : Monster.decideGate ⟨true, true, false, true, true, true, true, true, false, true⟩ = .na := by decide
theorem monster_0334 : Monster.decideGate ⟨true, true, false, true, true, true, true, true, true, false⟩ = .na := by decide
theorem monster_0335 : Monster.decideGate ⟨true, true, false, true, true, true, true, true, true, true⟩ = .na := by decide
theorem monster_0336 : Monster.decideGate ⟨true, true, true, false, false, false, false, false, false, false⟩ = .na := by decide
theorem monster_0337 : Monster.decideGate ⟨true, true, true, false, false, false, false, false, false, true⟩ = .na := by decide
theorem monster_0338 : Monster.decideGate ⟨true, true, true, false, false, false, false, true, false, false⟩ = .na := by decide
theorem monster_0339 : Monster.decideGate ⟨true, true, true, false, false, false, false, true, false, true⟩ = .na := by decide
theorem monster_0340 : Monster.decideGate ⟨true, true, true, false, true, false, false, false, false, false⟩ = .na := by decide
theorem monster_0341 : Monster.decideGate ⟨true, true, true, false, true, false, false, false, false, true⟩ = .na := by decide
theorem monster_0342 : Monster.decideGate ⟨true, true, true, false, true, false, false, true, false, false⟩ = .na := by decide
theorem monster_0343 : Monster.decideGate ⟨true, true, true, false, true, false, false, true, false, true⟩ = .na := by decide
theorem monster_0344 : Monster.decideGate ⟨true, true, true, false, true, true, false, false, false, false⟩ = .na := by decide
theorem monster_0345 : Monster.decideGate ⟨true, true, true, false, true, true, false, false, false, true⟩ = .na := by decide
theorem monster_0346 : Monster.decideGate ⟨true, true, true, false, true, true, false, false, true, false⟩ = .na := by decide
theorem monster_0347 : Monster.decideGate ⟨true, true, true, false, true, true, false, false, true, true⟩ = .na := by decide
theorem monster_0348 : Monster.decideGate ⟨true, true, true, false, true, true, false, true, false, false⟩ = .na := by decide
theorem monster_0349 : Monster.decideGate ⟨true, true, true, false, true, true, false, true, false, true⟩ = .na := by decide
theorem monster_0350 : Monster.decideGate ⟨true, true, true, false, true, true, false, true, true, false⟩ = .na := by decide
theorem monster_0351 : Monster.decideGate ⟨true, true, true, false, true, true, false, true, true, true⟩ = .na := by decide
theorem monster_0352 : Monster.decideGate ⟨true, true, true, false, true, true, true, false, false, false⟩ = .na := by decide
theorem monster_0353 : Monster.decideGate ⟨true, true, true, false, true, true, true, false, false, true⟩ = .na := by decide
theorem monster_0354 : Monster.decideGate ⟨true, true, true, false, true, true, true, false, true, false⟩ = .na := by decide
theorem monster_0355 : Monster.decideGate ⟨true, true, true, false, true, true, true, false, true, true⟩ = .na := by decide
theorem monster_0356 : Monster.decideGate ⟨true, true, true, false, true, true, true, true, false, false⟩ = .na := by decide
theorem monster_0357 : Monster.decideGate ⟨true, true, true, false, true, true, true, true, false, true⟩ = .na := by decide
theorem monster_0358 : Monster.decideGate ⟨true, true, true, false, true, true, true, true, true, false⟩ = .na := by decide
theorem monster_0359 : Monster.decideGate ⟨true, true, true, false, true, true, true, true, true, true⟩ = .na := by decide
theorem monster_0360 : Monster.decideGate ⟨true, true, true, true, false, false, false, false, false, false⟩ = .na := by decide
theorem monster_0361 : Monster.decideGate ⟨true, true, true, true, false, false, false, false, false, true⟩ = .na := by decide
theorem monster_0362 : Monster.decideGate ⟨true, true, true, true, false, false, false, true, false, false⟩ = .na := by decide
theorem monster_0363 : Monster.decideGate ⟨true, true, true, true, false, false, false, true, false, true⟩ = .na := by decide
theorem monster_0364 : Monster.decideGate ⟨true, true, true, true, true, false, false, false, false, false⟩ = .na := by decide
theorem monster_0365 : Monster.decideGate ⟨true, true, true, true, true, false, false, false, false, true⟩ = .na := by decide
theorem monster_0366 : Monster.decideGate ⟨true, true, true, true, true, false, false, true, false, false⟩ = .na := by decide
theorem monster_0367 : Monster.decideGate ⟨true, true, true, true, true, false, false, true, false, true⟩ = .na := by decide
theorem monster_0368 : Monster.decideGate ⟨true, true, true, true, true, true, false, false, false, false⟩ = .pass := by decide
theorem monster_0369 : Monster.decideGate ⟨true, true, true, true, true, true, false, false, false, true⟩ = .na := by decide
theorem monster_0370 : Monster.decideGate ⟨true, true, true, true, true, true, false, false, true, false⟩ = .na := by decide
theorem monster_0371 : Monster.decideGate ⟨true, true, true, true, true, true, false, false, true, true⟩ = .na := by decide
theorem monster_0372 : Monster.decideGate ⟨true, true, true, true, true, true, false, true, false, false⟩ = .fail := by decide
theorem monster_0373 : Monster.decideGate ⟨true, true, true, true, true, true, false, true, false, true⟩ = .fail := by decide
theorem monster_0374 : Monster.decideGate ⟨true, true, true, true, true, true, false, true, true, false⟩ = .fail := by decide
theorem monster_0375 : Monster.decideGate ⟨true, true, true, true, true, true, false, true, true, true⟩ = .fail := by decide
theorem monster_0376 : Monster.decideGate ⟨true, true, true, true, true, true, true, false, false, false⟩ = .fail := by decide
theorem monster_0377 : Monster.decideGate ⟨true, true, true, true, true, true, true, false, false, true⟩ = .fail := by decide
theorem monster_0378 : Monster.decideGate ⟨true, true, true, true, true, true, true, false, true, false⟩ = .fail := by decide
theorem monster_0379 : Monster.decideGate ⟨true, true, true, true, true, true, true, false, true, true⟩ = .fail := by decide
theorem monster_0380 : Monster.decideGate ⟨true, true, true, true, true, true, true, true, false, false⟩ = .fail := by decide
theorem monster_0381 : Monster.decideGate ⟨true, true, true, true, true, true, true, true, false, true⟩ = .fail := by decide
theorem monster_0382 : Monster.decideGate ⟨true, true, true, true, true, true, true, true, true, false⟩ = .fail := by decide
theorem monster_0383 : Monster.decideGate ⟨true, true, true, true, true, true, true, true, true, true⟩ = .fail := by decide
theorem woodpecker_0000 : Woodpecker.classify true true false = .redundant := by decide
theorem woodpecker_0001 : Woodpecker.classify true false true = .necessary := by decide
theorem woodpecker_0002 : Woodpecker.classify true false false = .contributory := by decide
theorem nightingale_0000 : Nightingale.stop false false false false = .continueGrowing := by decide
theorem nightingale_0001 : Nightingale.stop false false false true = .maxDepth := by decide
theorem nightingale_0002 : Nightingale.stop false false true false = .instability := by decide
theorem nightingale_0003 : Nightingale.stop false false true true = .instability := by decide
theorem nightingale_0004 : Nightingale.stop false true false false = .belowTolerance := by decide
theorem nightingale_0005 : Nightingale.stop false true false true = .belowTolerance := by decide
theorem nightingale_0006 : Nightingale.stop false true true false = .belowTolerance := by decide
theorem nightingale_0007 : Nightingale.stop false true true true = .belowTolerance := by decide
theorem nightingale_0008 : Nightingale.stop true false false false = .insufficientSupport := by decide
theorem nightingale_0009 : Nightingale.stop true false false true = .insufficientSupport := by decide
theorem nightingale_0010 : Nightingale.stop true false true false = .insufficientSupport := by decide
theorem nightingale_0011 : Nightingale.stop true false true true = .insufficientSupport := by decide
theorem nightingale_0012 : Nightingale.stop true true false false = .insufficientSupport := by decide
theorem nightingale_0013 : Nightingale.stop true true false true = .insufficientSupport := by decide
theorem nightingale_0014 : Nightingale.stop true true true false = .insufficientSupport := by decide
theorem nightingale_0015 : Nightingale.stop true true true true = .insufficientSupport := by decide

end Zoo.ExtensionFixtures
