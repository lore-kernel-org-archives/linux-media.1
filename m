Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E3E3DF018
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 08:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785488086; cv=none; b=hTAD7CBrYUgg8BmIHlJZmsUacCinOU7i7FQRq16PIeQIhDYe/ZREDDDMz32l4aO675B0wk2SYHIPbJntIOU0VwiEC4Y2mf9mg9gYm5nb3GcrKl9F/qdXZ+bRb/NzmPB1HXGM+a1oSCQSCRKpO1rAECe3qQdAJn3dyZCE8I5lPgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785488086; c=relaxed/simple;
	bh=OZdD1ENp/Pvi/iFDguhGhQl/TfJcv/72CnXp+PHgYIQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dVbTYRClqOwhABHKwLfkKRBq+6IsSVxqQggX+0Zuv4WYupwb7OkaHIBsjx/xkWan8sPPA6mgzMUvJrBngxvpBNPJbdPuEG3rXxB0uvF+paeQWBCFyTiKCOPbg9+anN6/+l7Tg+OFvGRZQFtQvQRnt+7ifoweBQhNHxdiR/a54wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KgSWpJ9p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hXa3UInB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KgSWpJ9p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hXa3UInB"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V8lPFA2991330
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 08:54:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OqS1G3B+9SOZ15glFniS7ntN2KoHD2hpe3SeHaPoXwc=; b=KgSWpJ9pYNt5nA3E
	0h0ty0uUChPhHs9w8wUWBRSxIQUe5S+be1ZV79QMozw7LFZfGhktgymAL0yu5TmW
	AodFvTO7A+CYaAyLmHiJcFNGypWTv7ob2tY26Lc2qWBQCtXw9gabrJUhB1DZzWCW
	OM1F/CobXjQ96/gWsUE16d80NG8SEuHL7BVGvktYdy8RS9NuySw54lSXn6TaT6ht
	QkweAIi69SUJ+s1JZRA2W905BxRC4s2YFeaQyFlqDyU5zrCBntwy92DBc+9JqKE5
	c9RQ1c/0VCGEOM0du8GHA8NAH8X54TdhmYAH/lrVq16bFCDvyD1XDU7UX+wjVVLd
	dRtBkQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frrgpg0xk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 08:54:43 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8f45dde7595so8831746d6.3
        for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 01:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785488083; x=1786092883; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OqS1G3B+9SOZ15glFniS7ntN2KoHD2hpe3SeHaPoXwc=;
        b=hXa3UInB6ZcO5WgvnQscmwqDSGIUi1caP3qq013GUe9nvit5zNf+ERosRHyECwW8q2
         FcWhbHJUp9nyWvZTcPjKUv9X3ChzDVukyLV/UutNKXe0djP1ZfrfMFmd4tgKF3As0W7h
         e9VBR6RLxxq13j0JdnUzUCxRUrvVRX3jyGTZfWdAZGUBmLiV3aoyUUSZI6Ss8ZbwyJPf
         TNA7DlUOtLSeFj4mpm8YVZtqeNgd2j4qAiFGcT8vH0d/VMhyxzZcTXhtqKJcdl3rbEhV
         wxV2mI9Fj9BQcIkrh49Q7fWcNaj6K7OEHEWOYZ8WjZ4GvmA55w6eXwz2BZHnRlVGmsFj
         yB/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785488083; x=1786092883;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OqS1G3B+9SOZ15glFniS7ntN2KoHD2hpe3SeHaPoXwc=;
        b=dezYE+0lCFKq5KYwwYD6dd/D7yNM9JoZt5MgpqLPk7r9xjKNFaAYtPfs6LiksVegLj
         uto4QGULCPaDjFYXKnJzGoJ/VLZg3YicE5WNq87A9dhQUWqI4LCGLzAoUaWfY2ivVf53
         o48wR5p6hr38JS4dSsBflZSiVI02zsAYEy8U/M+138/44tDI6rkx5FhFUXox1RNWUvkY
         01inYCLsuOiSMZI2Mqu7KubvTgIt6Jujfh9zxbJlqBEZIrRL/N3SFaBijZMe3UeQuKmD
         epBYpV7p2iTrTBzSKn9ubOMxvcTjh6jegBr8ztqGeeKnvUjNh0HXOnuKynmdNYjCvS/h
         p2qQ==
