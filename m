Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B0C403AFF
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 11:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790161457; cv=none; b=KylEh6t4fY1W/408D0uxFTEJIP5UJ13RWmqRMuDt/YKwDjCHwgGV68k4DV96FZt0rHeFtyiRhDk+fP7/xDxh6jJX8XjSR6eAu4vsOtmMRZdqYRovcJ9mzEDib81Ivz+OTyKlpHc6nQVWU4GYpRCfi+UMY+7fKqoCipCcRTrOBNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790161457; c=relaxed/simple;
	bh=yLtX1PLwOVeGZoNLSkVb9L1mGOV3vsplzjV4KY6SlTw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CY4yxFt9wDxjliQS2TOSXvkJDIKmpBfB6LLat6ZI5MKttTIqyHfL8KmNuobYYmYITV/iUVcJIAYaRhevXXh19g6L12Ze9qXaKyvcCiaVw/SqKCi85dxiQccnf9tAa/koz5CdA6JgE4rcxFvAQvA5iPBLNo18HJBnZeWf69zmxK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mj35o58y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dl+ZtxAs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mj35o58y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dl+ZtxAs"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA2mXW3208868
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 11:04:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hN5pJW/1dD45B5iCpeN5mFbHHc4A9vSVhEzkczkQXlU=; b=Mj35o58y3QCMPbFC
	8TLkyTSI+6AL1RFwrM5de45RCbq33pugUXbp3RY17MNyytYmfW9RtgpVJ1hw1zaq
	kxHDPYfa4N2KnkcsGNlerxhoZFqgzj8gcrEAjY2PIb9hH/YePC2FnfmfsrBwEbpb
	yHeGIQbPi9uzgRRv+/I2jJDr8HVBZ8O6rBi7e+kogN5NVZgIMaBljiOx902l9j3U
	4BLILC+Bu5+MOezv29L4r9CCE191Wp0Z4DtW5uZm8uhsfP7lJdd2B4rOWUoTG10h
	a8iQA+/2wz1Wv9ZE1A5+cETJod4Pe86713+kRAq0QE/H3lx7pEC0u++j+0oG1o1+
	whh7mQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv78n1msp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 11:04:09 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33baaba6371so1786745eec.1
        for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 04:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790161449; x=1790766249; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hN5pJW/1dD45B5iCpeN5mFbHHc4A9vSVhEzkczkQXlU=;
        b=Dl+ZtxAs3Ax7DhTDS6i0keK7ld+tE3N2JVhAvbJRyK4M/Epmq82u3D6CUJ+7KBmXzV
         mqX1fmtDffTpsW6cArkiPhabmwNQNDtM+nZeeu9ZHxxBKLUvz89iXmdUizbI4N8bXAtQ
         v6RvNV9sJGMRF/okVcbE4vWpv+imzqsCfhBEiE/Ft0dUru7maMdOCTZaaO4LnOKo7I0n
         PUSppwtye0B+DUW8DFnMBKP1+9kaYGKatzfG9H53wfvkjA/wYK33ZHlLx2G7UwsCOoc3
         wkZvJa8iIeVzvVW2UA0D4/MuFw2xf7/1ck9SdKms4IenCVXT+77mqyP7lK9Ke8xhlWmr
         DrCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790161449; x=1790766249;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hN5pJW/1dD45B5iCpeN5mFbHHc4A9vSVhEzkczkQXlU=;
        b=1BoEg33JZhPFi/NzK2+avRr+H1wHk7dmo1C63e+Ej1JSAwbbyX88mRreeFQPt2sf4R
         TPWXW/VfxE732ZzhwGaNPTTp3cLrO9gV4M7L62KkYUx/WCaZJCdB21hhul23qh1gKLL3
         v7BJ+k0Lnz1690ETa5W6aHJ9FyIg+AWNtdlJbmb/mSUoNncAjqk5hvg8DLOYKCjsyKqM
         Nb+ntK0F2wywquekalHqLlS++qdDId7Is9Z2nq5HvbjynNyUGepH6fVsxjwodoEiVjV9
         oONhZUWMIqZ7UGJS/x6zJHgXNV/+6nEQIX1lMnHn4u0livLTJCGFYapxudNdtXCgMWEq
         /Mdw==
