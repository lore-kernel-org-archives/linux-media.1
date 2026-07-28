Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903613FBEB8
	for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 08:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785227168; cv=none; b=eHB7sm4UIM1jD7v+T9VM8U670d8gPM/rjYpC6Knoo5wAP95Eo3tS3QL7T4VOm9vrAck18PBlbgLlye408A3l7X+/aHnh47sIWMZBRRWtw/4u+FlH39O28kgx1+pp2jqeLkLGbPwSMqD+cL5Ib2H04W2Y/sRhAdYBZYQVazZCREY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785227168; c=relaxed/simple;
	bh=hS3lXgdrBXw7eGpfbI4LKX4+rK3hd3zeyFyr/fUORw8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VC1PongiIpy1kkDchBPGQIl7fQFvaB96nFJunjk7xdMoFHH3VWsuRGSn0l0h3VYQNpOCigC+a8dzu7aWYzYyEQvYFw0XyzDvJhszaiJAhGrOWjJ5qVjUdj5NWFyWFlPMzPlKFFdzCopxEV2sX+smhEd3Ii9h772eLYMIYEiwS1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CL8K4iap; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gSMD+6cq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CL8K4iap";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gSMD+6cq"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S82KjH2318002
	for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 08:26:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fcpw2t2oCah
	4S/Fq05PSoMHW3xcIvuqO7Z996ChFYso=; b=CL8K4iapLLCpMI/pc7W+STnNybZ
	vMYfMTgwJDdQsfHUGsrpaNZlJ5+Dhoo+Ar8mW7L4zMi4pf2713Wt5U/tgqQJIsB8
	REiOWuFullAuTAvGYdsWUlM1KIbcbUuoT6Fr6rpY+xrVaVRen6/gPt6Wk749gEaj
	kiBFHwhqQyN68zc9DrY5byXlezea3hbtt4XfD903EJzGCQxjGejiot2AqH06xkS+
	Tx1Hl5dsSZsiaR/hfkrBB6gRETFW27wk/UN9wJ9Xa2YwUsac2HvGl+CY72XNsnxf
	yQnV0GRdJoyjZWi/U4F3v6lBhI/kZz3oNqOwJDiAe+ZZM4h0g5r1rlxznEQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpadkks73-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 08:26:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92ef31cd429so364515585a.3
        for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 01:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785227162; x=1785831962; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fcpw2t2oCah4S/Fq05PSoMHW3xcIvuqO7Z996ChFYso=;
        b=gSMD+6cqvlPVjW46L2RbiU5lWkogbaHR4s6dWbLsrBVdFcTBvZSyycVfaqhV3aceyQ
         ZRKAp7s4P9G6W4pMNhXJoB6qbAH+wsXhqUJV0iOk1rVOeBvqLpPDxud1u/c36SXO5+QH
         CW71Vy2THMH1OcWJevcoQn6EAHVojpwyGBSU6KjuAaTVgY4/pIGtU/NRkJUhk777OkNB
         DzDUQRtgjk+oEGhSLYRD4bxWatMn0XRxgB8hs5QaW7ZAcNc6260ejR7Z9I71qGkfDb5s
         0FmVsQ2rDqvquIK05aocxqnOy898BaYix5Bn5C8sgL6rpLtUja2pA0+140FEFSQX1H/f
         rcSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785227162; x=1785831962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fcpw2t2oCah4S/Fq05PSoMHW3xcIvuqO7Z996ChFYso=;
        b=m4nyUipAPSi8vkihguH+Sfpu0H1RlGWTfbe3oHJ0UjPF+dNe4y4+Csi5NnEdRq6Zlr
         AFSHEPnQypkDleG1Blz3aMhPL6NjulmH8i+eMm3olZrArY6AhhUuu1lMZsbKU3L58cXo
         qgytvkpAhK7gU93PRKen9ux9C9tMTAsnmjZLcotgOoEmUX0rKJjordG5yjkShjisYO5a
         7sB7g/zxu/7KeiIFyHf8EF6LaZItkpfcCyhj5TAWOmegav8C9qu6a4Ofr/YzJXpG9Uq7
         EIPDtjhkUIX5P33l2+3DXiVKZGPCRd74tD24KNghbQKpGOwy7YX0Hu/E9a5B3p4oA7P4
         diMw==
X-Gm-Message-State: AOJu0YxWg6J+oRPeO2R0Lp7i7SpGh23JKxc0Kh8LuVCr+q4p6dm67brw
	kc5up4Kv4kQNV3LX4L8x79vdzzuENnmgD8HzODOBB2CA6D2Pbkelo1nu4isBPYama9eGqvN+f/A
	+ZxdAzx3OXwGoqc0s+eJbsSbtzALR9DQSL6D8Xk48gyEtoELUM7wuClkT+1Dj/ky/Fm0YUYdLiC
	gR
