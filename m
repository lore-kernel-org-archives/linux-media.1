Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC07218592
	for <linux-media@vger.kernel.org>; Sat, 17 Oct 2026 00:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792195887; cv=none; b=i6tTJmTYGZJHazwKHuLMUwBVqdoIIEcYFhEFJX6g/OCV7kYb+rBbHKNy2gw49e8Eq1Ijg4TUsZR6wfh24VMzlXjIjkEBWAipc4H5egr6/LfgREtjKPkYwpkzJT49pcmCiS2+FBv/r+BG3SE34YQaW2EqYXkA6bK8TSvFZu4FtRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792195887; c=relaxed/simple;
	bh=A0Zz0Erj3WgezrqasEyNPWXHMDHXiqrBfaiDJBgicOY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=e9ewuy9bQtBJ1dtw+tTo3fFhqZeL2qkXbA2HTMi5uhiq2yrLhj4hOS3c34utsYvQHqe/CynT243l6VG/VAvFq/wZC7Dqi0CjYD1lqmELKWOco7IJCQzO5ExaztuIAVLb+EmLUAI+OzcyWKcZCv7b9GfxeKi5/0DP0SVbEb6oNq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iAjpotFv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hFbSwD0I; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iAjpotFv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hFbSwD0I"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GNF2ne480447
	for <linux-media@vger.kernel.org>; Sat, 17 Oct 2026 00:11:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZbA8sNUIs2a
	OZp8FnJWKssJSsaTTJhKo7KPYFHx6uno=; b=iAjpotFv64E4Atd/5APU6cmUmn+
	cn21FXItrOT3bUJopqFkK4H968uDr+XGjC0DPyudwazhV2gzIZftd3D6IULAFpDd
	mYI2+rMp5AMecyTVhsJEBAyFC8HPt5hcbuVnOs9WF/tbFsNk6F86r1XMfDps1+5t
	P4S512QtMTMYuzWCSE9qa2hzQhzu4gr1GcmIfP2FmTC3W56iGiztYLDTZ9UgPS5+
	HoMlM0w7cw6gStu35jc9AOUvrtWoS2skYt862m/i51RQ2yknUXm3+E3wjSrF4cjC
	LCpyHw2aYW5uzRJDts+uC7txfMvLzJTsbS0B6rdEWDaCcgoOp50dDHUiDxg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbrvwh2x2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 17 Oct 2026 00:11:25 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35cbea41088so580699eec.1
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 17:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792195885; x=1792800685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZbA8sNUIs2aOZp8FnJWKssJSsaTTJhKo7KPYFHx6uno=;
        b=hFbSwD0In8b7ZXwDeRbPHqmgu9fK4unarHO68IO+1VcYHHYZvUKWukFv5cdYMKMt0q
         xdwSNPB9jmlNrq8JoU/1RhefcMd114RYYR8fJIfczvtmilOyf99orj10wJSa5GRjnDeg
         QCgdV8nnQb1f0PuwX+B+FPQxrFonKZJ2ueCLXlBml90XyiL2aszHdhhbpa2pELyhLbUF
         w/5GPnkiyZInVvqdC1xYMMvYZ0yZmvXyDIKC7KO1TahnPg7Eu3Yc68IhMayNFMDEDrmv
         cNOlyfuU1osg43cpZgCUFPSfKRCe5Jj4d2qZoE0AdSatgIMFpvGNoCrciND1bTwIRF7o
         x2ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792195885; x=1792800685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZbA8sNUIs2aOZp8FnJWKssJSsaTTJhKo7KPYFHx6uno=;
        b=yAayZdPT5sUXNUs0vyb+Le11jY44en8VG56U9ilmFdmattSTx5M997p7I97WD39AW3
         rJ5KPw62IWYaMWb1VB4kGUFc3/K+udMuJwbMtCTfsNFFCXCYvRUg/hZ4X7QGszZUPp0b
         89wYqRplYOZhwngFaobG+iieQdfFQu2UDvqdi0l9d+flzJ6lyoPIqCRuNvC+97/nxf3b
         Pn/BSbIt32BYi1ptgkR/UJhzx+BlCoFblMCQcQUs2Rp2Q8UBxpqODff5lTxhuiq77mNn
         y83QJALgyo23ASN1dGDWxEFAQpMxZ/0WuxZlTJEn4baZMhexRlyuXsFugbKlXWQRURj/
         obVQ==
