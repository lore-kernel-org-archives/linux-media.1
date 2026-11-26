Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674749;
	b=gU32mItbtrjwK9klC66X1pJGOYmiXjOD69nUj3KkIYWYkEcDOzk3jq2u6y7wRwhMHgRC
	 4vRMo6sMvKzXuqLc5oPJgJAg8skvw33rHSwOl2KTjwT993vG5uSjWiecUQQQ3r4sMw/p9
	 4sd0EOXQuQyCbFm6G8/gXrcU66LkVH0p3LhTHsWBsJKaclsZ3usK3tzMgQCVJer9hkybU
	 SSStqLdgNs4Fb4ZCUzA32+DDDZMXZR1cIwyOpXmoCX7V3qgXgaNZ+K4tnNmfEqdb47gjy
	 LDCHTn9EG8un8/vbH+JqsnQQAFZuv2j5Veli3gjD/bzAzxPopRKl/J7AQBwix2aB6Uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674749;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wXveSJFcQwL36raoOk+JqlDXdJhqjUXocXOXXRact5g=;
	b=2jZYduVll3LJ57PM9xJyg46qN+NIia6vSFEu6mp3TrJHbdKVZujPCM3EiQzjyaTIUFr7
	 kHieGfhJOr3Cjdi2IxSfJNYVlAk6nERTWMm2s90cWxHEguBAEDm5El1+lID3sTnvGabMU
	 piPrPo7MxbcqZqXDpGaDHB9Tzyp0f5KSaKWlWKz//Mu6iSWsmHL606bgHkGX5qN/S8nGe
	 52Lwcbj/l74BuKFpk54EvIkxPVxVZ9tqGewHy2/Zoz7H30RCzfuY/SGoCbaeuKWw/o9EQ
	 kry7dyQpBU5mHC+xU0qKrtYOPfcZ2HoiBrayz2Jnn5t8+zmOuYtxTuMsGNekj2/HX0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m9+p5TqP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jVXVTUti;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC36606A334
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 06:32:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACC36606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m9+p5TqP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jVXVTUti
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ36VvD2175782
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 06:32:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wXveSJFcQwL36raoOk+JqlDXdJhqjUXocXOXXRact5g=; b=m9+p5TqPL/EDovvt
	RUOnHsWOlRVCHu0PagWbZ33E8yfTiLX8MafDmfqCfJW6m3GkMIG06umt4qg/Jr1u
	A/FaixFcV+U23UrLN84L4HZJw4hjx/NYQti3CqbGmyEOhhzQu7/GjkneTHrI3iCg
	dmgvjsikNoh2P0ZDHcXvzao/wC5B5mbNzmxaL/ojWQY3w5lEuSy4W2ccVxqjE99d
	fp6QFjCBQqBATZtsUFkWelTgZ1aLLaQNsSsStrFXBUytvNy3OMjpGoIk9ah3WqXP
	khYfI7tQqJgWLPnxFb3YhUt8k/3OhtOEUPrROrKl95/RKFL48ulJDf3vKU+eD2EV
	gomY6A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vuhvas1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 06:32:27 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2f08491d837so29671735ad.0
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 22:32:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795674746; x=1796279546; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wXveSJFcQwL36raoOk+JqlDXdJhqjUXocXOXXRact5g=;
        b=jVXVTUti1dlCNbgJyoXijPJi9aeEGh1FL9QCv+AACfQwIXHeUxvMJUWTh8+6UrZL9I
         YR8Jp0H34Nock3hrDoAJLsAxW7/yzCzVzy4ovK+bJjJYE85nqLnQbAEOE69Vfa5solte
         9atGqq8MPKQ42U1dZ8HjpiaBUV+Ambim3JD9NCk3kROwNegM1pCRxMO4cnCVbCZOHy7A
         oni1BeLjkGHhyYjOOEtjk84g1nTbx8uDn6trznUF0nrsDh6ca4hM/c9jML6xEcYC8Ncv
         s5W8DCRRZ8b8bFo9Z7jlMH7sDLgx7T/77ifD8HavlfkNs1swCLY3ilPkCCraOHzWjzD2
         01Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674746; x=1796279546;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wXveSJFcQwL36raoOk+JqlDXdJhqjUXocXOXXRact5g=;
        b=tmvTwj6WSAxMg8D+T+o0xOTUttevENQ+fY2LQnRyeceCMh5bLBHMEtHLmSpBw7W3al
         tcEcbELHPRcv6QWGeAJhTqQTZAhByqZ+xSN8MhxJKgnbDkUoBeY09jczyp1CIURf2dC3
         XUtFfXAZhZBDdEMWauAoqtp3MQeonb2Ogf6v/qdsntu3KYwa3OwVHo9ImTyhyE/mxaKC
         3IwutZZHdLh6iaE0kFNg/3TmMqn2WbBoUZkGdswkl+XC1z3LbMctahKc26lStefMirRR
         4je/drSqRjZnMVBhCzXyiZz9Hns0v8loZr3+8KlyjNORCAM3QMriaxR8Jukv9e/gdxXa
         o+VQ==
