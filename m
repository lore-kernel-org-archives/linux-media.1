Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795502656;
	b=Jo7064bowQdCfP7MnFdCQ5oP2RqJZxhYNAEmgr7XCf8LmNRJsMew2XJl1ANexQJ2NCIy
	 C4NFoOz9XFZvhIQnVpljjsiwJZY8v0kWOmyf3MuFYNGyYcGHzJu7JqXaZIXaF7Sd7rSul
	 0Zzgu8v9kmuj6FU+ceX14OICc2nC4Sc/8Lpcu7PqSWk++zJm284mP136fZfqP3KSj69xI
	 RVyclRcJjJO228ZVgs0wg+0aoSIi5DXpFtHrwr3ownz1r7dr4GgTdSxHUDYgU/DUquZHM
	 EBUDC1uwv/zfMi28Vqvt4Sq1X9WooIAH25Sq9OqqzG0HyPGVSXeYIP6MdsrDB6WAJ4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795502656;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=NJlO+n9QddxiQfqLhWfnSxFjyd5KcZXhTMEEZh7XIK4=;
	b=XkbwuxaWAg2KFj/BRFICD5XFdZz5ygP1YtMn1aFlNqo+fk2k96M9k6uYURfD34jUyItY
	 AJOKGAsUqqmgaJFwVRMREZF+yhZO+t3nY1EQLSqZ65QHwCx5uFvLj54A6Tmpav8uEnxyS
	 X2FiXyhZakuG+sFNiU2vV2ivsaDOnLKhWf1GJKC8s6Q7sTz4cPza9xEuzq4niQRvs8RaM
	 x3PU7MXXPrL4/b+ckAqf/mNpaMWtS7tVGPjLoG/6xBDlJE6G3k+sw8LI1dhavJxDjwjYF
	 VAUwWG5dl1CwxZJB+G09JQno3ArdKFMOjqCUG3yU1+1ppWkQfxnSfdaPzDAaRmjVqjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PjH7focB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VfSWUqQA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A64660A260B
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 06:44:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A64660A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PjH7focB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VfSWUqQA
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO2kJnA3850807
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 06:44:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NJlO+n9QddxiQfqLhWfnSxFjyd5KcZXhTMEEZh7XIK4=; b=PjH7focBiqaa0ZcR
	XISc8LNbhtosAMxTl3vqQzThZ0Tt4mgpcUFq3X36UlN9VFBNlAFbGlnp/tA/EbWy
	avzuliDj2EYdnjovzHWLoQyLv7UC7CJsPN/ZuA24/TsVmVFBzNzEiz5aerg2lvKU
	E9ab6LSiYiMKtF4LyErbvc44tMl0yf8fRVBpTtzDk8ceImycUTZ29a6zjL+b3Phy
	TyJ84eMo6yg2gv99WgDtahE/oQRslkBwKlrMocRqasgrBaHvOkku3cT9bksPMIDJ
	4Ex3yaU++NEuQY2u2J8SXAI6290UGQIwt3jmjpOGSalIdH+Hg8r93KmcwHzCgKw+
	xaIUjg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yvb196r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 06:44:15 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3869ab689c6so307755eec.1
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 22:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795502654; x=1796107454; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NJlO+n9QddxiQfqLhWfnSxFjyd5KcZXhTMEEZh7XIK4=;
        b=VfSWUqQAvomUy/YAyZeUDz6wqYsZ+Uo81lZylw40WJeKjThMRRklwStkUoxO9mxjLV
         zweP4jLb4Qz2d65VhF/FaFogdqURtbUs3s+Fiwmn2UYwCQRlwPWv39AxGCtGVWqQcQNM
         gnD0WkZSzQrhac6Pm6VrJhcsWo6gHpZrAs1llP5YJdjqGab9PsvuIODKDV/TGgV4PjZd
         SgRkVzXxOb+GMEivStqwr+YbrtKpyMOpDapIhGSMr5nwhlPeM4cETcecYwC6r5MaXv8J
         Fz+iPiFk4z9BL4pPJ5I0siRiYxHB1sY6UNjqd9Pbd0AbUtTAlsx0+rEHA7s0pyQkuocE
         uzXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795502654; x=1796107454;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NJlO+n9QddxiQfqLhWfnSxFjyd5KcZXhTMEEZh7XIK4=;
        b=BNvKm7xwAmb5aYv3R2qO+blRgsA6CjAlqO+JgB04VsyRvV50HPHuJ5xQhvbRkuEU8e
         hwCcdsW0iucZcW4mHuO67e1JooJucDsmzqNTYjne+WVzlGevWi6RWRCtn4X8kZRgSIpt
         nDLRvlm5txuodDh7gcLq5GOtFAi2BqzwLd7cgOzT9hgO/pLQrpJ/1PDLR/qG2wE7RtAX
         gActB4JTbL6PYzao5qFPqenj1iNM/B5wtrdAKcBxe/ksuCxUmAdv7dN11isLLYWbxyVQ
         O/Ou7hH9nZyIkeOyUbbTybbISa4PvtiiNXcPG2uOliA/SSYbpOH3oTSolCK2tINV+uzF
         m71A==
