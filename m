Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793736371;
	b=5kXsE0FMSuwrRYiPmOUqOcdG2RVwzTb9G1t7YsN86E0h0eC4QE1i52LoqSGdrw9yhbsZ
	 lD4//Ohlp6ibPwkpi43Q68sQCct08RM5bhYlbDHIjrNDB/+QGCDS5zHLiQG5Z4cJoXB4x
	 LYr5OPsqX6+8IPEKGDoIo6coG92X5WB8A29GqPR5D9uxuV/BEKnLBI3pPzGR+p+3KJRc6
	 ESzZKMqvZ5oGPrM2LoyyctSZbAaypqgPpQDemxiqnFR8YewlbhthJ6CzEKk/B/qyxY7nV
	 ACJbFnPJ3cDUc4VSi6WkuArx85Dla5JyH+af16IpIi1buuP2fJ1EHyRvu+W5SF6yJ0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793736371;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+i3zCYKlwVyXIoRDbAyxopCOyrLllPYMgSlhQAZy5Ic=;
	b=Drk/87qms8KdK98vvS+IpBbqSPQAELuBReCO74i0VYpN+/4PVwdHjn/Nvp+m50ZqHLzs
	 I47LqDauo8K1ipNjysNx8Da/BZAp8m11HBi5zt1MmNOUIrdxs4caYik6j1tQUxSf8WEvQ
	 uAh+AEJkxOhuIJI7AGuk5Kh/zyxdFJEuyzveJYEHLHiTXhje12RRbE5mbhCNffIJG4H05
	 nPOHQhD4bvQucNnayM9ZIBohAF5RbREhqWKpDnOJfHavtQnYxiiFU6D3g3TWuH546b0np
	 5qhmB6gzunF4GbWw515WzY2HuTUGPyZHCBJmvZ6xF6gppHo6+VUM9eErrYv9bkXk84g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U5atOivh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kZMkR+lQ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA269606D81D
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 20:06:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA269606D81D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U5atOivh;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kZMkR+lQ
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3Ip3oY121822
	for <linux-media@vger.kernel.org>; Tue, 3 Nov 2026 20:06:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+i3zCYKlwVyXIoRDbAyxopCOyrLllPYMgSlhQAZy5Ic=; b=U5atOivhH0SCsF8p
	09cGvJAJjRrz0knPc5pgRbX0oaj/2bBHnowv8XNLNs8FDWWPX0Dff8M7pVzNl6Ks
	E7qKXloiU0AqyE1iVemen0q0/a+T+Z3nuVaBUEPj4zccq9sfq4LLyK7fcEDpiqi7
	nyO7e0FEhlUj9vg6sb8Jxt9EK/8AwLUn/SO9x2BS9s6AAEl7S37jj9nWIsjGrjbV
	juJMHQBm0DHWoQcVAEGCoLNpHx589Zo0CrxfJBbpROCMI/yIXIXV5T4+p/WAsP6O
	B69Mp3vOen+qeV9BG/2LtadSHz7WY5hXUVyF7APL4yhVZOtXuMw3tvsmwEJuoJU4
	HYsn9w==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8mr945-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 20:06:09 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-99089f9591aso810108241.0
        for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 12:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793736369; x=1794341169; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+i3zCYKlwVyXIoRDbAyxopCOyrLllPYMgSlhQAZy5Ic=;
        b=kZMkR+lQgpZmCRRf8GSJ3eoWIgypwrpsxBRrFbn/iuLt9RHUDQjU92YhMnqvVZfIkP
         IJ7rAUBly3G3hh0gEWch6Mv0GZ4yw9Ei4iRRq0oibUDQdq0qEhA6bR/aaYVRxrIUPFzA
         j3FnWT5SzwCWMBrtZaAGMBNU4jOX7lXlgGA1SGJhT+w7OWR1W0O63lE6A2/iW1V7FJrc
         /lKNfcooyjJEXWDiAo/KlDoqc2gBtWpm0WcYUDrpfsXJILaFoZTOpZhbIRQyPxmq97Qa
         BUy6R98cQ6Bx85I5NdDt9oRsdkVtd3LhAPsZiJp+B7M9OkpvVjrk2shsOybAaiR6DztU
         061w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793736369; x=1794341169;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+i3zCYKlwVyXIoRDbAyxopCOyrLllPYMgSlhQAZy5Ic=;
        b=y4GyQfWkjT9sfp+mWDZrGrOye82F7vYetwkhkGZAPR9ZQGOd65XAo9uj+hCpG9PgtS
         USBAbHk9yO3cDjFXzar//RB3k9qhZZvb0CCmxKJqPNV/Y2+bk9Z8B5xULJj2CNsfJr0F
         aM+QX2B2Q+4pFphyIoANhxW950KUyZZvega7XYlYM0Y3n7s8yoZuxW4yYDsleJxRU5/7
         crOFySnGf4U9CaWzvx1KqCKMvAjgZn32Bvm7vXFfejre1M53hxvh2UxTsswJQeSqU4Hq
         hu5qEJD53s2DQZ2yz0UFklsZiO/1zdM1v6/ZJRxDjq0P2GMuJxAPRmIFBlvVyGzHC+NX
         wO0g==
