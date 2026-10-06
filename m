Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643434D0CDC
	for <linux-media@vger.kernel.org>; Tue,  6 Oct 2026 22:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791327487; cv=none; b=IVg37vbZdGNt+DD+vEXK+6t0Mhrze2NjbP1jQEDM3t0klLY6Ak+3Ok3BpH/ayp3n6zHHwi1SV3a3QGnZZw4kB1Ua9DTavB+0PS50CP8eoEUHXpEu22g2RsKNI4C3q5D4lcrhqz3UOsqiKAUQHI/faJNS8OLzsHaKXgaLD0I8Dbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791327487; c=relaxed/simple;
	bh=2t5J73v/MouUPPv8BeanhmSwIres2KIrufqDwmaCcNk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=P0xXmItFWWSriTD4ZMep6NxgZe5OUaBYJeX+AA5cXbJaAkfAdmZpzdcJ18FAolbKXS9IO/IpyW8q5AW2IFVU+N8/l89KtG8Byc4PiuuGLlEYt3R3DWvWV/6tgwje3mQIlQ8AW1LeBk0VaOjF1a8Km6ZYGYCF8nECoSXXhG610FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lBycZyyM reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lBycZyyM"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696LePcG2011404
	for <linux-media@vger.kernel.org>; Tue, 6 Oct 2026 22:41:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=S6xUJpnqHpK
	MXNveefo1cXTh1FFN6M8v+59Kiz3wW9c=; b=lBycZyyMOkLPvONYEB9pWIoIxmN
	kd34QhrxDt4qy8A3PRJWfUIbKd6tmM1ABSBSyrA927Kyg40Oy2a8wyAi6A+9tTbs
	tuNxkiZZYNI3PgZXtWLHrPM+OfGl1AImbp+Ap8iRqc7NUhlkjisIE97d5gqF2QVa
	hRdTSZj/n5vSTVg9NH4tZ5QUohduE5AtHbbRJvVkpoPlbDL4ehY3Nz428yfhqh+D
	y3YBP92YnAdiaMSZ23IdyHydrMG3ftN6Fd7QmMv/RPGHJdawu31eMWh5DM1kWklu
	KhFRHIFzbNHAwzQmf7n3MmyfVGcNgznwEKUNSeoE6Piw+PS/EqJ7ErLGzgg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4xc9u1uq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 06 Oct 2026 22:41:49 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9308eafb465so793390085a.2
        for <linux-media@vger.kernel.org>; Tue, 06 Oct 2026 15:41:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791326509; x=1791931309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S6xUJpnqHpKMXNveefo1cXTh1FFN6M8v+59Kiz3wW9c=;
        b=kU+61rBhFp5Q6ib+34Was2s/9ZJfGBR0yog3u0b5bn/n3A+pYn5HxWhPFva421h783
         JUvtQ9NWRVHpaaZbqN/qzTgvQ4Ogpf9Nl3EEpYWtIzI2OGesaDgQ6O/Zl9oQLeztazWl
         lX/Ue4F0rMU+o+E08Q+UGtGqirZmgXVpRpWdQIzKZ7yIjUsbAfb4g0Il5grcX11BidKc
         rGX5BGMTMFYDJxfIbjf5YXgBS9kHz6YlthEHpt/ie1RlmH4NBtSoBpIJvQ3jP2kMRB/w
         b50GpFdtDhD6otq7SPsW9S5oKjDDwY0gDBWXuTFqlLrHWDYblK28C1YpCVvR0k9R/4/Z
         0J4Q==
X-Forwarded-Encrypted: i=1; AKwUvBwwc6awQsi70IWFlvS34y5kUi5sm/dchxlceIpk1CVvGABEs0tCyxn3m1+Uy6r8dGn/MZdFhhmRTcjPWQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lRGEJvAw/otgycOvOzxP75YO7bw2TqdNThl98fe7uv82DT+erw
	xDpdT0LwZO5C3iHmuH6AOhV2FpwQbNh0av/btk+ZSECCHTTaCNd/6uSWoqvqnKYqhW+7YPtomjQ
	8nqT7g/er4d81AFO0pG7TmHsarX0vCZUltgEoyicBzaooo6mLqjaCDrv4vVP41ULHLw==
X-Gm-Gg: AYBFou3EpADPrSWag0aqY6D0jwect/OsSSD7VNoxIJ5vRuC1FfPCL5WKZVc4CfPGqFi
	DD74ncseDkI+pisM6R0HYasyAc7fskJCL4ZseCtuYm+YF6iNt3FW+EGSJO3hyhC0PQ09FoS14xk
	al3QzXTlV5a4DRjGQT6e2As5uBrCC9J6xzkz9RIKc9IvXLgf909vBDrgaH6+GyGie/C82SHSGG4
	SQ6LAOXarg/pdQ3pW2E/2aabR77yxI3qO/CKPJrK77wYYnP3ehkpVnu/z383CZ8HPwPt2WLf5I9
	16IPqCGSdtjI2om+f9rvkewnLCFufRooV9eV8cKdr1lASyNKq57odjDtva8=
