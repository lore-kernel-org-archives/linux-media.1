Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793736355;
	b=xf79IF7D/sg+3XEaIh1V2Sq3NvKYcVxqE2RiRDU6v+vqdHM59G0qV5mBKnTLYsfyyI6G
	 +ga1gFRHOr4xWsjyGip+YWtsqp2EV5RR0u9jOWV/+ML+VJKmwPApq2Pnhj82A+LStDJqj
	 9OTG+Xkj3gtHGTBe2t0YNCm4GDJ7AUEf6WzSj5+pObl/aYLzhaeS5fubBVy46eAogJPXY
	 SagSCsSR0o9eov3C5SpW+/DLTPOQpuNald5jHoa+VIwaHL6appdtm9kwPiLfmYdZZW4+I
	 emEUwHEkmBmgSnsK1HwAIxvhzC7/sdpTlgqB+F46loc8cXQ/ellzpn34Zk3OY2hTOqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793736355;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=TgR5F+iBiHqDbSrZbID4DhVkgUbDwbnclx1Ow0233B4=;
	b=D+acCivQRPt1iI27fE5e2CKuavzLFd2v49Akyq6VLtw/gy/ubkqvh/aABmk6vHjbvZN2
	 HJfQ/eRLItzb5FXqQGDvz1ZzpXCzVnNsmWR95bCwo3Sj8rjmnerIukj8+6J2Dv3NJe5de
	 X4r1b8/Yx5rlBaUF9d/MoPR2Yr7b+2LzueZ8bK3ZUWhWHNc/Z2G3W21Brexx+FOwAwsnZ
	 ZN6Q22mZzBS1fBCLiNG5IDJZmjdNAtises1DWnVMKNn+bPie15drd7WMUil9ZyC1DDZj5
	 vxR5V7dLxQsIFTwvxTzWMSgqznfjURa6mJdOBxPdYweMqNXXEgRIrcN8npOwajDUEAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OrdkKGXM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="A8iYZke/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9197606A33E
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 20:05:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9197606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OrdkKGXM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A8iYZke/
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3IZ6JP056641
	for <linux-media@vger.kernel.org>; Tue, 3 Nov 2026 20:05:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TgR5F+iBiHqDbSrZbID4DhVkgUbDwbnclx1Ow0233B4=; b=OrdkKGXMIYie7ZBw
	gX1jlhQeGe0W6e+SD2J+U938n/FIjb6t/MrnoJrjkj9ngAeb3GyWdxwYhUMijSz4
	c3MESy5kh9H1mf14YhEvsnc9EaKlIp1CnNSmOtUSa1tnBYWGFSqMV5ru+0SCfMyk
	wzcaZ+gwn4ZTlGBFp4Q1bLIHntDHo4XbHS8uKEWRIuvtNDR+IqmjNaUSm5I7U7OL
	TYg/LWQZ7thcXer47bFvIdxhgoVaeJgDwuP9+ryUvJJE1fkf5NfROFm+5+Ov/qaP
	hEgb0CNvqMcydckZ8VngxuvfEki4uNsQX7ujeWJ/FRwUK3mE5jG+4kWryOGCHAeW
	QfEXWw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqkgp8vnk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 20:05:53 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7c0bad5ec1cso1217661137.1
        for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 12:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793736353; x=1794341153; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TgR5F+iBiHqDbSrZbID4DhVkgUbDwbnclx1Ow0233B4=;
        b=A8iYZke/o8wtpJunv+zXr0VhcPeHQyuBbFbYkQwcpmlVicQx65rhK+ksKl8jrhCHc/
         70Sb0Wz7JCgpGTyAGauaFMNmAsHPcVxOtl2CbTEL18SNcCs7mxPZ+WOiRvuWzkyZGagB
         d5CEEdKlu/+Nn1YSPB8wD3Q2bGppdm7fSBUkNZ2EtqpJIz4z7fsOMvdhKHSbTWSUelDD
         BWNeUUcJVWO5OFI3ikqaSbSV/eB89elGVox13SWGI5GJ50HJXQQOaH/6QKKXYxWsilJK
         ogi6n3BpTax+g5xwRotoMus0iyTVO/SwYasf9Y+hP52EmgvpFLC1q3fRmkY/6pPS3G4E
         8g3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793736353; x=1794341153;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TgR5F+iBiHqDbSrZbID4DhVkgUbDwbnclx1Ow0233B4=;
        b=HAmwH8y9srU2JXM+FKaymzhTnktBJo6qtAuQdnOQvlL7x6ZGm8DAJ6zRinAFGXKmpk
         nTgRjtUxXli+Woz2U0WyK+aSLPTgK1HJVvt5iWDYlY4kBBvOOmDIpoLWanYuYuxWaIJ8
         kN9+MZdQWV8VMYCkydKWpwv7RDyAPscSmGWNUjau5OKrOKcEPug8N9VF+ybyxwyYW4Fg
         hsT8ZYKC+a1wGBno9teeiSlRnpoKP8QG8K/n6kcS4HPijlbyYn0tf8kRUH2hW5NxOmfg
         5sqUsr75AX+48+X0PpgEqtacyHPdBcicCVYa/sSnFPgcHP4h3duV+BPY0c/sanzWxWAg
         cAiQ==
