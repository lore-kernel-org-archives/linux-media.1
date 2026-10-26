Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793021855;
	b=oVmXdwBHt2rh09+Xv7vzY0GLBWtxWzI57fhSSPMAJwZCui/SvhGX+QJD2ApO4IapMUWZ
	 W3iJLHSt8ymXngfXWiqykwZ/oEm6NXpZ77V9hwPJLSQP1Rl/++TSttUdIF7z4zFO+UxR0
	 /qYWqnr+G+WWgjTPlx6SAXXqDyzIffvN0Td6megYgQq49+zsK2W6N4nl1D4zSvf21C8Uf
	 pF3uxYj91A3FA2Xb9/fqEwrm2ZQSgxYfzWSVh387Myb+iVpktKubrU21r12HPOa9VuvYG
	 O3zL0fYWObj6nB68XMhkkbPOsb/4r/pHhtnO1JxjC2DWWfHblRxu9D5EZuvc5Vg7vvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793021855;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Wv4VOK5tSeLNeBGONP5wrvvrJlbhMS56L/2JZ3kV7Hk=;
	b=NPbxDqZ+bP72pUSGWlqqs3xUoe19Y39DikdfjpSDrCkmvYnN9oDe+WV1V/QipaA1Gu8B
	 JDmL39QbHr5iX7xHcBA5QuWNus7PwXTMZd4eBctbvY9U1YFC2ZM0t8gAjP1fC2B7+5+UW
	 tw7z2dHiUz+F1Jb5pJCq99RF9BybVvS39O2/W1Eu6N+1kGGUXo+KVqbpy7rWNiLLTN7QM
	 uNbo9KAR84oqNyvenptZwNbVfUUO6SPmAB7nrq+oxqrJrw9GCWRfjJSiVnw9LMsa07rWl
	 lSIEBKxp84V5mLkV8mayeQCbVyyJ9xBynJV/J46Ur5PAKNS1eRFgsvS+VYlOqhB7/Yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h3k46n22;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fvXfRc5z;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A9C60A383D
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 13:37:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2A9C60A383D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h3k46n22;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fvXfRc5z
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAsp0c2168629
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 13:37:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Wv4VOK5tSeL
	NeBGONP5wrvvrJlbhMS56L/2JZ3kV7Hk=; b=h3k46n22ByleTTBjAatk5nHKhfn
	mSErQvjO2BJ1GLoMXmQGlmXh0YlMLpVyFxYVvjhPnlw68JorQGRuCR9imJcovWFl
	1MUQh99KoTxOyu0xznDLWKRO/G0c4JPqPoh/huhtyeMux0JE7NeIGZbzAtviJgVz
	2bMTb/BZnajRG2motYniDz1lgJ43z7kH4sR1e27es383SRQywNSmfHn03ONSpgYf
	uKoXCG2doEFrhyaU4srFmZJ6oj0kF6nsE940bcYtnSrMDMKJ7V+CCiEpLJBjvt3J
	gADx63Gpwq7pudHNZ13zmeZSymsSQ9NNxTyLUV3lLArFcf1xcKuIy5iT04A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj3u610ea-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 13:37:34 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f37c94ceeso829006585a.1
        for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 06:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793021853; x=1793626653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wv4VOK5tSeLNeBGONP5wrvvrJlbhMS56L/2JZ3kV7Hk=;
        b=fvXfRc5z0sOFyFsUM6Vpo4k9ekEfk7ofOeWNPxYeifPyIRn8Zmyl9clwtEYz480Hdw
         1CSLpPvM4/1ydYmsd2svvxWwnnB9k4bPcPqWjLqladb2hyCkyt/iB2tnoJlO7yi6LBU6
         vmEUXhdEN8vRzDiD8tZ9NjtEo0849MP7NCkRYuJ6OrbGLHLXEoQagBPshulSVIgmxnIe
         weEId3f/f7scp+xT+KTRxbz1gAyUHaYbMY3komKpSpqnNcV64qEfpPDQ1PpbgOLZZCqv
         IPm3IWb0KrM+pWEB/JPs4871jXRTp9wlBAtkCg1+5NJ6hNHbL14jxfIf7T8z7jCMI+KL
         HlzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793021853; x=1793626653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wv4VOK5tSeLNeBGONP5wrvvrJlbhMS56L/2JZ3kV7Hk=;
        b=dZAi8lx9PAqmOD/E598GIm00vIEKcOFS2cEn4nLEEPAVYthhdQ7LXAtpM0NuMV1Qm9
         Y1sJ35ncwiLdgWJflqDqGlQOcppDbpn3pGj/KA1YYcXwRQtQeio+wemyk36xQ99XkkJH
         24X9d5Rp/F2fxsDpWh6LCSfoOeD5EU4aQBPy4GXHMeQJgubnt1TJ6Uc7OKdd57p8SlUH
         Eg1zwaV25sgYHlkH7BTndB5G8eleSKlkVRav6EbevAl4w4JzoBrHXU5BnhVe6PqadK0o
         GfJU+l+vPy+wTWjPR2WMefqI5mavd4GC2LC/IZ5TEtSxVZeEwrC3CohSc+kIFbmnOfg7
         h+WA==
