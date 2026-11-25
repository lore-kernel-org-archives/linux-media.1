Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795631028;
	b=LKiWD+94+ltUEhhD3X8tL+/Os7L8I8NTAZUw5QY0FlQVQEWt5yyPPIgWZ0cx91ZsVoZk
	 1n9V444x+ZyJll3FzthXzb/Uyuk99i9UdnrgOqDfsAFGZ7P8ukS67EvaDKFY/8Ofz/33S
	 0rtkCw3pYARVIodg1uVLRsYzmj83jYCiuu/PpzRH96bSVSMSY4LsuHkksKoKuab1BES+x
	 EZxkxG/QPEorU29Aczvy2CVqcXnt73ZdrkVrLDwhflK14UPetcleWi3IaXBE8GedkhRmM
	 bjKl8HWcCF2+S1wsXZIOfKjLqA6kc7S4dCAXuVqriUjr2N5kI6JvxWZtyfsBubnQBQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795631028;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uxKxeCj5wsqZbNkY3Pso5/3yu6BMfXeN1V4cy6qFnsQ=;
	b=ranb8y5eAo0UeGP9IHIvoIXpCVh9yOjlarwaO+9syTwDPK43JUvCmz0B4BKEmrB4beMQ
	 KnWCQgsfKxULysyXvdBxu/+KXNnY4y339xos1ssVb9G0FLOPj9qNqJILamDBdmfJ2JzWv
	 Qhpin43IRo0bx84nz6tZkyrk07WalihZsAfMTiDn42m31BPgfl42elfGde6svtktfW3XH
	 52auI2B6F+WPSXE37Jovd7SCLvlEtyukkM5zRD8WrDuptarr74u83Rkuqs+B/BvuhXRKd
	 ef5hY8gmbY3cC40qFApA2yiuUptELlNuNQmAZob5zP6Ya2TKr7VJKGA0tKOlJRSLpyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fZ7nyQuL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TYiYKOHo;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63EAD606A68B
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 18:23:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63EAD606A68B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fZ7nyQuL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TYiYKOHo
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APGQMkU454193
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 18:23:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uxKxeCj5wsq
	ZbNkY3Pso5/3yu6BMfXeN1V4cy6qFnsQ=; b=fZ7nyQuLEkQ4O94uQ34n+LlrVzE
	KEKIKNmYCAYcvae10mxvZR7lCXQkEUMd35rF6EavGxbo14LzxS+f+7cCDAFBQM0d
	JwMil78/bmTdt5FuUfIi4ZqkxsNcCq3RYxEymwOCYiUWm6NAXC0xUBaxevSCRKQY
	3FXUGNpLfzpHIQJtApzHp191ZtzujB1cfa3E94a6xQekrfSjvBN0kjypios5QWNP
	j9KTMn2sE8ckRDeaw7PD5BhvQxEfpxXaFnAaTPiIuwnoY7Rzvs3I4xKE2SG6Fd8C
	OOafxrC/UmHWj8BA3JtFdw01oAs0N5klxOzohC185Qrgch2pHjwm3MKuMLg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vv2t7f1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 18:23:46 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f1f2fafeaso691119585a.2
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 10:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795631026; x=1796235826; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uxKxeCj5wsqZbNkY3Pso5/3yu6BMfXeN1V4cy6qFnsQ=;
        b=TYiYKOHoFOVjpRrtRr5pi9Zp0//iOntwVxbebGIKroLsRNWimIvVUazIQYw6vcumhS
         4xXpNYA6Kaw/1N4dULBT36OSq4FwG3Alb282U18zH7kUVGyxPLc2rZC3YrtDMAJiM8AG
         h3ejHqxbUU0akzcLIHdJ7rORYdN4mGNVTzas2huqkZ+4C0EzPEOahAlU4ig2qfEeCBdc
         P94RAl1WliSDi//XRq+V2NHxjmjrrZsEo+MNp9OK5TPIyWiwmC/BZBBqSy5f/naqEy3I
         8USrZYxSfP6MVn4TuBVpy9P2+SRBjd2pKrwuitmZOdiY4Rgpnf131SbrW779WrmcvlCW
         hjUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795631026; x=1796235826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uxKxeCj5wsqZbNkY3Pso5/3yu6BMfXeN1V4cy6qFnsQ=;
        b=Jf6nYFQIr9sD8OsSPcvMrnXt0L0pP91hfpFCV95i8mkAbBVLXR+8CJNoLcfVHrkBPZ
         m7TltvZJ26HDNUJ9Rg3h1MvtHV+1VUc2L6LVCY93qeymbdauLN4XoFJJ3paDSZTD200I
         pnwB0NK2GCfT9eRvQW9wsph+VbcklaoqsNw4flvsU/jj2awwBfGeIHeP4OVQ/ejY/+6G
         SLeux4MLCJmTFAYdLM+2z5a2cFlCWvRhtmnsfufoewcdhpOuMd0mjuKHMz1tusc1FQr0
         uEFJWKw1MxKWTLrCK60z4xE4tfw4EmgF/LYGWFSO/Oj3vDGD/vwEEW+HNAYM9qDpx8IJ
         lJ8A==
