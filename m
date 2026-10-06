Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FC139B4AE
	for <linux-media@vger.kernel.org>; Tue,  6 Oct 2026 22:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791326425; cv=none; b=V6ntkasTsUBtz7tLa7B1P3onv94N1X3hmtdOCA3VszCxhORsMyc002bLhY8/bx8lZFKN1Rl3Akn/TvnMIEy5pVG81a118nS5JStkoCVWiabaGVfQecKKKxUd/N+xOCUpgWjbXVGZdoyl/TDXH0XN/dtpBjkfyNkmaiVWWUvmXVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791326425; c=relaxed/simple;
	bh=DPgKLvB2PNcWdmQvkIzprusFWSgbJAmy+ICrqd4Fj+0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qlk+JIsnJKPAxjj6LkjzqSYRNcdaItkKm9Ut3KAcLAsuOAkA1T55ceTnj8eQ0Oa8wQDs4WpkEEQURNA0ZSo1OQHjNDOHb33d+/8tBvaYs0PDU73aFxGSrpSHs8kMfOUtdbXWDwuQoZqrSV7wzTKBT6mprLtmPf8l74Q2LSkV2ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CRcSSKz6 reason="signature verification failed"; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CRcSSKz6"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696LeXfX2049857
	for <linux-media@vger.kernel.org>; Tue, 6 Oct 2026 22:40:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=XU1FwuBtbti
	AGCfwU3DbkpmUGr7mhTNOJFzOVECWXN8=; b=CRcSSKz6Pqy58Lp3Vj/L9fQVdUq
	EP7/yunVuNbUiVLU15CY32lmeulKu4ri8uVgOwb+Mmt145c714bjvGrVASV2Xjy7
	s9MMILeVVl9tbLGXtmVG52D1lWx7gA6DcweLW7tx6unn7/OQ5BucGFfWDgT4vUs2
	MsBYXzy5Kl5bKFzesYVm5mEB+QTTXJdE0TaQ0C2hY7HOug5UVFKvObhrwRQ5QJNN
	tut3zyAQ+0CghyXtfvKI95Ejxm5sAI3BVY2tM+ABnyV4NeEgtcJsag/G6rQmKxVa
	IHvUYrHQPLe/qciIrPg57u6a3d8vLhooiBn4SBXqmRrB9c8qKzjVZe9mENA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h54621gx4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 06 Oct 2026 22:40:21 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91961d4b31bso64508896d6.0
        for <linux-media@vger.kernel.org>; Tue, 06 Oct 2026 15:40:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791326420; x=1791931220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XU1FwuBtbtiAGCfwU3DbkpmUGr7mhTNOJFzOVECWXN8=;
        b=Jqmb+acoKT93bq06z2Bs/ccsSR37nFzEg8n5GlPJjDnzr0AsMuXf1iZaeP8TGLiNYB
         NU7tfUyNspAxu2LlkhKi788N7oe5UHnSM/eiavqoa46Gk2I3PoF0MKQNJA7/6mEp5oF5
         miRuOJNh/RrwGkv6JfGS5h9H86/yfETwOI8n2f1ZEssZGktNvlgD6YjJBhFtW7tJHtIV
         vmURNe8Fa1atpenj5ruIzi5kKU2TUeMv0HStXAKleT3H0EOeijVyetTOSzNNUNMFHcBl
         yLK6v1n0D4BNU9MO7CynDRjlGhJkaRYWtq/VVUIQ9pGpdT5Or8DBJl++VuVBIjbNKB2H
         3Rng==
X-Forwarded-Encrypted: i=1; AKwUvBwWQz3lvMsDwAFdtVer9rnDGjAxHuwL2I55uERLZcQ01A1N3vzVtqsovbrFbmy/3ETJWZPZSlrxeJ/QFA==@vger.kernel.org
X-Gm-Message-State: AFuF++nLI8r9WXwwLuwNjF7PWx/CX77lcyGL/UFQvDihFOOjqtgR2nRc
	kHsWsYE6Ukasl9+jJxu44wsYpnPl/3HRvjv388VahMBd4H6BOdq5w/Q6v7fWRmuP6puXf8XcMGL
	RGuZbzFWoe9vrU91BpuGVQI6x/J8txpSu/2JM+xTzJTFbtERGXICh0ZEXAgAAs6jk/g==