X-Gm-Message-State: AOJu0YydTW/MdLQFFiFtFG5/9sYuCC9jTfKTtoDBYvrbkx+lHci9NkjB
	38xaHzQPN/ho6mFv1+hJsYUrVL84PfoWF7FlQa9YWpEflT3x41ewPgAuwUOcWMsRMzKgbUa2/Mv
	kyIroiXuU8SW1lHP0t8pfsrB3BQNDXiyI4HgUHcg8Ah2JhiDLJ+GhhcItcfXUcVQ9ZA==
X-Gm-Gg: AR+sD13aiMJTYwahF2H2wqGBSZL4CWvmaWalqbBQi9WIsuedLWQkqgg7udzchNV7XrV
	nHE3uXi1anxfCih13liIe6eLO+ieRrnBcoQqyhwYX9N4QqIolc7SBE8KFf1uUrFdZ2vjQxzDA6o
	Dti4BZ3YwpSI74ST+O0iDFv6FLl/OnJXw5xUxjLFGwsxaUIdz2357m9X1pSh844eNTdIxfZP3nZ
	+wh0WUi4W1JL6oBH28vsXjfzVaLDzb1D+SxKcHVgKgjj6zo1Vis99hJ64EH7r4T1pXriu/pdotS
	VC/8OOFsVzR2OuyWm+hj2sXBMGinkW/i3C8ZZJHmM97O9nYtKBWmvKwoFRp9/COdwP6SmoxE9E1
	vfnPesb6W/ptX8EaKyvasMSudWuIT30Ah83MetoKyqol9JH95u/rG3xpKLZkd4Cs4mctolqIaVC
	VrEEMny4aMABFY9preigrV56NI2wkZxIeJwCnsJUHEnpgGT8NxVOaa
X-Received: by 2002:a05:622a:1107:b0:51b:fc67:c738 with SMTP id d75a77b69052e-52b4af2baf8mr12319261cf.29.1785488082969;
        Fri, 31 Jul 2026 01:54:42 -0700 (PDT)
X-Received: by 2002:a05:622a:1107:b0:51b:fc67:c738 with SMTP id d75a77b69052e-52b4af2baf8mr12318871cf.29.1785488082533;
        Fri, 31 Jul 2026 01:54:42 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:61cd:dcd3:c61a:ac3c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd44e9f0bsm61899366b.43.2026.07.31.01.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 01:54:41 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 10:54:37 +0200
Subject: [PATCH v4 4/4] media: qcom: camss: Report hardware version via
 media controller
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-camss-version-v4-4-be8b716a8c4d@oss.qualcomm.com>
References: <20260731-camss-version-v4-0-be8b716a8c4d@oss.qualcomm.com>
In-Reply-To: <20260731-camss-version-v4-0-be8b716a8c4d@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: 8VrUOFFBQ0TEk1N_EO2mfNE7GodiUX4B
X-Authority-Analysis: v=2.4 cv=SK5ykuvH c=1 sm=1 tr=0 ts=6a6c62d3 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=_VBxEyf9HguAcaXgWQEA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA2MyBTYWx0ZWRfXzfwdLY3mDlvl
 SPZZC16s/rR+7O6llioDNV+aF8T+eA0TzYkJ226TTKOMCHI+9IVmjn9p6nw/MkBVl9W6PNlKxtK
 od/qJd5yuTDUwWz6BN7SrmmvpXAb2X13SusO0u9ADdBLcl2ygH8WkSeVoX06J3Q+ReaEP7TJHky
 lM+TXV7lSSwQ1Jh5f9J3DyyZrbrRg95oD72Y5RoTQEvpuwuDAm+fx9zza4+o8XVuW6X+YejuFWp
 GExC84ZxI1ktk/SMVVjxrRMOfZzN9GwGZrgat1JoHMMAWlE3AZ5pO2I4m1pYUTFUF8r7ClmcUEY
 rrU6wZQuJ/nhuiDaYSQ2ctnnf6rPZToqhBh3bVsoy1ZS51TJRlGoa6wmy0mEQ+iTJAFwKvkdQY7
 bw2HTu1Oa3wgNRtW1ipKJHG1FTU2nxY9EHMMM3OZFJovjznJNPzJibsGo8FGOYKuqUNxkyfEqXH
 m2XZQpsTeYyMvAHcYtw==