X-Forwarded-Encrypted: i=1; AKwUvBxsGGYDFN/OIzMqGc1mHyKChoArKs7XQ88lBdwoowhZ4S85RD/8uoG2UXLi1Y3jLNuo8jrC+E11QftxdA==@vger.kernel.org
X-Gm-Message-State: AFq9FYICfI7xgJOxegzJYj5gPQusjTpbQ97h5aheW08r6C9yk7l74v2M
	Mx5uXuV1VVisjKQlJEGRpt4OuHO48oHMjBzkVXSU5+0npY/fTITfZh25iX/wa8VpWE+ovVLMIJN
	kx0NfKv99Y7bFqcf6fm7zZq35qas03sTCClFkk0fkN0aBkL9Ip3IemOmMaFXiqIUyvQ==
X-Gm-Gg: AYBFou2nhwx9PtKpRnBwq5NT9kYuFZPZjSexU2kZnAISgkNYVShYAkpbqBBuYEA6XVM
	YBgpIUZHBbNISk3h1do1HRj8G3HzjdMwDBnOFeqm3f7PuzX+MR0VP/js39wHcZNfmk8POYaTq6v
	xGNAXiw30Kb1HitmKfu+2FUI2zgz8q8hIu0EMHxhTY3O9N7zYTgmrgI0biX+wKxUvbmfwbdI1jt
	cgTRcgFURlSmzE+LN5FC49jay8jZxPLM5geQXxfhWNrrQP50j02VI+SYIl+CqL/mNW0ALmqFbx6
	yKfclKEyZRrawKbTdjcmq3u7c5978c1s2Qcpyf5u1nIGHHiFejSAmzy/NUp3exiXzUlIkrS8jSK
	75ij3xb0LMR76SQpjssqvCQDm
X-Received: by 2002:a05:620a:6841:b0:93e:6e6a:b686 with SMTP id af79cd13be357-940ef999dfamr847560485a.29.1793021853138;
        Mon, 26 Oct 2026 06:37:33 -0700 (PDT)
X-Received: by 2002:a05:620a:6841:b0:93e:6e6a:b686 with SMTP id af79cd13be357-940ef999dfamr847556185a.29.1793021852652;
        Mon, 26 Oct 2026 06:37:32 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f305sm15376512f8f.3.2026.10.26.06.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 06:37:31 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/6] media: qcom: camss: factor out the VFE minimum clock rate
