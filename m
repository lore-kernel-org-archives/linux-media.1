Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793200860;
	b=lqiN8c/CZHQ773nqx6gkb4mqiXVFD3xBwh3KksBPWKw3p0LPWw547/my4EFGRKO4RmF+
	 YiL+6AD/Y3PQgLMdkIgU+kZt0E8Q35Ee+dxpxdVuBkFzRZkgHXWEMFQ20X08V7BfykOp7
	 NgxGnCSLxH8pFF+0//TDy4B/OBxWpnMnlinQyPrs9rHvLZLETQC8iMbtYcJqW29nNbfnS
	 YbrJsaxGL6MnYpHbsiLq9Ttf0xEMd9N/RI0IiqkvVY80TgvbTWFcNCt3I/jWJ7pWTAKAx
	 gYDsYeJtLnLJEw0rf/+Sqs5+97RfWKpTH9PJWwkE4Fu9aRCw7lUYYpqVSJCZo3ykIsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793200860;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Ef+Na+GsihrxdoSAJed3PDwEa1uv3hQJy1tnM3Tzqs4=;
	b=W5AdIKC5p4pkvbGfWlXXrDiy5v8weYW3PXrqMx4dMVo7x3RGP965cJmE6nRXATLh3eDV
	 n74QpwZP4cz2Wup6W3idX5HXJH9mienb5s+wM2WDwj7nMXvs3zVgNm4+BCexcTHCVDynj
	 644ZfLZKkp+NAg2ceVwNAAaDQTDjv3UmAagInFSWICh322q1hSTeaZRKxpQ9wHmUOaBde
	 X7gYRRgAFgNiTtY5kq68i9T2dMfnbwU9FpLVBJU39VIzN+zn6aN353M8UbbLvnvjHCaky
	 ywzvkqTgkkbflag5QSLX+KXBhf25y7QHnH1HeRxPXTDHmuFA5ssviCWeid67B3D8nPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=frZqjEp4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VRogjkj7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DEE60A2603
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 15:20:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0DEE60A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=frZqjEp4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VRogjkj7
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFAX4o1153188
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 15:20:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ef+Na+GsihrxdoSAJed3PDwEa1uv3hQJy1tnM3Tzqs4=; b=frZqjEp4NEENUooy
	1g+pjXLqfB2QN3+cDH8jhNNM/JBBpwf9HILIwtLEOrbJxLT0DLqQDTAhMeh3tc9X
	CdPPeMRqsDDGzNXip6jfyxO/g7EcjpVO5VxbKjz+63VRh2llthuBoTuwdHQbOq6A
	DlJbKBdBXZXM68xAmB7vEgJ1A12Kg5FUWIgLek1vVzmh7wdBw2C/6VDI6oWesDpX
	KdqLsyKoKe3E8ZNvJx9GF0jLZUNJ3RwlBUcIGB55p/XsX12orokR5lpzuty3vsmt
	OAJvt+ST/tkZuYjxvbHV6bylXAt0SVYY1K2B3mIpQhh9fvBQwLVUrMBweAZ4+3x6
	T0SLkQ==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6be34n5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 15:20:58 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-679a3664e1fso1807425d50.1
        for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 08:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793200858; x=1793805658; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ef+Na+GsihrxdoSAJed3PDwEa1uv3hQJy1tnM3Tzqs4=;
        b=VRogjkj73FXj0OPZ76Y4/uzlBmbp5nZ7ODiz+fFQ/ucYjCktvru2327C4AljXxR6Io
         n7yEaX/ej0vvThL+OL4lBp5QLosuQmCWpR4ha+TOffGGgv1jbiFkVCIbN/xhRqsP+lX2
         YOh3sbwxu9TKpRWrqxkDVv8LrwkvS1QYWmHBX3epZOjQNfM5etoARskIhhUTHaWfpooo
         Sdi7by1UiZx27I4pmvEp16JCE2zOGXBuDc1nEAfFAQ7RfPNKEk/8dqXV+LqmTKV85umr
         UZFgHCzPMhX8PQr3MCHXf+49c6+YYXqp/R03lwdNtBTXR+/x6zwTspP48FitLNb0ip0D
         Wqug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793200858; x=1793805658;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ef+Na+GsihrxdoSAJed3PDwEa1uv3hQJy1tnM3Tzqs4=;
        b=l07Ny4+gHSrLKr3hc2Qn22NHOb/fCRq0zqu3eH45fd7fFrP56Lle/vLkfdwLdEhErU
         9nYtL+95DgVLuTE5FYxaBytF2VAfqnKq7pUh3qCoY0ZWtwbhzUkEY+i3P40hiNoTa/Zj
         Q5WnbisUgIjUQu20qo7SCHvWonDIUAwBT48D+4pyGPJRHSZU0+pF4OwBB271++zfFcAd
         jUP09FfjnJlhxc379VwfmYadrdiVJN/j1SJkQT7tO5NNDipsu8Iak9TWQpIGhfJzP75q
         y0JuwcAbx0CyWOIM2GL6LOBRjbLYv9rKmZrwTmSGif2uyuA3fPutBzHoJ1R6PdhDLXeS
         QZWA==
