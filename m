Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69704ED1AB
	for <linux-media@vger.kernel.org>; Tue, 13 Oct 2026 11:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791889437; cv=none; b=iMlMk0/ULby/zPxX2V8onx3+L6Wv62YZXOzNEdJL/cwrO8NG5Apn4dWKdFBwLk99bFuRO69s1X4JjKfVhHw4SpJ7f/llmC8Xrm7qzSy2QTFidWPKSIufqMnMNBLw/61eZ0DCX3ndjYSZtXEmbSudCzQq1JZLWilwBhRzLF6zAWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791889437; c=relaxed/simple;
	bh=oPB5CExBfZvIp0SdjxzLvDmR/sfHrEqqZv9ZyQ+ncbo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hB/4TQ2nELpjuLZBuiPockPnd5sjUqtUEK7cFvZP4GZ7nzNp8TovkaijPDBvduthXy6q+vhT1Wn816DJgOhpN1rk+2JVpKO2Q4ucqcK4W/9QPpcsTdPQB0MQC07CS7tHchIOiIzTjaPwZOSO9oCKeSF05jLo0SLJHqkXL2z71BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F/dcWDVy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ixMoZHZH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F/dcWDVy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ixMoZHZH"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8jigI989363
	for <linux-media@vger.kernel.org>; Tue, 13 Oct 2026 11:03:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	22/YBhwJfH8qNyVINbHbAOKUi/Q7gizTfF8gUocDDJQ=; b=F/dcWDVyOJkBqmmR
	bQ5TZ+Iq94OZ8/CvEswm1o5cDDwATI+lDqYaCki4G6g/A0ynt74M44InrlZ5mcZz
	H4B2vt4O78M9f5B6r2RFMjsewVAiwD9M+bV0MH1+CQBg6hXDF7TYOVXd0ZvLSQYv
	smnY9PNMzCJLZTL7uKJDxeb5cbZR0u7w9NpD1/nqhLijEHT0ZtOeS40YynIGuPf2
	b1Kw1OFSvf69tRJ2zw0/mrvJd1GUpGt0UeSFqyZndca9yFKTgKik0hrH3vvjyqEG
	gJIfam4Qug2NHhhvzmZ4RQ7CLL/5Xfh7ZA8jfxU2JUmWm2oVnhwEvUI7n0MK1TJG
	Mc1xwQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98hcajr5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 13 Oct 2026 11:03:51 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ab7f1efe67so2257955a91.3
        for <linux-media@vger.kernel.org>; Tue, 13 Oct 2026 04:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791889431; x=1792494231; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=22/YBhwJfH8qNyVINbHbAOKUi/Q7gizTfF8gUocDDJQ=;
        b=ixMoZHZH9u3uU0nW29Gz64tm/QHrlFDSnKuGS1n0t8r9cQAuESX7emqr3SyOwoc58c
         xkv6mPwm4lVsB6ZLx1gXYhCXvk+uQKzs6uxO7pPizLyrZ8wxsAvPxFkQp8LPduSuz/lV
         EZmyYk6u8D3G8de4Ll/oK4YShJAJ4UizEgTSIqFSM8MXJv/+aPRBVPCQjLVsaDpxVLv6
         OctzpYPT8nrgEI/wGgFBWTIw4lAtiDOvsApTTCII718+3VHOu4gO/VWUzyQBQr/EKi0f
         WN3NJnmhljwxFlHhZrcT1sLWnjHkz1oCDLRSB3nW9lKGG4zvUJZBMV70nSLugNJpe8PV
         GrYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791889431; x=1792494231;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=22/YBhwJfH8qNyVINbHbAOKUi/Q7gizTfF8gUocDDJQ=;
        b=m3I/COhLDgOARR6mTPgo8PnonT2ABL5YwGX4+s/9yw5OeZf10wB58F1M5r+xrhkswJ
         VYu5Eh47qgYjHSfaVFeKnoWu/Fnn9dBCXpbhjGK2bkFYIJ3TP2/zssMn54i/z513Q8nA
         m/+vK1xwCB1SZikYdpnwTUB69fafPuyf+asWI5PWGqFmi2ctwAn8ycbr0lsS81TyBfhp
         qU4/Ny7wmZxT7gtAyQ5IL9uDrWdzWIkeaUd34FUG+eTTQiESrYIiJWam35i/5VFIBUGL
         V30Ps4ZdXBF1Foruv9ZbT0fvAx1f2GhMSQhMol2E11VI8fWP9Ifs99n7THoj6ycV+3+S
         2PTA==