X-Forwarded-Encrypted: i=1; AL+hErHmsBtcHqZsTvVszFA/nN1ft5YxumfhwhRx9BZa6FWEf+wHdvJFPuj2vZT/5rCRJm7LPloI8GaOT1GMYA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+d9n1BaPTZM5wCyx/FC4sUG2Dtny5d9crrDtntnsC4Dghkvggk
	gNqZE5azFFq/gEUobKexghDfVOZ5e6c24bnlMAtKhHRWVsEFILpurg/ySvUHifTmI1WkD+qJlA6
	ZbKlzf7YbhgephZHC1CmJl7VNrsX6DW+4c/pzqlBsvGVMeQhVV8IuZi8vGK0/LK/ckUjwQnlWwQ
	==
X-Gm-Gg: AZFdTZeYjRSUX7FSgnLEZGKyL00XVkjJSlOX/oLvfr8yPYPchKEmIxZu3t8Svw3/pBV
	UJSBHlnzfwokzFpUACApGqlNX5cAJXRb8AwCCav5/udFWaWr09r1xM0OoN6IFMYP6yUrsQXQeyT
	U4Q1KVXf+5F6/fp+DtNvQEHhOtu9QGjh9o6ibH0DSHbpRcShRikVMNsYuejkh1A94YRvADM/Hr9
	w5XXJL52QHniE1fFxIvPs/EmiC725C2fZdd75TLBuhKMngi4VqueQaTVSHY+ODy1lXnLYJcD42P
	YjzmnxgPtTaj0ExpsZBdAfj3xf+AecMa3cdmQXFqb2tDMCLDQ6aTHQA7nAditxeANPX9PkvFrZJ
	+9nJs/PG4UDVe4BKs906pylZeAo/8k89vph3HKZRIJxyJuIgFPnIHvAE5cl5GhHND9dQO1iINkX
	oZwxoYYZdb
X-Received: by 2002:a17:903:2407:b0:2f0:43fa:566e with SMTP id d9443c01a7336-2f043fa7827mr179016865ad.10.1795674746556;
        Wed, 25 Nov 2026 22:32:26 -0800 (PST)
X-Received: by 2002:a17:903:2407:b0:2f0:43fa:566e with SMTP id d9443c01a7336-2f043fa7827mr179016435ad.10.1795674745945;
        Wed, 25 Nov 2026 22:32:25 -0800 (PST)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f147a9esm97159715ad.72.2026.11.25.22.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:32:25 -0800 (PST)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 11:59:29 +0530
Subject: [PATCH v3 21/21] arm64: dts: qcom: hawi: Add DCP support
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
Message-Id: <20261126-jshekhar-v3-dcp-v3-21-f1e9d7505039@oss.qualcomm.com>
References: <20261126-jshekhar-v3-dcp-v3-0-f1e9d7505039@oss.qualcomm.com>
In-Reply-To: <20261126-jshekhar-v3-dcp-v3-0-f1e9d7505039@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Flemin Jose <flemin.jose@oss.qualcomm.com>,
        Mahadevan P <mahap@oss.qualcomm.com>
