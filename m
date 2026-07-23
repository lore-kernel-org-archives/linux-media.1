Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1F038D3F2
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 04:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784781877; cv=none; b=OPqUfj8yFSEHpvIb6Dhe6TbUzsc1txY0n2HYFEqAucgRIepattGCRNZYAZ1QIKuSUOgB5vgkt6zSRX4SqucAjy2zlrZmRj4lPEibr16Rq3AEu5DXGEk6fpBLkOKGcrdf8Sex03NPsO83s/dG6LvsFM/DhzShHEPtO6FkiIN22Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784781877; c=relaxed/simple;
	bh=D1n9L9gbfR65jz3NtcMFzb7EnvhrcmL8xb/Rqg2Wqmg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rT2aVsVTfiw7KVnXNRNbZJ4gXp+KnKUKzXjnbkyB4/Dw/ckdUHciyoxYYmAP+tg63A7xfwmt2Szzcx+Q3Q/mNU2fdKlQfk3uQEY1ynLI3PW/apkd0+Bh6kS44fz3cF6UIXElLpQsWjm6cME7TUTSLLBy6VpVGsLsKTv5/vt0DxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cXjpJjPC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wol9Evfb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cXjpJjPC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wol9Evfb"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N0X5rZ2261416
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 04:44:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uk6eXswhPXk7ia8EY0gX+lBahH+0TgY0YHRYlIfn1pg=; b=cXjpJjPCy3bZRHCu
	+E34WGMNeKHlwVCJPOBCMyZToQivrgl3OUv6DH0rAcMK+UqsO1RuAmPZF+2o/0DQ
	ysTi1JMYsvMRfWSKULM2Dw9n9bdgtIi+uojYNQlhyaNY3Nm74CZk0zIdgbeOyPIi
	s10NfznSJ+yyvRSth5oV0ON3fMiqqSJucMLLrZjQlKzWJrdOopaYCdzgcoAhKara
	IwtoMqQEz4v/Ykn25pyjmcjAbVmN3MWj7Yk72tCm+ZAeA3SlEN+El3LR4w4a6dlN
	VsvqtzTcRbYMnUdFovcyNdYDLCED6PWl1qHSvz9D+LGiJpKp6UJFVKobUgvSmUQX
	r3YsYA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk275jajy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 04:44:23 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-848860def2cso301962b3a.2
        for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 21:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784781863; x=1785386663; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uk6eXswhPXk7ia8EY0gX+lBahH+0TgY0YHRYlIfn1pg=;
        b=Wol9Evfb9JKiHECkC9YfjRtsIoTS6zkuXuNXzXfijHe835Kn9nYgG5mbD5o0vKIASo
         TKx9UfR/QusRm7sqOzmbIveEUgPKuFEwYr/xOrg2/o7LYj8N5KVpIbNmlWA5Ju7xHOZq
         Yx9gJL6n3Wj6i9spK9ho1Vxsty1FjVwARZC4kwXyVbaxz5/jP538RZqSO0nn80tNtVyG
         LE8jlz8mXjZRfaqgFRC5yqli9oU3yAx+A7334weAEtr5j14HTT7i+3p0VTiy7Z5KK5K1
         1XwzeIJ0563hBMKQQmiiCXay6UreoxitFORg3vTxD498F12vyBlqA3J/0gDcABY2Fh1G
         fHiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784781863; x=1785386663;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uk6eXswhPXk7ia8EY0gX+lBahH+0TgY0YHRYlIfn1pg=;
        b=XdPlD14cQ8VxHstu+Tp51qlW/71XL4/acU90OMxtHHGm5QDyOjpY/5AZptswj6UKgg
         RQZ6dGd0dOnWpZTuPynWj/V0G71M+yLcfediuvAoA24WCwL1ULpGAFCwCBe9oxqKFCVr
         7IV7IeOciTZOM7or+UB2IShzVdLSTcGLvubx/CK72MaeRWtQUP1t5/BiP6yUdz4k+OTt
         JNTnyKnDZTV9Oam9NaCKbchIVr0rjIlQOKdHgbgU1PNIVu1DZjnBOY8Wf3nCQ0EMuERc
         8JnaiAG8UAbrrrsxGi4xS5o3VxzRiZm/cmdZlqp3Pb6aue/jKYG2ZNC/cdVxyFgnyrXm
         4+Iw==