X-Forwarded-Encrypted: i=1; AKwUvBzYzEBDMJABsyNeExQK96371PlPBZrOak/C8MQ807jljnnhvcKNVJDPM0MPUToeIfYvwHRMa9IIwo1ADQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLht/Slrnc/UXKyBWCbqMQJ7OGdM1yfrvRZiwwZR2lnQxpd9VJj
	2OZPbrlIRaBDFqdNCgDIDDhv9wMVzqBxyx0/WoDOhgBubmboIX2bCH6sHZy0MbNVT6X3MT3fc6k
	hVcJbCgykrL1e8TBapFspugZGM1qS/peSOJwhyFA/IkdiWi3BbFnhgBfdb94t88GiDQ==
X-Gm-Gg: AYBFou1cl1eP9F+ZpAywCF6k/gRntmVDSd7mV3N0VJTneXj0BI//+NtjEh9nNfDpaLX
	wWfqpaJ2RhuqcLBq4ZdY7uCkqS8rcCr1cqEjDL56nrFl5Xqga+2g828NrzxBZqPMOMOOqmCDq+A
	phPoJDgYr+A3bsruSdey7lmoofoiGrEDieOd4v5grtxtVZJZtlXDvGymMcLDDc7tLDW8PJD0FWC
	kxwnryOA3XBQvLE7OuW69TtvBRQiulu5IKu3EQvMiWw3Ht9TlDCPrOwjIX+Nk2NxNzv8U497fSH
	La5TWGuGlf+q3Mqra1w/6bYAHEeP7EWhKC0raLwvDm3NcTIAMF21NzftNQMnf+UqI85nvvX6uGz
	uMyQfy28e4d8yzta+0NEPU9M+vNTR3RCjjlbS+yaVLnrhitpCIz0m/Q==
X-Received: by 2002:a05:7022:438d:b0:185:869a:8c64 with SMTP id a92af1059eb24-185869a8c8emr1634555c88.1.1792195884965;
        Fri, 16 Oct 2026 17:11:24 -0700 (PDT)
X-Received: by 2002:a05:7022:438d:b0:185:869a:8c64 with SMTP id a92af1059eb24-185869a8c8emr1634527c88.1.1792195884434;
        Fri, 16 Oct 2026 17:11:24 -0700 (PDT)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831a6f58c2sm13441361c88.11.2026.10.16.17.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 17:11:23 -0700 (PDT)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        bod@kernel.org, vladimir.zapolskiy@linaro.org,
        loic.poulain@oss.qualcomm.com, mchehab@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, gjorgji.rosikopulos@oss.qualcomm.com,
        jigarkumar.zala@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        linux-media@vger.kernel.org, krzysztof.kozlowski@oss.qualcomm.com,
        daniel@quora.org, konrad.dybcio@oss.qualcomm.com,
        christopher.obbard@linaro.org, alex.vinarskis@gmail.com
