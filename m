Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1113BE168
	for <linux-media@vger.kernel.org>; Tue,  6 Oct 2026 22:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791326508; cv=none; b=BBB3dpM6vLoW7ghfPzxlm9cA58Ye0i/G5t13GbwzCQ+rofC27VPynyyZ/NDq2YiI92Wpe0saXPctE+e4sY6i2CVPrnYvtSgZRek9RTqYqyJFHO1goAZ9opI8yaxEjjG3NtlcGV+B7+pFP1bGJBjlInjIl+5GA7Q/fetqPMLumiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791326508; c=relaxed/simple;
	bh=VOMacKAim2NeRKzYRGCKCM59giQCmbzASTn2t1LQzPA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=a44mAEl9zh5Hy8I1+8dT5Omy/YGslGFpDz5l6Glrhtnbw8E7SlXBvPEVTZ7VjQnyh9uQk9nSvj5up/KJXL23eUXjp5FutJR0bDEdZ4Vqd6Oiw1qkrr0h3tOfAR6NuOoYs3J9RKxu8LdY9KKKc9tHhFjBJXh0hyoAoR8RVBefpSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mn2f8f68 reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mn2f8f68"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696Lea8E1676240
	for <linux-media@vger.kernel.org>; Tue, 6 Oct 2026 22:41:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zwweVgbuw4Q
	eHx19ruMA4VKdQmD4Y6znPZooowo2HgQ=; b=mn2f8f68JJPPZi+RFN7X74QqpLR
	IkHyOI/5pn48/3g/a+YNnFLfTZAOHqP/Euzuk04jET/vNiPfVvWPfnYxrS76+hYk
	DyJ/IKw6f1jU3yBSXwaGgTsR/y7i5uGVMiDjWUVFk/dKJN5bGf/wNYNZFoMMzgXp
	LmrrABKgTg+mTtbAqMe6cvSbYntQ7vdS/Siea/3L3yUvUiqAhK1d8kVUY+kFLDbW
	qTyM4Fyse6EOX3tPVHnOAEu1HniQnROg+H7NBwd3nBqVmXwfsoYQhkRfByeVHPBH
	eeodvKV9/ws0RgQ+QydCQHEteIPzV5H4MsNOhxwgPw3pc4T65KCTOr1laxA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4xdub10v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 06 Oct 2026 22:41:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93dd3c3badbso650883285a.2
        for <linux-media@vger.kernel.org>; Tue, 06 Oct 2026 15:41:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791326465; x=1791931265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zwweVgbuw4QeHx19ruMA4VKdQmD4Y6znPZooowo2HgQ=;
        b=AegsRiXqYO1D5dvsqsA/LXZi8Qa10PeObM2H+pAa1VEBJPeaS9ijhxl9ZOUajHkXZp
         etBs+WlNyG1P9EN2+NvGQvU987YuigdekojOoYliOb+qTvLNs7aRv9Cn12PIyebNs6rk
         GWIt+8nMK8MFHlpDkNoWCwi8UKL1Pu/QRTNL/BHl9HUxOGKEejaIiakSblh5BS63hu3u
         +DJNFXCOI2DOzpFuOrIDDqTGOZbxe5XW4dd8aA1P/J9BMOs37iFL604iJbW8dvYWhE0I
         0lCDTNpltQO/1Q8ZR/kqv+yN7AB2ys8WoiU8ypwRFXZIQZ6ABXMJ16b3qE1FGO0rXo12
         TVTQ==
X-Forwarded-Encrypted: i=1; AKwUvByvhE8l42KRs63AY1SPI4InuFZMU+Wg5zMY1OJnd/6URplazrtfEtJ8oaoSzBZwh+YiPxKGNXTaSWi6OQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mKGkTNcpYghasTTM13Ypyoctx93f7AX4tXC60/cnb/jenRaeWP
	XChc0177P579fZPRpbuf4nwOg9rRA7bOVoPM01hxeiELoUkfM0o57yFk9jGApiaxfKiMEPC6Tiz
	P9riwXcsl73o5YJMU3V73oLfmcDEL5EsYAwZ/x0r5SV3aNGTgCvLRUkUIUIAkJb3RFw==
X-Gm-Gg: AYBFou0+Kz+VmKUWke3PLYaWlPEjnJm3Omh7jsbNUm8Mpc/oZZe+/sboxgkxE4/sPJ6
	g9PZcGE38vpcmKU3r6YpAL3G1sB2p5rPhljoAB5aPxNBmRWTHBWc6i/hFn+AsWb5gTggxoxZjhj
	em6XUv6L/nZI5prAWaRQai/jFl1EiTR/aBLDlXZ+sUmEv9XO9n0eF3kt1aLj9mmA9vKqkPfvL+r
	FpScpkOf8gZbsgmzy6JkMIO8Ji/cvPtQwMIC5eDklB7vQNg+7l7N9lnblG3GvIxwZjBXUiGFOJf
	fVP2b3XmLHljrmOqNmd9Y7ZAMY2Og8sZWzxsb6LzloLpUPMYLV2C5FZiIrE=