X-Forwarded-Encrypted: i=1; AL+hErGMr+yrkdckOULWegwwohR4aaTbFSIjw8gnlfuntXzgIsx6Zhepdl37RBPusJNLzpr0EfezjkgU/sCwDQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8WXEyckx8AwyRvUWDDFx1Ue5rNL1mszi2TV44Hv58XRjXr13bn
	mjHNElInlUyulVOr10m/n1JH1DPzv8Y92/2zUbJO9UdCBfaB9ZBHw0iXmsL+qevZ59QtCgmPCB/
	r5wmlEzGIjUD1OA/D+TRHWUIrgOXTY2E8Ka3JFdNvEQloPCe89FbPUowsiiWGjFpQiQ==
X-Gm-Gg: AZFdTZdFMzMVPfbll33K48Oo6zvVgzON8TT+5F/4IuIOgm0KgF54MSeo42QBMSw1WkU
	wWgRgCMXueQ5QGrJTzoZVN2CFPodFxcNM6DWMlbKzH2ZZt0MUdSaFBCBLxQca89/Az4sxERir32
	O75ClQ2hOc64kYUzAeXCF27rB93yNjd9VfFufM+2zfbbjZxXKK8AiEd1JSNLI2eakkiXqj5oHOk
	CqQxauJ21wS57KG8Ttc6UwcKf70eo9T74XJnidO717FoTPXJys9Ytuo8bGKSDYBiZFpXn408Mjh
	Zc6onINTUYe3YpH4wbmZzfIVs1NUJVpZYnN4Ef7t3IXpsW9iI7m6oohkA2uYOuXHi3IUjBpK5o7
	GTiq83krBznpsglbkNIcpI7O+8KHSvV8vgAs/E9hBQ1stYgGaZ/kER6FP4w0J7cHiqlErpZND9/
	GYrUOA
X-Received: by 2002:a05:620a:462a:b0:93e:c12c:9dc4 with SMTP id af79cd13be357-949bab23b5bmr3248908085a.68.1795631025565;
        Wed, 25 Nov 2026 10:23:45 -0800 (PST)
X-Received: by 2002:a05:620a:462a:b0:93e:c12c:9dc4 with SMTP id af79cd13be357-949bab23b5bmr3248903385a.68.1795631025018;
        Wed, 25 Nov 2026 10:23:45 -0800 (PST)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb42absm37185609f8f.1.2026.11.25.10.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:23:44 -0800 (PST)
From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, Hitesh Patel <hitesh@ebytelogic.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Subject: [PATCH RESEND v2 02/12] media: qcom: camss: Add csid pad to port helper
Date: Wed, 25 Nov 2026 20:23:16 +0200
Message-Id: <20261125182326.2767771-3-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125182326.2767771-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261125182326.2767771-1-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA3MyBTYWx0ZWRfX8ha4PIcdxlEL
 xAn1oB/r0baYI2/KWbdrdJxmozFihDceXu+/6phUesI2U4wIVW9A9F5pU6pudQZBI7qX/p17O+Q
 NUI0OJJDxqA+XBK0FmVS9sQEy91GWXo=
X-Proofpoint-GUID: _-CFvIKrdZdHPjcuSJvT0rSHw3284qev
X-Proofpoint-ORIG-GUID: _-CFvIKrdZdHPjcuSJvT0rSHw3284qev
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA3MyBTYWx0ZWRfX1gs5IMm1Vyyg
 IXBTDOStz5Jfec4UWmIGebLDenTTx+ksroPTPa88rgKF5qqu883hoq+2xl/YnALbzTrqVxhCnfj
 pNZoV+6Fu64Gk+dTymMgGBRkvrt2liZmwhAx7qsR9oGBEeVdpr0KFh+5XNfiRcrCyVLFpqWPZmG
 rBT6/H01+z3WqC5PrWY67eOuicczbytVDm3VhggHOU+gzfWhP+IES4y0YXYR3KjC57o/jEi0r66
 GNivPVix4qoPks/n/7V9vLEEQjkrGXx6F2pX4dtxSUFBMbkCwn1++D0t3Ljh1FrfOMXgwftR6+1
 Ael/YAxnqIv5+s7r9LVnoG5aTaLGN3jdufzhcLIvx+WwWZvCHZT55JMEwLlNiCVTOxP9AX/JNum
 eRclM+oDjxxDrFTaKVC5Kc9saLb/66DMLcEAtxKM7mDB3RakRiRAvIX1vQzWqPYX9uCO/iSVAKV
 AdIk3KBo3EJjoZhJ72A==
X-Authority-Analysis: v=2.4 cv=A/z5rKWG c=1 sm=1 tr=0 ts=6b0727b2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=gL8YbPdMY_OOZm72eTgA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250073

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

