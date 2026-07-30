Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE398411A1F
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 09:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785403462; cv=none; b=fhwI3tJmWInLxwNxb5Z6MaKHcSHHzmGyNuWAmptUyrLZph/KKExRhCH8EKs4PKCOUCCyGVA9AXbiMmKfS+0wM3Iv7SvKF8iTYwOsVtDutufO2cOnI8uWM7x50R8q3YMRvhzBT/XKkeKq8LQWU62Z/YDNsdn/W+EC5z+SxKVM3oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785403462; c=relaxed/simple;
	bh=hp/REi4FqxR/nwjoJRUOf5abpgvQZrK2pY5WetCj/K8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CaatuD6DYljAkrrDNtjqmTmuB4QgjioD/AYuyX2NSZ5TnIhRls134n2yImUUefFPSS54XlqD72CFYZCALdw7tHSGian/IpXaubudK9m3ydEwayGixEBkJrS/fjyCzqB75SUEp26oR4CGv+JKck2zt0D3GclsF4/6rKbAi5QnN74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kgMpDR05; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sklt6ooA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kgMpDR05";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sklt6ooA"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U9FlD54082096
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 09:24:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y8BF4lrVeXlgYtDt4LrDXBcHUybrsinovt0agb6/XhE=; b=kgMpDR05LNKv1KNe
	d0PHQRVuPz5HK3pTlW/yvKorvRf/nAQkzW2tG3D3MEjygkQ9MkkDKL0cZuJTdmnX
	6Y1xc9Tqzp0lXWTEwa8V7MpaTvToJv79WlRkMFFKfMnWPI3IQVXPSFS+OwYrt2c6
	popH6XX9bHKHfpmmr6bJk4gdek8r0B60ytOGC75H4sWk9Q9mjH/94QUC+Ljqsf/B
	XnUizTiEVHZlrEuYFGYAGs3PhJM7bg4WM8bQqIGO0DAeVxvjU6PtroJmbvQhwsks
	qeO1UBMY85wPrTztJVr45TDwVrgVY435ZdnqwbcZToXQD1plJvqA3Z41Cv/BOkA9
	RVR6GA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr3tyg16c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 09:24:19 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-526da7e3c9dso19209121cf.1
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 02:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785403458; x=1786008258; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y8BF4lrVeXlgYtDt4LrDXBcHUybrsinovt0agb6/XhE=;
        b=Sklt6ooASmQCIfP7z/E/JJuoAJ3Lv7xH411tlbV+YdxWVPPiggD+Q5WG2ILdo8MOq0
         6u8w8T7ZJTkyUIvvpy8FDDOQpkVL4zq8gYjIiq2pABuo6sGZzXnP9Qz1wZS//Ul0Gby+
         KRB9+JOAcQXu2Ze4EFRrXjrc0W9xCxFFPIN5F0Tol6CNvMmObIKCGmTa2PE7U0iUnJkG
         DukmeUzlDg8y2U9vr4hpoamIqpI+a7H7+SVLT7IAbp8sm6Z9EqBXzR817a4L9pnQMUMn
         yNahWuR0bdCRidP672jplwzTmkK3LCjByE9LGSZ7ZNoQ+IHJRpXVwsX2ayWSrH39kD77
         EfZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785403458; x=1786008258;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y8BF4lrVeXlgYtDt4LrDXBcHUybrsinovt0agb6/XhE=;
        b=K40Efss4Vrr9yAvScJ/v7GEyLKd10uolYheDPAWjqdSHU++bgErennMmskfu70qIHz
         da4TmdvL+XENbwqEU7PEaeDOlkQym34DUyAIe/k/JI+Vglu8zD4sPdFkLVrls8GJ2evO
         cFRDQ1YxGV5GTmD8eG1DJ0h/L7IUDigFyjrsYCaDvcrvXK8Zkl0wkqDhbFFi1isZBuPR
         dZYfPkDOpJFpYkk1YS9dukgRZdcqpF4tcBYk1OlemzWuuU8RBAwU3oS7u/QVUD19UHf1
         VYwIxEexE6aghAhjF20uWzN3DSdfMTIXk9QyB/c8farHbw9+yCYLsQUUwigUB7e0BboR
         GIhQ==
X-Gm-Message-State: AOJu0YzAlafantQkmkVWTFqReMSGTxfewoFcClTeO8t8kCymU7Zu+roX
	+ipfTXllSTwxkI4zDgY68DTmF6kssd/R8iQxP2bWNr+cD44X5/E4rxnPfv0N7GmSj80PSbJXJOt
	vQ1+UWqUfJqJBug1CiPJoFVWNqboTBtpoYPWFX1GTr+WKdEWLJY0dilTgEBxkIXTvvA==