Subject: [PATCH 2/3] arm64: dts: qcom: monaco: add CSI2 PHY common-phy providers
Date: Fri, 16 Oct 2026 17:11:15 -0700
Message-Id: <20261017001116.2318647-3-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261017001116.2318647-1-anusha.nandi@oss.qualcomm.com>
References: <20261017001116.2318647-1-anusha.nandi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: uhydMFHL_Sil1hioduAmBjAqOWhOM5Yg
X-Authority-Analysis: v=2.4 cv=COa/zhrD c=1 sm=1 tr=0 ts=6ad2bd2d cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=n2D47ajo8674fvOcmZAA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: uhydMFHL_Sil1hioduAmBjAqOWhOM5Yg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAwMCBTYWx0ZWRfX9JAvM1/xcds0
 SpXzrCygKwDzVnLOcHWm6jk3VCjnVVXp+UbHNF6K7p5gWMRsk83ZljTEyu1jeABJHCh9qWuxkJb
 qeit13GvFK5OsOeZDLyrB7z2OP50IfiK8XTsnYgrmqe468JLVdAbDgJEZi+S8b9//gFmteFuICz
 cqYQp0juNgs6Y0wAxjUzxt2rPa/wRlbiH3coITvF5snMisVA/oeguxQh8ag2k52ZzHm7jnS6XK7
 ShEzi8uDq2Wb1ASS8pftLsF+WSkSl8k1GHYzcIMZeo3wBbN/+Rzg9UdC0v8zC3tOsl0u+4h6qKy
 fYYVbd7jzbxx+VBHrJ1HywU1DtVe/XcFSLmzch3HIk+8aefphN02O5dF3wYWUQC+/Cv4h1c1h8B
 P/uvOacAjiXie919BKo6cMSWUOB5UVv5WF9Szeh9uc6uACgP4GhL0nc87MVoekN/KyuInB+gYES
 EdZ+9NsTPAQ48NqLW0g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAwMCBTYWx0ZWRfX/wS6Fqln4UJJ
 Fbt4Bu5dhm9xA+4Gw5cgly3UxwgZXujbyHjQIB3jGaqAb9pO9qyDrc5DZLRE/eB4okxFOIclgdb
 u42V7uKlBdUJHomVuRaFuoH9IN8bDfo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170000

Expose the three QCS8300 CSIPHYs as standalone
qcom,qcs8300-csi2-phy generic-PHY provider nodes (csiphy0..2) at their
existing register addresses, each with its own OF graph (port@0
sensor-facing, port@1 CAMSS-facing) so camss_detect_legacy_phy() picks
the non-legacy path once a board wires a sensor through one of them.
The camss node's own reg-names/clocks/interrupts for the CSIPHYs are
unchanged, so boards that don't use a provider still get the legacy
binding.

The provider nodes are disabled by default; a board or camera overlay
enables the one(s) it uses.

Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 114 +++++++++++++++++++++++++++
 1 file changed, 114 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 395d32d36844..166861146074 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -5562,6 +5562,120 @@ cci2_i2c1: i2c-bus@1 {
 			};
 		};
 
+		csiphy0: phy@ac9c000 {
+			compatible = "qcom,qcs8300-csi2-phy";
+			reg = <0x0 0x0ac9c000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
+				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>;
+			clock-names = "core",
+				      "timer",
+				      "csiphy_rx";
+
+			interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
+
+			operating-points-v2 = <&csiphy_opp_table>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+			power-domain-names = "top";
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
+		csiphy1: phy@ac9e000 {
+			compatible = "qcom,qcs8300-csi2-phy";
+			reg = <0x0 0x0ac9e000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY1_CLK>,
+				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>;
+			clock-names = "core",
+				      "timer",
+				      "csiphy_rx";
+
+			interrupts = <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>;
+
+			operating-points-v2 = <&csiphy_opp_table>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+			power-domain-names = "top";
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
+		csiphy2: phy@aca0000 {
+			compatible = "qcom,qcs8300-csi2-phy";
+			reg = <0x0 0x0aca0000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY2_CLK>,
+				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>;
+			clock-names = "core",
+				      "timer",
+				      "csiphy_rx";
+
+			interrupts = <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>;
+
+			operating-points-v2 = <&csiphy_opp_table>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+			power-domain-names = "top";
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
+		csiphy_opp_table: opp-table-csiphy {
+			compatible = "operating-points-v2";
+
+			opp-300000000 {
+				opp-hz = /bits/ 64 <300000000>;
+			};
+
+			opp-400000000 {
+				opp-hz = /bits/ 64 <400000000>;
+			};
+		};
+
 		camss: isp@ac78000 {
 			compatible = "qcom,qcs8300-camss";
 
-- 
2.34.1