X-Forwarded-Encrypted: i=1; AKwUvBwR8N43LLmYx1BwkR8ytSGftciPp2SiQWDG4DZQRnLYKwrtHtO88rW8MlLaPCRzRNkFNMl8pZwHbiPkuA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIBCWPyoCMCrEwiKAeeSzPIrdvtEDjSSxXF5ME+sz/jZT4kUXrt
	+LpX/17RF6PFNnHkqa9xYIP/plKVYcOxLb2qLGUAQqjC+izSWx2ENEE6LXh2y68r0j9Tj9xu8Nm
	4CGuGVj0LjGu6H2d0O84vX0tZlvnAp+/xXD4axCEJWKxOg7dGNFYIXmU9K7V0cii0zw==
X-Gm-Gg: AYBFou1d+2ospn7+vB2RQp5N6dcG04UeRMOGVm/F5gh2YdikC6dDjv1Bt6/a4jcTWGA
	ZbOOH00KFCj41cwDQyH4XKL0aJFl7PWN4eHmEvr9ra7uvvfGJ1uGWNSp0oR+qXPdq85zKtGq9c/
	IkqZK2v6BcQVeFvCu0rDVxPZzArlv7vmi2mvT+FG0VqAabWOA2er17l2VEXr3+TLfqTLdvRigr5
	GeEAQJSs3vKBc06XY5Jte5DgORULJwUerr/j7+BF8kRXjM5jzDpPx99GwZRwQsBlJ0QyTCYCSQi
	8OQOQDy9sEVAd3UAQpyCxUdVajxshl5Y8DY2rbzC5Pk9DrfEKDfRqOoGPh1ThBiZ/LJfmwVf2+T
	ENxvMAWmO+qr2d+kpdqXi+Ao+q8tyAxI=
X-Received: by 2002:a17:90b:3c07:b0:3ab:1a24:56e4 with SMTP id 98e67ed59e1d1-3ab3aca1257mr9064535a91.30.1791889431004;
        Tue, 13 Oct 2026 04:03:51 -0700 (PDT)
X-Received: by 2002:a17:90b:3c07:b0:3ab:1a24:56e4 with SMTP id 98e67ed59e1d1-3ab3aca1257mr9064490a91.30.1791889430432;
        Tue, 13 Oct 2026 04:03:50 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36f46dfesm20808403a91.8.2026.10.13.04.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 04:03:50 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 16:32:47 +0530
Subject: [PATCH v2 5/8] phy: qcom-mipi-csi2: Add Hawi support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-hawi-maili-camss-v2-5-fc93222da89c@oss.qualcomm.com>
References: <20261013-hawi-maili-camss-v2-0-fc93222da89c@oss.qualcomm.com>
In-Reply-To: <20261013-hawi-maili-camss-v2-0-fc93222da89c@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791889386; l=12145;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=QHOO/ApwrvMPHqYQQbryrqtsyaXvRwGNE62IT0HBf3s=;
 b=kXstl2PHj6wA0Gbg6i8wXpGRuVHFBg+01yfk7KW6fAnqmL6qsB04Q2IHOZXD+uZKo382mLcKq
 O+Tn1ydY+lLDu0yVAuKngRfF4C3GT2x7msG5j39UDr4LMbZvf1QCW2E
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MyBTYWx0ZWRfX4Y2QvqksGsWo
 1Rbj+nWgS8kgmQE0RCT5orFm2hBzYuCN0eCvFWT56JYJQwnme9ATxEyLcSc/1te6nIxrFPL6Gkg
 AvJQarl5bgBFUKIXm8jyDoe+8Q081QtxQFRn90R0IVYhwTOQ4xQyAKoLE22A+eyfov77/im+yZX
 WjkXAT2nsqDnhX/hMPXZphyyMSkxUrFAUkfd2bPosh+HmeQaIBsK0gRP4g5v+lJFGx4SggVMiay
 X7qbJr9ZxYnP6de/CblY/CaskrqBIzPVPPkviBeda7rmNl7TKKh0oYwE8EvFMBDNl/L2ID4tBY0
 l1AsGjQq9WKT1HqC3ip240ZmswhLaW2ctaBdJjpHAUszLv1IN6phlpN9ok82z9VJ3cP8iEDv8kq
 POyZ6F/oZ3NmM5t3v/fpdMUhqJLCFYJNxD7A4fvvcWlClTCZ7vacSczm9GRTqM3FM9qTYT+hvY2
 55Q1NEsROuBWDd/oagQ==
