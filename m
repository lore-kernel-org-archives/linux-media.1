Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC69952BE5E
	for <linux-media@vger.kernel.org>; Thu,  1 Oct 2026 15:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790867895; cv=none; b=ldL0bLFCI5YCeFoK65owfL0UsbxGdoIBp3TDKTI6TFx28z4EUBmCS5Aur7PjHWkMWgQihWhitEfADXpgfoY3mDekRKyCrEF/RYMergDobWHpG+1r38w1ftlKIHTwhqLz2dIh00tmXkizqdlTAvv5Z97+0OcB+Wtwz7xpKjTKaSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790867895; c=relaxed/simple;
	bh=hHugJm3SVpPiIxBXc/DD6tnFsE+GEvc1Z3zKaD4tio4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mAABhaZpomUKXQGp1EDKf6EVLK17gJG82Z3bmk1dlMHvv2aMhKiwb4z3pRkSIxhDp82j7Jt/z7rVTXlMQ4pIpWTL9NLjR6rwxyPAsTfusaiKxi0+HETR/jFpli05JpBe1p7qyD3TTTbIhj7XYSdr5Xtxvm9fMIR4e9b0vtq+ad0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nzFgalG1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IJRatapR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nzFgalG1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IJRatapR"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691DjHuW2403840
	for <linux-media@vger.kernel.org>; Thu, 1 Oct 2026 15:18:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ingTY46NJ2GQtvCGWZtOAziSPD60qDaEf0ROXwQIT14=; b=nzFgalG1DZjBiNNp
	d4iqD8uYWVdxkfegPNKPs3cBMsJ6VRSs2yMXLUNwaqSf2D7e9UlQxwQqQKhxsV7W
	FewmLvmJgqVru/TOh4DQQBBD5LNQmsMqTvO8SSCvGosbr9Nrd1mGo2YcjiSzPZuQ
	xBgqr4kQN8sp67jtXYC6W7aHXiwkM8l6NNlC5u8jWFRRP/ub0QcQcaz237tqZTcY
	shoIFiJ1yD44u3Kq3CYBEtXTIf9r/syqP+TBvobnGu2l7xczVHZFQULbNEAt5MSl
	Z1rp9ry2JQ61x8GkOjRlNcw+tVIN6BtSaddYq+EEUtC3B+kI5YUkyhyp2beJ8hFC
	Ve1fQA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h188sve07-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 01 Oct 2026 15:18:12 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-14388664b04so818175c88.0
        for <linux-media@vger.kernel.org>; Thu, 01 Oct 2026 08:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790867891; x=1791472691; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ingTY46NJ2GQtvCGWZtOAziSPD60qDaEf0ROXwQIT14=;
        b=IJRatapRhlm17PnoR+buVANF3mHi2A9kjnvtLIhhzo0X/Zbeui5WRim1RF+PUvKaQ7
         GFmrcmKf2PDU/WuPdfOs4nm4b9s9yJbtgu2dOPzxVWc8p15psimMLZ5Sx4rvWcGBaaWQ
         PlUyTtAlFgk2Xp50IHAhvMpeBP9wgUYZDd2DmrFvHmrZpqEwlTPnyvE3jsP4KILjYDXy
         HdFrAbswADrmcmTdEtNwCpeypKrk/uGZFq7Ckf8uzVgtmpCT7CC8HTjkcTt65CQBzADI
         6IS+x/bjbqjb/RchWIUAztw57CbSem1WH7+7T+0KLyLRsT49DDqmrmtXv0nhoFS9wEO8
         GtOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790867891; x=1791472691;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ingTY46NJ2GQtvCGWZtOAziSPD60qDaEf0ROXwQIT14=;
        b=ggdU0Eib/Ie6pDgDyOshZwQUqO191ILKtQqcpkAHXDEt7HcxZGzaxq3l2YmHfB5gDG
         nSiX1PRIfWFaGCJcuafFsUid79Padu3rmMeQAVgVerU7xY7d9Y0NeK9TStdClg4XPbvj
         GkV7ubP6AGJgQJcXqoIAeh3b+MPhq4OCZ7nIiwvUyZYF0o8TtcnMINK5TI4ldrBlwWq6
         6HH1aTeKC3VDfCnpYM0RofPmp1KyawEBZpmgq8o+3544vOmsOz+jfF1LJZMFgmfm3q0K
         OcLwdjI1A011IKACPpDf+MugkIXyJOzZPaNXEbcxgVzpSf3Th9YTz20e1jDxvMM+mAZM
         P4XA==