X-Forwarded-Encrypted: i=1; AKwUvByzY7+9eCG12kLpNxiBPQikRlxRCc23DDiyd5276B1y9UfNzAG6OfdjpWXvRPrfwdifK97PVGoYr3LMCA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLF1QC3rPkoV9si8HKZxTvFv0EgpSbVx56XAZJnWvptyLLjEtbp
	O5SaEZowqNqOtUgyEJeCpMOt08WY+WCOvP3wQCYUzz6oyIK8puFm6L85oWIIu7Pav8Pt4XVXaCn
	cuxK7MRxucS7WrI4QFImzmTAYJ7BdJGzus8omQZwRRPZ1Emg466QoJehQ/FJ1RYeu9g==
X-Gm-Gg: AYBFou3PePrqyhbArfeYK+RM11GcQYSsbA9D+aVE1+f0xKjAYslMEhEP177VVnSTRKK
	9dBB9kWEVOnnbEOgbBHW6lP/Muh1ImQM2X1lNcwG9W2n/4OFx0dDYimZ8D2RT8tz+bMva4S/x3L
	WylXvHNojA8c8clFNFQ32K9mOuKYglrs6ApuQ78oRp+/ZYPlYugYAz1i40Ycav3zKQRI0NdmA0d
	SU4zwa5CkHom5cGeB/SwsuUITSCx8qMRFTSvuUvejRmbtdyQUKPteFY/TaFb6Lkl6m/n+jIweqi
	ji6uz96eZ3s5tk4KIiVNEUN24hOzFsBzQe4e3wjd4VTAyfeVg/rLOvoGOjbP2rwBU7BdbzNcboX
	6z55/31h72JyFB9o6UrlYJhaD0bc8KLutjVVwwETcZbV0AoE3wurZ8YvKom7FCl1cpJNRefSuUv
	FOE8zg4apLD4dQj5I6FtpMTe+5EpjXMNBXIfyzclrqncq/TU0UGOzpjr8RYH7Y
X-Received: by 2002:a05:690e:454d:10b0:679:b87d:6f7b with SMTP id 956f58d0204a3-67a7bc6349fmr1631289d50.42.1793200857449;
        Wed, 28 Oct 2026 08:20:57 -0700 (PDT)
X-Received: by 2002:a05:690e:454d:10b0:679:b87d:6f7b with SMTP id 956f58d0204a3-67a7bc6349fmr1631268d50.42.1793200856951;
        Wed, 28 Oct 2026 08:20:56 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a803cdd1asm1107541d50.4.2026.10.28.08.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:20:56 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 08:20:36 -0700