X-Received: by 2002:a05:620a:6495:b0:93e:9807:9792 with SMTP id af79cd13be357-93e9b86fa54mr72257785a.83.1791326508895;
        Tue, 06 Oct 2026 15:41:48 -0700 (PDT)
X-Received: by 2002:a05:620a:6495:b0:93e:9807:9792 with SMTP id af79cd13be357-93e9b86fa54mr72251885a.83.1791326508425;
        Tue, 06 Oct 2026 15:41:48 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53299sm167263575e9.11.2026.10.06.15.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 15:41:47 -0700 (PDT)
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
        johannes.goede@oss.qualcomm.com, konradybcio@kernel.org,
        Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Subject: [PATCH 41/45] media: qcom: camss: create TPG links for IFE
Date: Wed,  7 Oct 2026 01:39:49 +0300
Message-Id: <20261006223953.3382273-42-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=ctMOAF4i c=1 sm=1 tr=0 ts=6ac5792d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=Edoj-RGbKjCKvmuEXRoA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX2f785d5S/+so
 Udm1vNn5zs1KKm44o0nlF6KxTmakPHDrLN/Q7SLHbgXMOs0cdZrPDCl/5QoDzjyF2dIkXxR/WZ3
 zRpdb6Jg9gVtYzweKTnjl2MKsn5yVK0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX7BfAFSfzEAgp
 zeNnYoKwWdcxF6AAasO48RpHtEgVV8mL57I79Cmkv3PRkHl9mYM5V46ku2axbvN4aRemoV/idkZ
 lOTh4mLMfFH2xvIV+NwPjFgW+P3J7dEnDquZRRtsS3SpHOOOgR4auzMV3h8rey+P+4SxUEikXnt
 hV7BreqCDvjYoDHw1ayEE8IEQx2DCzQXET9AMGFwB5yWu717lvq7RtjrqLGL7CK4fZXDsvynO/d
 2DLkAoeLViMK5OlrKh6ZaW0cblXxo+5Vn00RWu5kb8MeaBtteRKs0JOD0wlYNgP0cZMhVKYGubM
 aW2Hsh3LkYMTVTHDv1pJOrvWLT2WWu4iuD9r1dUBGgtmOL4CZcimnijh6HrRMiI70h9w4BJljE2
 HchHatBJh6UcWWOchnZY+86MvaMHyhOaxlw71jj6yl3yAmoyaKwB6ynSzAOOsbEEBYwrRwzqo25
 SmhykKMENWiYipXaSnw==
X-Proofpoint-ORIG-GUID: Gz4DcmkXXN6MXTjqECsaN21ViubCamet
X-Proofpoint-GUID: Gz4DcmkXXN6MXTjqECsaN21ViubCamet
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 spamscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060090

From: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>

The IFE topology uses its own entity-link callback. Create TPG-to-CSID
links there so a TPG can feed the IFE pipeline.

Signed-off-by: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-ife.c | 22 ++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-ife.c b/drivers/media/platform/qcom/camss/camss-ife.c
index e2049e00ea96..ab6102fd1126 100644
--- a/drivers/media/platform/qcom/camss/camss-ife.c
+++ b/drivers/media/platform/qcom/camss/camss-ife.c
@@ -12,6 +12,7 @@
 #include "camss.h"
 #include "camss-csid.h"
 #include "camss-ife.h"
+#include "camss-tpg.h"
 
 #define CAMSS_IFE_PREFIX "ife"
 #define CAMSS_IFE_IRQ_NAME "msm_vfe"
@@ -1574,9 +1575,28 @@ int camss_ife_subdev_init(struct camss *camss, struct ife_device *ife,
 
 int camss_ife_link_entities(struct camss *camss)
 {
-	int ife_id, csid_id;
+	int csid_id;
+	int tpg_id;
+	int ife_id;
 	int rc;
 
+	for (tpg_id = 0; tpg_id < camss->res->tpg_num; tpg_id++) {
+		for (csid_id = 0; csid_id < camss->res->csid_num; csid_id++) {
+			rc = media_create_pad_link(&camss->tpg[tpg_id].subdev.entity,
+						   MSM_TPG_PAD_SRC,
+						   &camss->csid[csid_id].subdev.entity,
+						   MSM_CSID_PAD_SINK, 0);
+			if (rc) {
+				dev_err(camss->dev,
+					"Failed to link %s->%s: %d\n",
+					camss->tpg[tpg_id].subdev.entity.name,
+					camss->csid[csid_id].subdev.entity.name,
+					rc);
+				return rc;
+			}
+		}
+	}
+
 	for (ife_id = 0; ife_id < camss->res->csiphy_num; ife_id++) {
 		for (csid_id = 0; csid_id < camss->res->csid_num; csid_id++) {
 			rc = media_create_pad_link(&camss->csiphy[ife_id].subdev.entity,
-- 
2.34.1

