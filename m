Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF43042903A
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 14:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784298029; cv=none; b=Nkj2dlRKz5cpLLg/fd5llqt6j3ux6Wwt/h7nTgytCKzyzfeTBR9zXKPQRuXPwCFm6HIwknjrTXqB8ScHKzc35gQcpsgYlQTYkePogIJRS3Dtu673+FVTaL40eIgpcu1u2AhrizUJF2gKw5PETdOUVkjv11xP5TznYzj+1M7UVLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784298029; c=relaxed/simple;
	bh=7LLEImUmKPo7SrHc26UeJn3JRceGlHaMvwT2HiiujVE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JX6YC9GJQcd/HM+11VWKH0zmMX7rfAV+hHwOp18ak91fUyLu1qu4RAirNDMXs9sZmOrJBPYURZdewoHDY1IZMcAFuzGnVlo25Vvf5PmKxC/0KdTCwXoFu5Vd/xAPHufXZDW94PZ0h2NaDBXGO2T0vG64A7qdnKYJWsQuPkPabNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LQqz+zEN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h9M651Wf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LQqz+zEN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h9M651Wf"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HE7ux52002229
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 14:20:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c04Q9myq+d/MYa7ft3VRmwYFh54ZKESQ0C1fHms6BKU=; b=LQqz+zEN9Mu0LN6M
	j+oZ4ymN9I145FJgcg3C9bf44RcQLM1wJuVVvQIVxEAeZqbp5HhUHxgUa4BreMf1
	8KaJ06eHycqFNNy/XuHWidbcRAmFGOgnSVcnzk8qpIsydreaw2cpjiX5yEAqmXNJ
	1/lRbBGfxx6EawlYsT+YD2NTb6ZhEzFNH+fG2UsUPJglsb0n1pAaCMrVH2T7m07i
	MVJHYPOsxuQm5KXVRnI1ODym7vR+myB1WYOiQvNLQ/Cb/p/JkTxOt6pOw+1vaqmX
	Ig2Jff5QYZ0Iux5E6ZTBPTusTJZTPmQ8nssbf/PqnNBJsvsRj7n68qlgFDNzx8+2
	I+yyeQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fff9gsqdp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 14:20:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-930b6bdcb4fso161537485a.2
        for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 07:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784298026; x=1784902826; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c04Q9myq+d/MYa7ft3VRmwYFh54ZKESQ0C1fHms6BKU=;
        b=h9M651WfVk5wY51ZeNeQFzcQ0JU9D/hZaq4VSD8L8Tu+Yh5YDv1FJMCF/dy3GCaKG7
         Ji0gqYPZfD96VE/N0V9eHzdMbleF/KQ+gU5Io0+5NTmvY9WsylJ6GRX0HzU+qb4ehvlp
         B4HceXVm9RLrfJOv88EwTPC1qeEOX/UEqE9LobLKB4UQZYejZAgcyqOK4lGiDZfS9wGG
         Kx4TQFbdFEi8t2BgoKQ/mBh+uH1F9dwYJctsC54U+pQ2WM+aPZrJXGE1TkpAM5GS/v+F
         qtmKVolx9Y/utpzhpEWXrujIgaA0EWCfO64bC7n+XMcNseORl6DXPvWcTYsqwe/5txsx
         0asg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784298026; x=1784902826;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c04Q9myq+d/MYa7ft3VRmwYFh54ZKESQ0C1fHms6BKU=;
        b=P2iEtMGEDgcLx8zXlQ4JJyQqp2FBDhSQtL/TFLqHHeSmblP6FCVGiJufX7zwpW3gpO
         35SQmRwIIMgx8uO+wj6+xAv1W16JZgGdvnNg5tgmx0/cBQxRUcdFaZBcXItdnIOOqxVe
         lwCDXSXY7Cf53nEbGcLMgq2u31NRVK1i0ZM9XeiE30wfMJUZwsuR847IIZIULIW2y/ka
         0iSOB8Q67wC+Pn/oXaGleoIJMDKi+pBIuFiZQG5FzPtzawQ9anLIyZJhHOQAYeCvfViA
         vGywQEDR08bQsobuQBRIiAVqX2nByl6Dd0dT8/oswO6mzLF75vfpBTUl0FCGlmSvgtZT
         FXZg==