Date: Mon, 26 Oct 2026 15:37:21 +0200
Message-Id: <20261026133726.3249235-2-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261026133726.3249235-1-atanas.filipov@oss.qualcomm.com>
References: <20261026133726.3249235-1-atanas.filipov@oss.qualcomm.com>
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
X-Proofpoint-GUID: Nvzj8Ni96qPnrG3RZOqwESVP908UwYTp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1NCBTYWx0ZWRfXzEAgzIgiL5Qi
 ofq3P4O14LXhubHjRPepeD3uCtjGOMECnbtZnrfRHWfoxkf+NbDZqk821Gb3RNWtUuqmRolIQgr
 7MYTbhv44ykD07CWnE5BrbnDR2rI8lJzJBMQYuop53pWWOdAMXEcR0Ch2XfchA7Ez3uUOuhhYCq
 b1rZzOPOnowyZNvbL9p7zb63gGGHC3QU6yhYev7Wn+k6Mqb8v6GXeACeiyQc8gpiyFSAI1i6aFC
 2tW94p7omcErtmwYZqINWY+0Ljm3RjJeV6HoQLKY17U8jZsPqMOBf84v3MrRvTeCGscCOlQx1CT
 CZeh4gKAH9GM5dRwU/1/Dlsgljhf+OH6QBT7IQzkf9lbT6C8f6hnlT08OvNZttRXX6IfixJ8AXU
 4dpdbj4owSWWhZ+Lc9driMvbh/6/CpnnUe1QDaSDgFlsiAj0vQggpdAHSmhI6w4YRTstwZg9XAo
 nLiTpmgDN3vYAob7eSg==
X-Proofpoint-ORIG-GUID: Nvzj8Ni96qPnrG3RZOqwESVP908UwYTp
X-Authority-Analysis: v=2.4 cv=K823jCWI c=1 sm=1 tr=0 ts=6adf579e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=ezZDx3Tf6p_-T66H79UA:9 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1NCBTYWx0ZWRfX31iWDCM5q3ow
 OgAOfdNff/pogEuQlBwUzadM7ZJFftwLPW4rZAAEGUP0d1oGiKLuXWURoapIs1DB9ZKh2hhImNI
 TyJqckW4daq6m/QCfpqIfDrOUk6K+bo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260054

vfe_set_clock_rates() and vfe_check_clock_rates() both compute the
minimum clock rate needed by the VFE lines from their pixel rates,
inside the loop over the VFE clocks. The result is the same for every
clock.

Move the computation into vfe_get_min_clock_rate() and call it once
per VFE, so that the clock loops only select and check rates. No
functional change.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 108 ++++++++----------
 1 file changed, 46 insertions(+), 62 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 2680a9914765..59be37f83df3 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -935,52 +935,66 @@ static bool vfe_check_clock_levels(struct camss_clock *clock)
 }
 
 /*
- * vfe_set_clock_rates - Calculate and set clock rates on VFE module
+ * vfe_get_min_clock_rate - Get the minimum VFE clock rate for its lines
  * @vfe: VFE device
  *
- * Return 0 on success or a negative error code otherwise
+ * Return the highest rate needed by the VFE lines for their pixel rates,
+ * including the clock margin, or 0 if no pixel rate is available
  */
