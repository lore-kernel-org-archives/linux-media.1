Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793743834;
	b=Xd2BsLV2Xc8vkd7OY6WMBPYROjSPmsGMmVRcyp1hPTA3ZzOc8KFsuEd6lRQfwd7x43oK
	 Dn2HakdGCoFELys2d6pnRRtOtavtbRDb8VTNxBx9Bnbfny0htVDZiFfI+6UXQZBOXMPLr
	 FRuNhmPquxP5PaLxftRo94ERxHyYN7Ngjl/LzHDyyLIfj8Zl2hARFTieF3edhe/qaUpD1
	 le+P+ZTAxPIPNLbV7nQ2bTBrz311j2dER3OJes5b1oQMx4u3oXbNxDST85FkLTojPiH9K
	 wllg6Ddf7ESL32tFNww2cdbxmhQmziKsB/lvcPRXzRAPr91+yRo/TfRNiu7JNPro03w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793743834;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Bq9q8ndWYXWdbsRd1Z+GWT3oVUYG9gG/fVSEYiW0F90=;
	b=VPnTPkOrCsHlRjwSeVhGa0Wrn14wkAN6KHs9BiF1M78u9k/R0IFl7gx0BDCdv8DoMD7e
	 24GJ3twDBsTP/1/Ubv4gr1LeY3ZOkHVOCW2CXw//8LHDI66b621JMuqEWHhVczPnilLZI
	 Sk64bZP1QecQRD58B1ZJZ8g/Mx0sHaEjSnpygc/Tc8yEw33MfKs2RpO1OrfqMhvj1MUe+
	 TCYCbo/XnTg4tiQMWtTbS9exvb4D39B0fNO1hpnZHo/n+97l8CyWnP51nhIBSA7n8/Kct
	 TzypULGRlJApG8IgYIlJHGXaewdKl7tv4ZcasuT1df+KJd4mr/FpbmowHZKIiLKSlzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FQaOW+56;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qcs7M+Zu;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D683606D81F
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 22:10:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D683606D81F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FQaOW+56;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qcs7M+Zu
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3LKeh83993600
	for <linux-media@vger.kernel.org>; Tue, 3 Nov 2026 22:10:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Bq9q8ndWYXW
	dbsRd1Z+GWT3oVUYG9gG/fVSEYiW0F90=; b=FQaOW+563c4HsUkcfSoXlxl935i
	pmRLBcxWVsalSW7ggAyR//Xn1rfCBEs4bGK19uJzclpfjm3/FSmmTbN0Z9Oa8WHo
	IhZ7JcGjdKOhH1xjnmwofY65Yc8yE6bqM3sIpnS2YVa6ts9FGWLfZTEiOTED2/9Y
	27NEEWtKabSa2N6KcOS8s6YxjHsbpMVjeFoxfNmIBZAISpd2Fxskc1S2zQECUtO2
	3YQoMpTZkZMaYU14/ylp4Uu2wgtkr3kDppy7XfmiU2QMXLNQFqpCv4tJ8MMBqdYp
	3+VOaH0Z/5kPFw05UQL8qvLatsXe5Daj07zTQ2JAr7kJydKCFMI9RgTWgtg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8ngp3y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 22:10:33 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-139b62317d0so408452c88.0
        for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 14:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793743833; x=1794348633; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bq9q8ndWYXWdbsRd1Z+GWT3oVUYG9gG/fVSEYiW0F90=;
        b=Qcs7M+Zu/72tNDc8G4X6wTnmMVxleGFbW+v3LGeJhhFDtIi8Bz8OMlK5j0O1wG8P+Q
         pXQQrAD5g/6LqMFpHcEgZmqXDE/TxJsnfFYlEIlI6XuNNpDY0OGgAOh/vLQz+QGbsSXr
         RjKTgmlt02XoZetPolivlM/45DkgD+WSwxxW0F0cv4qivmVSob/toMR5gSzkRk81kjKj
         UVO84Tn9a2wKMzR1VYKhk31D9q/LGw3pLzs+YYrMEOJRBigdGCfJc0VKGG2cDNSDA6ZI
         v12R/v4lQBXOvh1jbfFPCrFL11WaxfEpjrxhX8+wyU2h6tGe3RgfZtEKNZBJmzVhbISn
         pSVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793743833; x=1794348633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bq9q8ndWYXWdbsRd1Z+GWT3oVUYG9gG/fVSEYiW0F90=;
        b=hMNmWHC+81BkWi+NT0YcefEUvZiOvxKyp4FLYMzBqd0987fEZLCJp4g99R3Od9RLgk
         QRLFo14WYwhiNdga+qfWeOfdPDV0gZMlA4xS+b6LexQMU4zXPAJeWMW/spaNjvV/pNkW
         CgkL6G9i9SaBbGZc5guBbwzJqR1iEIdiLO7+swmhcJZSh1i9ZO/7a/Si8pWG48Dmo5Q9
         XEO5l8EEXhuKZlf2MXs2TgR/NESetSyQ0MpTrExXRbnruv/XKWCDAM98t7MPGzPazPhZ
         ZlEQv03bZzz4MrOffhmiiLhXKHJZJOYLaypLNQnr4gqRVvYLsMHc9+cxHRIznPQ/ohn3
         zO5w==