X-Forwarded-Encrypted: i=1; AHgh+Rp7K1OXJad6PsCLDW/KBjMHTT+LzB5XnRGFKvpDVCV51NPugan+KkysLK7qeYJVOBDsFrs/4ROGEQ4+Xw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yys9vgaiLepTAhj5tzOcRJNyHVGHj+XNO54uByy7hlmVBPPgLEe
	8I82ieuOlQaEHRuL2miFuYu797JyRJPTNTByx1m74Zh3sWY4SbmWKk/kWsJHtNWd0Nj4RCJMvRh
	UHxbVhk8AI3Mjb2oaSz09gnLJ+IJEZHRi8iG/6IxReVJJycHH94E687Ln6DDKjzvlWQ==
X-Gm-Gg: AR+sD13lVuhp+myLmHNKGSg4GOwEW7KzxWeNA9l0LFx3WM540hwle9y7OmmBhhIUH28
	GB3sDPR0ltnDxFsfv/OsNv19cIucbdvEHNrSxjpaPY7byFSGdA0eegix5f5YlwMGhHkMJONDk7T
	wQKPuu5DNBnjvJ17301XmACxl7Ats67iP1aR9Nx4+20GlaAzs2rJkp7jU+Avy38AF964ksh/TSW
	Im3iEgV1tRPtr6eC4YIlI6x8EyoiAQv7lJFw0ZMZ0e2RMHJovnKwqE9xJ02X1CLhHaCJn6A6wnU
	XOYy1D/J5VrBwlrk2z+D9d9hGuGLnBSPLO9SaQr3eHzUS22TjekHmM/FGGnH08K4tgIEWf8ukoB
	f24ztQpZCMwI2jOt0Co5F/+sEnvFpkeE=
X-Received: by 2002:a05:6a00:12da:b0:845:c373:6525 with SMTP id d2e1a72fcca58-84e2bb2395bmr1829627b3a.41.1784781862906;
        Wed, 22 Jul 2026 21:44:22 -0700 (PDT)
X-Received: by 2002:a05:6a00:12da:b0:845:c373:6525 with SMTP id d2e1a72fcca58-84e2bb2395bmr1829598b3a.41.1784781862451;
        Wed, 22 Jul 2026 21:44:22 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e175aad1asm2327922b3a.44.2026.07.22.21.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 21:44:22 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 10:13:56 +0530
Subject: [PATCH v6 2/6] arm64: dts: qcom: shikra: Add CAMSS node
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-shikra-camss-review-v6-2-7c46f9bbb4db@oss.qualcomm.com>
References: <20260723-shikra-camss-review-v6-0-7c46f9bbb4db@oss.qualcomm.com>
In-Reply-To: <20260723-shikra-camss-review-v6-0-7c46f9bbb4db@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784781838; l=3966;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=D1n9L9gbfR65jz3NtcMFzb7EnvhrcmL8xb/Rqg2Wqmg=;
 b=RZ7JSUKc7CI0/q2DojVdaY6OREJsajlJM6e50P2PWCDfwtHrKjy8d68R9zUTseBdvKaFzhRzg
 d6wJ7Dh4dC3ARTTqYjhbqW26nHhoZ5av56mpbi9hMmjgt89I6XpN5F9
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Authority-Analysis: v=2.4 cv=Q53iJY2a c=1 sm=1 tr=0 ts=6a619c27 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=ahKksh3eZu5pIVwncigA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA0NSBTYWx0ZWRfX1dkU7iARrStU
 +eZYWcir9NNpUgwaUPCyaFR9gEJJ6TSngRpEZsSw60aLNqaRkdy2LFBgmfvnt33qkiIa4CfiiUK
 VQ+8cReGiujiOAR37bE22+8ZIa71RaY=
X-Proofpoint-GUID: AlwAqZ45-V-CByG87DT-ln7M9UVkwbgF
X-Proofpoint-ORIG-GUID: AlwAqZ45-V-CByG87DT-ln7M9UVkwbgF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA0NSBTYWx0ZWRfX7SolUpvBBTv4
 IBs/4BsHmF13IaKPwtmgCGNTnqdDiq8Cbw44SPAzm5MMQvDoVMCvfkE8pc1MAeXj3WobtU1tt2E
 Wcktgd9aaznQ0orX6N059GHZLVsxcM0ru5DJ2rH9xkMkt6xfjYPE1lgXBZkf6G7LldGZNtB6Mw5
 iLptesbwu0WG3mTr2kqgSc54F8Crr6l4ok1NcgcEdzP94tuGPE9WjlD0LPbi+1dyL/LXCsmiAOa
 s7GdktK4dxb25psQyAIV6VqYfDRJRKwWvZbUwY6dnXzy1qwOmytKeufTvrNUJxFMbWUTAUGi3+i
 3IlPDcZG9oST8Ip380cxtML5cgtJN0qmquR8MITejUdjl+yVQXV3gaYbMe9IulGjNlPTDMlzZhS
 OqRjqN/NfvxFoUGW21hxTfUDPKhLQHMq8deTAx/KY50Us5ICLRif3SD3fnAcOOtDs0cYoZXRG/n
 lHioVJC9wDztn7OOM7A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230045