X-Gm-Message-State: APuU4Z9qYae60bDwN2u878GyXaDh+YuzkHDDYTYLOutISfRR6yVZS6lU
	oc72uD4MvBpJK7t9Vb59Ik7AwbYR6jVJDpAoB0IaqvhNxPfsWf+k4jd3C+MFLllARG+WB/7dmiO
	OSUCSpKa7H6KsVK6sY02nIefj7BQ+AVGTMGkGaLCV41PeTw8qb4cQW+Fd3QPCTix05Vt2ohlZFg
	==
X-Gm-Gg: AZFdTZfBwR9qPLUVfN4JIBDKYQdUQzuHkxZVcIbPLtPbYwZmPoR0p5oLE87zoPEMg+8
	W1Wer/Faaq4awTpeoAi1d8M8qdX7BSSSaltiBltzJtfx7LoNfcRCpn+6F2Lg68P1tLxb/8sYIne
	r1YZ7/HxcLvT3Qr+ROofC874Ojx0nAskJKtKY0yfTqw/iCzg0Wzy/ZjsI2lq7nyeY1IiPne4S9D
	6ngi7uOcXcTz43GSQoFMkoc5LOUr6JdWR3djKBaTFcV7A3vWmuDGbwETXqGxmr9DCF1WpzR45t7
	loxcIptYEZnDfovIuJFNvFPLIiexbkenSdCPOCu52Q3qsH8xJA1JnZFgcEhb05ccZFLsbs/TlJQ
	oRVO1/1WJ21P6DnIF1NaoEejnNNrdhPQl4CTIuIlHhSSfQnRgKRhlh67PtcLuMveE2h0vgcAbgI
	kAULeN8piT2eIqWHJVn0Led+TOouCUSzeEEQ==
X-Received: by 2002:a05:7301:18a6:b0:36d:cd5d:d809 with SMTP id 5a478bee46e88-3856e84e391mr21262530eec.1.1795502654047;
        Mon, 23 Nov 2026 22:44:14 -0800 (PST)
X-Received: by 2002:a05:7301:18a6:b0:36d:cd5d:d809 with SMTP id 5a478bee46e88-3856e84e391mr21262479eec.1.1795502653545;
        Mon, 23 Nov 2026 22:44:13 -0800 (PST)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567ea2cc5sm39265484eec.29.2026.11.23.22.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 22:44:13 -0800 (PST)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 22:44:05 -0800
Subject: [PATCH v2 3/3] arm64: dts: qcom: mahua: add iris video codec node
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
Message-Id: <20261123-mahua_iris_enable-v2-3-b1a16b16afca@oss.qualcomm.com>
References: <20261123-mahua_iris_enable-v2-0-b1a16b16afca@oss.qualcomm.com>
In-Reply-To: <20261123-mahua_iris_enable-v2-0-b1a16b16afca@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795502648; l=2664;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=qjdIwYmv1raoOrxdhbIt/Aie3lUaYl7m0Yszv6aLmdI=;
 b=Po+I1K6UW1QdqQB2jqK1BLYSJklxWdpghSl8piBW/o3T1M44wR4e4eKuHpfw+fvmFEq6Y9V8r
 p+WfVltS/6EC7w9VLIgHImyunyKinqlP4wmKw1XAzFvGS7JvTb19vED
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Authority-Analysis: v=2.4 cv=aJ1lOr9m c=1 sm=1 tr=0 ts=6b05323f cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=2ggMmf_gxUOvV-BHYncA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: y3qrJDX_xOEhFIHabJNomow1VzR4JgUn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAyNiBTYWx0ZWRfX4CINAg1ZsaRI
 M92WsMBU0ZGtObM7PJmJhR0XGbowOZXyX8zeNQzlpu0YZL/IraCST3mB4WEDHpvX39cgYAP23HQ
 qISxwH0fVbPhZZ8QoJSii3y66TcZZ70=