X-Forwarded-Encrypted: i=1; AKwUvBxn7/oc1C9wYmKaF/bHZOVmrjw8mVjwEqib+st0HseYj78Pou43CjC00h/i/cKvuo4YRVD5E09lXLy3fw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+APks2LFz8h4Sdt29405RS50J0rouw78J0UcqXVxXPc8SCOmW5
	txz+6IWc+PaYlP3KHBUAy/XhRUvnoIWqEU3tuOanu8NKDGxVQHmam1syQoV/wcj5K+Qe52s1J8B
	avkE50hX/wtvUziEH0fEwz4CDWn0EWOzQ5TJ7cv2IyKaOoVpYQAFdO50zxpkpPG2/9g==
X-Gm-Gg: AYBFou0hKEfodvL2LAr8hOxPgz6MjBKBnMTDYXuIli9dpblEH5qVQlgEi2CQ89nexeS
	WEjDhFFIMazwuVU8AqcWT/9zV69oHSglMtK3JhhNnQc0+ig7JmI0+foiCXp/IGdNxESIUCOA1c7
	EfbpyaF/1NxyH224O2ARKNwvDji1v+qr7JwzCVMeK2LkUR0mITKG/pdpxXQR4GqlpKJxvGXPzCd
	XnrwHbeXsnzBLGethNX8PVlqrTbK5eUHIxPjGLo4oWmPWJh3Z1LXiQD0aojcldSZXgtVdQtBLP+
	pBmk+yjVaJjAbb78vcPxMcpnTDRfhyNh+CAP04RNm2CGJoX/9ahWVA//8wUiMcJRR+rwJaFB13s
	V9W6qzXqafyxiKSEocC6IA6KaCCt/VRv/gc/wF82FtSpr3ThIJSfwENFJGtNpOUyJwL3iSNHOUW
	cEpCJLHI+TJB7a1nNTuUH2Qy1TZUQ5
X-Received: by 2002:a05:701b:4589:b0:19b:39f4:88c9 with SMTP id a92af1059eb24-1ac5bbb487bmr21042073c88.10.1793743833067;
        Tue, 03 Nov 2026 14:10:33 -0800 (PST)
X-Received: by 2002:a05:701b:4589:b0:19b:39f4:88c9 with SMTP id a92af1059eb24-1ac5bbb487bmr21042036c88.10.1793743832370;
        Tue, 03 Nov 2026 14:10:32 -0800 (PST)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c4706bsm2137312c88.15.2026.11.03.14.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:10:31 -0800 (PST)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] arm64: dts: qcom: kodiak: add CSI2 D-PHY common-phy providers