X-Authority-Analysis: v=2.4 cv=VPVIDNPX c=1 sm=1 tr=0 ts=6ace1017 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Bi4xzQbcsu4AotpEwdkA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 4A1SFNlYWx13Br7ilzAiFPgas4T5_M13
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MyBTYWx0ZWRfX6QHAgezO6m9c
 Wi2LBCxwguxNqSPDkNxnt6V4a/VAZshFcEdTeYIpaLyKG9o/KSWMoUmrDoUxS37L3efw4r7vGry
 +OpS9JnCGhPbwaRQWTXNRqBPBqQV4g8=
X-Proofpoint-GUID: 4A1SFNlYWx13Br7ilzAiFPgas4T5_M13
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130043

From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Add support for the Hawi 2nm CSI-2 D-PHY.

Reuse the Kaanapali lane table and adjust the data-lane CTRL0 value
from 0x8e to 0x8c for Hawi-specific tuning. This prevents potential
stream stalls and SMMU faults.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 136 +++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     |   1 +
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |   1 +
 3 files changed, 138 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
index 658a39463104bedfa31d0ccb81fd9d34017e91a6..1e9bb8b9e50bb15e7fad3c6e3d6048bf049e3e64 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
@@ -162,6 +162,126 @@ mipi_csi2phy_lane_regs lane_regs_x1e80100[] = {
 	{.reg_addr = 0x0c64, .reg_data = 0x7f, .param_type = CSIPHY_SKEW_CAL},
 };
 
