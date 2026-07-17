Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA57242A145
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 14:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784298040; cv=none; b=icPRuniBYuXccgbs4zUUwpObMqusRzDHcJU4WpHO8nSwEj/V3eKmUa4hl4+RePQ0o65X7L27V/ZAbzbwIDeXAjiIv1P6JFE9PTR/fZDeupTHg3GGB8ZrXVXnQi14bUIM2BA0szGjtgF/Ff+/+4Ql9X/rIzJBSzmIAHmqjBaKhgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784298040; c=relaxed/simple;
	bh=gb4COGp5aKgcSUnq7654arLk2Ih1nEmaKpGQrdvjYOQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ti0fpyKDP3XAV03Xtauh7gLE57OPS0CFTy74N7o6q7ydw1Vs5wK3fs/j0y134plgW+o+2cH1Szb8DEAUlp35FFxero43p5a2A+OBAzH3WwSTWmEoVDCl9JiBJfXHKu9G8mey6pDDL4h4+mLes3N7qnzMD8sfcP6Zy2q9UGPiIrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e7iTRbca; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RV0C6nJ3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e7iTRbca";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RV0C6nJ3"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HE899Y2106613
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 14:20:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zZ2RGRSj9aWPELXvCs6Sbk4RcyjB5HAKGztUWudcD+Y=; b=e7iTRbcaH9HXTwLD
	hRzvY0sRtaxy6kn5AUAYDkPB28qxq27oZYbhe3vF7AePs+WDfO5zbheS/10U8e/2
	kc4bmirHFMb3F6EENU1Z+BfGMTCDT2SAvSm/XHAMX8AYtmOr9wXL76cbPt5DKLYU
	mdnuLJZLo6FVwqGPUqbJOKcRV3QaWvl2Cu//3aNgxaFeRzLXc2MKCdqnbJIZ6EPX
	cXNDfWA5RY5p63lMJXpFWN6qtph9CoyAWvFHv0Dt91bhBnXnlji3N+TLDbPHbL3J
	/JIFfc6El6o1o0sT7nad8wCck+gqBGqpP2SKqApJUvXWAbicW3m2OlifnLOWgqy0
	d3KH+g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffhpfh36u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 14:20:31 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1d7886cdso20536361cf.1
        for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 07:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784298031; x=1784902831; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zZ2RGRSj9aWPELXvCs6Sbk4RcyjB5HAKGztUWudcD+Y=;
        b=RV0C6nJ3QPXW0Cc2nv06If2I7cLwxlDVYxY8Ask2Grk1H2b1as0jZWLAEOpDW0whZ+
         EttRjXw5HS29+8B7YGKkXoKiDpQFLH7fDGG3tZOsh/Ht7l2wwvFfwlyg9DaeARh+7xc5
         kuYOVo0LAO/ZOOZ3PMJfPkg6pmxvGW8m8iq25mWapmPDaPDRBzxwePaoH/e9wGLJkKFz
         RnLDOzC4+hD1jgAmA7lCsiKzTJPh++EL8gcy7Q3b4Q+TuVnvXDiGgVeIF14xZJECymvx
         7xeSJp7VOvqvEL6zDq0VwAGDimpDh2gSxwNv06qAUsBEMGQrRAKjuFFWNKWHWwxbzdrZ
         wp9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784298031; x=1784902831;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zZ2RGRSj9aWPELXvCs6Sbk4RcyjB5HAKGztUWudcD+Y=;
        b=q5c5DPs19ESnEW2ZslHNccYpH4DGPE9yhqaFNVcZ7xpVu47FH+mSt66uX0EhXsrLH+
         uH4oMGWoNt7+kxRcAt6NGPeGF434vrmGd14OyCF4N/S39Q6uG9yQNrywETJnJxS3E7aw
         pXJjJoc4iWQlgL0Ac79J4DVtCHgKWU8/HLUuLBZbtzpTMvxe968PU72WWBFIEVk5LUm2
         i+pjwIT4k1toaxVgTIaFP1p0ZlwnCF80tT3SpT10zwkj8JZYZ5ZJIBADZGI3RzYygeiS
         xYKZHmJ8whU8mgLQZc5e3T1JV0jdQA8cH0doE7fnbOID+XlHvFsEuGgP9KoxMEAabWDT
         /lPg==
X-Gm-Message-State: AOJu0YymmAjRlQ6pSXdAPGhvPzL+XpZySKR4/W6Kx4qJ3I2G6OL9Bup4
	zf40HE2LK2tOj+JUmrweMR7R+JLrP2Pi6uXGM7HGbDCfEYdntk3IuaMuJluTtWp0rzjvSAhG4sO
	15VcB3fYGFoP3h7l6nx6JLJ8x4iF3sWiQ7nKsPlkZrqLOM1dpACKtnpav+8+Z9QFyaQ==
