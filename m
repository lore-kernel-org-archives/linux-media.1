Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495E93B47DD
	for <linux-media@vger.kernel.org>; Tue,  6 Oct 2026 22:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791326478; cv=none; b=BxcFYpSz0mF9i6k2AytXd797LPmzPQyw6Rfz0LE0ucsN7LlKcm09cLiovNqiT0e1VohTDKPSqc4viz2QhvHNNe5/FU7Pl8VD94vPNMH0vFJvJXw5KQTqNk2wKyzT6ZY86zhq82DeIOrPd+v0WHV0ugdzFfuoiKhjfxPP+Qy9h+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791326478; c=relaxed/simple;
	bh=T8GaM/DWCcTwfgaKLNVN9FohEqx9SJOxt4Sb3BkyXS4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HBFOsurdlBEk3OQIP1sakLpYgI43A2ok4E9T4RwtqpP6ir+mS+DJSA8pM9+KpB6Ajsm90I8DKFFSxRvq/j3PjoOfJkCqlOm2iBI21FSWb5QSaVSPf2zXGx1uZSNeFHvF+r4ajH4MLbIoWcooDqq1zStsP5vLUI8vAlflzdphx2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nAhgj1fE reason="signature verification failed"; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nAhgj1fE"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696LeNRb1195961
	for <linux-media@vger.kernel.org>; Tue, 6 Oct 2026 22:40:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Z3s9eIt8PRE
	KTbC0XLz27Q7AE0rMoVpZ0L/j9AKbvXg=; b=nAhgj1fEHyGwT9gekjIC9W77i7q
	Hos4Dvcn3GJ0z3+M+KsdxPzyKOwxTJmD26SfMkpsupHDfRvqtWftWlvYlASeYFVk
	CpKWa8rzQp9XMecuOlIV2sE6BEV38beXLW+JZSvqnud/b1cz6MLFkL4/JgfUepQB
	gHRh+Zvxa6ZQg8ENgA5VfohzLQWyElRMz1QJdElmdfwsVYidh6GBHiuXld7ft/SO
	7KlpKQ6ruR/fNMcOpPF57LIiXEfx6IiLHBxUIdAfEa2HsZ3zMupDFK2QZrtynNA9
	uAJ4l/C37f/RL3RMmSXjIYqKZ02AWj0Zk7emp9+2JBdpwQc7CZK5PhQ/ohA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4vmruf4g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 06 Oct 2026 22:40:50 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91961d4b31bso64520046d6.0
        for <linux-media@vger.kernel.org>; Tue, 06 Oct 2026 15:40:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791326449; x=1791931249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z3s9eIt8PREKTbC0XLz27Q7AE0rMoVpZ0L/j9AKbvXg=;
        b=MZpC+12teJSrB/CcireTw3ShHY8uooMOtk/wC0Kk5d98wS4AvJNeU3UGiq1iPz0x1l
         UPw5mH3tV4SqB3Bc02CnldI10fC24kVZ0ZPL77mBr4YSF8pqFhA3NHzw1+682T5m5pJe
         BSNVE0+7vSh7eFjdB5CDL6Rm9EC10S7gAUfmNW82vsvaimmMPyGTM49QKw8z4J+vVHwb
         HqXgA0HbgSLbTnWLp0AD4IA5P5uc4xQwyzRLwhuw9r0D3NLC8SeTm3G3/NTPLEHnIzaE
         v6CkT0bgAbbn0UyZNyhYl20KKQEtrKn18CTu67EYN4uMDUImq8GvwBhjYxzadepAoogJ
         kLJg==
X-Forwarded-Encrypted: i=1; AKwUvBzzjnOEYwPgxEeRAWSegF824WXo05n+XVkXuQyKp7Pag6uVKsfFFXd49b2HReLAPLwt/J8UCwa1UpKHnw==@vger.kernel.org
X-Gm-Message-State: AFuF++l/PBk4WjDMM5ds3OUp2tSJ5IfHnZHoeVqSMUR/vs0GsM3GJtmM
	BsbfjQcOcSRcq+N4o2na2BUtgRwNZE3sSZzAH1DGUimPybn5YYfp5+OmH+MRHEA6RRbnE7Y1yVj
	KbGJcj419zJ1m1m+g48Y29WGuDntcMapZ3w1eKiL3svBIYaNF+B48NeVn9ebJikM6qA==
X-Gm-Gg: AYBFou3T4M9l/dSDwGzGk/pZOi3afNHFg7g1K7sQbYgMLOYoXiJS5FjEa8shR/F78oG
	+quBuLcIlzA9JJLEMdW2pl/9iJQWddCpqURkFAVyCRHnBQbRhcYIJ4lgCPs5/IFJmi1ymqq3F3o
	4WY2S2SFF8P+AdS/L1WTSWx21g5DhG1SajTOXp3JnO1ENaROzritpkbjlb2TFYaLltRJIqBMDyF
	87E33muXCOkZqXiyJrs2yYgMxGIpZ11QzEmQbL6STaqovNv3w2WFwe0vfcH5asLCTs1akxgdpBo
	fLxx87QhTQ1itRR10ssUvZsa0DcQCGeFYxHo1+yB7b9Dv8RGRg5AxSl+0f0=
X-Received: by 2002:a05:620a:8801:b0:93e:9809:dbfc with SMTP id af79cd13be357-93e9b8ee68dmr74951885a.79.1791326449167;
        Tue, 06 Oct 2026 15:40:49 -0700 (PDT)