X-Gm-Gg: AR+sD131tGYchhC+kTiV3ccQ1EnG1PsGQsFxmE/coUsFKRG6ztIXfiYZ1r0EcwhuHg6
	n4OciB0JhsAL8N4QehQPdv8eORzrNnAEUHT0UrgGjw1ZwnfmJ04+5kYGjpJBEk7+D+Zv7ECNHJx
	ByVUn1f0wVfc15Z32FBrI422/l2GZPI6/BYbDyfMQrY8Dku7OcNTtGZ6BXHh+hsNs7HeRxi9hPU
	9jxbvcHOT8Z7B6odfYxeDKvS3KEX3KA6dSV925H0gJ1G3YJkjQyQXARiDwZu0+z439iJWs8brOC
	qKgjHU9aGlxD7El8m8WJzBr9fxFXbsrKh0OS7ox5F8QW3dxokn2BRxo2Pf6FC3Zs7GNm+ILYtuZ
	/mtmF+uYi1GyIUjDX9usm7Hyzlv9zBNYDJ/wjbxZtYVtPUryN3Xh1son464TwD9WC/8rJN0q6Vp
	aMnTriHS/LGxxpnhvKdzyMLWkMvLpTDyCrJS14A3I2p/5MVQM4W4P8
X-Received: by 2002:a05:622a:2d5:b0:51c:7b12:5ffe with SMTP id d75a77b69052e-52b386dc213mr19153661cf.74.1785403458539;
        Thu, 30 Jul 2026 02:24:18 -0700 (PDT)
X-Received: by 2002:a05:622a:2d5:b0:51c:7b12:5ffe with SMTP id d75a77b69052e-52b386dc213mr19153461cf.74.1785403458086;
        Thu, 30 Jul 2026 02:24:18 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:61cd:dcd3:c61a:ac3c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a07d3831basm411483a12.15.2026.07.30.02.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 02:24:17 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 11:24:12 +0200
Subject: [PATCH v3 4/4] media: qcom: camss: Report hardware version via
 media controller
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-camss-version-v3-4-74a87302dd9f@oss.qualcomm.com>
References: <20260730-camss-version-v3-0-74a87302dd9f@oss.qualcomm.com>
In-Reply-To: <20260730-camss-version-v3-0-74a87302dd9f@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: C9DoWllMt_NkQ2SZuRNwGsWIGLbW1PdF
X-Authority-Analysis: v=2.4 cv=JZOMa0KV c=1 sm=1 tr=0 ts=6a6b1843 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=_VBxEyf9HguAcaXgWQEA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA2OSBTYWx0ZWRfX0xYf3ByR3wcv
 +jjVBKkOyGobIvs5LIaAh6GEz2cb5vH8vZTAxnUtdZguQHjPRto5ONJpdFWwL30gBnwTX1HRctn
 N0Oz7OxCYc8JwoDvAdp3a7roa4Fd4NuF7W5c1KyeVjVMAVcbMcwfqFp0ATcIpp4E0oLitTJNGSu
 8h53Y1mPI/WXbFEox9PAKU4fdzHQ8v70Mil7sQoqJYNJT8A8o3pzSP4ouHI/ZYtR3GIFlpCRtUn
 hFCI2EYX1fVjVtYedWFg16u/I/5pm1z0JSSjnwS7Xi/xNDHMw+9Sck/OK7UbLsPINjCKAtJIlpF
 vEWkYP0FMvXYHdTJKrdcElVprBZKHsc/GY7EKXeAIQRscfGsQk5OmFFFZR/PRp+yri+KVUOHA6Z
 GUoEoVzcIbH0jlDBAgaqorh8CHFb16Uq68xh1y94IntmHl+wzWl27zjhnu55dpRtfipgoRIC7xt
 UrTyqFo1omXRnGdFdNQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA2OSBTYWx0ZWRfX62us5tq0O1H7
 pni3uv4fq3/Tie5Ra+cCL49XBO2g8GCK9Luap9g8E7tkx25Is/RVXHS/WtN28UdZCUpiyOAFpQK
 DP/7gry3U15/TjfgtR0gTpjXVtEVGoU=
X-Proofpoint-ORIG-GUID: C9DoWllMt_NkQ2SZuRNwGsWIGLbW1PdF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_02,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300069

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
index 2301aa3868d26692c0c67034ebccac2a4f9abc4a..c5f3d4f405ed02e7fd6b397c6ff18c15c92ca824 100644
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
+	if (!camss->top_base || !camss->res->pm_clks[0])
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
@@ -5456,6 +5492,10 @@ static int camss_probe(struct platform_device *pdev)
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