X-Gm-Message-State: AOJu0YxMGCPIPC6GAAlFv0Kztr/6Twy1yu405psYGgV0yn8+AkGSR1+t
	fjJ6Ot42x/wiAQMM5aSUIKjFos1GMc9nLIP5Do6mLb+7ZMTohT7bF8AFKRkrwUq0zI5j/eQfjYb
	mqysuFnnaWU/ZERorNpwFlhAwNSx69XQcJkdp9maOIyvONtJrAPABjLExH9SojTNf8A==
X-Gm-Gg: AfdE7cmMjQpVwyoHAy40qkzMcwZHbswHpr7d6xxn3IQHLOti/SfrwRiqn16er7jE0LN
	R7lzlypxjZqB0FU6KBRPTBfjUFHGF2cOJa1sCCmlccxRe3QM4JP/MzSMtwwuvXrgIEw4L8BLqe9
	qMuc0Ws8wxodwsetjR9wZbKQHvwq0K6xyxgUzTUDC+Uv+l1tNbvcyr2oltME6TG6MhZGWF/U5ad
	xcPVEmEgnbljT9poEMYqD0NCLk9Y4pYLytnfQI2OjQQNR4NDYMbgOu4q3zDFmdsI824uJVhVayc
	vw7ydbQDHdFwDundWwYncUdRmeAWaIemzgdWzYyhHvtCekVtbgPJTbpLrU1VFObmgro2VCQKYgm
	aeN9ep2vFz4ghN2ncqfV/Ngs2ieJZjM+Q4pF55pQ+4nkBwFObl3bIN6WfzZhLiLzmHdty06hYBV
	Zek9jA1lYpywlOJFwBQyjujtiYm1ie0AFBM/V5asKV3y0Go6hjZwk=
X-Received: by 2002:ac8:5e46:0:b0:51c:217f:518 with SMTP id d75a77b69052e-5213a38435amr27878421cf.6.1784298025825;
        Fri, 17 Jul 2026 07:20:25 -0700 (PDT)
X-Received: by 2002:ac8:5e46:0:b0:51c:217f:518 with SMTP id d75a77b69052e-5213a38435amr27877851cf.6.1784298025251;
        Fri, 17 Jul 2026 07:20:25 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:751c:d61c:c91:60dd])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1740bf91bdsm79085966b.63.2026.07.17.07.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 07:20:24 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 16:20:20 +0200
Subject: [PATCH 1/4] media: qcom: camss: Add PM clock support and integrate
 with runtime PM
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-camss-version-v1-1-7ed71fea95e8@oss.qualcomm.com>
References: <20260717-camss-version-v1-0-7ed71fea95e8@oss.qualcomm.com>
In-Reply-To: <20260717-camss-version-v1-0-7ed71fea95e8@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDE0NiBTYWx0ZWRfX3zlgIPlkrO9a
 d7P+6lH/7fuyOtUoyCqV4p11BrG5af4Dv0qFnNU83DaR5xf7xLcAr3ArxMhgSeN23UyBiKMt5em
 9L9lMpVJHTtvcDY5Xf7sLC21STVz59E=
X-Proofpoint-ORIG-GUID: mx_ZvtJuhHGREmSgOeE58WwGhIUr3KVb
X-Proofpoint-GUID: mx_ZvtJuhHGREmSgOeE58WwGhIUr3KVb
X-Authority-Analysis: v=2.4 cv=TaumcxQh c=1 sm=1 tr=0 ts=6a5a3a2a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=BAJ2-saCjKdBVCgQpPYA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDE0NiBTYWx0ZWRfX3E1V8lQrDGeR
 GzelLJcdv2rlj8VV+nxblLauGXz6oJqTcR1zxPKfXJnydh9yaIxwqPV54tp/dDTuU1yY8oSpmeA
 khkjHPGuCJphg61yPmiIa2AzqhXDVGoaLextxBzi/yeil2bKhXtEI1LMg9/QcFD4+yUHUM7Cy4H
 9obs4jL+FOHVsLStlwEbuZfYc3LL0EACqIxvVpINkR+d0apHwbgVra8EHJdzQ1x33gMINw/IS4x
 fxHUcAC/L7hCduXWL4uiblUe/KB8c6Td9RqokVr/+mQbPsA3heUtcS7h8AdxC6B+oa3K2ItLzTx
 Zmbp12KUDkMSlsZNQI/umDvrp5RjY+22YailP+dOJv8KsKYrZnJFOad6pusGGC3u/YhYN7wcHBX
 NlJ3JzUj/nrVTvPw0QZf6HS2Wx9+D9+0TT+F5/t7zzJ+Pf63hxrbjeyO83cDvC7Ui11BZI71ywH
 hf/bo59LSeysE/j/OvQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_04,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0
 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170146

