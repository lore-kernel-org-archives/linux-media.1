Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B530836494F
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 13:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784640082; cv=none; b=HxSlO9r6GqYwj6CxWdPFHMH1ZGYTYkZdjYeaclkTCKrbMHVZsUdpaf55g9kJUg48TjT4iTPFr17pnNCC6my0TvYB8ySodHLLwHGnE3V5WQ/LlOXGQ5ltxMeeXxGXEc0iIJW4ZXHlVbHXA+OWARHP7PIeSrerZyqfZZTYlwemeto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784640082; c=relaxed/simple;
	bh=sBwnRZ82yznopV4VzndCL9r9yoI1AKE/zwXtiHogyAI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rcZAA+HWTVRjfKZs+1O7BoxB24gs67XqF1NsrAdLQ8z4SjgW5cCbBRcH2qDRlP4kK62PQmJFdRRXOPyz9s2sGAesQHabM6k4ON6Mlgl6RdJm9ileg6T5r81gLpzUgtDIuFiontOjMB4IRwF3c59wNTRnbvYhmht+l0ir0Xdtv/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cr6PR9rd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NWlo+lFc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cr6PR9rd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NWlo+lFc"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LD5icW1853451
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 13:21:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vt0LJ6eALD8ioZ3HxdW86IyRNoctA5vWZjxiC/38dS8=; b=cr6PR9rd+gwEW48H
	bj/6AZd6sgt58duyvFPxltiBV6DypqIQSaq5yYaOGXtm3hOvXMwKbr9cy/z0v2FK
	kwORwmZeI02MsAI2p7wa3kbkUO8APq8P6fiSVnX464VefScNI6Bw51l+HI2UAMhk
	ldbeX3IOckp0Ar2nMeHeYtF+tUHoY+uOApeXYaC5l0ig/OmfaL+465P/e6Unidas
	lcRqUv/33CKtpO2rFmlYwr7aZ7awUXL9uFOvdqF+cMUK9VkS5CccqoXz5i1RN+Cu
	Dh7s72aY1TR67SXJoN748LAHQTRfjDzNZFcluJ6PC1rP7CkprUqFd0teIRNxzY7V
	hI6LBA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9bs8263-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 13:21:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e695a3b28so1052685785a.1
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 06:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784640078; x=1785244878; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vt0LJ6eALD8ioZ3HxdW86IyRNoctA5vWZjxiC/38dS8=;
        b=NWlo+lFcSvPSi4EYQtxbC4qir5PInAq3/V5Aa47LWGrbLpHVTXiU7OIQHVubumPTOO
         coiNuTcYWa453pgHKbS9UMMfmbOhOlkwXeqQMkMhXo+XMVe68lS5dKjuxWpXuJtBvZfT
         gOTyxQWCnT32F2Q31oEqcJVAlbTsbHinRGLTbYNS8E2c/UDS+nW8nA5SzFb2bDj5Zh9/
         wAdOhw0oF6dp6KRLauKtH2Y7B3Q4ogd+7+lEobtM4anjtGZfByWFsv7j8tNdzgnK0zMi
         TZksdlvcEVhO0zMN16h2x0/9V6ZtIG3tQmoy0fAHshHrXr5gI0v9O9MACTdFx7bINnWZ
         L/UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784640078; x=1785244878;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vt0LJ6eALD8ioZ3HxdW86IyRNoctA5vWZjxiC/38dS8=;
        b=pQviA9Sxm7WW0uFn6CudbgVhH/WKzYo+ErJpVcYccNTp5naZV92QglAsZ7/nZ1PPjV
         42oZOt7d4QTaUGil3k/2R8aWP2cdvdEFTuk7oIA5d6ZhH3kjZGUJw6yACqfEp6LK7ea8
         CVcXUMUdvLiw3YxWFqcpKyZTX67Jmn7c3YjL5OBtwGHCx+yyL1E7i2YCLX4OcU+PIHBf
         qyfmJUBVO8s15d8j8QX281PiMhP2EjU3mKAHo4rCh1axqfV1sQzBIiHI+36Fj9SIjTm3
         fzYoWDVGGuD+J7g3MJebg20EXdYbDHlaIyq24NmjPlULVZeSGBMDcVUsrfm13zh7Dy78
         7nmw==
X-Gm-Message-State: AOJu0YwjdbsbCb5uLiNG0eEF7vt8qBtsPP/SVyFMW3IZb/mqJBHREm01
	EtY7KXL/JB2vKQaRtJIOZHnu+5ntoL8LiSiRIM+8PJBq0FUxK11SBwieF9KkTPnH5GU8kqUx3Wc
	kjR0Ay5gehKDVLMing0GPOT9jDyp9fVdjUY0DfrFfipLNmNbX3/B2g5NmIbosZfaMPA==
