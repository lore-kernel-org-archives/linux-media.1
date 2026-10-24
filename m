Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792834836;
	b=RFGkFLKZv2zBgejKCz6c+jemvDouHzcU+PFcEhg++/bp97CJVwVk2+cvsKnF6XLIrQbb
	 1wMIhLsR0lpMZXEh6EnabZmuDVMgGGr39TRIbJpgZhO0IA0tiKIY/2WhF2XbN7yBSz89g
	 1hwBqXONtx5cB3OthWtz6n2MYN1Y12iwCnpPCR6Xkhbb08ZL/5Ry/o06tliXaCu4A5au3
	 yj+Q9tYTMvq6SKJ7m9dV9MMJgOmiTTZGZePPZMK7M8R4p8LPcJIFrj1+8PIMwuEloR+21
	 7KM2Jwjj5QHd43lzvaKU5H+zLmlusu/1BSD5Ekn3rAiOqyC0+HMqTBQHLaFX4n6lkJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792834836;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XIrh0UZsD1tgMsJlxCdcIXSiORrg5SSAPZTtFN+3iP4=;
	b=Oy+QKluqHwQlDuL4vkUpNXnU2iec7wc4gwwiOlDxfyiQDgjWd4Q98jsWD+oyCDD51KLx
	 YjFJ+/dUtOyzN4JKqmE5K6e0KIF9IG/cLDfEKNucLg5SNbEdDoZ+tlZMjKYua9yeQ8R6u
	 BnhxJTzbxAdI6dQiQYjV+wJLqIvzSUtNmhxm8bsy3g/GGRLJtOjkTAiLM9c9D3/ZIWcBj
	 OTCnPe2C/LAeMyVhORqqzNTqqnCMlJ3D/FAPzHoGf7fnFNa91Gl6Gn71EkFpupKGsQOym
	 VlrpRIB/Z4A2QvKx4pDcExC5J9F+FghdJpI5Ij9fqbc8OshTLUGMJBpFORp1V4MVjww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A9ikOs1q;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LH2VDn11;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59DAE606A32A
	for <linux-media@vger.kernel.org>; Sat, 24 Oct 2026 09:40:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59DAE606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A9ikOs1q;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LH2VDn11
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69O8o0S7098128
	for <linux-media@vger.kernel.org>; Sat, 24 Oct 2026 09:40:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=XIrh0UZsD1t
	gMsJlxCdcIXSiORrg5SSAPZTtFN+3iP4=; b=A9ikOs1qOtLegd9fV+E2oHCGaAw
	ihk/NfyAWDBS+HSJHxMwGV6WLTCMnmx7hSpCWpdnVUnoMoTitmMfEMrhTlJ07FHg
	7rRPDkOT4U4a2JWLrRN75JsjnC0wKzcuqHHSfazZQLZMA0yqWDcA//KsYCumrgUv
	9Kct65cYLOzGCH4guMR/4jhCLGfVbcaSGwUKIJxKgerCeq3nUNMcYNYbKXCyc3J6
	0K+Op7rJcEP0DGCyU7b45RShVS35Uc+RPvIzMgqp2600HUKjhTtaaIZwL36C3LMl
	GI5gsecaXnC7RD5SDWN7ianvmCqdBi2kkwNTO/22spzRicbzWgXD9sXLowQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgn27rm8m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 24 Oct 2026 09:40:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93caa0ce0cdso196302585a.2
        for <linux-media@vger.kernel.org>; Sat, 24 Oct 2026 02:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792834833; x=1793439633; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XIrh0UZsD1tgMsJlxCdcIXSiORrg5SSAPZTtFN+3iP4=;
        b=LH2VDn11QovNpidUQACL8TG/I6fxmVCiB7Ev0wbFbuFQSjYQwoxxSX6/O0Q3e39vVY
         uI1x9AbvbeUxZZ53KNY0EEdf+Jh/TfRprrH2RH9w2AqBLbKbDzay7gIT1wBC/Yb5h72k
         /F4kvi8PBtL+NCITKGCsXsIglSwBFM9dAP+7m79zHZ3FK6pK3J8DTHKqvGyxBTpodTrK
         OhSJy0ytGsPldF8CY7/9S4fEnFc/sY08Bt5vh/Hb9svoDxLtj1KFsBJ6PatpddZ91R8Y
         vvXxvOth7KSZwjexaUxFJPesBcIUAmwaPydNXWQ3dJAO67w40pqugJpYsCSFmv77mKyd
         G+vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792834833; x=1793439633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XIrh0UZsD1tgMsJlxCdcIXSiORrg5SSAPZTtFN+3iP4=;
        b=zYQLlRZ6tPSqD+fJUeuMkO00QcOLJk0VNJUMsPCVcJoV8ReNza+JooDrYvlVeaS4Nd
         YM3pGSUxFyAjjaG6keDXT1/f4mY/oNKgebRvmEum8E07ilVhG8M2002nfisSp2Q0Bs17
         J6JhhmBhd/840f5mqR9L2heoVlWFx6GVSmhJmjPx/TPC2Rm97CbVlBZ4xUXTNso5rKr0
         dLP+TobygwqJ+SHp+hEUT6tQLsLxt8SO31VrZLf7D743LqEbjBFRAEjm91FHh26L/aTk
         8U65BQKi/YRq3sqgDy4naOg4hG0L87qeL/8B5MqfN8+K6lnT8zlhCosBvBVMz8hG2U4y
         fUgg==