X-Gm-Message-State: APuU4Z8BbvTdYyWdzPZM6nd1hwoK5sX7zaPlMV8jUtbShMtodiTxuhbb
	oSvJYUmnthL5oSU8BJOOj2akz92MVG9cDYlkNupVQYElfdr2EU/IcIaAYJi6JWyyd7cXVvr8Mf/
	NyjOil97h3jmCr0HbIpR/Qdlt0TUTz+8Mb8rH4vbDLyQYkHQctUVv6AH+JiAU5jWbSQ==
X-Gm-Gg: AYBFou1zoznu0mlnon9zzFg7KPL++ydQ660qYzlLM7gwPRnjO/KWK2S5HAE6nH2bI9Y
	O+38eFfr/CRinmbi0rey9d0cz9urg/d6nbsa9nLMMXmC2fQ/+ze1O5y6ZQGxmxABvx4/MmMRtu9
	T6obz5lord0a53IVoI+G8aEdScaDkzci0sgipBQR5GKrmQancTXf7TQKOAUWLrcMRocZ2ETmkCx
	wlmKZ4wketD4ksKt06JCXtYw1VsZuqe/iEcVBV2I9/9vTZ3yueh6lob3+xTJ8Y338T9I8vFsO8X
	k2jG0aLYwyBsW38afzQdvOKXInHEN9Uxf+9/83DdpjFJ7a6G6AQFVt7nnheNONyKmxGm3xUtXE9
	prt6C+5dnGFfdZzUDxEac9/WnntZOLsk36hnrWNxoQAnB6jC4MKjaXAdtPrQzkFKzFC9kW7aDwy
	SQhYVVXKBEGAq+4+uHSozFVxWlmOuYUF4yY3pP2vLmOpfQnZlWUBX7oJInDRstKzokHTR/xijM4
	94IVk8rvYzcbI2Fq7baj0nvJyDp
X-Received: by 2002:a05:6102:5811:b0:7c3:9a36:bbda with SMTP id ada2fe7eead31-7d0727ad784mr5651416137.5.1793736352883;
        Tue, 03 Nov 2026 12:05:52 -0800 (PST)
X-Received: by 2002:a05:6102:5811:b0:7c3:9a36:bbda with SMTP id ada2fe7eead31-7d0727ad784mr5651401137.5.1793736352383;
        Tue, 03 Nov 2026 12:05:52 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f048:3e89:c517:10cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fcd03d01dsm358875f8f.44.2026.11.03.12.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:05:51 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 21:05:45 +0100