Cc: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795674555; l=5143;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=giewpTQrZZVV20ml7CV6gG7RnmPP9xMRQcPv0COC1lE=;
 b=qU8Ttt4Szokv3b86bytlduDWEANO9b5MhZ9lnOQKHZv+ALr+8UtSQz2OrOvnBc2J7pyUmqzsp
 8RDEoYrk1LzAbuQWX0hAw+055JaZrWR50okBbCOCGEtYwmJ9IDdkLRB
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Authority-Analysis: v=2.4 cv=FPmOVOos c=1 sm=1 tr=0 ts=6b07d27b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=rMwJWs0V9SWzAl7URZYA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: yKPqVoPBJ11aZfq7tGjTqCXOKTTiBDDc
X-Proofpoint-ORIG-GUID: yKPqVoPBJ11aZfq7tGjTqCXOKTTiBDDc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyNCBTYWx0ZWRfX8+qhOR5+S6id
 KCVk5i0SqQziUWi7ZDfwPMi6HkBJDeXxFuIvqnM2XNXtRL2h53dH1gp00BQwnScfrycG4HVvXTv
 I02NHnZ92n0W8eYYmHAUeg1f3QdbTz4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyNCBTYWx0ZWRfX75xF6N5TlAXX
 NwUGDkg9EiI/MY0Kb2S4QeTT7R2lRpaEJpVnL471Jf0xfJAb/4Qe6ub0iH0GZzrHVfQ42q7GTSH
 sN+JLJABLbxizOJ9jH+XN+BoLpRXzEKxYhn1zwqOXDQf64jJ5vFB9oofk+x6vsngnZ9H9/ADX65
 cCUz/FV2zeJ3pDc6YzAdoC9IvotMHqWF3o+bQ2Hxj0pzAtf9pdaDVLMseguzGy3P5knvOXZDk+X
 jSw0y0z6T0DBcEP1yMwYz9/tZL5uBJ7g186GeKbjdy5xhPCFafTT2PKzALEwbVabQgq4PBZo0Wn
 Tgu3jxaYA/uPxtC/PiRrbdmOo5LnVHqD5l7tqg5nk/7GT6m6AoWs1FEu6/CzFNTwtQ+2ao3qKta
 BVQJrfR/a+AT2BRzopkGSlvWMdhqvkSACkcLk9AUmMBibJ6dA9IfCgHHcp9nvnPiQ5tW0Teq1B8
 wDst7lu33jDk3PI0idQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_01,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260024

Hawi display hardware is owned by DCP firmware, so the platform device tree
must describe the Qualcomm transport wrapper, firmware display subsystem,
power-notify channel, IOMMU contexts, and display graph used by the MSM DRM
driver.

Describe the Qualcomm DCP transport and its VirtIO-MMIO child,
the IPCC power-notify channel, IOMMU assignments, firmware-visible IOVA
range, and DSI display endpoints on Hawi. Enable the DCP display device on
the Hawi MTP platform.

Assisted-by: LLM
Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hawi-mtp.dts | 108 ++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/hawi.dtsi    |  45 ++++++++++++++
 2 files changed, 153 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hawi-mtp.dts b/arch/arm64/boot/dts/qcom/hawi-mtp.dts