Add optional PM clock support to the CAMSS driver using the PM clock
framework. This allows CAMSS clocks to be registered once and
automatically managed during runtime suspend and resume.

This is especially useful for global CAMSS clocks that are shared across
multiple CAMSS subblocks.

This avoids the need for each subblock to reference and manage the
shared clocks individually. A typical example is the set of clocks in
the top_group, which may be used by CSID, PHY, CCI, and other CAMSS
blocks.

Introduce a small PM clock descriptor table in the CAMSS resources
structure to describe clocks and their optional rates. Initialize
these clocks at probe time and delegate clock ownership to the PM
core.

Hook PM clock handling into the runtime PM callbacks to ensure clocks
are properly suspended and resumed alongside power domains and ICC
paths.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 40 ++++++++++++++++++++++++++++++-
 drivers/media/platform/qcom/camss/camss.h |  1 +
 2 files changed, 40 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 2123f6388e3d7eafe669efd6b033e22d8eb5cf79..6a2bf3373e8755805c8cd0f8fe5037b788d68fa2 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -18,6 +18,7 @@
 #include <linux/of_graph.h>
 #include <linux/pm_runtime.h>
 #include <linux/pm_domain.h>
+#include <linux/pm_clock.h>
 #include <linux/slab.h>
 #include <linux/videodev2.h>
 
@@ -5346,6 +5347,35 @@ static void camss_genpd_cleanup(struct camss *camss)
 	dev_pm_domain_detach(camss->genpd, true);
 }
 
+/*
+ * camss_init_pm_clks - register shared CAMSS clocks with the PM clock framework
+ *
+ * Clocks listed in res->pm_clks are shared across all CAMSS sub-devices (e.g.
+ * top_ahb, axi). They are managed automatically by the PM framework.
+ */
+static int camss_init_pm_clks(struct camss *camss)
+{
+	struct device *dev = camss->dev;
+	unsigned int i;
+	int ret;
+
+	if (!camss->res->pm_clks[0])
+		return 0;
+
+	ret = devm_pm_clk_create(dev);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < CAMSS_RES_MAX && camss->res->pm_clks[i]; i++) {
+		ret = pm_clk_add(dev, camss->res->pm_clks[i]);
+		if (ret)
+			dev_warn(dev, "failed to add pm_clk %s: %d\n",
+				 camss->res->pm_clks[i], ret);
+	}
+
+	return 0;
+}
+
 /*
  * camss_probe - Probe CAMSS platform device
  * @pdev: Pointer to CAMSS platform device
@@ -5434,6 +5464,10 @@ static int camss_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(dev);
 
+	ret = camss_init_pm_clks(camss);
+	if (ret)
+		goto err_v4l2_device_unregister;
+
 	ret = camss_parse_ports(camss);
 	if (ret < 0)
 		goto err_v4l2_device_unregister;
@@ -5775,7 +5809,7 @@ static int __maybe_unused camss_runtime_suspend(struct device *dev)
 			return ret;
 	}
 
-	return 0;
+	return pm_clk_suspend(dev);
 }
 
 static int __maybe_unused camss_runtime_resume(struct device *dev)
@@ -5785,6 +5819,10 @@ static int __maybe_unused camss_runtime_resume(struct device *dev)
 	int i;
 	int ret;
 
+	ret = pm_clk_resume(dev);
+	if (ret)
+		return ret;
+
 	for (i = 0; i < camss->res->icc_path_num; i++) {
 		ret = icc_set_bw(camss->icc_path[i],
 				 icc_res[i].icc_bw_tbl.avg,
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 93d691c8ac63b2a47dbb234856b627d8911a1851..fe5fe25d5f18d8a3ce35b48077a975f1453c341f 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -107,6 +107,7 @@ enum icc_count {
 struct camss_resources {
 	enum camss_version version;
 	const char *pd_name;
+	const char *pm_clks[CAMSS_RES_MAX];
 	const struct camss_subdev_resources *csiphy_res;
 	const struct camss_subdev_resources *tpg_res;
 	const struct camss_subdev_resources *csid_res;

-- 
2.34.1