+/* 2nm 2PH 2p5Gbps 4 lane DPHY mode, Kaanapali table with data-lane CTRL0 0x8c */
+static const struct mipi_csi2phy_lane_regs lane_regs_hawi[] = {
+	/* Power up lanes in 2ph mode. */
+	{ .reg_addr = 0x101c, .reg_data = 0x7a, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x1018, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS },
+
+	{ .reg_addr = 0x0094, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x00a0, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0090, .reg_data = 0x0f, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0098, .reg_data = 0x08, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0094, .reg_data = 0x07, .delay_us = 1,
+	  .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0030, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0000, .reg_data = 0x8c, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0038, .reg_data = 0xfe, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x002c, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0034, .reg_data = 0x0f, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x001c, .reg_data = 0x0a, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0014, .reg_data = 0x60, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x003c, .reg_data = 0xb8, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0004, .reg_data = 0x0c, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0020, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0008, .reg_data = 0x10, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE },
+	{ .reg_addr = 0x0010, .reg_data = 0x52, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0094, .reg_data = 0xd7, .param_type = CSIPHY_SKEW_CAL },
+	{ .reg_addr = 0x005c, .reg_data = 0x00, .param_type = CSIPHY_SKEW_CAL },
+	{ .reg_addr = 0x0060, .reg_data = 0xbd, .param_type = CSIPHY_SKEW_CAL },
+	{ .reg_addr = 0x0064, .reg_data = 0x7f, .param_type = CSIPHY_SKEW_CAL },
+
+	{ .reg_addr = 0x0e94, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0ea0, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0e90, .reg_data = 0x0f, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0e98, .reg_data = 0x08, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0e94, .reg_data = 0x07, .delay_us = 1,
+	  .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0e30, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0e28, .reg_data = 0x04, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0e00, .reg_data = 0x80, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0e0c, .reg_data = 0xff, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0e38, .reg_data = 0x1f, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0e2c, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0e34, .reg_data = 0x0f, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0e1c, .reg_data = 0x0a, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0e14, .reg_data = 0x60, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0e3c, .reg_data = 0xb8, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0e04, .reg_data = 0x0c, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0e20, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0e08, .reg_data = 0x10, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE },
+	{ .reg_addr = 0x0e10, .reg_data = 0x52, .param_type = CSIPHY_DEFAULT_PARAMS },
+
+	{ .reg_addr = 0x0494, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x04a0, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0490, .reg_data = 0x0f, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0498, .reg_data = 0x08, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0494, .reg_data = 0x07, .delay_us = 1,
+	  .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0430, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0400, .reg_data = 0x8c, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0438, .reg_data = 0xfe, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x042c, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0434, .reg_data = 0x0f, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x041c, .reg_data = 0x0a, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0414, .reg_data = 0x60, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x043c, .reg_data = 0xb8, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0404, .reg_data = 0x0c, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0420, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0408, .reg_data = 0x10, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE },
+	{ .reg_addr = 0x0410, .reg_data = 0x52, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0494, .reg_data = 0xd7, .param_type = CSIPHY_SKEW_CAL },
+	{ .reg_addr = 0x045c, .reg_data = 0x00, .param_type = CSIPHY_SKEW_CAL },
+	{ .reg_addr = 0x0460, .reg_data = 0xbd, .param_type = CSIPHY_SKEW_CAL },
+	{ .reg_addr = 0x0464, .reg_data = 0x7f, .param_type = CSIPHY_SKEW_CAL },
+
+	{ .reg_addr = 0x0894, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x08a0, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0890, .reg_data = 0x0f, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0898, .reg_data = 0x08, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0894, .reg_data = 0x07, .delay_us = 1,
+	  .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0830, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0800, .reg_data = 0x8c, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0838, .reg_data = 0xfe, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x082c, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0834, .reg_data = 0x0f, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x081c, .reg_data = 0x0a, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0814, .reg_data = 0x60, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x083c, .reg_data = 0xb8, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0804, .reg_data = 0x0c, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0820, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0808, .reg_data = 0x10, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE },
+	{ .reg_addr = 0x0810, .reg_data = 0x52, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0894, .reg_data = 0xd7, .param_type = CSIPHY_SKEW_CAL },
+	{ .reg_addr = 0x085c, .reg_data = 0x00, .param_type = CSIPHY_SKEW_CAL },
+	{ .reg_addr = 0x0860, .reg_data = 0xbd, .param_type = CSIPHY_SKEW_CAL },
+	{ .reg_addr = 0x0864, .reg_data = 0x7f, .param_type = CSIPHY_SKEW_CAL },
+
+	{ .reg_addr = 0x0c94, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0ca0, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0c90, .reg_data = 0x0f, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0c98, .reg_data = 0x08, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0c94, .reg_data = 0x07, .delay_us = 1,
+	  .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0c30, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0c00, .reg_data = 0x8c, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0c38, .reg_data = 0xfe, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0c2c, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0c34, .reg_data = 0x0f, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0c1c, .reg_data = 0x0a, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0c14, .reg_data = 0x60, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0c3c, .reg_data = 0xb8, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0c04, .reg_data = 0x0c, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0c20, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0c08, .reg_data = 0x10, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE },
+	{ .reg_addr = 0x0c10, .reg_data = 0x52, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0c94, .reg_data = 0xd7, .param_type = CSIPHY_SKEW_CAL },
+	{ .reg_addr = 0x0c5c, .reg_data = 0x00, .param_type = CSIPHY_SKEW_CAL },
+	{ .reg_addr = 0x0c60, .reg_data = 0xbd, .param_type = CSIPHY_SKEW_CAL },
+	{ .reg_addr = 0x0c64, .reg_data = 0x7f, .param_type = CSIPHY_SKEW_CAL },
+};
+
 static inline const struct mipi_csi2phy_device_regs *
 csi2phy_dev_to_regs(struct mipi_csi2phy_device *csi2phy)
 {
@@ -405,3 +525,19 @@ const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_3nm_kaanapali = {
 	.genpds = x1e_genpds,
 	.num_genpds = ARRAY_SIZE(x1e_genpds),
 };
+
+const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_2nm_hawi = {
+	.ops = &phy_qcom_mipi_csi2_ops_3ph_1_0,
+	.reg_info = {
+		.init_seq = lane_regs_hawi,
+		.lane_array_size = ARRAY_SIZE(lane_regs_hawi),
+		.common_regs_offset = 0x1000,
+		.common_status_offset = 0x138,
+	},
+	.supply_names = (const char **)x1e_supplies,
+	.num_supplies = ARRAY_SIZE(x1e_supplies),
+	.clk_names = (const char **)x1e_clks,
+	.num_clk = ARRAY_SIZE(x1e_clks),
+	.genpds = x1e_genpds,
+	.num_genpds = ARRAY_SIZE(x1e_genpds),
+};
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
index aff9e66f0352e1d4d7a07d10d350ea2cba6df233..76c55f8e30b8c629818762d0b42a7dc4ddc6716b 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
@@ -445,6 +445,7 @@ static int phy_qcom_mipi_csi2_probe(struct platform_device *pdev)
 static const struct of_device_id phy_qcom_mipi_csi2_of_match_table[] = {
 	{ .compatible	= "qcom,x1e80100-csi2-phy", .data = &mipi_csi2_dphy_4nm_x1e },
 	{ .compatible	= "qcom,kaanapali-csi2-phy", .data = &mipi_csi2_dphy_3nm_kaanapali },
+	{ .compatible	= "qcom,hawi-csi2-phy", .data = &mipi_csi2_dphy_2nm_hawi },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, phy_qcom_mipi_csi2_of_match_table);
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
index 2355a1db9b941469325646ef81d0f70c6a2badc4..4ad058b916ebba8b319cb297c231cba10d3ec602 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
@@ -95,5 +95,6 @@ struct mipi_csi2phy_device {
 
 extern const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e;
 extern const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_3nm_kaanapali;
+extern const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_2nm_hawi;
 
 #endif /* __PHY_QCOM_MIPI_CSI2_H__ */

-- 
2.34.1