X-Forwarded-Encrypted: i=1; AKwUvBxsm0uf6JJAj+Lq9oG3nrevOb+Ue1l6nOUTS3iRFWGCzjZZLSXwls4F9ZQzoYRorBpwmXXD3zc+rowvGw==@vger.kernel.org
X-Gm-Message-State: AFuF++nqjHiGXav2NzecV7j0ODIywA755wbdMowgCD8Qrtz5G/lmrRfL
	2tEzHUj+OClJKo0LG/be67gibR12ndWkuHbj8Fl7A13TNEPPubxGj6cWlu3m+MfqLo5iw9IQACD
	AI4Dy4g3+eyCsUxPZL6A18VuBNPWZpVltp2N2Y8aZui3R8F5Zuh9BQn4dKfDQc1BFhQ==
X-Gm-Gg: AYBFou0sarBHEY9uUmBJkLpTLHqr/TgI4qx1TfAQMPRaHj+n2XcTU0zarwKfmFIF+Io
	y5iL9oQ7k/ZxdHD70K8PqZ18/ELfWycARhwsOLoEQyFS72aZiayRD4ouYh4Fzvk4bp+CsSIZHck
	T/3/7pIx562aaRgKo5q4gq34lmT6RHu8pUwSUzACPq+YqFFE5v+LNxI8MQ9rP6qe0xl6wIsNXbm
	Qgrdrre89gHV+ZVsJBO0Lf1K9LcJqCDWF8G/iA5uNn+yz5D0E7otpQXL9JomuDcMQNxqzF02UPQ
	7Ld8XM/7FgVHm6adrfhYoaKx8WDHhHPkXx66kTL5c5NZChjKyQAHf0gsWSpg5vEv4Vw9SW0jr5f
	N7ahX4+lEkGjUZWeEhgegVsCxKr89nQ==
X-Received: by 2002:a05:693c:415b:10b0:33c:e86:b2e6 with SMTP id 5a478bee46e88-33e8dec8339mr2609050eec.34.1790161448356;
        Wed, 23 Sep 2026 04:04:08 -0700 (PDT)
X-Received: by 2002:a05:693c:415b:10b0:33c:e86:b2e6 with SMTP id 5a478bee46e88-33e8dec8339mr2608989eec.34.1790161447319;
        Wed, 23 Sep 2026 04:04:07 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e9625825asm5905377eec.13.2026.09.23.04.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 04:04:01 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 16:32:37 +0530
Subject: [PATCH RFC 06/15] media: qcom: camss: vfe: Add support for VFE
 1190
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-hawi-maili-camss-v1-6-cbbb42e534ef@oss.qualcomm.com>
References: <20260923-hawi-maili-camss-v1-0-cbbb42e534ef@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-maili-camss-v1-0-cbbb42e534ef@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790161355; l=5335;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=U3LMLhstlT1V1V+dKiCrH4zG6uZ933Im/cVt5rMYzoY=;
 b=50tDvHp6qbrXKfRTUBjaMEpKXHn8aB5o/S6Uk0OcCyUQrlJeYr/ZzpOQ7iJLQAQoe86hVDck3
 yNfTEx9VmNiB/plVaanSxvcTMdgA8+kkark4K/hiQKDDBK3OmScrmDJ
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0NCBTYWx0ZWRfXxyGHKjg28n3a
 mz5u18hNMblAPsUJjziXDmgP0RmRJzHS2AqHWCZu52FpIRhiRDSO7GH9FxZ3Fu/vecuk7WIuoNb
 GGo8eInSzCQcDtnsKuAJ+UnnU8kgcpU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0NCBTYWx0ZWRfX4YWJVMoNpCd1
 BLtgQjkm1PWep8cfbhe7og3vHw3RViKMCxhC+An3bfrp8WFskQ5q+Nhq7FWHYxsxYTBSCYqkAbW
 yICg/CWjrIJjrd0rmCzBJMi+D2JhZpm7RfMYwo5rkQfSwOAvoNyoN3UBq72vPDXtY3EBePJ8iur
 YS8IRe9llPDi0fWjwZm3Vs4mUHokIFuqT6k615ZlgSPMiG46Ysh6fLH1BKoox8rbD68l/s1B/GC
 k9m+YbcAoWuZMfc0YvYnq2lCdv3wfvk82iyWZvIiPjahqe5GtcXeFocFmxU/xd6kYwQ1K1USPt3
 koXpLHTcwYUzmxV0TwOwm8mpmnedZq3Q5kRCec5YRzGwaT08IMnr7V6vbvvjvlhPJzUfG3XqchT
 kR3H0HmZ73gcQZSgQja5CQ12/wfbFuvQAQ50i3LwIpq9wFv8QGYT5p0vIQvtKPREzDowVILQS1a
 Fw9RkFXnHfR8Z1lIzAw==