X-Gm-Gg: AfdE7cnyCq6P2y6acW9O+kqNdI/nRyTJ3++N3G3Yci3vIecNfDBAXX2sv9hx1mokDeF
	Ia0oPtRlHE6aE5tjxs5E/a2SNDNTajVJEgELWxt0g41DsXilTlwIWcFYQiZYa5WiHUcASRXTEcq
	4EB9ShSFNdKl5R3DucEFLMAP7LMJQBUlGC3JHtzgKf6/FUZN+14dKbRxKm0YrpIKv8zCMOxsK1g
	OqKmeuZm3Cc4Fn2yYY68qodABfi8g4YinlsAsXgBFMS6hJKX5mleiokB5nEzshw51LG4P017Fd7
	jQe6SBQXo5ea+xM2Z4szG1u+dAFCZQ1x1WTpyxYc31/nxD8DJ/zhgNFbq5AQh1LUshsSeRmxRwq
	dT1zxmsZtpSY76pubM8utUke4+4pmBXwpI5qydjA9njnO3/HoUJ3ZyS37gIoxJj7s5uoqQ98t30
	exeWkGJqekH4LuUVPj6PYzx2m9f4IRubz7DYmZ8bxvqvr1qP3/dcs=
X-Received: by 2002:a05:622a:5909:b0:516:35fe:5524 with SMTP id d75a77b69052e-51fbeeb3240mr219126781cf.5.1784640078429;
        Tue, 21 Jul 2026 06:21:18 -0700 (PDT)
X-Received: by 2002:a05:622a:5909:b0:516:35fe:5524 with SMTP id d75a77b69052e-51fbeeb3240mr219126241cf.5.1784640077729;
        Tue, 21 Jul 2026 06:21:17 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:751c:d61c:c91:60dd])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1712a5f8c5sm598326066b.34.2026.07.21.06.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 06:21:16 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 15:21:11 +0200
Subject: [PATCH v2 4/4] media: qcom: camss: Report hardware version via
 media controller
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-camss-version-v2-4-b2440d99085a@oss.qualcomm.com>
References: <20260721-camss-version-v2-0-b2440d99085a@oss.qualcomm.com>
In-Reply-To: <20260721-camss-version-v2-0-b2440d99085a@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: hH8XoAeXy_lj_LXD_KSNb8xEuJcR_bU5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE0MSBTYWx0ZWRfX/dUJ8QHvrdNC
 ViwkvSEJPVM272R+pioo146gOoNW3cNHag3aYoBoEm/UIQzh1YKUUf2PRTpFmnQ27SWG6RilIgp
 osvaTYWO0zWDLyyhc6/X2cmJQG9ScgpIy1W7IRH2X+k/u04DFleylNIIxsept+LQi3A+G4Pxyvo
 jNo1VaQ6LcMOGkT9pHXPpG6kmMHiVqIYo+GodsO41y0J9dq60zVs6wGInyoYzP8K+lYWJsfUXJz
 KgKgOXLjpSmKJ0oVj6Iv45rZEDm/R9cBzPICJVn462hsEubskQQF7x519jk7qhF/D+R/V8EBXCP
 LAytVNq3D5tD4gB0EjsQV1NvIuaa4boPX2yHCHzl5AFM6ym6YliB9kNomIzhs7L9i5td0209h2A
 Pr5Jvlg1BDgheV8jUVLKRHFaNzKbCdyfD4zUD7pga6TcYV2LpM+6J/V9ymG1V9ObgROJkSmqApj
 Bor/xNMSTH33vLU1KLA==
X-Proofpoint-GUID: hH8XoAeXy_lj_LXD_KSNb8xEuJcR_bU5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE0MSBTYWx0ZWRfX5jVW1Xp4yxg1
 yKgE5D+VqzyRpF3TZfu4cPAyo96OggKjzfXUu6UWEWk+BS/oBC1uXcrmCTpoo/On88UM3fAcqwe
 fvJyhJNurWWXko5mPz3nFFfrC2VOgcU=
X-Authority-Analysis: v=2.4 cv=QK1YgALL c=1 sm=1 tr=0 ts=6a5f724f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=_VBxEyf9HguAcaXgWQEA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_01,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210141

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
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 40 +++++++++++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h |  1 +
 2 files changed, 41 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 1f691b8940a9b3d8a9c03cb3159ed711d0d18e77..caf11ea21a60b5e10644d3daebbde7371d549ff5 100644
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