X-Gm-Message-State: APuU4Z+RrFd+xUwDLeLPa7+jo3c8uYOTo3iAqp120QdjoIFEHRnI/WiV
	H2tp2cTm8cvQ9ib9CDHJxTM19giwjp801EjF87/t7b7JbBiKec9r/8qxIps1It84EoBtMa13lM8
	ncweAxbfFINadP0G+lrefDY9BM7Vu8bb/d4Tv+jGpKRNuB+/Qm678Lz/WefyLANwqqw==
X-Gm-Gg: AYBFou2CprMst6EABuA4LZaU9xufjJLFpnhXfm3QghB5yxJ6F3kfCUMUm8rXrtEr6d7
	JbmTNldFVzEJ9OCAkpBS5fgLoiar8aKUc5k+9gFI573KyrdF8H5oieNLUti4cOYmA0DO46450Y+
	UvxDL4t+JA2vq98CiHxHAIcEnYZQjWM8CsNt67yxBj08frTc4E2m2oi3rXrWz9I1xoklFeLjiWk
	1eB7e8DIW311JR9kJ9l5hpB9YoSGx7bicKsq5VN+mMGf6kIHl9ZxbmjvLeO0GTfiQzwKu+MdcJL
	M3k/bHC6g90ZaIMvgg3YI+cOFhJbYVajOLdM9EditNtK18uPG3EoNvTHfp0AilWc4vPrSttShQ2
	TfJg+QcGt4FCfFclsAkQEZa4TZuA2Bgf92XMoGTopqaS8Kz/zToaB1+aTVnd037T520nF6ghqMb
	RB8oDKgwZs1Vn9g+KqKc4mnsVidm6RBvpl1CNJOo/qz5W1kBibjzV3f61jhB2CcnxXxBzlkTPpC
	QMCufa6rtCL+mD2ldlcYGswl8jm
X-Received: by 2002:a05:6102:3eca:b0:7d0:5688:f4f3 with SMTP id ada2fe7eead31-7d072775d68mr4767617137.1.1793736369081;
        Tue, 03 Nov 2026 12:06:09 -0800 (PST)
X-Received: by 2002:a05:6102:3eca:b0:7d0:5688:f4f3 with SMTP id ada2fe7eead31-7d072775d68mr4767598137.1.1793736368516;
        Tue, 03 Nov 2026 12:06:08 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f048:3e89:c517:10cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fcd03d01dsm358875f8f.44.2026.11.03.12.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:06:07 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 21:05:52 +0100
Subject: [PATCH v13 8/9] arm64: dts: qcom: shikra: Add OPE node
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-camss-isp-ope-v13-8-c2cbf15a39b1@oss.qualcomm.com>
References: <20261103-camss-isp-ope-v13-0-c2cbf15a39b1@oss.qualcomm.com>
In-Reply-To: <20261103-camss-isp-ope-v13-0-c2cbf15a39b1@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: GwalsRG81o9m1yeUx-P08P4yzCcpg7oM
X-Proofpoint-ORIG-GUID: GwalsRG81o9m1yeUx-P08P4yzCcpg7oM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA4MCBTYWx0ZWRfX6EeJZ5mDA87q
 zuwH+2a+SCNRapflzHH7kLmUi4LNwCklBeUOtpH23lMG/yrTkhbdFYjjQKUccB1P0OgEoud0dgG
 MweeFlE9DuyZIOLFR7/DSb6/E+qJ8PFge2COQM6N3bdIC6GCpsedVAXQuSm6DuetIEGE4D5npwT
 RP4dVCrnYnD+kx1E6OSEetLCUdQXIz2X6pmUZkJOrJTwkXM9KV3AkTq8wkowdsVCRpMCLEAUT5K
 3oRBGbox6HihKX56DBV9bdxsLSMjxMjKjn9XuMANMmoTrxNk0WtJx9VWKvx3F5vnV/rQzXXFm2l
 7JM3dzeY47rik9YQ8xwVquZtzFGe1ZmbptRjCmvGd9aQcC6AHyXnV/41ypCkT9V0/ZvMJD9qeLZ
 kjhxcks0raFlV+KIsCS1rEHW/i62K8tCCmwf3XwrHjsdr4WCZFnIVEBOXgPKD1RMb9FQ/4rfiBr
 hWRjiyZW3Eha5IoW58g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA4MCBTYWx0ZWRfX355tyttT+Okv
 b6UQcO52cRCowAtGx3hPcSW+20m/R33GkINpRMfA9P+NF1TopLV4QRR638Sejoli1utDDvxicIW
 VNqmZ7z6Ecfq68mTntXXcYeBD4Jv92M=
