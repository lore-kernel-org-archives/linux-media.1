Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792995947;
	b=E/V8UHsVLs/0DlUmRMwCLDgDZ9OJD11pfuxhXHwVIBleqkhUZyQzZxF/3ca2f0yOyKBP
	 ohbppmIMnmMwFlDk+Z53PDy87oZ72sgkslcOYJG3mbPRIyU8Znmtjq8583YdNVXp44qQF
	 OVJtgbUxAe9nGX+dvvhB5DiFNHKEWlTRz2JW5K3zUCdoXCxb3DlcLrIUbrgEkVtONG+TC
	 t2Sl0WzYgIwgGkCO2RbmfMi1MlDMO6mh4GUTp1JyWrx02AfxUqEURFAm1CrCv1qVu7CK6
	 zsQzF3jo9R5uuLJzJ8BcQ5PXo4Yus1OQyfwI+AFaBKik5S4ifNnm5a7htFoiOyMlYmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792995947;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FCnvFyOtoxqBwa/Gstd7a10Uc74nGWW4NE9dwrU5Y1I=;
	b=CS5r0VehMkuH9pTY1yLnJm2cTedZverbWCy0WxQ0E4hJmwkPlKCWOm+k1ZHzG6zoRRIF
	 UkNRicSb2gCSuZu+UncEJu7QJYQjVVR1seXrLoyXOWIbzLYsmGQRQ/+dfHyx89V8kwmoj
	 ug/d32CX6eJN61gv+o6kGVOtNJwmlkqT2C2NL8pP2eIh/iu2oig8EkVydJ/wMIodJuF5u
	 aRqKi9IcajvRPv9R08Nd+cFMYzBN2BJDgRBJxd99gQo1R7Coo0tIlyCdtfDbnP+Ydsim0
	 ZNYJz2F6P6RKumVnO/JVPaMgl7gAV8waneVzDgkt/Ti4k2bulk74E3xHp/5SYCBjk6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AF2QO09t;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QODEv9JY;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C33606A322
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 06:25:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16C33606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AF2QO09t;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QODEv9JY
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4as703303625
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 06:25:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FCnvFyOtoxqBwa/Gstd7a10Uc74nGWW4NE9dwrU5Y1I=; b=AF2QO09tuvUM3jqZ
	pSCUqmKrO4lnRGeBAuqNE4HoMghuuf9ANxMv2q8JOwcryBTLC9Rdf8xBqaJnQuD2
	GxzGJdBANbr4UO/monIXFFvfVL5AHC24jI1aFWk3VW46rDw58JNfR0rcj+EPlXRN
	eX+D/VAva651BTctxF+S3TAoiKqqevZaHryYBOLUUf2PMNqNVG2/MT9wGVifnsu5
	bAsE/AWM9z4BFjOP+UMzwbjTUK1qAIsVCcAkxym3FK2GwsDnT9h5QPpfgYR9vkK4
	YTl0r4uPspz5zb/WFIrbwBjxUNx2BBnbNRoQv9anEe7IewLpX16fg4kor6aj+mVp
	VEMIMg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgkmsd5bf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 06:25:46 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e601800e58so48553855ad.2
        for <linux-media@vger.kernel.org>; Sun, 25 Oct 2026 23:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792995946; x=1793600746; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FCnvFyOtoxqBwa/Gstd7a10Uc74nGWW4NE9dwrU5Y1I=;
        b=QODEv9JY4TwGQsU1lqAN+2oer1EuPUiLIimkGBCdF9aK5BQhhR1QPkrCIejNemF80I
         RrVHu+7VAfI6DPHccIkc9gyQ8ED0qkophI5Z+r5bKfXvCzH4bJsfqm2TyamxLJ91Az8t
         hGcjT40Eth2R2InuRIgobIFOqri/Z93GrXva4VVqSKZuY1xEDWduRjlJIv+GXCKvRwXb
         VSHZV43olkf3+hnHk7VWE7xNRFiVxStdLkfoblkbGuCdqq4waJiJcLo9cHktifQHTsm1
         oekKZUL11mc8+WQslavq1vEiExAPdEhVpL0FD4/Ee4KNYNPLlOlaawo3bxi6XbYF9Ow5
         2M3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792995946; x=1793600746;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FCnvFyOtoxqBwa/Gstd7a10Uc74nGWW4NE9dwrU5Y1I=;
        b=U3lU4azkM2RRu6IqUi2kaVKKrXh0feJBR7WffT3a8cUj4ofXeWfW01VT9UNfsSzJ6h
         OfJIQ2LcC5HHHPC5L61sOpt9G6Erm0k5ZuTZPFEnexouk2p4XnvkxTNYm5qEc3DmY831
         +g/f0vXWGOLA3Zv2khZS+7Hr5Hq5hMI8geGXfwGMVkSRoT5FbvPReovvjXhD8uQB3nz2
         /s/Q/6kGOOWlXJQF8PKhBByu/eVxRhTKTqH1A0DvVGVSSiQeuLAbjSXONlOYqo0WmC6+
         llOgbLoIczIXTYq7eEOLIZ1sgiCaX6h/6oHMg8nzS3PbaaGHAhCbdu3JHFB5SkPni/BF
         8tgg==