X-Gm-Message-State: AFuF++mb2vsG5jGzloB/i/wLFm1Bq7Amoy9/P+WSM+mUccfzCqsKyQja
	YVR9KFUQvMJOKU1cJXDHC0+Ay0L1cB2Xst2zls+AEDOBtTFEqcFrV2oOM5ye+ftVqRcDP/XZvbR
	ZTJrVkfod0xn1yP4pb2hoqPomZmZ/w5ReCsD/HD+QnX4PQoz/0SOxcAhXFUdksiHCnQ==
X-Gm-Gg: AYBFou2GJ9Q/hchqdzqZdN1r2eVsc4VPeRc8emfyApp3ThMIzfYVh4johw/r5+9MeCi
	4zcMY2Of+Xi+FVB5CLqgsH7rM+mIf9mdok0Tw6FJAeU/YSNnZ4BYWDrRhyq0AVk6uO+U9VgUrsp
	3mSU9Sreosr7qIG7FQXurdBaLBFFQKT6ULRZny3eMyxL9aAOFV7aRT/LdxkOUwMEzM2p39fR2gO
	VByul7lZdtGgoG2ilSxmP0PXLHo7iyWSaiRog1EjBgU7Q7FklPtJsm9wuFwXoKlIdnSCPS5vsdh
	DmrWHJ33yeEkshc/lfs6uhzsfy/eWy65O/8+4kihJ1ySyJfLWfwiYq3BlPjhRTRS0nTfWQ+VTVo
	q12BkxG1/eNXRCbGvCtdR1bx+d3DfUyttjQ==
X-Received: by 2002:a05:7022:5f06:b0:14c:d041:f9e with SMTP id a92af1059eb24-14dcf491981mr3113000c88.19.1790867891137;
        Thu, 01 Oct 2026 08:18:11 -0700 (PDT)
X-Received: by 2002:a05:7022:5f06:b0:14c:d041:f9e with SMTP id a92af1059eb24-14dcf491981mr3112957c88.19.1790867890268;
        Thu, 01 Oct 2026 08:18:10 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14f246d32d2sm115700c88.1.2026.10.01.08.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:18:09 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Thu, 01 Oct 2026 20:47:25 +0530
Subject: [PATCH v4 5/6] arm64: dts: qcom: kaanapali: add iris video node
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-kaanapali-iris-v4-5-642f9ac5e699@oss.qualcomm.com>
References: <20261001-kaanapali-iris-v4-0-642f9ac5e699@oss.qualcomm.com>
In-Reply-To: <20261001-kaanapali-iris-v4-0-642f9ac5e699@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790867851; l=5000;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=hHugJm3SVpPiIxBXc/DD6tnFsE+GEvc1Z3zKaD4tio4=;
 b=3Qk6f6rZiC5tX5qRvZrbVMdAPj7V2+YKSuGGsOQcN2RnjHg9K6/KLVnbueA/vzPtofADRobOo
 LIM8toI0IrBBAxxiKsU6+SmuMG6MFtXy1QSQx7R4O/nnKLx/OYCOTY9
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA2MCBTYWx0ZWRfX3Y+ls5W7Et9f
 BbJ8NJVFNaAG8n/N9ZAFm1+lyoQLJotOEma6u8PkftH2osChDqc+pHcgZa4X+q95nsfRvkD4XMD
 0Ucm+P4ihh5I9g5JKga3lJbcrmIBM3c=
X-Authority-Analysis: v=2.4 cv=OozaWC/t c=1 sm=1 tr=0 ts=6abe79b4 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=_7F-lZpJ7T8AqIHUSVsA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: ZUVL1oPObq8gRfSqo8Da4dPiJnpIJl_M
X-Proofpoint-GUID: ZUVL1oPObq8gRfSqo8Da4dPiJnpIJl_M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA2MCBTYWx0ZWRfX72oXnPNqN0zN
 PExdStBN7kCZ2CRn6c3Ntel0uguh1Zk+wZteV36zfeosL0NCbpd/ch9TjmEAZeHPMSsmTEZ+Zdi
 PN/KTZ/YC04QgjXb5tb7zjvL+lnoz48C7JeApGKEG1CiA2rJp9wlahT/4mX06TAvH0zLPW8lSRX
 S5ssHeBjxDK+cr0/CUxh7gIht4O2uwQe9E2uU9ZMelpEsMhqTw///neY4whbaC0PuEzm0Su0a/8
 g2gOxgPF8G0ZY1IZLL6aMhwaumND3x3Ir7d2y7TiIv6UeAxgLH+LRUnHfTKTyd1L8hXVm69DWaC
 h2cEYTSq42YVUdSuO64EPLuKxAeDLDPpXNsrIgguxQLntnHj0E8rIt+VPRsEkNpj7U6TrDet0HA
 4YEncPOh9Gwl5elPz5T5+11p2oBkttpUlrdJX7Pm9JBEV538BUXOxc4vkptGfhTFvKtvYQd4LRz
 vFzvwZSdP/vlooUyuCQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010060