X-Gm-Gg: AYBFou1yUYdth5lGYcTzcJwaw/6RrbV4bD7l/vw1892u2sbZDD6xVhKg7u+6sU3UcsM
	WF8WcDNTC5rmRIbUMIcgRdUPLbh0AyrAMhpMcrNN09bXXkb0z/VGMeEOgW9VXyH01ccdBwVM3sz
	5bAY8H1J4PKoghUkXyiiRU0nA/87jEGyIXGeKAUnnW852iF5V+6wviG02a97klDI/KUBuCJAXjy
	gCFUsswmlYzHwpkUjWLiIpfYPp5v0G6iTKrSk5H2mo5dw0GyUvnxI/47+J3pyDbHiEFik2i8bjP
	PhMZVvaBmB0mjIileCxRb+megsCHqz868+qXohN+ZZfX7A8A9Vuzbt2K7fc=
X-Received: by 2002:a05:620a:4550:b0:93a:2d15:f84 with SMTP id af79cd13be357-93e9b7cc40amr75368685a.33.1791326420128;
        Tue, 06 Oct 2026 15:40:20 -0700 (PDT)
X-Received: by 2002:a05:620a:4550:b0:93a:2d15:f84 with SMTP id af79cd13be357-93e9b7cc40amr75365185a.33.1791326419732;
        Tue, 06 Oct 2026 15:40:19 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53299sm167263575e9.11.2026.10.06.15.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 15:40:18 -0700 (PDT)
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
Subject: [PATCH 03/45] media: qcom: camss: report probe failures
Date: Wed,  7 Oct 2026 01:39:11 +0300
Message-Id: <20261006223953.3382273-4-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Proofpoint-GUID: oS7QseHdb6EnF8nIrwy6ofY21tjDVlQD
X-Authority-Analysis: v=2.4 cv=ZZiIpcVA c=1 sm=1 tr=0 ts=6ac578d5 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=_ke9eFR7E5bWC9if0q4A:9
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX/n9YyMsyTUm2
 6ZTViz8JVTSW1sibAPz/T/b0eSEIc6VDhmL10r3qiZvqO3RoidKEa2P/8ghe0c9Jzrm+uK6M8Je
 b+neZ+5/+D08blb3szdOeMbV+W3kdaQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX3aAsJcbXnxYn
 mYk+yFJfKvGIOu4137C5eY0O3yGKFW5/SejhNaRlhaNvNACy2dlUrVPk7paullD7ecPXbf/4gXi
 D3PFdDgdwa07tXHcfCYDpXzadnnG2qujwR5gBV3LVu9hCVGNuNP+ys/gxwa3/OqAeqtWOUgrns/
 Xh74OBBJNmpakjcBD1H7MCSdljVSRcsFQUZLG9bH9H/UNEYHRbSzAIE5HwVeuiYp1wvungnRUz+
 PwQWjOUK6SyWkgx3+8rVaKpKx8YQKsBxsJWWgjs6hCVd9d5WEYXI846dCMxAXw3iVl6RGNONGAy
 UXxPxO+Nk5iTBN37z4uy5CT+87PZmtRJXC3VARzZ5d8QvxEWyCQy4wJfl5E6T5H/6styjMtjaAO
 mSAaTX3/Il0ncwfeO0TArqLdwIxTkPls8ijvwdhJLSsFqWujl4Rchpf6g4JI10d0gqdTzNZFK1+
 VffapyfxeKi+ngP6k1g==
X-Proofpoint-ORIG-GUID: oS7QseHdb6EnF8nIrwy6ofY21tjDVlQD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060090

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Report errors returned by interconnect, DMA and firmware setup.

This makes early probe failures visible in the kernel log.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 9bfb0290395b..1f662b1caf5a 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5418,8 +5418,10 @@ static int camss_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	ret = camss_icc_get(camss);
-	if (ret < 0)
+	if (ret < 0) {
+		dev_err(dev, "Failed to configure ICC: %d\n", ret);
 		return ret;
+	}
 
 	ret = camss_configure_pd(camss);
 	if (ret < 0) {
@@ -5432,8 +5434,10 @@ static int camss_probe(struct platform_device *pdev)
 		goto err_genpd_cleanup;
 
 	ret = dma_set_mask_and_coherent(dev, 0xffffffff);
-	if (ret)
+	if (ret) {
+		dev_err(dev, "Failed to configure DMA coherent: %d\n", ret);
 		goto err_genpd_cleanup;
+	}
 
 	camss->media_dev.dev = camss->dev;
 	strscpy(camss->media_dev.model, "Qualcomm Camera Subsystem",
@@ -5453,8 +5457,10 @@ static int camss_probe(struct platform_device *pdev)
 	pm_runtime_enable(dev);
 
 	ret = camss_parse_ports(camss);
-	if (ret < 0)
+	if (ret < 0) {
+		dev_err(dev, "Failed to parse ports: %d\n", ret);
 		goto err_v4l2_device_unregister;
+	}
 
 	ret = camss_register_entities(camss);
 	if (ret < 0)
-- 
2.34.1