X-Gm-Gg: AfdE7cnAg8hkplKhliKpn6lxAY49cQUORMr7QIIBYKcrmKWHqcUy4N6B4PL3FUAmkAo
	3xcADeIQDDuR6sfMVL2VdHJslIsuNNfwBnxFBBtCYL/Q1D5KNdtfkN/d124xB4/rs0lDyvzLu6C
	FACGrQfBvVDlGdt+3gzsykEX/M8qcXTjMjiFxP0UzvzfulHh6efy7VPFuPG3dB9vOGtnW8rFB7l
	ybMA8ZjMROdKUx2sNn2X6c6elEMZjSQMEqhZD8w8+bQE68UhVoe6zZAjnTlMztxfd5hgYGROm1o
	g5Blj3vhZgQlTuOx4k9RoUjN4kk+//O1Tp6HXkbnE84Qc8Wr3V59v8XFc6ZPKvo60L1430bhK5I
	GHXhjzd38WWnCUf1oDF9TyoIofIpkuQobSLuTPSKVEESj/TvgOjhz3IJv5p+4fMw8IjfGJpt6iR
	hHuv5TqP2JFBSAON7kIhp0JQzNuB8HkSVOOGGXshn2TTOnz5lAN3o=
X-Received: by 2002:a05:622a:251b:b0:51c:7b12:5fd8 with SMTP id d75a77b69052e-5213d3b8efbmr27897721cf.84.1784298030836;
        Fri, 17 Jul 2026 07:20:30 -0700 (PDT)
X-Received: by 2002:a05:622a:251b:b0:51c:7b12:5fd8 with SMTP id d75a77b69052e-5213d3b8efbmr27897101cf.84.1784298030230;
        Fri, 17 Jul 2026 07:20:30 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:751c:d61c:c91:60dd])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1740bf91bdsm79085966b.63.2026.07.17.07.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 07:20:29 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 16:20:23 +0200
Subject: [PATCH 4/4] media: qcom: camss: Report hardware version via media
 controller
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-camss-version-v1-4-7ed71fea95e8@oss.qualcomm.com>
References: <20260717-camss-version-v1-0-7ed71fea95e8@oss.qualcomm.com>
In-Reply-To: <20260717-camss-version-v1-0-7ed71fea95e8@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDE0NiBTYWx0ZWRfX4CgKtCOGC+mt
 3hdZ+5DVIXESzb9BkuAjvyIfzObpzEHzK54VxFF7UVDCnd4mLtcjpeUZvGmmO6lAhWquufqdZST
 LQFCePi9iHemIqGKfTAQANNoalKQCP8S5B9J1OyLY1VjIiyxjWdJpHRZidVfIhuRkkPKfvkH5p4
 vynFwl+Po5YkgUHqDFyBuULPEyLOs6PQET8zzAfQ1/PDOtl9hVoa3h50CiFLF/1XIN3K1BRgw4B
 nSUUJNMHfwO1ljo0TjIavLyV199wWXI1hoZ1H7eZAUVtpEXQy7oh42jCkxixL4cG8AlqRHlW7YK
 QZiAvvGTop56i/CH2RPXYqmGS6DuZQqxN8U7FqnnnJGkvQQzoFp0gp8fLlhmwNX/4GBLFz+TlVR
 kye+juGpVemEMZtyxFe5fZQ0P1kkd+EeubRLd5FCoLsWtux5w5bDNO4v94QrFEFMkuSa/6iv+tf
 2wmq0rvVfHhNQW1QvpA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDE0NiBTYWx0ZWRfXwbrbqhOZDxcN
 yL3G+LG9IiiUWjjFJ0CZ2TV8exGgZdd3tlWrKIsfTYc2lPIIQlbDlStr7GDzdsdjvSph07G3guy
 j1mItXKtH7PKcXlt7u8J1exMl2AHcvQ=
X-Authority-Analysis: v=2.4 cv=YeWNIQRf c=1 sm=1 tr=0 ts=6a5a3a2f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=_VBxEyf9HguAcaXgWQEA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: nr3U2uVIY9LIHEc1SWDNGIE37mjs6GuI
X-Proofpoint-ORIG-GUID: nr3U2uVIY9LIHEc1SWDNGIE37mjs6GuI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_04,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170146

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

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 34 +++++++++++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h |  1 +
 2 files changed, 35 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 1e97b0b7ec463f1fa2615704d09ce465a8964176..2caa253fc4ad48f7f04580417d15553a710cbc6f 100644
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
@@ -4677,6 +4680,25 @@ void camss_pm_domain_off(struct camss *camss, int id)
 	}
 }
 
+static void camss_read_version(struct camss *camss)
+{
+	u32 hw_version;
+
+	if (!camss->top_base || !camss->res->pm_clks[0])
+		return;
+
+	if (pm_runtime_resume_and_get(camss->dev))
+		return;
+
+	hw_version = readl_relaxed(camss->top_base + CAMSS_HW_VERSION);
+
+	pm_runtime_put_sync(camss->dev);
+
+	dev_dbg(camss->dev, "CAMSS HW Version = 0x%08x\n", hw_version);
+
+	camss->media_dev.hw_revision = hw_version;
+}
+
 static int vfe_parent_dev_ops_get(struct camss *camss, int id)
 {
 	int ret = -EINVAL;
@@ -4866,6 +4888,16 @@ static int camss_init_subdevices(struct camss *camss)
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
@@ -5454,6 +5486,8 @@ static int camss_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_v4l2_device_unregister;
 
+	camss_read_version(camss);
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

