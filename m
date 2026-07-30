Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E7D43FD01
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 15:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785423936; cv=none; b=T2bhPs3OLXzVl4+AsIMX+ad/qtPGgMTy1Xr+tqtRQuQim0INJDKPGTWtKEC6sl1ql2+d+cmW4FxD56nl3bN91GPmKKjr40GFHRd8GhFaKBDnAr0VdKqaKQKVEjjeVf+SGVlkv+6y+dSPCtmrFlvY8Eo5RLZwYK0GRfqosyhFVZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785423936; c=relaxed/simple;
	bh=bV1ubFaw5a3sLDmKpjH2DU8zFi/d97dY21vNk7Js5lI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=W/dM1G6eUdqhVIc3oyCl+uVouGiYLRUEWLJxtoz4FQ2CWnS6iWQtxDp7Khc9sQoxlhuSXgY6FjIZOp0eg/gCDx2G2gIjfjS4R8/1UpVlwDA3T0jVYaw9iy5nuDT+IrgIyVKXWxEMh7Rqvue5U2NUsryYc47qMsug4RppuycvP3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CGueXccp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O0e0yc01; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CGueXccp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O0e0yc01"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UEeluU1036262
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 15:05:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nY3zkg2YRAA
	ysLf0KirOWBWOyj3MyV6U/tbCO6aFw0Q=; b=CGueXccpKOQQXLpW1bq8rcD0Mgk
	bAZYPp6J4raj8rwAH4Tw3mTd2nYVkwYj9guwfn8DK5UO27DZhG6qYjlIZ8nC0AL8
	Qw5Ta0X9oJm4lwhfnhw+v/+KKyprb0c319uoqKDrcbpYS9idIMAcWh8Bn1cGQkMM
	2RAjF23ehdqtb8U0Fgn/kCLQcFhlJF2mueP2QdZPDoTMu4JBkN5/1apKp7uuDcjX
	PuEa5iEr6jB1FzUOvr1j5p5b7s+7twUQyF6bvKqxlI3umrt3h3DbdxHG7Nf2QXs/
	dXV7Pxu8TRMkM5N4Knp/4cQHQmISxrDiauIN9iXzkBbwLcU1MiaVpnM4NAA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8k604jb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 15:05:34 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-96dacd0abfdso418743241.3
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 08:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785423933; x=1786028733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nY3zkg2YRAAysLf0KirOWBWOyj3MyV6U/tbCO6aFw0Q=;
        b=O0e0yc01JhpziedPgjDkwJiVfz4z7l119wotVSP9MrxxKFQDrHMi9r/LUNcYSpp5j5
         GOMhCB7AED48DGrKJHSnRbBS28zZ9j2ih2UipDEbzGoet9v22h1xqFcbDv7Umb2YXjF6
         UDCHz+50NrzRLcm30H4I0AmuLeIazs0uevnvcJ/uIT5aC3eWbK5P4sjNH1KGJJ9QEv9e
         HC2kjsxbKUWPRVLsVlKHgdo/74nidYqsr9sRjmo5BE9P1a9dVku9+snXiADlWI0NsqDQ
         a39rPwa1wj8rGuCwBt+022E4uJXwIFMakh00EVY/Sv5NQIIjmaJCoVOARmRVkAFLD+cZ
         dFig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785423933; x=1786028733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nY3zkg2YRAAysLf0KirOWBWOyj3MyV6U/tbCO6aFw0Q=;
        b=gA5NQUZUfbbe8UE+NCVvRuenkPl+NpjYVoMlDn6T6chpUSOTvAWVcd2A4ZWYYAkZjH
         h94UN9zR5fAqYzl1ht1AWLaFdhH8Hq5GL7zsSFVANGidTCeaNlVeNGX/LM2MvXWCYuHk
         dRJPxLFp46wIwDksfayvx8dMaW52HQVRJQT4xAiZNrosx5d2qm46BkwlAWjIg51A6uYH
         ijSoQQRB3X5pD+Ak1D344DErBKqGEJq3RalzSmBN3T1sqGsNLiCTFxv+o1hxOJK6bgNu
         eOxspYv425sBPK13+f8m9lV/BZFGsMUjljucqnGdjqQ4Ftmj0V/ufDIttQGld3+O4s2w
         D8bA==
X-Gm-Message-State: AOJu0Yz0G9JjP+9BaFxstVcCFt3sbkdi/BmGqT9XoEhAk8KdXxEbKGvD
	8iAi4bmRrGHNT4MY8RDsVCHenovPQGiP+sAeYbkvS6VYnWM4wmEqhp/Pq8ZnPnB5UbptgkO4+gA
	vWwqdfNzi4VWssj1to9IIukFpGfwEERy8u+uEV236zCzHwyGN371Srf1XYECRn5PHvrvCwE1ZlE
	T+
X-Gm-Gg: AR+sD12bmytpb8G6d2sOHddw1+Pwvifa1yKeNQAX3ppWRVhXTXO7agpTCJSGtolws+/
	9wXQCVW6lP312dJWG9HNp1OrBt+fjlv8YfsazyBOq4Z2VWSkniiij1Anjx6zwRbkQiRi90HOk2D
	goGFHrGcoQeDYm/IhaeBy+G/+7g1P5lfPYDIOkAi5C1QX6TPAkDy8ubhqP4U8ILhyRIW/Lfou80
	RPCH6Gze9gbwnX21MGPJ0N8mMY18/sqVlTMkWNZMZ+auNTurKignd1W04kgGGTWbLXYtJAXd/FK
	vTHaT7Z+qZHNXPCc8s/t44KRs/O+z+q1h98L3I3f0jb5M8X3yp2SwU4FeWW4hbg+8wNPWVXfyfT
	lIIzid9DKJS7uaAks6JUpS52A