X-Proofpoint-ORIG-GUID: yW_GbvWvAGrIXHeNHlOgmj9dFJceT9YT
X-Authority-Analysis: v=2.4 cv=aNFlOr9m c=1 sm=1 tr=0 ts=6ab3b229 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=K2FGoDgSqdHUgQQgPRsA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: yW_GbvWvAGrIXHeNHlOgmj9dFJceT9YT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230044

From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Add support for the Video Front End (VFE) on Hawi SoC. VFE gen4
has support for VFE 1190.

VFE 1190 uses a different bus write master register layout from the
VFE 1080/980 variants: the per-write-master register block has a
0x200 stride based at 0x1000, and several individual registers sit at
different offsets. Parameterize the bus register macros on the VFE
version so the gen4 driver can serve VFE 1080, 980 and 1190.

This change limits Hawi VFE output lines to 3 for now as constrained by
the CAMSS driver framework.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-vfe-gen4.c | 49 ++++++++++++++--------
 drivers/media/platform/qcom/camss/camss-vfe.c      |  2 +
 2 files changed, 34 insertions(+), 17 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-gen4.c b/drivers/media/platform/qcom/camss/camss-vfe-gen4.c
index d73d70898710a2127c606ac8459a1d8c747a2f7c..eece3c8698e66d739dd870d79b549dbba8e52ad1 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-gen4.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-gen4.c
@@ -13,36 +13,51 @@
 #include "camss.h"
 #include "camss-vfe.h"
 
-/* VFE-gen4 Bus Register Base Addresses */
-#define BUS_REG_BASE				(vfe_is_lite(vfe) ? 0x800 : 0x1000)
+#define IS_VFE_1190(vfe)	((vfe)->camss->res->version == CAMSS_HAWI)
+
+#define BUS_REG_BASE_1080	(vfe_is_lite(vfe) ? 0x800 : 0x1000)
 
-#define VFE_BUS_WM_CGC_OVERRIDE			(BUS_REG_BASE + 0x08)
+/* VFE-gen4 Bus Register Base Addresses */
+#define BUS_REG_BASE_1190	(0x800)
+#define BUS_REG_BASE		(IS_VFE_1190(vfe) ? BUS_REG_BASE_1190 : \
+						    BUS_REG_BASE_1080)
+
+#define BUS_REG_OFFSET_1080(n)		(0x500 + (n) * 0x100)
+#define BUS_REG_OFFSET_1190(n)		(0x1000 + (n) * 0x200)
+#define BUS_REG_OFFSET(n)		(IS_VFE_1190(vfe) ? \
+						BUS_REG_OFFSET_1190(n) : \
+						BUS_REG_OFFSET_1080(n))
+
+#define VFE_BUS_WM_CGC_OVERRIDE		(BUS_REG_BASE + \
+					(IS_VFE_1190(vfe) ? 0x4 : 0x8))
 #define		WM_CGC_OVERRIDE_ALL			(0x7FFFFFF)
 
-#define VFE_BUS_WM_TEST_BUS_CTRL		(BUS_REG_BASE + 0x128)
+#define VFE_BUS_WM_TEST_BUS_CTRL	(BUS_REG_BASE + \
+					(IS_VFE_1190(vfe) ? 0x144 : 0x128))
 
-#define VFE_BUS_WM_CFG(n)			(BUS_REG_BASE + 0x500 + (n) * 0x100)
+#define VFE_BUS_WM_CFG(n)			(BUS_REG_BASE + BUS_REG_OFFSET(n))
 #define		WM_CFG_EN				BIT(0)
 #define		WM_VIR_FRM_EN				BIT(1)
 #define		WM_CFG_MODE				BIT(16)