Add iris video codec to kaanapali SoC, which comes with significantly
different powering up sequence than previous iris generation, thus
different clocks, power domains and resets.

Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 142 ++++++++++++++++++++++++++++++++
 1 file changed, 142 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 146eaf9f0b9a9e1cac764fb598ea2433c0af6631..0708815f9ef9565f9560969100153fc532b803d6 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -2663,6 +2663,148 @@ tcsr: clock-controller@1fc0000 {
 			#reset-cells = <1>;
 		};
 
+		iris: video-codec@2000000 {
+			compatible = "qcom,kaanapali-iris";
+			reg = <0x0 0x02000000 0x0 0xf0000>;
+
+			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0_CLK>,
+				 <&gcc GCC_VIDEO_AXI1_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK>,
+				 <&videocc VIDEO_CC_MVS0_FREERUN_CLK>,
+				 <&videocc VIDEO_CC_MVS0B_CLK>,
+				 <&videocc VIDEO_CC_MVS0_VPP0_CLK>,
+				 <&videocc VIDEO_CC_MVS0_VPP1_CLK>,
+				 <&videocc VIDEO_CC_MVS0A_CLK>;
+			clock-names = "iface",
+				      "core",
+				      "vcodec0_core",
+				      "iface1",
+				      "core_freerun",
+				      "vcodec0_core_freerun",
+				      "vcodec_bse",
+				      "vcodec_vpp0",
+				      "vcodec_vpp1",
+				      "vcodec_apv";
+
+			dma-coherent;
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_VIDEO_MVP QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "cpu-cfg",
+					     "video-mem";
+
+			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+			memory-region = <&video_mem>;
+
+			operating-points-v2 = <&iris_opp_table>;
+
+			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
+					<&videocc VIDEO_CC_MVS0_GDSC>,
+					<&rpmhpd RPMHPD_MXC>,
+					<&rpmhpd RPMHPD_MMCX>,
+					<&videocc VIDEO_CC_MVS0_VPP0_GDSC>,
+					<&videocc VIDEO_CC_MVS0_VPP1_GDSC>,
+					<&videocc VIDEO_CC_MVS0A_GDSC>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "mxc",
+					     "mmcx",
+					     "vpp0",
+					     "vpp1",
+					     "apv";
+
+			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
+				 <&gcc GCC_VIDEO_AXI1_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS0_FREERUN_CLK_ARES>;
+			reset-names = "bus0",
+				      "bus1",
+				      "core",
+				      "vcodec0_core";
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+			dma-ranges = <0x0 0x0 0x0 0xffc00000>;
+
+			status = "disabled";
+
+			non-pixel {
+				iommus = <&apps_smmu 0x1940 0x0>,
+					 <&apps_smmu 0x1944 0x0>,
+					 <&apps_smmu 0x1a20 0x0>;
+				iommu-ranges = <0x25800000 0xda400000>;
+			};
+
+			pixel {
+				iommus = <&apps_smmu 0x1943 0x0>;
+			};
+
+			iris_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000 240000000
+							    240000000 360000000>;
+					required-opps = <&rpmhpd_opp_low_svs_d1>,
+							<&rpmhpd_opp_low_svs_d1>;
+				};
+
+				opp-338000000 {
+					opp-hz = /bits/ 64 <338000000 338000000
+							    338000000 507000000>;
+					required-opps = <&rpmhpd_opp_low_svs>,
+							<&rpmhpd_opp_low_svs>;
+				};
+
+				opp-420000000 {
+					opp-hz = /bits/ 64 <420000000 420000000
+							    420000000 630000000>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_svs>;
+				};
+
+				opp-444000000 {
+					opp-hz = /bits/ 64 <444000000 444000000
+							    444000000 666000000>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-533000000 {
+					opp-hz = /bits/ 64 <533000000 533000000
+							    533000000 800000000>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_nom>;
+				};
+
+				opp-630000000 {
+					opp-hz = /bits/ 64 <630000000 630000000
+							    630000000 1104000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_turbo>;
+				};
+
+				opp-800000000 {
+					opp-hz = /bits/ 64 <800000000 630000000
+							    630000000 1260000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_turbo_l0>;
+				};
+
+				opp-1000000000 {
+					opp-hz = /bits/ 64 <1000000000 630000000
+							    850000000 1260000000>;
+					required-opps = <&rpmhpd_opp_nom>,
+							<&rpmhpd_opp_turbo_l1>;
+				};
+			};
+		};
+
 		videocc: clock-controller@20f0000 {
 			compatible = "qcom,kaanapali-videocc";
 			reg = <0x0 0x020f0000 0x0 0x10000>;

-- 
2.34.1