X-Received: by 2002:a05:620a:2853:b0:93c:7582:14e4 with SMTP id af79cd13be357-93e9b7b9d91mr70293785a.40.1791326464739;
        Tue, 06 Oct 2026 15:41:04 -0700 (PDT)
X-Received: by 2002:a05:620a:2853:b0:93c:7582:14e4 with SMTP id af79cd13be357-93e9b7b9d91mr70289185a.40.1791326464279;
        Tue, 06 Oct 2026 15:41:04 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53299sm167263575e9.11.2026.10.06.15.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 15:41:03 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        hariram.purushothaman@oss.qualcomm.com, pshrotri@qti.qualcomm.com,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        johannes.goede@oss.qualcomm.com, konradybcio@kernel.org
Subject: [PATCH 21/45] media: v4l2: add Qualcomm IFE statistics format
Date: Wed,  7 Oct 2026 01:39:29 +0300
Message-Id: <20261006223953.3382273-22-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX6QLMVZNrWHNK
 srB9K/DNUWl1xeapi2+HakLLO/TCsWKX63CtrBpEKRUf10Ezk7jyPffJ98hRqgLi5jrGsXyZpat
 +oB4cHGKracDMasN92bhddnNBq+RHsU=
X-Authority-Analysis: v=2.4 cv=NshE4MdJ c=1 sm=1 tr=0 ts=6ac57901 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=ayFhjqOtJfiHK51EeDoA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: TiWCj9c3VsmXRELYchxPJNAcT5VObyX4
X-Proofpoint-ORIG-GUID: TiWCj9c3VsmXRELYchxPJNAcT5VObyX4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfXwqq7pD97lv2M
 jS04rhzWOvIWdSkEm6cxBK0LACPKUqevtr4oLV5clTG64YV+xm+pWhOpGQM9TnZJMscEv6vVwCP
 mFAdbN7Rg/Uv8/SzCW80SnKKPWeC889BmoOXofR9hHTP1Pho68fHSTYlcrCo2il58xZWQXJZvwL
 inwC5m+9oDwWCZeP3s6cAp/sqM0+9Iigw+zxret9/wVe+c6wyw0mr6cT/9k0JY60DUf65q4UdmU
 Ca9doNc2hUn/VMaMo76DWZVdszjtuh+RWFfGD3lrF3rfx706WWWS0c4i7xRuZlpRwpGSq7oNqNL
 u0jQcrrONxN6csxqcDJTXuafuVIFO0ujYKXB4u8P+KyNiE+LjE5dL9d9l7OnDuZ6mb0cPYN0LJF
 IS4fJIKhOTru1bP3F1/gz1AYe833VhGJyq7Pw6bI6iZrTlArSU0BTUvNi5f/0+9Ytht9i79Kz1J
 OMCdO4B+9/YVXFpnwfg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 impostorscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060090

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Describe Qualcomm IFE 3A statistics buffers with the QCF1 metadata
format.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 3 +++
 include/uapi/linux/videodev2.h       | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index cef1593c1835..b7173a258225 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1467,6 +1467,9 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_META_FMT_RK_ISP1_PARAMS:	descr = "Rockchip ISP1 3A Parameters"; break;
 	case V4L2_META_FMT_RK_ISP1_STAT_3A:	descr = "Rockchip ISP1 3A Statistics"; break;
 	case V4L2_META_FMT_RK_ISP1_EXT_PARAMS:	descr = "Rockchip ISP1 Ext 3A Params"; break;
+	case V4L2_META_FMT_QC_IFE_STAT_3A:
+		descr = "Qualcomm IFE 3A Statistics";
+		break;
 	case V4L2_META_FMT_C3ISP_PARAMS:	descr = "Amlogic C3 ISP Parameters"; break;
 	case V4L2_META_FMT_C3ISP_STATS:		descr = "Amlogic C3 ISP Statistics"; break;
 	case V4L2_META_FMT_MALI_C55_PARAMS:	descr = "ARM Mali-C55 ISP Parameters"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 70208a9443d8..4a0748b60a15 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -876,6 +876,9 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_RK_ISP1_STAT_3A	v4l2_fourcc('R', 'K', '1', 'S') /* Rockchip ISP1 3A Statistics */
 #define V4L2_META_FMT_RK_ISP1_EXT_PARAMS	v4l2_fourcc('R', 'K', '1', 'E') /* Rockchip ISP1 3a Extensible Parameters */
 
+/* Vendor specific - used for Qualcomm IFE camera sub-system */
+#define V4L2_META_FMT_QC_IFE_STAT_3A	v4l2_fourcc('Q', 'C', 'F', '1') /* IFE 3A Statistics */
+
 /* Vendor specific - used for C3_ISP */
 #define V4L2_META_FMT_C3ISP_PARAMS	v4l2_fourcc('C', '3', 'P', 'M') /* Amlogic C3 ISP Parameters */
 #define V4L2_META_FMT_C3ISP_STATS	v4l2_fourcc('C', '3', 'S', 'T') /* Amlogic C3 ISP Statistics */
-- 
2.34.1