X-Authority-Analysis: v=2.4 cv=HbWB3SE8 c=1 sm=1 tr=0 ts=6aea3eb1 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=EzCDy3pf2FPqfMyO2-oA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030080

From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Add the Offline Processing Engine (OPE) device tree node for Shikra.
The node describes the six register regions (cdm, top, qos, pipeline,
bus_read, bus_write), clocks, interrupt, interconnects, IOMMU mappings,
and OPP table.

OPE is a memory-to-memory block with no board-level dependencies, so
the node is left enabled for all Shikra boards.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Tested-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com> #Shikra CQM
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 77 ++++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 2623e139196f6398c57b616879a37f84b83d59ac..b95ad1e61b9b4ecd29a1b7b7fb0c2c52ce31a967 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -2357,6 +2357,83 @@ cci_i2c1: i2c-bus@1 {
 			};
 		};
 
+		isp_ope: isp@5c42000 {
+			compatible = "qcom,shikra-camss-ope", "qcom,qcm2290-camss-ope";
+
+			reg = <0x0 0x5c42000 0x0 0x400>,
+			      <0x0 0x5c42400 0x0 0x200>,
+			      <0x0 0x5c42600 0x0 0x200>,
+			      <0x0 0x5c42800 0x0 0x4400>,
+			      <0x0 0x5c46c00 0x0 0x190>,
+			      <0x0 0x5c46d90 0x0 0xa00>;
+			reg-names = "cdm",
+				    "top",
+				    "qos",
+				    "pipeline",
+				    "bus_read",
+				    "bus_write";
+
+			clocks = <&gcc GCC_CAMSS_AXI_CLK>,
+				 <&gcc GCC_CAMSS_OPE_CLK>,
+				 <&gcc GCC_CAMSS_OPE_AHB_CLK>,
+				 <&gcc GCC_CAMSS_NRT_AXI_CLK>,
+				 <&gcc GCC_CAMSS_TOP_AHB_CLK>;
+			clock-names = "axi",
+				      "core",
+				      "iface",
+				      "nrt",
+				      "top";
+
+			interrupts = <GIC_SPI 209 IRQ_TYPE_EDGE_RISING 0>;
+
+			interconnects = <&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					 &config_noc SLAVE_CAMERA_CFG RPM_ACTIVE_TAG>,
+					<&mmnrt_virt MASTER_CAMNOC_SF RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>;
+			interconnect-names = "config",
+					     "data";
+
+			iommus = <&apps_smmu 0x600 0x0>,
+				 <&apps_smmu 0x620 0x0>,
+				 <&apps_smmu 0x640 0x0>;
+
+			operating-points-v2 = <&ope_opp_table>;
+			power-domains = <&gcc GCC_CAMSS_TOP_GDSC>,
+					<&rpmpd RPMPD_VDDCX>;
+			power-domain-names = "camss",
+					     "cx";
+
+			ope_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-19200000 {
+					opp-hz = /bits/ 64 <19200000>;
+					required-opps = <&rpmpd_opp_min_svs>;
+				};
+
+				opp-200000000 {
+					opp-hz = /bits/ 64 <200000000>;
+					required-opps = <&rpmpd_opp_svs>;
+				};
+
+				opp-266600000 {
+					opp-hz = /bits/ 64 <266600000>;
+					required-opps = <&rpmpd_opp_svs_plus>;
+				};
+
+				opp-465000000 {
+					opp-hz = /bits/ 64 <465000000>;
+					required-opps = <&rpmpd_opp_nom>;
+				};
+
+				opp-580000000 {
+					opp-hz = /bits/ 64 <580000000>;
+					required-opps = <&rpmpd_opp_turbo>;
+					turbo-mode;
+				};
+			};
+		};
+
 		remoteproc_mpss: remoteproc@6080000 {
 			compatible = "qcom,shikra-mpss-pas";
 			reg = <0x0 0x06080000 0x0 0x100>;

-- 
2.34.1

