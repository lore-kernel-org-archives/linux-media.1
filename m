Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973C14D6C3C
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 11:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789645285; cv=none; b=VrehRJmXdh8hBHTnY4C45bFfPvIl37VQgb0B6AmdJSvD649rcAyrNST+f2jz1X0GVWKn8Y51aGqcFU8sUBlQ6H25GWVEQFJAbMY3HxgU5e1+2lH9peoMpJNC+yPv8KQD0b0B190kNSQw9/dnDJs0l3wgECydRc6tP8AH2GS9HLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789645285; c=relaxed/simple;
	bh=dBquW3rrzw2wP52nzgHqCW3FsrfEce/mwiNkRbVPbBA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q42j9Eo4RUpU3TXlTxjjUiI+0eWQeHpPbpY0cq1vKAUq12aXeBbFtZMoOc8wHvPnqZpwNoIAJbGumgPnejtYo4lyivnaGng9qoYBpIAwTSemPeC7mVKlyeVSe7LRDaK3OF9yW6hUOt4/HgSIvpXPZOsaTMp1e09L9++EWtZEhEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P+sY6nxZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HdaDhPeo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P+sY6nxZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HdaDhPeo"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZUJ5746426
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 11:41:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f4bSX8P8uhf8R9Ebg4i33O9RJeY6pJIJnHw8HgmLtDk=; b=P+sY6nxZQH6ph5td
	xQbbVxRHBKrm+5h7/zl3asrE/8z+KIyRpPqrK1nqSUyhqyoZ9x19l+cutPqlnVdF
	Jfsn8L5gcqG9I/j1Nr9MHNdAqOdKZzRPsFdoh5RxqFqVdTofR2s81bWVUWlxBtMO
	sXD9O1Oo6169GpnKI6YGzsw5XjZcbd+NidpPQbFyXwHMd7cL5SSVukzB4c9Fpk1e
	ppceYuNYL78GWRQTa7jJ76Mn1Go94J36uYjXKIti8OdsuBs9u1ullJ25TayIGyD3
	puL4hBX0tCQT1t9VnTX8Y7RzWbc7Nu281tymfRAW95VHO8ghinSGouuI8BaP56iX
	FrpY6w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grcra8rnn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 11:41:20 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc4c1fc9ceaso633401a12.3
        for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 04:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789645279; x=1790250079; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f4bSX8P8uhf8R9Ebg4i33O9RJeY6pJIJnHw8HgmLtDk=;
        b=HdaDhPeosD0oeBMm+jYwrvob87WFEYgjK3UNI6PifgLGHmgeunoClozU5EnvRcBNQy
         qHkBoGyvgqOBJmk36HhTeCzeEvsu97PXJUSmispYqGvipkV7JqRouxOrQ6EZKWcEBSvg
         4MsUAGPWqpdqtNfXR53YwHYj9i/BbLY1K7VoYixjABRLH78x9FBGWrDf9lwvP8z2zFem
         hGtKDK1RCo0LdojKFJzJlEDroA7xXnebdDxBJrJO4WKs4NEA7R/6gOKZQF+VCLTVtGhB
         mYsERn2fBJ57lj+3maJXXodRrhdPNeBiI0FdpKAFKqkp/m7gk2xDECJBKoHMyMdlTUoN
         ilMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789645279; x=1790250079;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f4bSX8P8uhf8R9Ebg4i33O9RJeY6pJIJnHw8HgmLtDk=;
        b=VlfjhyYgNNp1BLoFpaHcclehNcQw9P31/QRBLEpvI/HAjYMtT/iisw6O0RGe5qeEYj
         J/o1i2hlcD5hFuCToqM1YCm4BVttH1IQnZKUQqEam62ETvBw5B/W+gHSWg/DRTFJUCpA
         xyCNwzBmj8JdpWyjAitS0IppiyENA5riZIYnJhrOUtMom5CwpeiSSRy+G7qvYCvV0J0q
         rc4GW6LcAVRkgKf3dgkJKiYUTNuh4zbsjTgEPhiJtR7G2a73WOzF+2uqEm+c8M/oFZOs
         3nGs1ZCrKUQ8KQmoVxziHYIZpbf3DDB84a1njoBPWvkQi0jC0jJFtRXswjgRFZQHg8Ft
         fQ6w==
X-Forwarded-Encrypted: i=1; AKwUvBwiNrmItJkyR3+QuvhREDvrd8PtCbP7MsNJafRM0oirVwVJmmTj5sFRNQnSP4sQqmjik2HukykTgQ3LOw==@vger.kernel.org
X-Gm-Message-State: AFuF++n4qOh8BaD1c4IgVcV916RfMxfU4qfqKokRJJ0eLtJOD/5PM5Cu
	Nekg/agbDKQxH/3WE0pKPfawmzEjYKWhRknZpM+130Kq8/dF1MWpLjm3OvG0RjaxI68w4Aqhogw
	5/8NwgVgXNUY8FHcCmGqpkj117IP7EcGxdBi9ckVz2NHosI6dU2Yrsqycy609oBsoyQ==
