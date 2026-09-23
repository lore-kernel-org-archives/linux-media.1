Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4113E717C
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 04:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790139483; cv=none; b=M3EIVaFWnqubwTg+1BoIshb1h6GUhqj77gsvPyeNe8+bbBp99YG/6yyYVMIybwgdY9CMAunHt8UrLQ4TU2L9QI4VfN5ExyFiz/S9D/KR2x9uYyg/Ysjv5Z3g313C08o2vaTDJ0+MJcullQvE02C0J7Yv7ctfgSzj5sN37hzwfQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790139483; c=relaxed/simple;
	bh=7YcT+Mp4N9oUEJJb1R4A4tqL2v4DNSxfSMin5F8lmwc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Tr3Pal586t8KHlwDnMe7blsILzdkiZUvhXbRJ3uVffDliD9hxpyvGsepZYKxKitQqwIYV1ppSoKYc5ko1qhrU2Cudooda5AjFNKDP/Wrzap5lgvRYggi3Xyy0dg2T091yq4IoGqpcSlSScWQFuo3vtWFGOtkMFbQSXAImtJ5Lr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nKChpZ11; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IINU6sG2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nKChpZ11";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IINU6sG2"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N3iS4Y2728452
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 04:57:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rXD3jwzeCq986oj128eoetS+pkWm5i7kbLJxsP/VRok=; b=nKChpZ11djQ5vCPs
	9kfJuPao5qE+xpQq7lxInnnSkwIl821UKTs2+cAuWdvCw0TZ60RpL79IzSApnpBh
	v2G6PPjdyzG1jftbHTD0ihqbw9gmCfguyJvV05xQh1/Q5wP9Hwfgv5m8DH/Rl95V
	JOxXcqZN7LmK/y/SJz2v/AsFl0Tuz0yC0Ouwf7VBapCHWKVsWVh2k6zsuCmkoYrG
	qq2YEa2oRDm2lQn2NgjE1ykZ0dVHoiYply0kGTDzixGj6YLe/jNQTAkAHWWUnyJZ
	21cPOW+7SVyFKZUbI0/2JUxxxmmIsj7tGfhL7vxLs8Wpov1OofCID8JCrpbaOA1s
	ltaasw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux7xtj9f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 04:57:51 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso772538eec.1
        for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 21:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790139470; x=1790744270; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rXD3jwzeCq986oj128eoetS+pkWm5i7kbLJxsP/VRok=;
        b=IINU6sG2WbbAucpFLkN2kHWLtO7nG50dG+INQVbW+koMUK611hlm4kEuPq0xh7xFtX
         XPGg2ZXVGjQk56RYNgsJ90pTUn92QPgxctugjCNsN9YKPtmDy/0aBnCTcVqZ+9x2o6Iv
         kPuhPtjETBTiINBaP96G0njaPH37t9iLvPDW5YQdttU1wuEJZ+z0+g8Brr4oynkyG8h0
         Tc3J5yZgLhiib8Ru+rRjle19OuL40+QVxKy234knmFMKh/j81jXi975/yuMkilJlvhBY
         ioNXvnZOXoaKPpfWEdGbp9w5VZTDH7e/6kOZDQJibNGyLX+9YlN2UqT66omOt3MOayf5
         bSww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790139470; x=1790744270;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rXD3jwzeCq986oj128eoetS+pkWm5i7kbLJxsP/VRok=;
        b=nGjsH8Kq1aDFkYbHeRccZlYLrSiB4UCs0AYfFexV5F212xVOw6gwH0BsM3yvqR1Yeh
         dv6rgJQJrTC5HYmlB9EmL1nObkDQe5+7f1gKHxlddfuU/Exfi6LGIGkvCwr5xrCLSB1C
         h81vO2UzNXd8HoXB4/nE2lzqqR8aDy3zPG1KmJo+aWP55XplxmKzmWmntRiNcB8QmCDA
         3u+zCetRLPglRUXxHoOTJi5shStVZHtBzaq07vcVicDdYByCXy0bI9XUChFTRFDtfYxh
         +6WHcPDgNsfIWAnSsWZ94i6sIYLJlOFbucmq3AEMqgGs36FfQPGZtTE3bjzbvHPuePjL
         jRbQ==
X-Forwarded-Encrypted: i=1; AKwUvBwSSyNWAjYQTTseEk+Bao+PtrmYXT+WimXdQ8biaInSp9DXFFriUF/GjlwioSij8EwxB96yDQYWTavvlg==@vger.kernel.org
X-Gm-Message-State: AFuF++k7eErEG0PRUiAWPmBL2ukZ7JOdk6qCR/U1GqAKV0tvX1GoaZAO
	gYZUzc8SQEZp5zvwpROlqr0mboIs5bEYCgIRP+T14BMBDqcB8+TEK091EpX8VqBmZd/uqZ0l6Z9
	1UG3UGnUl+eRDJdyrXRLr1O9T98t9NnFjO3NXAM8w6Y/alg4OMnl60bArdHDD9BMP3Q==