X-Received: by 2002:a05:620a:8801:b0:93e:9809:dbfc with SMTP id af79cd13be357-93e9b8ee68dmr74947285a.79.1791326448708;
        Tue, 06 Oct 2026 15:40:48 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53299sm167263575e9.11.2026.10.06.15.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 15:40:47 -0700 (PDT)
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
Subject: [PATCH 14/45] media: qcom: camss: formats: add pixel format lookup helpers
Date: Wed,  7 Oct 2026 01:39:22 +0300
Message-Id: <20261006223953.3382273-15-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=XZ4cX455 c=1 sm=1 tr=0 ts=6ac578f2 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=q9B_VXwnRp6pzYBZdsAA:9
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: WLJ3DGCx9ptxhqdVzNWDWuHrzyiGyWhv
X-Proofpoint-ORIG-GUID: WLJ3DGCx9ptxhqdVzNWDWuHrzyiGyWhv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX0yxhZm5pJQfZ
 W5wW88wokQHMvBvLTCPmsTR+BNItpWS0eOPLi3G7sEgWllXwAe79x/oCs45Kf7GkX3nlk9Mp5Lg
 zFo6p3x/G1wTaCw8aSlC/3LxtrO3YQ5Ar0NeWiKdMjE2NlVo3b5sLp1muL1xQZ/cxlza2D81k6I
 V8vwViEfxAZPD+uW/sPs5x5bZUsPSGpSmf9rDrgWLZMjECSQfaG9Nt/10GKMGzpS/jxycOfhoSw
 teFbMm6pyjL0H1gfQsLu8XOlcoADw1jtqEo/9wxegLsXa1veWBJsuqtWvdZ2TnYzkWn+VfBZSGp
 Y5XSvZz3eoaWajpXTElSZVyFxYWxuczuG7W2g4ZoOjLP7SEdxOIlhRCQQlc/dkLIcyojrbciEKc
 vOws428a6jj8QHbsGm1WOmZPm48VL+5bZ241Sdu1HNlHzhXrFvRYZjWuySxzldOPXGWY+RA9ftj
 vtU1IkbV3hdG42AzDvQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX32Re/oybC+Gw
 3SrS0zuJaBz2pE0J7ErOYFJqnVoAMnrjzKxn2OntEDamNulb59CAcs9roQiHtC7jX2iT4rSfJwQ
 xXjjZZhNlAjWyPFKqjT+kVBFB1s2kmA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060090

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Add helpers to find a memory pixel format for a media bus code and to
calculate the stored depth of a V4L2 pixel format plane. IFE format and
performance setup require both lookups.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 .../media/platform/qcom/camss/camss-format.c  | 31 +++++++++++++++++++
 .../media/platform/qcom/camss/camss-format.h  |  3 ++
 2 files changed, 34 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-format.c b/drivers/media/platform/qcom/camss/camss-format.c
index 52cb01306ee0..147287e7f033 100644
--- a/drivers/media/platform/qcom/camss/camss-format.c
+++ b/drivers/media/platform/qcom/camss/camss-format.c
@@ -12,6 +12,8 @@
 #include <linux/errno.h>
 #include <linux/lcm.h>
 
+#include <media/v4l2-common.h>
+
 #include "camss-format.h"
 
 /*
@@ -103,3 +105,32 @@ int camss_format_find_format(u32 code, u32 pixelformat, const struct camss_forma
 
 	return -EINVAL;
 }
+
+int camss_get_pixfmt_index(u32 code, const struct camss_format_info *formats,
+			   unsigned int nformats)
+{
+	unsigned int i;
+
+	for (i = 0; i < nformats; i++) {
+		if (formats[i].code == code && formats[i].pixelformat)
+			return i;
+	}
+
+	return -EINVAL;
+}
+
+int camss_get_pixfmt_depth(u32 pixelformat, u8 plane, u8 *bits_per_pixel)
+{
+	const struct v4l2_format_info *info;
+
+	info = v4l2_format_info(pixelformat);
+	if (!info)
+		return -EINVAL;
+
+	if (plane >= info->comp_planes || !info->bpp_div[plane])
+		return -EINVAL;
+
+	*bits_per_pixel = BITS_PER_BYTE * info->bpp[plane] / info->bpp_div[plane];
+
+	return 0;
+}
diff --git a/drivers/media/platform/qcom/camss/camss-format.h b/drivers/media/platform/qcom/camss/camss-format.h
index 4f87ac8c4975..f1af2d3a2c54 100644
--- a/drivers/media/platform/qcom/camss/camss-format.h
+++ b/drivers/media/platform/qcom/camss/camss-format.h
@@ -59,5 +59,8 @@ unsigned int camss_format_get_bpl_alignment(const struct camss_format_info *f);
 u32 camss_format_find_code(u32 *code, unsigned int n_code, unsigned int index, u32 req_code);
 int camss_format_find_format(u32 code, u32 pixelformat, const struct camss_format_info *formats,
 			     unsigned int nformats);
+int camss_get_pixfmt_index(u32 code, const struct camss_format_info *formats,
+			   unsigned int nformats);
+int camss_get_pixfmt_depth(u32 pixelformat, u8 plane, u8 *bits_per_pixel);
 
 #endif /* __CAMSS_FORMAT_H__ */
-- 
2.34.1