Date: Tue,  3 Nov 2026 14:10:26 -0800
Message-Id: <20261103221026.3662383-4-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261103221026.3662383-1-anusha.nandi@oss.qualcomm.com>
References: <20261103221026.3662383-1-anusha.nandi@oss.qualcomm.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA4OCBTYWx0ZWRfX0rj+96iyHx3p
 FH/I32Y+1LOhH7kBWPRe13n/a7ceKUvp55le0sBDVZU3h7W9ZPl2oTdhm7VD/jJmEaVbivLVkwY
 g1UOgnnbCIbeAdh07eLX4apccL95eCDJ4l3sQP+3fMncoy6cewIqTMJzgkbXLKKL+ZlupgcG4u6
 4SFMAvXc0wxaBjPb/eKhAL5OZ8CIxbhhZspjloXvsVavhzAB+JVxpLGax3cce9BeaFRBuVS6aie
 Ox39DdX5AGW2G9y50EGPgLO6eTNvkYtdKtmzlwybMqV4mOH07VUEuQ0nsDgvzbH+l4XJJ8sH+JT
 kaxo4g8YyqvYu0TT5M2QtX0Idu9YXetuHEvXFR4VNdOduNQVRl70mqonmpKlmfnqXoire2TLDY8
 jVG9qWJo31WvLu1+cdiYu+fsji2QHgCi1oTgr0v4b3tICjmF5EUHmojFgJuCv1YON/BacJjx9J+
 Z3fctjaN9GlFfHiTKrQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA4OCBTYWx0ZWRfXzSGOVrF1e1Fv
 /gWEAXriYhrk8KLh2CPmpDL708OIHbJB6NAISqjNPLauTWCXsdt/W2DDTQeg9NrTGfqVJKAUH0l
 lyazXUXzQ0cHywzD3+4tEGF83xmtIF8=
X-Proofpoint-GUID: 2Mt2nsGPiMnduwsbSvJq6bUQuoZsnlKy
X-Proofpoint-ORIG-GUID: 2Mt2nsGPiMnduwsbSvJq6bUQuoZsnlKy
X-Authority-Analysis: v=2.4 cv=As17T+9P c=1 sm=1 tr=0 ts=6aea5bd9 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=AEMvfOE69tE_Q1r2TxsA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_05,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030088

Expose SC7280's five CSIPHYs as standalone
qcom,sc7280-csi2-phy generic-PHY provider nodes (csiphy0..4) at their
existing register addresses, each with its own OF graph (port@0
sensor-facing, port@1 CAMSS-facing) so camss_detect_legacy_phy() picks
the non-legacy path once a board wires a sensor through one of them.
The camss node's own reg-names/clocks/interrupts for the CSIPHYs are
unchanged, so boards that don't use a provider still get the legacy
binding.

The provider nodes are disabled by default; a board or camera overlay
enables the one(s) it uses.

Reviewed-by: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 172 +++++++++++++++++++++++++++
 1 file changed, 172 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 8c7523602d27..3f3a41cfaa00 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -5164,6 +5164,178 @@ cci1_i2c1: i2c-bus@1 {
 			};
 		};
 
+		csiphy0: phy@ace0000 {
+			compatible = "qcom,sc7280-csi2-phy";
+			reg = <0x0 0x0ace0000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
+				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>;
+			clock-names = "core",
+				      "timer";
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
+		csiphy1: phy@ace2000 {
+			compatible = "qcom,sc7280-csi2-phy";
+			reg = <0x0 0x0ace2000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY1_CLK>,
+				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>;
+			clock-names = "core",
+				      "timer";
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
+		csiphy2: phy@ace4000 {
+			compatible = "qcom,sc7280-csi2-phy";
+			reg = <0x0 0x0ace4000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY2_CLK>,
+				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>;
+			clock-names = "core",
+				      "timer";
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
+		csiphy3: phy@ace6000 {
+			compatible = "qcom,sc7280-csi2-phy";
+			reg = <0x0 0x0ace6000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY3_CLK>,
+				 <&camcc CAM_CC_CSI3PHYTIMER_CLK>;
+			clock-names = "core",
+				      "timer";
+
+			interrupts = <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>;
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
+		csiphy4: phy@ace8000 {
+			compatible = "qcom,sc7280-csi2-phy";
+			reg = <0x0 0x0ace8000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY4_CLK>,
+				 <&camcc CAM_CC_CSI4PHYTIMER_CLK>;
+			clock-names = "core",
+				      "timer";
+
+			interrupts = <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>;
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
 		camss: isp@acb3000 {
 			compatible = "qcom,sc7280-camss";
 
-- 
2.34.1