-#define VFE_BUS_WM_IMAGE_ADDR(n)		(BUS_REG_BASE + 0x504 + (n) * 0x100)
-#define VFE_BUS_WM_FRAME_INCR(n)		(BUS_REG_BASE + 0x508 + (n) * 0x100)
-#define VFE_BUS_WM_IMAGE_CFG_0(n)		(BUS_REG_BASE + 0x50C + (n) * 0x100)
+#define VFE_BUS_WM_IMAGE_ADDR(n)		(BUS_REG_BASE + BUS_REG_OFFSET(n) + 0x4)
+#define VFE_BUS_WM_FRAME_INCR(n)		(BUS_REG_BASE + BUS_REG_OFFSET(n) + 0x8)
+#define VFE_BUS_WM_IMAGE_CFG_0(n)		(BUS_REG_BASE + BUS_REG_OFFSET(n) + 0xC)
 #define		WM_IMAGE_CFG_0_DEFAULT_WIDTH		(0xFFFF)
-#define VFE_BUS_WM_IMAGE_CFG_2(n)		(BUS_REG_BASE + 0x514 + (n) * 0x100)
+#define VFE_BUS_WM_IMAGE_CFG_2(n)		(BUS_REG_BASE + BUS_REG_OFFSET(n) + 0x14)
 #define		WM_IMAGE_CFG_2_DEFAULT_STRIDE		(0xFFFF)
-#define VFE_BUS_WM_PACKER_CFG(n)		(BUS_REG_BASE + 0x518 + (n) * 0x100)
+#define VFE_BUS_WM_PACKER_CFG(n)		(BUS_REG_BASE + BUS_REG_OFFSET(n) + 0x18)
 
-#define VFE_BUS_WM_IRQ_SUBSAMPLE_PERIOD(n)	(BUS_REG_BASE + 0x530 + (n) * 0x100)
-#define VFE_BUS_WM_IRQ_SUBSAMPLE_PATTERN(n)	(BUS_REG_BASE + 0x534 + (n) * 0x100)
+#define VFE_BUS_WM_IRQ_SUBSAMPLE_PERIOD(n)	(BUS_REG_BASE + BUS_REG_OFFSET(n) + 0x30)
+#define VFE_BUS_WM_IRQ_SUBSAMPLE_PATTERN(n)	(BUS_REG_BASE + BUS_REG_OFFSET(n) + 0x34)
 
 /* VFE lite has no such registers */
-#define VFE_BUS_WM_FRAMEDROP_PERIOD(n)		(BUS_REG_BASE + 0x538 + (n) * 0x100)
-#define VFE_BUS_WM_FRAMEDROP_PATTERN(n)		(BUS_REG_BASE + 0x53C + (n) * 0x100)
-
-#define VFE_BUS_WM_MMU_PREFETCH_CFG(n)		(BUS_REG_BASE + 0x560 + (n) * 0x100)
-#define VFE_BUS_WM_MMU_PREFETCH_MAX_OFFSET(n)	(BUS_REG_BASE + 0x564 + (n) * 0x100)
+#define VFE_BUS_WM_FRAMEDROP_PERIOD(n)		(BUS_REG_BASE + BUS_REG_OFFSET(n) + 0x38)
+#define VFE_BUS_WM_FRAMEDROP_PATTERN(n)		(BUS_REG_BASE + BUS_REG_OFFSET(n) + 0x3C)
 
+#define VFE_BUS_WM_MMU_PREFETCH_CFG(n)		(BUS_REG_BASE + BUS_REG_OFFSET(n) + \
+						(IS_VFE_1190(vfe) ? 0x64 : 0x60))
+#define VFE_BUS_WM_MMU_PREFETCH_MAX_OFFSET(n)	(BUS_REG_BASE + BUS_REG_OFFSET(n) + \
+						(IS_VFE_1190(vfe) ? 0x68 : 0x64))
 /*
  * IFE write master client IDs
  *
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 826ab85a44a14e611ff9918f6c8de40edf483fb8..92dbd59477ad6cfe2d2e7e663397dde0271a5c16 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -353,6 +353,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 	case CAMSS_8550:
 	case CAMSS_8650:
 	case CAMSS_8775P:
+	case CAMSS_HAWI:
 	case CAMSS_KAANAPALI:
 	case CAMSS_X1E80100:
 		switch (sink_code) {
@@ -2017,6 +2018,7 @@ static int vfe_bpl_align_rdi(struct vfe_device *vfe)
 	case CAMSS_8550:
 	case CAMSS_8650:
 	case CAMSS_8775P:
+	case CAMSS_HAWI:
 	case CAMSS_KAANAPALI:
 	case CAMSS_X1E80100:
 		ret = 16;

-- 
2.34.1