X-Gm-Gg: AR+sD10VX1M1+oru7HDis6zfZR5tw9WEKLtyDdeXfAVOiUie04+8yKBV7Dy1csbQd0z
	hpQAIKV53+4+9/ziJwoWA6+UNIybsa06zhcfea5Ms7PGc26AAShUI0wF4s8qLThkAGeR67V1R4B
	TTYNhY+JmXtWLGEScRbmilX9hEMlKw9L0CrWmH2kdKoiCYMt86lTNkvGx+k+Zgi7ZJiRGF3Gz6i
	oTdEwMyrHFENyyCqsRX5m18VZz2JZS61aigacKsafNo5ITrYQjJT5ikBc7NJmX8ia4q4EAjG8/C
	tRS0ed3lOxLQLFjW3IGvmJyKmCD7K7pqA2jXlL9qSHzZjNT1M82MptqNqbeZ+5y/R0BOKQteW7/
	wmV2t3rqkFkvV5Fa6Oh6KvSsg
X-Received: by 2002:ac8:7c42:0:b0:51c:7b12:5fee with SMTP id d75a77b69052e-529d7198b2emr9867151cf.74.1785227161651;
        Tue, 28 Jul 2026 01:26:01 -0700 (PDT)
X-Received: by 2002:ac8:7c42:0:b0:51c:7b12:5fee with SMTP id d75a77b69052e-529d7198b2emr9866971cf.74.1785227161163;
        Tue, 28 Jul 2026 01:26:01 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69fb5543370sm3585484a12.15.2026.07.28.01.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 01:26:00 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org, bryan.odonoghue@linaro.org,
        vladimir.zapolskiy@linaro.org, loic.poulain@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Subject: [PATCH v5 3/3] arm64: dts: qcom: sm8250: Add JPEG encoder node
Date: Tue, 28 Jul 2026 11:25:48 +0300
Message-Id: <20260728082548.2511694-4-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260728082548.2511694-1-atanas.filipov@oss.qualcomm.com>
References: <20260728082548.2511694-1-atanas.filipov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 675Ghj69PjWI2Yffi75v9gJgXBaJuzzC
X-Proofpoint-GUID: 675Ghj69PjWI2Yffi75v9gJgXBaJuzzC
X-Authority-Analysis: v=2.4 cv=Ns7htcdJ c=1 sm=1 tr=0 ts=6a68679a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=21In2shxhfGbT1B4NdwA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA3MSBTYWx0ZWRfXzWLJUI6v5v4H
 5/ileMOaRqOaTdWktJOe5Ea+MhpwfJ+NFKgGN9S3terZcf4KuHnokLwZD8HF4VUF2fLsm3FY6bb
 UZ2l/7nq0JUVpcbTHPg0KrUyxv2Vz+QwmTIrCkb+wzUddQa/Y2FRCr9MJfTmPtqF/QN0+3ayfpg
 ceyX82Hj7EtGO202GASL8MRcUsmSaHTSLqdxKpQARAgfieypkzb7ijE52CUSuK4enoJ9osTuOxX
 ES3PHo5D6tKKlbCF4GLhjFtUe5bgDoR92cUHFiNWqjqMJXOSUfdFQGh6u8SqTOgUMsEeTcV845C
 XoUF2CnySYSBW8BQpjDnUOPuGpjNt+ZcURPD2jFppLdAGlZffghxZFBFVoNySQZtMqmzVNmcNwq
 c+UpMNJhzAjbHhSReHV5h9KIyHbyzjkIQjB3yldUW78cEF/J3XLLY9TY++OlZVFD0iCA1HjVuaj
 pXZMYP1lHCJbZ/G750w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA3MSBTYWx0ZWRfX/TIJ9jdX12HS
 odQux7FZPj75sexCXBCKW8+mfx6c3V/54nbXtqUWOaMNBkpU+aAbBAamNkPpLeRBp37OX+/QSnR
 0NQnYWBJMldi7l7AZGRBrsl9CYFtdNI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 impostorscore=0 phishscore=0 spamscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280071

Add the JPEG encoder hardware node to the SM8250 device tree so the
qcom-jpeg V4L2 encoder driver can bind and operate on this platform.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 74 ++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 7076720413ab..98935f3fcd05 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -12,6 +12,7 @@
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
+#include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,sm8250.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/phy/phy-qcom-qmp.h>
@@ -4469,6 +4470,79 @@ cci1_i2c1: i2c-bus@1 {
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
+			power-domains = <&camcc TITAN_TOP_GDSC>;
+
+			clocks = <&gcc GCC_CAMERA_HF_AXI_CLK>,
+				 <&gcc GCC_CAMERA_SF_AXI_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+				 <&camcc CAM_CC_JPEG_CLK>;
+
+			clock-names = "hf_axi",
+				      "sf_axi",
+				      "core_ahb",
+				      "cpas_ahb",
+				      "cnoc_axi",
+				      "jpeg";
+
+			interconnects = <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>,
+					<&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "cpu-cfg",
+					     "hf-mnoc",
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