Add the Camera Subsystem node. Shikra shares the same IP as QCM2290
with two CSIPHYs, two CSIDs and two VFEs, but does not include CDM
and OPE blocks, so only a single IOMMU context bank is needed.

Co-developed-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 100 +++++++++++++++++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 4e5bc9e17c8ed8914733ac9fdc9b69128b40216e..f7caee4cffdf72b7e98f5dd33a33419087cb8b57 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -640,6 +640,106 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
 			};
 		};
 
+		camss: camss@5c11000 {
+			compatible = "qcom,shikra-camss", "qcom,qcm2290-camss";
+
+			reg = <0x0 0x05c11000 0x0 0x1000>,
+			      <0x0 0x05c6e000 0x0 0x1000>,
+			      <0x0 0x05c75000 0x0 0x1000>,
+			      <0x0 0x05c52000 0x0 0x1000>,
+			      <0x0 0x05c53000 0x0 0x1000>,
+			      <0x0 0x05c66000 0x0 0x400>,
+			      <0x0 0x05c68000 0x0 0x400>,
+			      <0x0 0x05c6f000 0x0 0x4000>,
+			      <0x0 0x05c76000 0x0 0x4000>;
+			reg-names = "top",
+				    "csid0",
+				    "csid1",
+				    "csiphy0",
+				    "csiphy1",
+				    "csitpg0",
+				    "csitpg1",
+				    "vfe0",
+				    "vfe1";
+
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&gcc GCC_CAMSS_AXI_CLK>,
+				 <&gcc GCC_CAMSS_NRT_AXI_CLK>,
+				 <&gcc GCC_CAMSS_RT_AXI_CLK>,
+				 <&gcc GCC_CAMSS_TFE_0_CSID_CLK>,
+				 <&gcc GCC_CAMSS_TFE_1_CSID_CLK>,
+				 <&gcc GCC_CAMSS_CPHY_0_CLK>,
+				 <&gcc GCC_CAMSS_CSI0PHYTIMER_CLK>,
+				 <&gcc GCC_CAMSS_CPHY_1_CLK>,
+				 <&gcc GCC_CAMSS_CSI1PHYTIMER_CLK>,
+				 <&gcc GCC_CAMSS_TOP_AHB_CLK>,
+				 <&gcc GCC_CAMSS_TFE_0_CLK>,
+				 <&gcc GCC_CAMSS_TFE_0_CPHY_RX_CLK>,
+				 <&gcc GCC_CAMSS_TFE_1_CLK>,
+				 <&gcc GCC_CAMSS_TFE_1_CPHY_RX_CLK>;
+			clock-names = "ahb",
+				      "axi",
+				      "camnoc_nrt_axi",
+				      "camnoc_rt_axi",
+				      "csi0",
+				      "csi1",
+				      "csiphy0",
+				      "csiphy0_timer",
+				      "csiphy1",
+				      "csiphy1_timer",
+				      "top_ahb",
+				      "vfe0",
+				      "vfe0_cphy_rx",
+				      "vfe1",
+				      "vfe1_cphy_rx";
+
+			interrupts = <GIC_SPI 210 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 212 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 72 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 73 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 309 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 310 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 211 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 213 IRQ_TYPE_EDGE_RISING 0>;
+			interrupt-names = "csid0",
+					  "csid1",
+					  "csiphy0",
+					  "csiphy1",
+					  "csitpg0",
+					  "csitpg1",
+					  "vfe0",
+					  "vfe1";
+
+			interconnects = <&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					 &config_noc SLAVE_CAMERA_CFG RPM_ACTIVE_TAG>,
+					<&mmrt_virt MASTER_CAMNOC_HF RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
+					<&mmnrt_virt MASTER_CAMNOC_SF RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>;
+			interconnect-names = "ahb",
+					     "hf_mnoc",
+					     "sf_mnoc";
+
+			iommus = <&apps_smmu 0x400 0x0>;
+
+			power-domains = <&gcc GCC_CAMSS_TOP_GDSC>;
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
 		sram@c11e000 {
 			compatible = "qcom,shikra-imem", "mmio-sram";
 			reg = <0x0 0x0c11e000 0x0 0x1000>;

-- 
2.34.1