Subject: [PATCH v13 1/9] media: qcom: camss: Add V4L2 meta format for CAMSS
 ISP parameters
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
Message-Id: <20261103-camss-isp-ope-v13-1-c2cbf15a39b1@oss.qualcomm.com>
References: <20261103-camss-isp-ope-v13-0-c2cbf15a39b1@oss.qualcomm.com>
In-Reply-To: <20261103-camss-isp-ope-v13-0-c2cbf15a39b1@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Hans de Goede <johannes.goede@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA4MCBTYWx0ZWRfX/j0sJ6U99GVp
 20omM9w3XOHPMnIZICHSNRTnRQ2Vp2YVQMIbzabMbU9TPRhplP+F3Hp5smPUK9aXU2U/NorxQUI
 6jvCXP1GE87IZGsrQ+HqxWFoWVV5Lr6jAoJMRRaSbrsWJABwodCQtuHWf0T3CZoISg+BRyJ2BN7
 rKJgUjZhEr749B3UHJBhiRZsWSt7jpDENn2DerDUhpKfqCEYYHsCAflcI3mEMfHB11PNv34QKEm
 lxA3N+tdCC2ljdIe4+kM+WCtbidNDWI1ay2BxKKdt7l4nRsbDKlf3W0CR5psnKSzl0ZUR4Y1rVz
 0LC2AX6ApKHiqgyl1IqlV9ymHu/29KpX3qc0D1sGdcQxS5rvHn+4fOyB7C76r5zljPrwGykEyx9
 BTJ/ghRa4DWITIw2fv7XHuOuLK/UVg08mUWViK4J3k9aTbKUAFTbz8CsvHsu7PQE5TU6fBnHIcH
 H5FS8Z8bBO8tcINqc2Q==
X-Proofpoint-GUID: ftShpZZQZFTEd49EDIUChOBIdGuy1ofF
X-Authority-Analysis: v=2.4 cv=Yoya1IYX c=1 sm=1 tr=0 ts=6aea3ea1 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=mDm0RygAtmZY0osY0NEA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA4MCBTYWx0ZWRfX4u5tu2RpFKbQ
 RQXdkgKuYXTnGb+vbHxd8IOcw/nKNOw7v5IAJ5DjDJIoQfCEHg/eNOAovmWxJX7kWnUKEi4tFLG
 wEUYpLrTiDKzNWPu9Rja7nzSXUDnSY4=
X-Proofpoint-ORIG-GUID: ftShpZZQZFTEd49EDIUChOBIdGuy1ofF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 spamscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030080

Add a V4L2 meta format code (V4L2_META_FMT_QCOM_ISP_PARAMS) for the
Qualcomm CAMSS ISP parameter buffer. This format is used by the params
video node exposed by CAMSS offline ISP drivers (e.g. OPE) to carry
ISP tuning data such as white balance, color correction and chroma
enhancement settings.

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 1 +
 include/uapi/linux/videodev2.h       | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 17ba1ae707355a134047de646f61fcc2d1512d4c..cef1593c1835070f7b34a8b8c860738fb77f533a 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1471,6 +1471,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_META_FMT_C3ISP_STATS:		descr = "Amlogic C3 ISP Statistics"; break;
 	case V4L2_META_FMT_MALI_C55_PARAMS:	descr = "ARM Mali-C55 ISP Parameters"; break;
 	case V4L2_META_FMT_MALI_C55_STATS:	descr = "ARM Mali-C55 ISP 3A Statistics"; break;
+	case V4L2_META_FMT_QCOM_ISP_PARAMS:	descr = "Qualcomm CAMSS ISP Parameters"; break;
 	case V4L2_META_FMT_RPPX1_PARAMS:	descr = "Dreamchip RPP-X1 ISP Parameters"; break;
 	case V4L2_META_FMT_RPPX1_STATS:	descr = "Dreamchip RPP-X1 ISP Statistics"; break;
 	case V4L2_PIX_FMT_NV12_8L128:	descr = "NV12 (8x128 Linear)"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 5373dba640fae3d19247ab1c74ba336e05dc0fe0..70208a9443d8ade569f130e2fc3d6beebab6b636 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -893,6 +893,9 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_RPPX1_PARAMS	v4l2_fourcc('D', 'R', '1', 'P') /* Dreamchip RPP-X1 Parameters */
 #define V4L2_META_FMT_RPPX1_STATS	v4l2_fourcc('D', 'R', '1', 'S') /* Dreamchip RPP-X1 Statistics */
 
+/* Vendor specific - used for Qualcomm CAMSS ISP */
+#define V4L2_META_FMT_QCOM_ISP_PARAMS	v4l2_fourcc('Q', 'C', 'I', 'P') /* Qualcomm CAMSS ISP Parameters */
+
 #ifdef __KERNEL__
 /*
  * Line-based metadata formats. Remember to update v4l_fill_fmtdesc() when

-- 
2.34.1