X-Proofpoint-ORIG-GUID: 8VrUOFFBQ0TEk1N_EO2mfNE7GodiUX4B
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA2MyBTYWx0ZWRfX7Q27cY2swx2F
 zZ04Br2PzG8UuTj7hni0tuu52lgQ0LIUsm0JsddRt0Au2GTDM+3mkX+A9xvcNG/oPKcBpED+xU/
 /SM5T/+EJPMNGpj+K7XNWSd4ajzEOjc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607310063

Populate media_dev.hw_revision with the top-level CAMSS hardware version
so that user space can query the exact hardware variant through the media
controller (e.g. via media-ctl or MEDIA_IOC_DEVICE_INFO). This can help
identify the platform variant and adapt behaviour accordingly, for example
allowing libcamera to apply quirks or enable features that cannot be
discovered through standard V4L2 or media-controller APIs.

The version register is exposed by some platforms through the top-level
"top" reg region (offset 0). When present, map it and read the version
once at probe. This is a no-op on platforms not mapping the region (yet).

Reported media info on Agatti/CM2290 (Spectra 520):
Media Driver Info:
        Driver name      : qcom-camss
        Model            : Qualcomm Camera Subsystem
        Bus info         : platform:5c11000.camss
        Hardware revision: 0x00050200 (328192)

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 40 +++++++++++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h |  1 +
 2 files changed, 41 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index f688d11990a71aa6d745db1fdcebefe5a5119ca3..6807239a19677709481bcba0246e66ea5ebc4a83 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -33,6 +33,9 @@
 #define CAMSS_CLOCK_MARGIN_NUMERATOR 105
 #define CAMSS_CLOCK_MARGIN_DENOMINATOR 100
 
+/* Top-level CAMSS version register */
+#define CAMSS_HW_VERSION		0x0
+
 static const struct parent_dev_ops vfe_parent_dev_ops;
 
 static const struct camss_subdev_resources csiphy_res_8x16[] = {
@@ -4677,6 +4680,29 @@ void camss_pm_domain_off(struct camss *camss, int id)
 	}
 }
 
+static int camss_read_version(struct camss *camss)
+{
+	u32 hw_version;
+	int ret;
+
+	if (!camss->top_base)
+		return 0;
+
+	ret = pm_runtime_resume_and_get(camss->dev);
+	if (ret < 0)
+		return ret;
+
+	hw_version = readl_relaxed(camss->top_base + CAMSS_HW_VERSION);
+
+	pm_runtime_put_sync(camss->dev);
+
+	dev_dbg(camss->dev, "CAMSS HW Version = 0x%08x\n", hw_version);
+
+	camss->media_dev.hw_revision = hw_version;
+
+	return 0;
+}
+
 static int vfe_parent_dev_ops_get(struct camss *camss, int id)
 {
 	int ret = -EINVAL;
@@ -4866,6 +4892,16 @@ static int camss_init_subdevices(struct camss *camss)
 		camss->csid_wrapper_base = base;
 	}
 
+	/* Optional top register for hardware version info */
+	if (platform_get_resource_byname(pdev, IORESOURCE_MEM, "top")) {
+		void __iomem *base;
+
+		base = devm_platform_ioremap_resource_byname(pdev, "top");
+		if (IS_ERR(base))
+			return PTR_ERR(base);
+		camss->top_base = base;
+	}
+
 	for (i = 0; i < camss->res->csid_num; i++) {
 		ret = msm_csid_subdev_init(camss, &camss->csid[i],
 					   &res->csid_res[i], i);
@@ -5459,6 +5495,10 @@ static int camss_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_v4l2_device_unregister;
 
+	ret = camss_read_version(camss);
+	if (ret)
+		goto err_v4l2_device_unregister;
+
 	ret = camss_parse_ports(camss);
 	if (ret < 0)
 		goto err_v4l2_device_unregister;
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index fe5fe25d5f18d8a3ce35b48077a975f1453c341f..cce79e56f58c8bdc0097f4a1702df22c4248f2fa 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -133,6 +133,7 @@ struct camss {
 	struct ispif_device *ispif;
 	struct vfe_device *vfe;
 	void __iomem *csid_wrapper_base;
+	void __iomem *top_base;
 	atomic_t ref_count;
 	int genpd_num;
 	struct device *genpd;

-- 
2.34.1