X-Forwarded-Encrypted: i=1; AKwUvBypuhXwnN++7mAw6E2AFxXPyfPn/WKm0B2Q9b1qQsPNqd7WRIPXF1G0Bpnh9oBtqMhUuFOnT5IukMWGgA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLC5UNUHsdim98tnXZv0yUbVoPA4kaFh4VD2rQ1kFDt5vuFRamc
	o9eLI0uUEZSivNV33x1SIXFuThPy245HGJzk0WZDDEYlZVhfPorevNvbB+Swj+p/BXFQAMHNPPg
	Kq3c9lhbItTjwLQOUAba6TPY49HvRwgPL3vEqrib2ncQxEtw+jU1N3Cj+/Zyxk64LHw==
X-Gm-Gg: AYBFou1B3SRL8nx/Wzu18Rpu3Bxvr1yiVpucC1j081pLqDZubLT/9v8IWx2NXbsxe6S
	TwuCtp7910TFrzzPmaCqXql5/JQwVqFb0WsTl/qcDErAQ4QGVOP0xKVHpquCEbdWe3Vq5TggmnC
	CKre+G+vVNQliqrosy4X11fM6RpJaAJYYP4IHFKPxolKu1ShT8PX3KUjhyIKce7YmrWWgI5y04a
	J7tXSo+dlCtC4fIV3xnZsGjiPQi1vmW4CtW/Ppd0y+Jrcmilni7OeYnkpDNI04kBd6LSb3MlAPV
	6YF2HBy9tWR9bBJRXN3tHgKmEDUojCDnmTTxe8ILX3qRaQyhwnwp3RS4NXnSPwzcp3B+nbpAeUF
	yCyUsF5JZvPFvWctdswCzDnwvO0ltx5mugw==
X-Received: by 2002:a17:902:cf12:b0:2e9:73db:3c78 with SMTP id d9443c01a7336-2ea9c63efcamr48839005ad.17.1792995945645;
        Sun, 25 Oct 2026 23:25:45 -0700 (PDT)
X-Received: by 2002:a17:902:cf12:b0:2e9:73db:3c78 with SMTP id d9443c01a7336-2ea9c63efcamr48838845ad.17.1792995945230;
        Sun, 25 Oct 2026 23:25:45 -0700 (PDT)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b1a1c56sm12633415ad.44.2026.10.25.23.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 23:25:44 -0700 (PDT)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 11:51:33 +0530
Subject: [PATCH v2 23/23] arm64: dts: qcom: hawi: Add DCP support
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
Message-Id: <20261026-jshekhar-dcp-hlos-v2-23-7cf014efdee1@oss.qualcomm.com>
References: <20261026-jshekhar-dcp-hlos-v2-0-7cf014efdee1@oss.qualcomm.com>
In-Reply-To: <20261026-jshekhar-dcp-hlos-v2-0-7cf014efdee1@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowangio@gmail.com>,
        =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Flemin Jose <flemin.jose@oss.qualcomm.com>,
        Mahadevan P <mahap@oss.qualcomm.com>