X-Received: by 2002:a05:6102:e0e:b0:73a:322d:1bb4 with SMTP id ada2fe7eead31-7575036f0damr984646137.22.1785423933082;
        Thu, 30 Jul 2026 08:05:33 -0700 (PDT)
X-Received: by 2002:a05:6102:e0e:b0:73a:322d:1bb4 with SMTP id ada2fe7eead31-7575036f0damr984631137.22.1785423932649;
        Thu, 30 Jul 2026 08:05:32 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fa8bf2417sm75211166b.59.2026.07.30.08.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 08:05:31 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: bod@kernel.org, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        loic.poulain@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 3/3] arm64: dts: qcom: sm8250: Add JPEG encoder node
Date: Thu, 30 Jul 2026 18:05:24 +0300
Message-Id: <20260730150524.2659577-4-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260730150524.2659577-1-atanas.filipov@oss.qualcomm.com>
References: <20260730150524.2659577-1-atanas.filipov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: OKj1FbsOxUn1MJerW8ST7G8jull-etlc
X-Proofpoint-ORIG-GUID: OKj1FbsOxUn1MJerW8ST7G8jull-etlc
X-Authority-Analysis: v=2.4 cv=Wqgb99fv c=1 sm=1 tr=0 ts=6a6b683e cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=DnMRqvjp_ngGNQOL0aAA:9 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDExNCBTYWx0ZWRfX4zTv+0clufLk
 A+l/qtx7hEM1Zll4XPlsvHs2hzo0U/faFSgo9cb/cW09MSgHvOn0bSvQU+UdfYiUTG3XZXTVL0H
 u3zSdZn9/pvlPTB3mBoguj/wvB35FEgGlRTbBIUnv890PK/oQC3XEeEPxJ9qZow/zqWYTz+2r9J
 dyYalZ+PG0vBXLq0A5zCLprMn+UfKlSdyB1LG7qEb4ckw3bvVB2ifI+P7iWT1WCNRufyEzkzI6C
 ZDFx5FXMNcWlC4wV7Ol1dKP3HdOOV1/NEC1hn87ihRHdj+kpRCJ4sFZzCyZF+lAUoke+iY0xpdL
 X6cB8XQMYynz1GFo85AjEggGCbjcXImYLc7nNbzuJ0eQssj3aV33aYXp09GjejJS+FKEuBOYS69
 rl/UKKdrfXj3Z9jPQVB7uUve5WWXO5Ig8Q+Dz3JCoDfDUeL+1r7gTi4lbX1LHJnT/zOo9OdiAe6
 6moQ5Mj+de1Mo8ez1rg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDExNCBTYWx0ZWRfX8D/uGCzdjh93
 UU9iw4rkg7wabWm9mSc9aKw5AmJ6+iKtDCPI4LaU76+VW18cLkD+yzLXBJ1nbNyS6XwpKEKeTTl
 TQyScHtqbOytyhmwg40Lhge+cpoYiY4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300114

Add the JPEG encoder hardware node to the SM8250 device tree so the
qcom-jpeg V4L2 encoder driver can bind and operate on this platform.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 72 ++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index f11da2ca4181..d42b29419320 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -13,6 +13,7 @@
 #include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
+#include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,sm8250.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/phy/phy-qcom-qmp.h>
@@ -4486,6 +4487,77 @@ cci1_i2c1: i2c-bus@1 {
 			};
 		};
 
+		jpeg-encoder@ac53000 {
+			compatible = "qcom,sm8250-jpeg-enc";
+			status = "disabled";
+
+			reg = <0x0 0x0ac53000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
+
+			power-domains = <&camcc TITAN_TOP_GDSC>,
+					<&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MX>;
+			power-domain-names = "titan_top", "mmcx", "mx";
+
+			clocks = <&gcc GCC_CAMERA_SF_AXI_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+				 <&camcc CAM_CC_JPEG_CLK>;
+
+			clock-names = "sf_axi",
+				      "core_ahb",
+				      "cpas_ahb",
+				      "cnoc_axi",
+				      "jpeg";
+
+			interconnects = <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "cpu-cfg",
+					     "sf-mnoc";
+
+			iommus = <&apps_smmu 0x2040 0x400>;
+
+			operating-points-v2 = <&jpeg_opp_table>;
+
+			jpeg_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-100000000 {
+					opp-hz = /bits/ 64 <400000000>,
+						 /bits/ 64 <100000000>;
+					required-opps = <&rpmhpd_opp_min_svs>;
+				};
+
+				opp-200000000 {
+					opp-hz = /bits/ 64 <400000000>,
+						 /bits/ 64 <200000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+
+				opp-400000000 {
+					opp-hz = /bits/ 64 <400000000>,
+						 /bits/ 64 <400000000>;
+					required-opps = <&rpmhpd_opp_svs>;
+				};
+
+				opp-480000000 {
+					opp-hz = /bits/ 64 <400000000>,
+						 /bits/ 64 <480000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-600000000 {
+					opp-hz = /bits/ 64 <400000000>,
+						 /bits/ 64 <600000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+			};
+		};
+
 		camss: camss@ac6a000 {
 			compatible = "qcom,sm8250-camss";
 			status = "disabled";
-- 
2.34.1

