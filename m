Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795593612;
	b=wueJ3BmxvP9x/FpgHQslbkhCcQYkHYW3qd5wqP+GDOd39/4ev2qHHEjQ8MZ0gyCwjgDI
	 ladvef78dXK/qC5Ybf++56CB6kj4B8t1Yn9guVB0Em5KSWKjRNeJvWEcmCt3vFa1DtZZ4
	 PEQSwGa7DtZdSxrfN6Q83toRqOyHhYvaB091ZA1KcYrFGN0yD86sSDbKE19NjQ/Ye1Xa7
	 cU3eZHxJB/cH/j8mTh9Q4gau3BWd3/VUBlbK7CUDYdIDM0jEWXAcznuhVb1GmY7NwRnFh
	 fR98Qh5gtmETcnVQw1/VOZHdFGMKjmZYVCYkI6D4MfZ7Xi/PRr2TAqScI9lOmtc4lCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795593612;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QZqenHJHuvpcFmonw/+lrZ9R12/PrmorwdB0s5e0yt0=;
	b=NlhZUExTC0wOClOQRWEVRwVaQngBeuVOzmH6/Zy290vLN8LTqaH7Muh0n2c4CCjoAYPo
	 TnBjHOLkurO8iazmhp8FL6K3oTeiqHKRReDmSr9gXYP5IR4BSsBjgX8USb5hcgUK2ZXXw
	 ZVBN/MYsmKP1+7IwbHTTy7F/QgIYpEqVeAdwoW8gIKEI6dgoRedp//L5KtApGULescZkL
	 DY0EMpn+0/8kCMnKZRasSwlm915M6UsHmALrqdoFKGMgSFUe2wxdPA6soov22EK8yz57h
	 ReQ0AhLPHW8ajkMdC7BuY7Gb7nmg1GT3PUhef2AoTIYyCvUfPGdArWJ+qhBKIdpzfMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=fail reason="signature verification failed" header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bCYvtYsx;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15354606A695
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 08:00:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15354606A695
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bCYvtYsx
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68Z4v300019
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 08:00:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QZqenHJHuvp
	cFmonw/+lrZ9R12/PrmorwdB0s5e0yt0=; b=bCYvtYsxLXNYdxwoJyQIm/UCcVH
	zW5DnjDxvUPYxBNJD7oo2ivT9ftJOT7BttbJIU1rEjDANjmw3T85K7OA3Lpe2VlT
	MNxq2ACPtnl5Gbvgq9LXl0hFQkdQncOGbJqAIjG25dmaLrQ/0myNcZqbDfslkju/
	/XaJG263TiFeocOecLwI31eEBq8OZg+nyK4inU01GkL51wG6iI/jstZGGgdY1p5d
	N3NiSXg1ZvPjsJ0MkIyjvn1en68sBW4SyxJieYPWxoDIEcnK69DMBkp9Znu1qZv7
	zrRxA8+RFAkJFqIdxEnExaZm8iKdoAww6rYB8c0XTtNtGXLHXRg3Zp+yyXQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5n6rsf8t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 08:00:11 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9495a1f5e47so857194485a.1
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 00:00:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795593610; x=1796198410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QZqenHJHuvpcFmonw/+lrZ9R12/PrmorwdB0s5e0yt0=;
        b=bBU2gfwCnE4UiK64hFo/e2fY1ZXAzD2+THkTplHHb+s4W8TTVfn+LRXMwhVnLin5Gc
         tlSkIcEEbJTY2vEKHEaSoqnhXhdap7vN2mEuSxNJubCl2CkkeIMEw5MU5tNpMQ2MR1Qr
         Qy8saGNvD7ZP6a9Dx/dZzqcUaFYN1R4w4yiBgzkg+bsVEaEQttc6LOe3Nsrbe2rIZfuF
         ekl1wm2wpl8dHj7S2dPefekDGo4BgxUJeJK2zjmR1xMlesrlRccUPAdaoe5E+zz+2sNa
         8mu8HyTAXJ2x/elp4lBaBhc9gIMwFUfuUeGAqF4MzXJz32hwiXQwVXG566Tcb8SedRmH
         lYVg==
X-Forwarded-Encrypted: i=1; AL+hErFNKJf2i6QKJcQy09DpHFyLwL81ZNwtEQS2zVy5FfboTEUDlljjffdt7cuH2L4eA6qbrS5lfPriqfRB5g==@vger.kernel.org
X-Gm-Message-State: APuU4Z8VrpbLFQn09i+0pJ+vpUvP3XU/mjaftkhGpIe+6QzjJBRWj+6I
	py48DsakdoinEl52W58R83tTr7guPFIOdjpVCKWyCoNdsw+o4NpnTIzs94KHC8qLutBIiW96uuf
	s8s+RzUpUO/DA+bMVKJ5QFy7OQtaJP9aC3YGalkrzKR3kH+Yqrvlv06pP4crhOHHtnA==