Cc: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>,
        virtualization@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        iommu@lists.linux.dev
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792995687; l=5616;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=JWax6SHxXqnSdz0sR52ZG2fr/5xHogt+xoHHZShHbR4=;
 b=3phvyPAWLpPk42PFcsZstSJQNZG3MKuNnHg2gCbX6SuTSkcshSlrsuGkDS29WnsFK2MrUgree
 GAjJ2fJdmXzC8b2UQG8TZFR1oKZzbT3VTflheMwfWxfPdFCg0+kVtOU
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Proofpoint-ORIG-GUID: rtCAQHP5PnAlJ6zO87sa8N7DA0oLLJeg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAyNSBTYWx0ZWRfX9izAhLKKhC4v
 zKtFCieX0f4iSJH+aUtxGYrMBxXnOpt3knUFHVO/c/ZJc/aPQf+6vRTj529rPgypO2mCglu4+Vs
 0WeO/pA3nxYXwSIAS+JGdDZtENofw5+UfQ16YcdJbFzGSzGhKR3NUueYyVVCSI6WqABmf6QkasV
 c9LsPInaqd4+M9Nd6d2wEZV7N5r+VMlCBhkEtCzk1WaSXGP28ECWsTUupIw5njqXzeM5ceM0clj
 ligi6/NOAqwfQRPUoCmRd+i7dS4ywH/oDbHzVGrL/GAjEv0UZz98H/d7KUaTJpsrzKBrxoN3Jq4
 45khekBMQrx03T5bNEpjwJwvSIFhjaWokUQk3ADMcT7mNPjtw/8APoWnVYOIwzeUJ7wjtREo/7i
 SIwOFMDFXbdOH+rUEz8bkRsws3JnZdF1fG7Dsdvz7J+iqUMiCyNXREnfTqlnHyQvp6Ucnhycewg
 7QDo8mBMZS91tEbM4Sg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAyNSBTYWx0ZWRfX3ZSVl7UuNlZ8
 RLju4iEe9oB6+kThCFbmhWrs+OyIdt/bUWorDRjj0RCFf2BnF8CgU3aJv94JEqLFbOpa0eEcCnl
 BfgbmbfGfmCEn1QXZw5GjNh+i5M4jf8=
X-Authority-Analysis: v=2.4 cv=UqX2pOwB c=1 sm=1 tr=0 ts=6adef26a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=cp69EZODLtjo7xmYzNYA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: rtCAQHP5PnAlJ6zO87sa8N7DA0oLLJeg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260025

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
 arch/arm64/boot/dts/qcom/hawi-mtp.dts | 129 ++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/hawi.dtsi    |  40 +++++++++++
 2 files changed, 169 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hawi-mtp.dts b/arch/arm64/boot/dts/qcom/hawi-mtp.dts
index c38e5fab7a2c..a27003f69d02 100644
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
@@ -142,6 +154,7 @@ sdcard_vdd_3p0: sdcard-vdd-3p0 {
 
 		vin-supply = <&vreg_bob1>;
 	};
+
 };
 
 &apps_rsc {
@@ -995,3 +1008,119 @@ &usb_dp_qmpphy {
 &usb_dp_qmpphy_out {
 	remote-endpoint = <&pmic_glink_ss_in>;
 };
+
+&dcp_dsi0 {
+	panel@0 {
+		compatible = "novatek,nt37801";
+		reg = <0>;
+
+		pinctrl-0 = <&sde_dsi_active &sde_te_active &sde_esync0_suspend
+			     &sde_mdp_vsync_p_1p2_active &sde_mdp_vsync_p_1p8_active
+			     &sde_disp0_rst_1p2_active &sde_disp0_rst_1p8_active>;
+		pinctrl-1 = <&sde_dsi_suspend &sde_te_suspend &sde_esync0_suspend
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
+				remote-endpoint = <&dcp_intf0_out>;
+			};
+		};
+	};
+};
+
+&dcp_intf0_out {
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
+	sde_te_suspend: sde-te-suspend-state {
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
+	sde_dsi_active: sde-dsi-active-state {
+		pins = "gpio211";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	sde_dsi_suspend: sde-dsi-suspend-state {
+		pins = "gpio211";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/hawi.dtsi b/arch/arm64/boot/dts/qcom/hawi.dtsi
index 6b0a0ff0faa4..836970cdef71 100644
--- a/arch/arm64/boot/dts/qcom/hawi.dtsi
+++ b/arch/arm64/boot/dts/qcom/hawi.dtsi
@@ -6841,4 +6841,44 @@ timer {
 			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
 	};
+
+	dcp: virtio@9be8000 {
+		compatible = "qcom,dcp-virtio";
+		reg = <0x0 0x09be8000 0x0 0x1000>;
+		interrupts-extended = <&intc GIC_ESPI 956 IRQ_TYPE_LEVEL_HIGH>,
+					      <&ipcc 13 5 IRQ_TYPE_EDGE_RISING>;
+		iommus = <&apps_smmu 0x15a3 0x0>;
+		iommu-ranges = <0x0 0x84000000 0x0 0x04000000>;
+		dma-coherent;
+		mboxes = <&ipcc 13 5>;
+		mbox-names = "dcp-power-tx";
+
+		dcp-subsystem {
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
+				port@0 {
+					reg = <0>;
+					dcp_intf0_out: endpoint {
+
+					};
+				};
+
+			};
+
+			dcp_dsi0: dsi@0 {
+				reg = <0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+	};
 };

-- 
2.43.0

