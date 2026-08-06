Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981E43C768B
	for <linux-media@vger.kernel.org>; Thu,  6 Aug 2026 11:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786016632; cv=none; b=t0kilbori0itxSN29O04rIzqYfCaIcZCVAThn0QI0F3w82tiPuAZH891FCY3L90LWH5QdELw4bHdnS6tro+pdtsLEMRJgjbF13u2xVbjyv8F4tEEhXOHhIra2vYumgYsLAIjeMeIXbV6jTGMdNTnagweQfyiG0GF9T9Yek8STfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786016632; c=relaxed/simple;
	bh=jR7x1n9Ni0IjykjrPq7iZ4t9AnZhxIdi6ZN5eUm87wA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UkaTJoTrjqwlWJ/MYmedSvh9O3ioEyMkRUUktJtIe0I4zPeOOLOmcBTwjGaMs1ARxMNpN/EaiBM3/TeDeh5oOeiL2Jp5j8fr+QXcIaq1L7RBu5zgHCuU9+pxITVJikmfWlwGSu6SEvPTCZLeqnpBFUY2FzouuyzeN1p8sufcV4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lEYFFMjq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y1pG5U+s; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lEYFFMjq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y1pG5U+s"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769neHm2724625
	for <linux-media@vger.kernel.org>; Thu, 6 Aug 2026 11:43:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U2MIMRqehmFvc+78YizqisNLFadQWbLRQtbUArfigiw=; b=lEYFFMjqtNLBmFgF
	1pvcOJScJXyPyLdu2E7s1n2yHeGAORxc9ime9bBJ/R37bWwFaoschs9EE6P79zS8
	nxxYS3yWP73v6jfZG0COmRrhuQwsXoIPuDqV5UDHzpw2uVSMRpyvntjlhd9xtyiH
	zhkq9q27y7Y17SBik0weelT+OU4/11bQyKxxH1ZX3H0+Sgk9ebDl19KQHCmHxhEU
	MGtVL3FaIpnJ0B46/2dHHhm2QOXvENpSnGojYLrW8mwiGzC0k1NuHFxb6WgdQfei
	qR6/szRpaeRJrJlae/tcB3EAqPR3LVF1cgXC+1yOSYvGb4GAkexwNVkUzjocBPZm
	3YJuAw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv9dmm4dp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 06 Aug 2026 11:43:49 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84e375d9736so2735855b3a.2
        for <linux-media@vger.kernel.org>; Thu, 06 Aug 2026 04:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786016629; x=1786621429; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U2MIMRqehmFvc+78YizqisNLFadQWbLRQtbUArfigiw=;
        b=Y1pG5U+snt7V1Vf2MdBYqHNKMiMY8xHr9h2w4oFv8hP+1boRWxoULf5Ij0tupwBGFK
         UDyErTcOURD20oCRtIUtcXqyupFCScAuR5dXSAxj4W+nUXsD6DDvlrmRpwOWi578uLr+
         g/DZY0IExsPYZsFBB3yXYmX+iY61ObTeQCvkB8EGlMnu5X1u+Z73RvKnn3sbcm1aZp90
         B8Jz+ISOYfG/mlO20h529Nj3z0FRvBmtRgzFs2bTCOSAcAMAFBPKOzL08cReqwtfFvLH
         WjsdVuJzipWjJIHR6UG0HKT7aaXEiAaiq0Abi5OaoYskabnU9qSGZXGYfALRJXByeZnw
         IEEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786016629; x=1786621429;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U2MIMRqehmFvc+78YizqisNLFadQWbLRQtbUArfigiw=;
        b=oauI0ydfTK1ft9+/nDP/azT+JyfdfxVUP1A2/dR6ZRvMN4RqinHjHsXtQqKbrLJ4wK
         XH4MaBGzWudchVPU07Nzv5LGVSk4y/XtXUTKDTFeWxZ2mlSWdjAqPoX6gLVvrBL3FRDB
         NK0DAUMIjzxAOjUE6XaFdCgc/83POPBBzscqq2CRLB07YKMl2OG5Sp4mV4a1jYDd2Mm8
         PI0K4ig6nHiX5AC70dg+ZSn6dCDbYVL5IclBe+rcK3iQTGK9N+Prn+VbjQ/1l7ywyOBU
         mZM86tR4ZFVANrclRgdOw627yVUHEj1IQgwcEUx2vtB7l3S9+uL2HFlDIcWYD40B+Rjk
         cHVg==
X-Forwarded-Encrypted: i=1; AHgh+RqBtLNBqdwCNRNu0Dbl4YTaStMsJGlOWUTBlhVovPpLPA1Q6rzlic17R2lO6Y7bsWZX147omIFSJhLWMg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8yMFvFLLBvIEiTX8WLMvEd33w1okdQ9D2tp6V7Iusk7pW09s5
	a9+2BcQ+KXVoHenSJ67oz6mo0xCzst7Ls/AAYi95VVlQekDLK/amPLJcIQY3c9E0Na472Rz7oK2
	SPp8pwxTPChMZyIWKlQi8gqXDjwzOU/8+Jd4D6vkzZV86hx7Pq7DeIWy3oVW9NE5u0w==