Subject: [PATCH v23 02/15] phy: qcom-mipi-csi2: Parametrise the common
 status register offset
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
Message-Id: <20261028-kaanapali-camss-v23-2-95f250b18612@oss.qualcomm.com>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
In-Reply-To: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-ORIG-GUID: dViwUJ4EgvsB-_ZfeWp-ZUR_H5EgJddq
X-Authority-Analysis: v=2.4 cv=HeuB3SE8 c=1 sm=1 tr=0 ts=6ae212da cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=P6Xs4Y00w1yHQXPR5eoA:9 a=QEXdDO2ut3YA:10
 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX8J0R2lmZ4/Wz
 pyG1gqkj1btMGf+6f4iDfPIu/9sR2qXkU8EstYq0prEcYBF4rds+DUpR47CSJx6CVfbI2ybJsFN
 qiygs8aVihro/jdS1e/CUKkYkRD04HE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfXwuomh//Ybjkw
 1FJRZvpk+oB9hTtPIduEg+2mO5dGWqqTKTUEUEAHFIp3j9p4eLoURzQzCLueAjxwPlCaU+Czl40
 siBerDwfuHtEoD0aHn7PajAyP7ZgIhqk+XWbPqT1/raJCX95p5KbvX8Ov76fGwVaZjy92pBT2jE
 dYIVUUooh5X5/fyheQ4xc2GWQ7yqG5hoiWiwOjinfhxHclZdgyZi/fCUi9Pyqi11SuYkuEuTm/9
 HY/B6k++nSobktfQ06P1O9SgOhbYOyZlSou+FjfyHSLtTZ2xAIUOIafmykW+g2VnRKMtJk4AY2B
 aGgVl0iL//YFzUEf5xpYcsHpClpn4rdJBxCVrNOPMpJ3h4Ozf3NiWaEc4I8xqxGn3u0iEGLAV/D
 rA43fRDQ7R6bn3OOXKrhPB+2lNxIIHWvT6fUsDLP+NRaOE9pCPNgDyCencdlcw5m7RV4+Mn15O7
 eTU6jXxk4rHwMDHVYeg==
X-Proofpoint-GUID: dViwUJ4EgvsB-_ZfeWp-ZUR_H5EgJddq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280061

The CSI2 PHY common status registers are not at a fixed offset from the
common register block across SoCs: x1e80100 uses 0xb0 while other 3PH
v2.4.0 parts differ.

Replace the hard-coded 0xb0 in CSIPHY_3PH_CMN_CSI_COMMON_STATUSn() with
a per-SoC common_status_offset field in struct mipi_csi2phy_device_regs,
initialising x1e80100 to 0xb0 so behaviour is unchanged. This is a
no-functional-change preparation for describing other SoC offsets.

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 16 +++++++++++-----
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |  1 +
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
index 966d79c98f9b..8cd331cfb4b3 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
@@ -19,7 +19,8 @@
 #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_COMMON_PWRDN_B	BIT(0)
 #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_SHOW_REV_ID	BIT(1)
 #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL10_IRQ_CLEAR_CMD	BIT(0)
-#define CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(offset, n)	((offset) + 0xb0 + 0x4 * (n))
+#define CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(offset, common_status_offset, n) \
+	((offset) + (common_status_offset) + 0x4 * (n))
 
 #define CSIPHY_2PH_LN_CSI_2PHASE_CTRL9n(n)		((0x200 * (n)) + 0x24)
 
@@ -176,19 +177,23 @@ static void phy_qcom_mipi_csi2_hw_version_read(struct mipi_csi2phy_device *csi2p
 	       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, 6));
 
 	tmp = readl_relaxed(csi2phy->base +
-			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset, 12));
+			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset,
+							      regs->common_status_offset, 12));
 	csi2phy->hw_version = tmp;
 
 	tmp = readl_relaxed(csi2phy->base +
-			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset, 13));
+			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset,
+							      regs->common_status_offset, 13));
 	csi2phy->hw_version |= (tmp << 8) & 0xFF00;
 
 	tmp = readl_relaxed(csi2phy->base +
-			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset, 14));
+			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset,
+							      regs->common_status_offset, 14));
 	csi2phy->hw_version |= (tmp << 16) & 0xFF0000;
 
 	tmp = readl_relaxed(csi2phy->base +
-			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset, 15));
+			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset,
+							      regs->common_status_offset, 15));
 	csi2phy->hw_version |= (tmp << 24) & 0xFF000000;
 
 	dev_dbg_once(csi2phy->dev, "CSIPHY 3PH HW Version = 0x%08x\n", csi2phy->hw_version);
@@ -375,6 +380,7 @@ const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e = {
 		.init_seq = lane_regs_x1e80100,
 		.lane_array_size = ARRAY_SIZE(lane_regs_x1e80100),
 		.common_regs_offset = 0x1000,
+		.common_status_offset = 0xb0,
 	},
 	.supply_names = (const char **)x1e_supplies,
 	.num_supplies = ARRAY_SIZE(x1e_supplies),
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
index 7e55ae007370..d6366f809e51 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
@@ -51,6 +51,7 @@ struct mipi_csi2phy_device_regs {
 	const struct mipi_csi2phy_lane_regs *init_seq;
 	const int lane_array_size;
 	const u32 common_regs_offset;
+	const u32 common_status_offset;
 };
 
 struct mipi_csi2_genpd {

-- 
2.34.1