X-Gm-Gg: AYBFou2EVdAH8RthApSD6fAbvgumIypYmq/YV+OTwxN6rluANhpayIFStKrzG18hHS5
	oYDdDfobb1MDm8X7/Cg+2b866U4JywVKuGyYNHD8Go7iCwgWQz7kjTLrESKs1TxHo6B3G6V4XnT
	THKKqLYVPABRIZBorCkyFVmfINTLo66KjDFpn9qTWvAMEXW3zDUTLgbSZ89SaukxLoOS1mFT6fS
	PM7n9vFRIueY6k1CFhU97ImuB6M5rFgIhg1oy+3GZWIh+WT0oswpLve5wgRc+qvtrntJInf5TXo
	orVcKg84W2o6hHe98GkKZLmgHCAnsO3NEc1ZiOIt1wVmm3A+Zlbhjrgl6TwTS2bSWvlYN8i5vdQ
	afCmocZF/iLoxzd4a2oTqU7m9LbTQ+g==
X-Received: by 2002:a05:693c:42d9:b0:33b:e75b:cc42 with SMTP id 5a478bee46e88-33e8d7d8b7bmr1164957eec.19.1790139470213;
        Tue, 22 Sep 2026 21:57:50 -0700 (PDT)
X-Received: by 2002:a05:693c:42d9:b0:33b:e75b:cc42 with SMTP id 5a478bee46e88-33e8d7d8b7bmr1164928eec.19.1790139469640;
        Tue, 22 Sep 2026 21:57:49 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96e48e3esm3168907eec.26.2026.09.22.21.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 21:57:49 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 10:27:28 +0530
Subject: [PATCH v9 1/5] arm64: dts: qcom: shikra: Add CAMSS node for Shikra
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-shikra-camss-review-v9-1-09f5fbea1309@oss.qualcomm.com>
References: <20260923-shikra-camss-review-v9-0-09f5fbea1309@oss.qualcomm.com>
In-Reply-To: <20260923-shikra-camss-review-v9-0-09f5fbea1309@oss.qualcomm.com>
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
        Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790139451; l=4132;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=7YcT+Mp4N9oUEJJb1R4A4tqL2v4DNSxfSMin5F8lmwc=;
 b=wI17llcRZ6hPMzQxO9isLCj/ZIjozRDvqEMslZcpq/PnsYIBKC8Z09mL6WHI+o5U2d2RpD3gv
 f7ChzzZJ5/vAuJny62EAqok1ig/I7UQnY6xJgJAd4DQ99hJwJxWuLtM
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-GUID: G0RtwO1Zf5Rr9eTYgSk0W-N5weEW0PpY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAxOSBTYWx0ZWRfX8JtVE8nXkAkL
 HxmT1Q8O/7dZ++0j1gDxpIlBdMpvqF5BLPVPkc1Jn8T6LZPlW7pmpnyquSbzgYvFDxgEX2J8Nwu
 A982FI7C6EIiSvMbpl/OjwBw2tqc6A7WfYFtUrzpXk4z+566scYHvf5U/UewaOQehozBllgB0Kt
 9CINVeilqY/Y09qYoaXkyc6w9sxmLSf1u2Bp2H32IjuOO2ex3/fqwy1kMKKPEilEOSZKEU6RbGL
 N5TozR2psqarU/5c4pVQuCK8bhZ9BQQ7YOzqGr574Es4G/mJL7cw54qBuW1DwIgcjwMY+DtZwzz
 MFy4l2n13F/9s+AHNbc98TxMqW+No9+K0jLKpSSRX16Oe3lGP0IqGjVMlXJDZ/YEM4PIhBJ1KUW
 +VBp7zzdvQBtqVGTlA/I3uEL2dvgW8ElGzSfAXog/yki/Yt0iwrbe8KFM9Ycyl7w31J92J5e37e
 LLTiEBP0NJdNq1P3L+g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAxOSBTYWx0ZWRfX0cKmrXzgAsgp
 guE9/2wA/d69NoniDDCfN+vdduqCEENvAEpNMCoU2nIlhHfM24pvICCLfQxM/UjYWhN3hhECWUF
 96F0IETgxWGO5irPgFcujJtu0He/lPg=
X-Authority-Analysis: v=2.4 cv=QsDLTlyd c=1 sm=1 tr=0 ts=6ab35c4f cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=Aep19VGDvhHTtQhRaYcA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: G0RtwO1Zf5Rr9eTYgSk0W-N5weEW0PpY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230019

Add the Camera Subsystem node. Shikra shares the same IP as QCM2290
with two CSIPHYs, two CSIDs and two VFEs, but does not include CDM
and OPE blocks, so only a single IOMMU context bank is needed.

Co-developed-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 100 +++++++++++++++++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index c1f06f692f66452c6ee1b10f3ef12c20e201b5ce..469023a22818962abb394f3ac02752f816efc839 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -1977,6 +1977,106 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
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
+				camss_csiphy0_port: port@0 {
+					reg = <0>;
+				};
+
+				camss_csiphy1_port: port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
 		remoteproc_mpss: remoteproc@6080000 {
 			compatible = "qcom,shikra-mpss-pas";
 			reg = <0x0 0x06080000 0x0 0x100>;

-- 
2.34.1