X-Gm-Gg: AR+sD13m4Wi3SSCLlp1TbXLz9zUBWFfjjIix/GDAFUa2lY9U93YJm/VnqRNOILeWezw
	OwIhOtotiO7TJfPgs6bkwgU/5Hs1PXaRlAucrNjYWQ9bA5e/BuntUW7EbZzHMh+a9CIN/tqBhc7
	8Gtpg863+edHlH62M4Wo46Y+w5m1IgJUJabZF7yx67ZMHVUfvcDqZFkuZGW+Vn5lzEbj1ghtWqm
	jvZQQ92iY79UXQsYwgPhTDTcez4tLcc6tGKtnRe4lb8SicAtNK2wnsriwq0xII9WF61TjXekCIw
	pqJIi5RRYK4SCUKdDJsgBhUjpVPqcpw92fHwC0AwKeo1jhCJB5d3qGMUDN7WaRmPOmpTiNshrwZ
	XzLe1lr1b+v4tTIUWVOq1d63FaMAax1c=
X-Received: by 2002:a05:6a00:bd0e:b0:847:8b0f:2508 with SMTP id d2e1a72fcca58-84f2dfc8c37mr17374715b3a.13.1786016628919;
        Thu, 06 Aug 2026 04:43:48 -0700 (PDT)
X-Received: by 2002:a05:6a00:bd0e:b0:847:8b0f:2508 with SMTP id d2e1a72fcca58-84f2dfc8c37mr17374646b3a.13.1786016628446;
        Thu, 06 Aug 2026 04:43:48 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f456b75dcsm1234756b3a.34.2026.08.06.04.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 04:43:48 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Thu, 06 Aug 2026 17:13:26 +0530
Subject: [PATCH v7 1/5] arm64: dts: qcom: shikra: Add CAMSS node
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-shikra-camss-review-v7-1-c7360fd6a5ac@oss.qualcomm.com>
References: <20260806-shikra-camss-review-v7-0-c7360fd6a5ac@oss.qualcomm.com>
In-Reply-To: <20260806-shikra-camss-review-v7-0-c7360fd6a5ac@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786016613; l=3981;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=jR7x1n9Ni0IjykjrPq7iZ4t9AnZhxIdi6ZN5eUm87wA=;
 b=bHYhxfZnvqDzDazJnWVgQDOgo4rTIU/pucHvm9v4OMBEghd5zLPcrKX22CZiAZFm7EyPsClbh
 nxHepwVtPcqBqLxLaMJvpZF0YbvKRsDAbWXaVpB5oziE044QF7VNsa1
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Authority-Analysis: v=2.4 cv=TJR1jVla c=1 sm=1 tr=0 ts=6a747375 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=ahKksh3eZu5pIVwncigA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: VixioK6tNAnELDuKZ6wGINwQRHyz8yCv
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA5MiBTYWx0ZWRfXwbHugu65wu1E
 WK7OF8H00RHycHVOmmT3qPP9wmY8zn1CWC8eFHLgwacf9OWSh0N4Dm6iB5/pyrpvLRkNXUcApoB
 NH5jXcSEDCgW3Df6upNc0zeHayvC7mU=
X-Proofpoint-ORIG-GUID: VixioK6tNAnELDuKZ6wGINwQRHyz8yCv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA5MiBTYWx0ZWRfXwrHeunJGFQFl
 WZ3RbeNd4somefhjKCIh+hQ5XP9HvddTb7DdAt/s8GmoCvE4IoCVB9pY86UYPqaePw/XrDFytNf
 eJmDGN3ZDc4JX85y8juFoMFW2ki0Tq523vbp4i0gOii+HARNn2mpZSao++Y+DhEp19yveOY0k2t
 B0Bk0g9ecKukTXITAs1vszP8DmzvSSt3nzcOROn0DDBT3eMLMSuHieErcnZMzy7s2kIbeO19pAQ
 oljgUZTIT680kvmHLludQ/AoA/Rl6UotpcdYMPhvL9GR8FOAqbhdtDOigoyL4+VgloW25DY0+0u
 mVhSEFfmAi35J4xzIq2dkA1SfCWEXgF1cHfmRYFMDMQ+hxwnS5Qw14MOA4bncwL0o3C+DohPnHy
 7P5hkAXbu2kJ6JPMZ5P46DDsIZAWayjnapqOe9t1YErOEDJfHjdYWgvKUgf+/yWwDRIiy4oYDaB
 Nc8gNmTXnUwS26T7jig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060092

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
index 92d22e3b6931cf49f213d1807f78fc1a261f290d..44e1a333e97f1c88a672c77579fbe987d4285693 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -1828,6 +1828,106 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
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