X-Proofpoint-GUID: y3qrJDX_xOEhFIHabJNomow1VzR4JgUn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAyNiBTYWx0ZWRfX1+SqGbs82Qc4
 4QPmeb6eO4pzQ+1vVUXOctTMcskhqAvL45hjyTfDIo62uTsKmrm1cdd6z4m+/OZipCNZ+My7HCW
 wP7jGflTXPBg8OUgVLEcrlZXJYcHAgPtY6ooFPUoAqfapvNHHCrkZyfwU01tyY/8lXg0E5IkRak
 B1yqi5Pgq49i0m4pa2u60b6yLESvSV2BeQyt9A07CfKJNFFE5ExzWzLMdDrDJBhXyJIfWs2mvu+
 U4XXc/s+gEzDUB2+ufQs8VOlJGsaGyEJaJMXfzuYr8ZNd/sAsT8ozP2Bxpz6i1Hd+0nlE3p8OfI
 FkXYub6svbxhkA+MdAdD5p/gPFpr8zbS40tw60+qkBoGfKijVN4GNxGqBHL5KadjzbzBz5vQ8jV
 K35xmhDwV8i7v91UQKqmodHMe/HdAiH1DdbDp4LUS1oYdW7E7RLig05jTeOqVsoJ46zWnjkMNNZ
 hsHmrSoBfj6CYxTLlXg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240026

Add the iris video codec device node for the mahua SoC, overrriding the
fields clocks, power-domains, resets and opp-table reflecting single core.

Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/mahua.dtsi | 67 +++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/mahua.dtsi b/arch/arm64/boot/dts/qcom/mahua.dtsi
index e7141f8c9e0d372aa30f2ac1ecdc5941d249311d..4f018193be50a9f62bd9b0b403a5a6b0a9f6b6a5 100644
--- a/arch/arm64/boot/dts/qcom/mahua.dtsi
+++ b/arch/arm64/boot/dts/qcom/mahua.dtsi
@@ -150,6 +150,73 @@ &hsc_noc {
 	compatible = "qcom,mahua-hscnoc";
 };
 
+&iris {
+	compatible = "qcom,mahua-iris";
+	status = "okay";
+
+	clocks = <&gcc GCC_VIDEO_AXI0C_CLK>,
+		 <&videocc VIDEO_CC_MVS0C_CLK>,
+		 <&videocc VIDEO_CC_MVS0_CLK>,
+		 <&gcc GCC_VIDEO_AXI0_CLK>,
+		 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK>,
+		 <&videocc VIDEO_CC_MVS0_FREERUN_CLK>;
+	clock-names = "core_iface", "core", "vcodec0_core",
+		      "vcodec0_iface", "core_freerun",
+		      "vcodec0_core_freerun";
+
+	power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
+			<&videocc VIDEO_CC_MVS0_GDSC>,
+			<&rpmhpd RPMHPD_MXC>,
+			<&rpmhpd RPMHPD_MMCX>;
+	power-domain-names = "venus", "vcodec0", "mxc", "mmcx";
+
+	resets = <&gcc GCC_VIDEO_AXI0C_CLK_ARES>,
+		 <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
+		 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK_ARES>,
+		 <&videocc VIDEO_CC_MVS0_FREERUN_CLK_ARES>;
+	reset-names = "core_bus", "vcodec0_bus", "core", "vcodec0_core";
+
+	iris_opp_table: opp-table {
+		compatible = "operating-points-v2";
+
+		opp-240000000 {
+			opp-hz = /bits/ 64 <240000000 360000000>;
+			required-opps = <&rpmhpd_opp_svs>,
+					<&rpmhpd_opp_low_svs>;
+		};
+
+		opp-338000000 {
+			opp-hz = /bits/ 64 <338000000 507000000>;
+			required-opps = <&rpmhpd_opp_svs>,
+					<&rpmhpd_opp_svs>;
+		};
+
+		opp-366000000 {
+			opp-hz = /bits/ 64 <366000000 549000000>;
+			required-opps = <&rpmhpd_opp_svs_l1>,
+					<&rpmhpd_opp_svs_l1>;
+		};
+
+		opp-444000000 {
+			opp-hz = /bits/ 64 <444000000 666000000>;
+			required-opps = <&rpmhpd_opp_svs_l1>,
+					<&rpmhpd_opp_nom>;
+		};
+
+		opp-533333334 {
+			opp-hz = /bits/ 64 <533333334 800000000>;
+			required-opps = <&rpmhpd_opp_svs_l1>,
+					<&rpmhpd_opp_turbo>;
+		};
+
+		opp-655000000 {
+			opp-hz = /bits/ 64 <655000000 982000000>;
+			required-opps = <&rpmhpd_opp_nom>,
+					<&rpmhpd_opp_turbo_l1>;
+		};
+	};
+};
+
 &lpass_ag_noc {
 	compatible = "qcom,mahua-lpass-ag-noc", "qcom,glymur-lpass-ag-noc";
 };

-- 
2.34.1

