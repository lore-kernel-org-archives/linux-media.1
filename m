Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793736369;
	b=Aw9Ncv8Yh4z+zTu0j1zj+c1UURyOcutfglIrRgKwkK3a84TiVKDa/jX1hhFCvS3MS3+T
	 OL2PHw6ctN1ndObTUuj9Qdd1smDiJDIBf+4lsJNvmgQEAE8mouk1SSn/Yu0VpAexe46P0
	 YzN6TGJEC4xgESmrrCrwzOzCdyntTp1Hc47nDpHnhe1zAdwRgAHby+8Gsc7u58I+g67Sp
	 a1j3ikdY6PXGF2t2C5Gm+beAR9LjP7USk6GJ2OrSBAvtbo/vi0Fsoj08GUwcYEijjZXrg
	 Plk6IAtwfrVVpALjrtrKZRR3NduxGexAFsco8RhlMpZ8GKNup5OZT+IK5esIXTRh8ZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793736369;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2Yqb8w77911HPId3dxP6CpINfJB91u8DEDhhhf4QlPo=;
	b=yl3X++bM2PSJPuTFFQ09QlLOPIlZSFX6dAqA/QhhEZYMdEnHFhfwyHFt2nhFdQOCVEFs
	 n7/oHLwMvG17WWEUCaDYQrrdxa4cn01BWuveR4/jR/MweyzNSDoM7LRD4HvAC9Fou8xJD
	 7CeNGn5fmWdxIdFyHMLu6oGFMVX2jHn4qOUnB+szbAqkkPzQGb2sXcRBrzpy3W9Eucx41
	 hlWMJYl2ZmM7PD/PLJqA00o3WKjLGTX+HVREQV3hehKpSogkzuGLjbqZBL8oCY1ZRsCBY
	 WjQkETiz7tF5Mc7SOH8vxNvGImb6QM9Jtx6noykxcWfwBhBI58FLaDVrXhn0xa4TyLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="U2aKDJM/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fPMcZTJK;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D87606A33B
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 20:06:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4D87606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U2aKDJM/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fPMcZTJK
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3IZCMW3666512
	for <linux-media@vger.kernel.org>; Tue, 3 Nov 2026 20:06:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2Yqb8w77911HPId3dxP6CpINfJB91u8DEDhhhf4QlPo=; b=U2aKDJM/FByQWv/E
	HGdwFgqZqf798U6llOgWXSbQmK9MOc1hvhqopSttSV/Ni8dJziFm/M9ZmgxkR83W
	U9ANharWH8qyu2sDTUC0nlT4wW3augtLPR9Pc7bp4fxT6jimVGTCTZWuo6C2BhAs
	tF+1QcXZgX45qBomUMvX8LD6LmoWQl/bqhwNoGQYJ2pm+osE/zpL6ek3s5jYM+Qv
	MvoLbShGaJyUl5flAjfosQ62kaYxX3ibNSXdVVUyPolIFWQ1Yg6V1uWWkfz+EbyL
	5pQFg3EWmEIhrCh951FK22+2m1CfSSRihFQakE15dP4uopD4C2jGt4Nazt/Kz9fq
	Fo/8/Q==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqjubh27y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 20:06:07 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-98c88cefeb3so3453529241.3
        for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 12:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793736367; x=1794341167; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Yqb8w77911HPId3dxP6CpINfJB91u8DEDhhhf4QlPo=;
        b=fPMcZTJKcPnkoXrow7KT6/xhK/mg7kzYB73+7UeNHdPxKOZNYABUtm/KnIhz6UhwIv
         HyENFwIJEKQA7hnemgzEAvzDK63hRGpTpQUNCHpYpa2hw4p2LjeT3YVvhPcbPJW2mhSE
         YyZuU6yTz8PdWrkYf0fiVwZ3w+0X14DQU+jELOfjnkNIqRqMyk55dzz1LsvNgcPXoPYM
         /dBxMTWSfjSkvzbog7dHC+w2sJMzjy0fbXwepJmJ60AITjgYmHlDHGkZgWTUfqbI8ry5
         5Okz1SuZLOwaM+EbiNWWMJI9f+XzO2KFbHVu6wriT41IcvjYzaH3klZYZtcrEOppMB+3
         JHug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793736367; x=1794341167;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Yqb8w77911HPId3dxP6CpINfJB91u8DEDhhhf4QlPo=;
        b=aGxLMjhKqZ4nOATceWG+Q9KZ41CEP31SnNysKT5Jka4tFlo4DYY4RCB5Laob8KnfjH
         8j0utsGZDgvph0cGMroV4ORAzJMsXPDyzBrVkAN9bOdXXJPJ19wLMV4QcM+UdVKnr8W2
         Kb9ffBaveeUiKfor9pVtvxKXgJgkIucn5jE/qqjM3q5rOwRWmiH8TZZTGt62phDFME2h
         n6UvLeBM0ExEKefX5aKv7CtJWJxJGTmiAaVl3ZkkqJ9ll63NIFwK0xsZbwwSC9fez06v
         Lnzizi64nXrUzb+NptC4pp7+m8meyNLwVn65ovY7WbA3qMDX0e/GmcZJKYSUp9H/c31s
         FglA==