index c38e5fab7a2c..50484d006db6 100644
--- a/arch/arm64/boot/dts/qcom/hawi-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/hawi-mtp.dts
@@ -34,6 +34,18 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	display_panel_vdd: regulator-display-panel-vdd {
+		compatible = "regulator-fixed";
+		regulator-name = "display-panel-vdd";
+		regulator-min-microvolt = <1100000>;
+		regulator-max-microvolt = <1100000>;
+		gpio = <&pmd8028_e1_gpios 2 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-boot-on;
+		pinctrl-0 = <&sde_disp0_vdd_active>;
+		pinctrl-names = "default";
+	};
+
 	clocks {
 		bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
 			compatible = "fixed-factor-clock";
@@ -995,3 +1007,99 @@ &usb_dp_qmpphy {
 &usb_dp_qmpphy_out {
 	remote-endpoint = <&pmic_glink_ss_in>;
 };
+
+&dcp_dsi0 {
+	panel@0 {
+		compatible = "novatek,nt37801";
+		reg = <0>;
+
+		pinctrl-0 = <&sde_te_active &sde_esync0_suspend
+			     &sde_mdp_vsync_p_1p2_active &sde_mdp_vsync_p_1p8_active
+			     &sde_disp0_rst_1p2_active &sde_disp0_rst_1p8_active>;
+		pinctrl-1 = <&sde_te_active &sde_esync0_suspend
+			     &sde_mdp_vsync_p_1p2_active &sde_mdp_vsync_p_1p8_active
+			     &sde_disp0_rst_1p2_active &sde_disp0_rst_1p8_active>;
+		pinctrl-names = "default", "sleep";
+
+		vddio-supply = <&vreg_l12b_1p8>;
+		vci-supply = <&vreg_l13b_3p0>;
+		vdd-supply = <&display_panel_vdd>;
+
+		reset-gpios = <&tlmm 210 GPIO_ACTIVE_LOW>;
+
+		port {
+			panel_dcp_in: endpoint {
+				remote-endpoint = <&dcp_intf1_out>;
+			};
+		};
+	};
+};
+
+&dcp_intf1_out {
+	remote-endpoint = <&panel_dcp_in>;
+};
+
+&pmd8028_e1_gpios {
+	sde_disp0_vdd_active: sde_disp0_vdd_active {
+		pins = "gpio2";
+		function = "normal";
+		input-disable;
+		output-enable;
+		bias-disable;
+		power-source = <2>;
+		qcom,drive-strength = <2>;
+	};
+};
+
+&pmh0110_d_e0_gpios {
+	sde_mdp_vsync_p_1p2_active: sde-mdp-vsync-p-1p2-active-state {
+		pins = "gpio9";
+		function = "paired";
+		input-disable;
+		output-enable;
+		power-source = <2>; /* 1.2v */
+	};
+
+	sde_mdp_vsync_p_1p8_active: sde-mdp-vsync-p-1p8-active-state {
+		pins = "gpio10";
+		function = "paired";
+		input-enable;
+		output-disable;
+		power-source = <1>; /* 1.8v */
+	};
+};
+
+&pmh0110_f_e0_gpios {
+	sde_disp0_rst_1p2_active: sde-disp0-rst-1p2-active-state {
+		pins = "gpio9";
+		function = "paired";
+		input-enable;
+		output-disable;
+		power-source = <2>; /* 1.2v */
+	};
+
+	sde_disp0_rst_1p8_active: sde-disp0-rst-1p8-active-state {
+		pins = "gpio10";
+		function = "paired";
+		input-disable;
+		output-enable;
+		power-source = <1>; /* 1.8v */
+	};
+};
+
+&tlmm {
+	sde_te_active: sde-te-active-state {
+		pins = "gpio86";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	sde_esync0_suspend: sde-esync0-suspend-state {
+		pins = "gpio88";
+		function = "mdp_esync0";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+};
diff --git a/arch/arm64/boot/dts/qcom/hawi.dtsi b/arch/arm64/boot/dts/qcom/hawi.dtsi
index 77d704fa6cf7..9d22243b97d7 100644
--- a/arch/arm64/boot/dts/qcom/hawi.dtsi
+++ b/arch/arm64/boot/dts/qcom/hawi.dtsi
@@ -6854,4 +6854,49 @@ timer {
 			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
 	};
+
+	dcp: virtio@9be8000 {
+		compatible = "qcom,dcp-virtio";
+		reg = <0x0 0x09be8000 0x0 0x1000>;
+		interrupts-extended = <&intc GIC_ESPI 956 IRQ_TYPE_LEVEL_HIGH>,
+				      <&ipcc 13 5 IRQ_TYPE_EDGE_RISING>;
+		iommus = <&apps_smmu 0x15a3 0x0>;
+		iommu-ranges = <0x0 0x84000000 0x0 0x04000000>;
+		dma-coherent;
+		mboxes = <&ipcc 13 5>;
+		mbox-names = "dcp-power-tx";
+
+		display-subsystem {
+			compatible = "virtio,device34";
+
+			iommus = <&apps_smmu 0x400 0x2>;
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@1 {
+					reg = <1>;
+					dcp_intf1_out: endpoint {
+					};
+				};
+
+			};
+
+			interface@1 {
+				reg = <1>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				dcp_dsi0: dsi@0 {
+					reg = <0>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+			};
+		};
+	};
 };

-- 
2.43.0