X-Gm-Gg: AYBFou1baac++aeypf6/cV5nkWRdjT2ydSbeTMSBHje/SkfRDXjCSEvCEAyZs7rV+uW
	PFUEEBwlU32R8H9dtkYEiZ1Btu08Q8tK8j4NRtriz2rfZBUG9vhYKVLrgCDPvG6u04WAW345Qmy
	40bPK8qPrw8dx6ouYqO1mXWuRsb4fzH9xQctpz9NF8223pDqpP7m1E/X7dMgVNoZw63pKK/eYOS
	OneGaNQAF8PSVOzC1uxQuyAeLAr+BIro2QhJanXDDL2DDWS0t9b0XBiCtQOFmwMChSs1g0cwE6K
	0PW1uWnGhRFf+Nl6jJMt8x0T0oJazT5IYh2OJXxik6nmSYufBSa/ojKfwz+DW2pvfxeWNR2GRX0
	bFSj+7gIQcmvqZ3fb+XtI6It1WGXd5A==
X-Received: by 2002:a05:6300:83:b0:3cd:9dea:2be1 with SMTP id adf61e73a8af0-3dd5f094c91mr17001561637.0.1789645279295;
        Thu, 17 Sep 2026 04:41:19 -0700 (PDT)
X-Received: by 2002:a05:6300:83:b0:3cd:9dea:2be1 with SMTP id adf61e73a8af0-3dd5f094c91mr17001479637.0.1789645278808;
        Thu, 17 Sep 2026 04:41:18 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50acc1178sm3066557a12.30.2026.09.17.04.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 04:41:18 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:11:00 +0530
Subject: [PATCH v8 1/5] arm64: dts: qcom: shikra: Add CAMSS node for Shikra
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-shikra-camss-review-v8-1-9b9596221cfa@oss.qualcomm.com>
References: <20260917-shikra-camss-review-v8-0-9b9596221cfa@oss.qualcomm.com>
In-Reply-To: <20260917-shikra-camss-review-v8-0-9b9596221cfa@oss.qualcomm.com>
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
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789645263; l=3981;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=dBquW3rrzw2wP52nzgHqCW3FsrfEce/mwiNkRbVPbBA=;
 b=Qap2UKN5qySFqJIJgVmmNhqnIKlPZ8yKkSGkzupva+aFr3aRApiiB9137Tc9heI4DQu5xQFDD
 Ulwt+BIGaZqCKULaOkIk94a/JkrTVk6aYiOWeyOOTmIzdx9iyVhDvAp
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE2MiBTYWx0ZWRfX+LnWV6SwJRbS
 fvBZ1tJSoJTSe9huNnAGvEjLib3IDrFb4OV/cJ0t806SlYOVLM6xPqjVeZ3oR+mjzgBAep4dvUS
 slT6nlO22xUk434sreqOITzftOXHLf4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE2MiBTYWx0ZWRfX0BJCmXFJ/Qsi
 EfvpTB4senzcLZym2sZgd8wotRmZaCvAt5TjrCzWlx+HUGKFeAtC0gSeTtwyoA9CJauqRGFmjal
 UeIcs7LBNxx9m0z+U7tVKfc43knJlNtHlz2Yh7jjjiHFMvfuTLMriWZxr2NBW7QpXPJn0MNssbL
 ebDf5bMMgjHOYXLYqmAGys0ryJGgm/h0ZURl+qiVhrAy+/su3lVhDOAttUzIQGDA0FvVdjG5+X5
 5l0prPrTN1B4pQHvsEjKf/c0XSWOqbLUNmEr4Jw/rmEnjqXVU6Cv4J8OnQfhUCILdmbnAQsfVhk
 foR9DspVeuOhkzGEjk0nkHn32HxKJFwQC1tuuz0fDx1tuhkow9PKVVKrWKuyImuAnVeE46CUWcz
 AT4bw3W+nF1V1ToFQjryekW81guhX0MzEFkmRRgxcRTpiHzvVq/E0xmvkWwJUo2z5aDUEBRK2jQ
 A3imer9ilxt2Q/LnQog==
X-Authority-Analysis: v=2.4 cv=WL/qzXsR c=1 sm=1 tr=0 ts=6aabd1e0 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=ahKksh3eZu5pIVwncigA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: _8l7r-_kTxjlilBjZztdQMns_PSJv8nW
X-Proofpoint-ORIG-GUID: _8l7r-_kTxjlilBjZztdQMns_PSJv8nW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 phishscore=0 priorityscore=1501 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170162

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
index c1f06f692f66452c6ee1b10f3ef12c20e201b5ce..faa1f02c01957b8ed86b5e8fc659c856d574a8ee 100644
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
 		remoteproc_mpss: remoteproc@6080000 {
 			compatible = "qcom,shikra-mpss-pas";
 			reg = <0x0 0x06080000 0x0 0x100>;

-- 
2.34.1