X-Gm-Message-State: APuU4Z/OtjfIHYjl8i42Hgj8Q9VrciZ6165oJYN8kkwhiGg89cwPoigP
	l1iEodcUE6I7DeBdpxdPR5oJPVxZsFSQtPgfS6sA47RXXaXKkZVoh678GSjpKlMc+lzZmZXiYsk
	973rQIf0Nrma9TuID/JfalFCLGKr9Maos3xsfd2SvN/kuOO0iNlhza6o9NoaznIjrUBmz1AnNO4
	Ir
X-Gm-Gg: AYBFou06h55EF2ah9fDQIUM5FwiSAXXjQrRAXOozLsAw2D9FCn8UqwFo5ZLGk8BOlfB
	pYdONKvr8RoIBfUs28e6UC31kFd5NE1D5gQjdtt3XwxGjGF2QArmv5HOkUimWEJBn5LRs5rIbPV
	blhK/ov02BttFj69AxuOEZuUV7skUWZ01rZA7ToNWSryxKlqweXDDzXgVji+IWjkJzNUgXw/5po
	/jcNHeEVeR+HNg1BnWpt/5ozWMeeineDp1kRiAZ9meG/+Y3fq1QJc8/0/5tGWkooYw5dmaEzsBO
	ANlbmFUl07HdxgI+l3KW2cyPqOjUX8jq1K4QAwRGbOUz2b4HPKjm7/Wa6Sqx5e1u1UWPKeRjBCz
	wBfgfzWq8An+mssuBkAWVoPc7fxj/SpbHVRkfxtx4+t95xwBEGn4x6Vu3YeN/Efkt1qjdndkBOb
	dCQOxSTtHV6P2HTlHgAJ6AeQNrpNU0EkCFRZFn+kWBwE9oF8AKLsiKMpIboPStZ7F0aj7nVnb98
	OPGv1sH3VMLJoN3mmnQJ7GVBVZU
X-Received: by 2002:a05:6102:2b85:b0:79e:373e:8216 with SMTP id ada2fe7eead31-7d0723d2480mr6172727137.0.1793736366916;
        Tue, 03 Nov 2026 12:06:06 -0800 (PST)
X-Received: by 2002:a05:6102:2b85:b0:79e:373e:8216 with SMTP id ada2fe7eead31-7d0723d2480mr6172709137.0.1793736366363;
        Tue, 03 Nov 2026 12:06:06 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f048:3e89:c517:10cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fcd03d01dsm358875f8f.44.2026.11.03.12.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:06:04 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 21:05:51 +0100