-static int vfe_set_clock_rates(struct vfe_device *vfe)
+static u64 vfe_get_min_clock_rate(struct vfe_device *vfe)
 {
-	struct device *dev = vfe->camss->dev;
 	u64 pixel_clock[VFE_LINE_NUM_MAX];
-	int i, j;
-	int ret;
+	u64 min_rate = 0;
+	int i;
 
 	for (i = VFE_LINE_RDI0; i < vfe->res->line_num; i++) {
-		ret = camss_get_pixel_clock(&vfe->line[i].subdev.entity,
-					    &pixel_clock[i]);
-		if (ret)
+		if (camss_get_pixel_clock(&vfe->line[i].subdev.entity,
+					  &pixel_clock[i]))
 			pixel_clock[i] = 0;
 	}
 
-	for (i = 0; i < vfe->nclocks; i++) {
-		struct camss_clock *clock = &vfe->clock[i];
+	for (i = VFE_LINE_RDI0; i < vfe->res->line_num; i++) {
+		u32 tmp;
+		u8 bpp;
 
-		if (vfe_match_clock_names(vfe, clock) && vfe_check_clock_levels(clock)) {
-			u64 min_rate = 0;
-			long rate;
+		if (i == VFE_LINE_PIX) {
+			tmp = pixel_clock[i];
+		} else {
+			struct vfe_line *l = &vfe->line[i];
 
-			for (j = VFE_LINE_RDI0; j < vfe->res->line_num; j++) {
-				u32 tmp;
-				u8 bpp;
+			bpp = camss_format_get_bpp(l->formats,
+						   l->nformats,
+						   l->fmt[MSM_VFE_PAD_SINK].code);
+			tmp = pixel_clock[i] * bpp / 64;
+		}
 
-				if (j == VFE_LINE_PIX) {
-					tmp = pixel_clock[j];
-				} else {
-					struct vfe_line *l = &vfe->line[j];
+		if (min_rate < tmp)
+			min_rate = tmp;
+	}
 
-					bpp = camss_format_get_bpp(l->formats,
-								   l->nformats,
-								   l->fmt[MSM_VFE_PAD_SINK].code);
-					tmp = pixel_clock[j] * bpp / 64;
-				}
+	camss_add_clock_margin(&min_rate);
 
-				if (min_rate < tmp)
-					min_rate = tmp;
-			}
+	return min_rate;
+}
 
-			camss_add_clock_margin(&min_rate);
+/*
+ * vfe_set_clock_rates - Calculate and set clock rates on VFE module
+ * @vfe: VFE device
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+static int vfe_set_clock_rates(struct vfe_device *vfe)
+{
+	struct device *dev = vfe->camss->dev;
+	u64 min_rate = vfe_get_min_clock_rate(vfe);
+	int i, j;
+	int ret;
+
+	for (i = 0; i < vfe->nclocks; i++) {
+		struct camss_clock *clock = &vfe->clock[i];
+
+		if (vfe_match_clock_names(vfe, clock) && vfe_check_clock_levels(clock)) {
+			long rate;
 
 			for (j = 0; j < clock->nfreqs; j++)
 				if (min_rate < clock->freq[j])
@@ -1024,45 +1038,15 @@ static int vfe_set_clock_rates(struct vfe_device *vfe)
  */
 static int vfe_check_clock_rates(struct vfe_device *vfe)
 {
-	u64 pixel_clock[VFE_LINE_NUM_MAX];
-	int i, j;
-	int ret;
-
-	for (i = VFE_LINE_RDI0; i < vfe->res->line_num; i++) {
-		ret = camss_get_pixel_clock(&vfe->line[i].subdev.entity,
-					    &pixel_clock[i]);
-		if (ret)
-			pixel_clock[i] = 0;
-	}
+	u64 min_rate = vfe_get_min_clock_rate(vfe);
+	int i;
 
 	for (i = 0; i < vfe->nclocks; i++) {
 		struct camss_clock *clock = &vfe->clock[i];
 
 		if (vfe_match_clock_names(vfe, clock) && vfe_check_clock_levels(clock)) {
-			u64 min_rate = 0;
 			unsigned long rate;
 
-			for (j = VFE_LINE_RDI0; j < vfe->res->line_num; j++) {
-				u32 tmp;
-				u8 bpp;
-
-				if (j == VFE_LINE_PIX) {
-					tmp = pixel_clock[j];
-				} else {
-					struct vfe_line *l = &vfe->line[j];
-
-					bpp = camss_format_get_bpp(l->formats,
-								   l->nformats,
-								   l->fmt[MSM_VFE_PAD_SINK].code);
-					tmp = pixel_clock[j] * bpp / 64;
-				}
-
-				if (min_rate < tmp)
-					min_rate = tmp;
-			}
-
-			camss_add_clock_margin(&min_rate);
-
 			rate = clk_get_rate(clock->clk);
 			if (rate < min_rate)
 				return -EBUSY;
-- 
2.34.1