X-Forwarded-Encrypted: i=1; AKwUvBz3Ljnv9spsSPhGhyj+rvFAn1yxEzE2Foqb4MOdDEQy8lmo59QW1+R1/5fZ7psQfCpWLIltR4o2+NaNZg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLpmKfcJKOfNZRZ0lZ4/PPXOE/kJJ+rTREmvh+7mk2VnFT1JNHv
	jxrVoAKrxnivFFdBrkT7qBF7WCoIaCNYYjuIptAyUwcSjLWcqYuiJ0OnTEHI0WW6CYPIR+OOaT/
	e2UkY0I2Wc/jzbWQAGO5Jf1yBmGc75x0rS4k1e49JopolwLlIXIof2AuBXQWS5aF/LQ==
X-Gm-Gg: AYBFou36lVUY/xg5G8B7pv3ozaCxfi9EoVcWEwc5XkL5RweeKBIFEVJi6bF24FusGuf
	JO3sulaQucSJy4+U/vngSw45lXIIBe7mGe6Qt4E+/WGQdF8wIpY276VPjuK/tt6NCZAM3z+A6+/
	XnpZpaMrnfW8L1R7nuRC4aCQltnXJYXWVeYMYXT0umTHAtCpikCIvCXX//eY5FR0M76op+hG+iX
	yWFCdMwuZ1WmOdBJChW1dPVcb8MuACqowhIPbiXHO7QyKxLll7v2h3/3l3R7Cm5Ab/1+60QqNEH
	7CCCRxL9q/872Q9kGdXOrO04j3u3bRBjul3HJeAMHuwUGqfrGC7BUWP+N+/CmJBOojiRq9OMLTw
	JMJU3Tu1ssYDBZOzhSPhNKXdr
X-Received: by 2002:a05:620a:4413:b0:93a:2611:270f with SMTP id af79cd13be357-940ef913c7amr182796085a.13.1792834833458;
        Sat, 24 Oct 2026 02:40:33 -0700 (PDT)
X-Received: by 2002:a05:620a:4413:b0:93a:2611:270f with SMTP id af79cd13be357-940ef913c7amr182793785a.13.1792834832924;
        Sat, 24 Oct 2026 02:40:32 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3bcdsm2857166f8f.13.2026.10.24.02.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 02:40:31 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/6] media: qcom: camss: factor out the VFE minimum clock rate
Date: Sat, 24 Oct 2026 12:40:22 +0300
Message-Id: <20261024094027.3095475-2-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261024094027.3095475-1-atanas.filipov@oss.qualcomm.com>
References: <20261024094027.3095475-1-atanas.filipov@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=G7GJgNk5 c=1 sm=1 tr=0 ts=6adc7d12 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=ezZDx3Tf6p_-T66H79UA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: sLMyMr2viNqpjOSx4ToOS5_4E9U9wkd6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDAzOCBTYWx0ZWRfX5hZsat/w20v6
 rox9sxg0AoqpC4gruNcKcrZqXd2aBZT+q+42n6CAZD/Cz7BLrlaDzLmz/zjgRz0QdPMyKB23W3b
 1whaEabAGhHzg2psyOAvsydRArmVvHc=
X-Proofpoint-GUID: sLMyMr2viNqpjOSx4ToOS5_4E9U9wkd6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDAzOCBTYWx0ZWRfXycGgs4ElvxAb
 qQVEPM1MHlL4nsjnz202mCwmRJ/6Okk1NwxzDZc4ZsK7Tw7e14E8AEu72FIGy2u3d9MnwqhdWxp
 zs4StYY7aA92cR3Qb9WOW4MbkvZ4tODAQg6dOgdH+oNyeWRpqceHsFCiT6tnxoCy9Ul63FMAw+7
 /hCGfFFxoQ/PBK1C0EcWVrKc3/iE/eNQQJ8Kxe2zwkwL0sN0Ij7ooNwqKM9JM9j1O3AQS3XiUqx
 qxIi3nwgigG3Hv1YWo9eEK25TpYSJsDI0frOvClYlpgrbzZsmARI+CJ/EE2IBrJ+uJQG25HE/Lx
 UiWJF5cUhfF2OPLkAAfOp2+nipK3thvTXOXpYpVeuEwT1/ZS7e2Wszk41Yui3Nnw6HJEZBs+OFW
 dmLMndthHypYKY7XzhYBaVoh52G1ZwTuVmyhbI/7RhQq7htOfDYEzJTZud2Wd0H8NMmT/EUIe1W
 llvBBTulXQNnjJ7ObOw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-24_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610240038

vfe_set_clock_rates() and vfe_check_clock_rates() both compute the
minimum clock rate needed by the VFE lines from their pixel rates,
inside the loop over the VFE clocks. The result is the same for every
clock.

Move the computation into vfe_get_min_clock_rate() and call it once
per VFE, so that the clock loops only select and check rates. No
functional change.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
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