Subject: [PATCH v13 7/9] arm64: dts: qcom: agatti: Add OPE node
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
Message-Id: <20261103-camss-isp-ope-v13-7-c2cbf15a39b1@oss.qualcomm.com>
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
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA4MCBTYWx0ZWRfX7DFRgCMihTfT
 9wYkRJP8RVW9SOHO0q7jAdiycyqc/EtT00mTZ0i9/YhtMJDaMaOZxPt+niEleESeypqyQj2Xj/h
 I/jpEsCNBmHpLVQkFtePiCrFUg5urt0=
X-Authority-Analysis: v=2.4 cv=JeUpPkKV c=1 sm=1 tr=0 ts=6aea3eaf cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=1BEw5LmG3YzgyHxDt7YA:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: 100gB2__KQRH624uOMc-2thse5k6JkYX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA4MCBTYWx0ZWRfX9+7hhjCEwLO0
 9/b6dRLldMWr8d+NEDF0J2q/0CuNClfL0+7DRIh4764MQmwVF39usqzueLLkbu8rCpM3RZHKS9A
 dPzwFgL5xBqHcqnj4AtbJiuZECPk0DG+6azhLSjTlRno0Jils24IDIqUChsUu8P5XlTbds4LpRc
 vRvUCc+URqLImDGsqymp3nRRmcVoVHHjP5nMKZPq0prmKPx9MPvo9M4m13ZdiKsKJQrfN05OA3o
 YZYDH1822KkkSdG7DMZ9nd0+TL+bzxh5P6abiJYuVtmtjb/gGzIwnpFFA9uD7vd9TZdYMkN5g2H
 Own0aKUsySv9khCfqxeBAyRbtPiSotPimOoQ05IlmN2oIavlhDdFRViKvBHBKWuJhmAllKjexvv
 cb9ChU+QlHi+tZRi0NYdKF/UVXMG/Ph/8kg0ZOJwKTdWIfF5IREpYB+hmNgUApqnmMLLB0llmQA
 J8E/MZ6j16GqqYiDt1A==
X-Proofpoint-ORIG-GUID: 100gB2__KQRH624uOMc-2thse5k6JkYX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030080

Add the Offline Processing Engine (OPE) device tree node for the
Agatti platform (QCM2290). The node describes the six register
regions (cdm, top, qos, pipeline, bus_read, bus_write), clocks,
interrupt, interconnects, IOMMU mappings, and OPP table.

OPE is a memory-to-memory block with no board-level dependencies, so
the node is left enabled for all Agatti boards.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 77 ++++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index 32d185d0526ffe109d83fe92d9c54f21bedbbcfd..dacb551fef530b73ca5265eb6aca39b807e82382 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -2026,6 +2026,83 @@ port@1 {
 			};
 		};
 
+		isp_ope: isp@5c42000 {
+			compatible = "qcom,qcm2290-camss-ope";
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
+			interrupts = <GIC_SPI 209 IRQ_TYPE_EDGE_RISING>;
+
+			interconnects = <&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
+					 &config_noc SLAVE_CAMERA_CFG RPM_ACTIVE_TAG>,
+					<&mmnrt_virt MASTER_CAMNOC_SF RPM_ALWAYS_TAG
+					 &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>;
+			interconnect-names = "config",
+					     "data";
+
+			iommus = <&apps_smmu 0x800 0x0>,
+				 <&apps_smmu 0x820 0x0>,
+				 <&apps_smmu 0x840 0x0>;
+
+			operating-points-v2 = <&ope_opp_table>;
+			power-domains = <&gcc GCC_CAMSS_TOP_GDSC>,
+					<&rpmpd QCM2290_VDDCX>;
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
 		mdss: display-subsystem@5e00000 {
 			compatible = "qcom,qcm2290-mdss";
 			reg = <0x0 0x05e00000 0x0 0x1000>;

-- 
2.34.1