X-Gm-Gg: AZFdTZd4+rqYsf1Bv91WCbZS7fhSdYONDV0SorCWcD8M5g6J1FN2U91lYdGZZCZKctQ
	x6apX0UasnxZWPLFN9K+dB8/3sWdYro+axBDIgSL10P7rX5XiEzagkQ8h5CpS9uSZNLTUnmGQCt
	ihGO2kDcbYKTn4sho1868pvpMvZWkchl9HrZwRT3hD+itxPnrd/CWQVQ9u7NBcMRt8KNv6OiJZC
	In36Uy990bSFfo5yBE9duxQ6Q67HsesG09LN9KalA0tlHOcu74Zjt5HkZh0j9h4Jyl8+uZ1QuhI
	NuBBWQF5T3UHAQHECAQeY8J8loqLgQyQHwCZy29oNhs8J4nyDJ6a1rJBuEYtTFxkCcHlb9UVcDK
	dQJvMv6FxmuJMREkx8cNTz7nmL7sAeSd/
X-Received: by 2002:a05:620a:6602:b0:949:74d8:4706 with SMTP id af79cd13be357-949bab2a981mr2985233085a.72.1795593610430;
        Wed, 25 Nov 2026 00:00:10 -0800 (PST)
X-Received: by 2002:a05:620a:6602:b0:949:74d8:4706 with SMTP id af79cd13be357-949bab2a981mr2985229785a.72.1795593609971;
        Wed, 25 Nov 2026 00:00:09 -0800 (PST)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9846sm585912015e9.11.2026.11.25.00.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:00:09 -0800 (PST)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, Hitesh Patel <hitesh@ebytelogic.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Subject: [PATCH v2 02/12] media: qcom: camss: Add csid pad to port helper
Date: Wed, 25 Nov 2026 09:59:51 +0200
Message-Id: <20261125080001.2540101-3-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125080001.2540101-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261125080001.2540101-1-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzMSBTYWx0ZWRfX9WlyVcCZUB1K
 yYgDl8Av2iFfpRjakm9H1XE2cFyuTXluydvIEf/eTTCOqsl7EAGtudRq4g5VJut22U2PC0HWBbp
 9VpEoZ1gZQ/ibOSXtlumUOXutZ+v+IGylebavf9/aWRkVt8jP+7qjfjbmo5hF023BlE47PvlMgN
 vOlqSpmDsYW3ZqVsIzLck5VKLb0WKQXQpB7vYnVv6bmho+ShQbjf13M/qFXrOSNzLf2j9gOoKlG
 WAP+4E+IkYCeSV8ipbbrC5+qj+9Ig5SZ0j3DlMM23g4elRSOBn7xSfUR//ubl8KCqCtokHzXm1f
 3d3sb1siAhqeaX9Ee5ouq/+JguVpaq20MXRcqiZyMzteaosDj0hl7De47qkIeZNQiPf63aMbUCj
 gevVSxMg3/HGSuonZt+ZiTXOfyqFoeBdMzNjLQxGCk9YMxrCe+kr6qdg7PoTNcCaC31xBhCPZxs
 XZMMDB1YIVR+TL/tFOw==
X-Authority-Analysis: v=2.4 cv=Voa2kO2n c=1 sm=1 tr=0 ts=6b06958b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=gL8YbPdMY_OOZm72eTgA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 68kxOKbngZ_cafqi7coFKMoli3u6D-9o
X-Proofpoint-ORIG-GUID: 68kxOKbngZ_cafqi7coFKMoli3u6D-9o
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzMSBTYWx0ZWRfX0v24RIWEf5jB
 bsuqqJnFOY/1+PUxUd7r709k3wpFboPmRB/HIlrN4cR7WKhd8MuLuhEGNwhSEhTZjZkIIsDFuNk
 WGjk0j4BLeOkBxU04mda+CZGX35CGVM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250031

From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>

The function to convert a source pad number to its port
index, and use it in csid_get_sof_seq instead of the inline
subtraction.

Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csid.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index 588122beec85..0f819c34e760 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -1356,6 +1356,17 @@ static int csid_subscribe_event(struct v4l2_subdev *sd, struct v4l2_fh *fh,
 	return v4l2_event_subscribe(fh, sub, 0, &csid_frame_sync_ops);
 }
 
+/*
+ * csid_pad_to_port - Convert a CSID source pad number to its port index
+ * @pad: Source pad number (MSM_CSID_PAD_FIRST_SRC or greater)
+ *
+ * Return the zero-based port index corresponding to @pad
+ */
+static inline unsigned int csid_pad_to_port(u32 pad)
+{
+	return pad - MSM_CSID_PAD_FIRST_SRC;
+}
+
 atomic_t *csid_get_sof_seq(struct media_pad *pad)
 {
 	struct csid_device *csid;
@@ -1367,7 +1378,7 @@ atomic_t *csid_get_sof_seq(struct media_pad *pad)
 	if (!csid->res->frame_sync_en)
 		return NULL;
 
-	return &csid->sof_seq[pad->index - MSM_CSID_PAD_FIRST_SRC];
+	return &csid->sof_seq[csid_pad_to_port(pad->index)];
 }
 
 void csid_sof_event(struct csid_device *csid, unsigned int id)
-- 
2.34.1

