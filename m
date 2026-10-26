Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792995936;
	b=C+9JonmY8z9yckozFd8CEsgXNvnbiO40PbK/zgF67QYLkoqCQ3gHbDQj7lRf1NCyIulL
	 dk1xiNwjz4Y1vC3y2Q58L9BoBUrKn9tp5CBL9DNAOkCvLBDJg6rK2M51KW48ciQIMfaK0
	 Zj9AZSR2ZsQzKhIbmHMOrEJLUhTxjs+ky3XM2KW+JzbUuoEk72kjgHMCbsZmAdxOrsM7n
	 ReCp/cw/0NkxNYWV84Gn4+r4L/gnKM9f33dYZa3D3qNqjvN5ezzyv5FrOE3irrYYjKHyo
	 Y5WFWhrErWnL4+QRpgvvBKgdVP4JCQwJ8NtbM3yQTOYrYpHHO/AbIfYOdYb09gUdLuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792995936;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=X+yqLfO39gj/H74c+0JuxaYjS95aZYaE8hMGc6dAOLI=;
	b=DykBN9Njj6hZZ6dAu/SjY2Gv4IeUmBRVXD4prmlivWG0SQq7EbnsAS6qSHWDhFLrm2JW
	 0BKPQOXg2Fe2DCS7LOFV3XRy0IsvazmZ/4os/9FC3z6FFM/H0YTu/OD7yHT1y5qnXm0L+
	 5TXuns09XVkog5+7k9nFunTEbWnw7ro3wypDQI5bzk2LNeqsgk0j14eAbZAVHrA7dDZ6M
	 Hx4IJU6zFKHSHjJSeBVTjOY97DrZLFZYY2OW1af8z+JPewtTaPNmT+I2nIrtptO0LLb84
	 Xqf+RYEV5eM28JziAT8SBztKF4xGV2cVxC541F4wuqr04GWJ1gLw6i27qtlbgBpdPUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d6jUNACE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bUiUGdPe;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87FC2606A320
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 06:25:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87FC2606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d6jUNACE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bUiUGdPe
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4bH2Y718409
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 06:25:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X+yqLfO39gj/H74c+0JuxaYjS95aZYaE8hMGc6dAOLI=; b=d6jUNACEdMZOAneb
	efc/lmRa0ouqmtZPn6+Lmoacckw5QKLPorWHW4OB6TWz/6dvAfcL4m1WDtfznd0/
	ICcLtZNS6b6JuiLKehMPapqK0XJsrbbmgRHvTAIwtvwZtP2wE1s4xTZ9ajwUCjkN
	YFWqESrQ7CIZ3WoQURT/1XMXMTOx8cm2OdPGdBFYnrROzceKLxgy4PjYxvaR+PAq
	ap0JCgeSelkq9r9Kx/mX8M1U4XV0z8HOiA0SSt+mnjbiexaAT0DpabYJ+4KEPVda
	cBrcqlp4m1v3mtoL7YbfppntANJNpzQFWBN4xBUjoIJslJriDxA+zLbfod2FcQZ2
	gBpCBA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsgss4vb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 06:25:35 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3adad90c894so2986841a91.1
        for <linux-media@vger.kernel.org>; Sun, 25 Oct 2026 23:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792995935; x=1793600735; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X+yqLfO39gj/H74c+0JuxaYjS95aZYaE8hMGc6dAOLI=;
        b=bUiUGdPeNhK09b3IxUS25Ls1bP6Nmz9uWUicaBtrlIIOHHO+KiMOxh8XK4LLbYkXmg
         qBimgTn5Y0KTyb5d3tL0/VZVWwkpjKh5nfq54GELf2QvTfZaoJMd3bEhCeEb7AF2NPcW
         6Hy6VXCZPBovTtNKTV8HK/OxuhVD+1AGwtrfTW9Qjrk2gw4t09lU2VIG7vSSPmzzDT61
         BqN9NU25q2R9RsIbuh/8//CYU+3RQahJ3HOrklzXzC78UBnG8SSkwKjJ1BU8BMvS6c4D
         6MvxoT+2f9sOFmUoFXmX4Ba5QWXif6O/QTe89daWhU6NPdxqtZLLjueUacYLX3JDGsNT
         4sDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792995935; x=1793600735;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X+yqLfO39gj/H74c+0JuxaYjS95aZYaE8hMGc6dAOLI=;
        b=RSFg58TogvHrAqQjFoSj8DYQ2iImGyBvblt3qyKNcgHYG9ADWfYdZ2K4BmqhLMRll0
         o2ZKcoOCIPBRJKxMcaHB1++lWk/+tnmrne/+NaaIG0oWNgXvEdEOUAiNLiQpQ64I5sHO
         lOkV8Kr8RQhcuk/qmjm6+9mewml6LDS28dKaeIPLY369l08m/B18LCQfRDL3pY7T7ONa
         6VR8L/iuEmdXArNfolXV0gTf+/dyLZPVgT/hGJm8dM7jT3Ao5LqIzlHw7TE6XTAWxxAo
         J8P8/GiIJo2dloX+PDFtXQGNwaHn6bYWpktNyc8tqjWf3uV0pkCYUZd3I5YUvPZXJ1cC
         8QCg==
X-Forwarded-Encrypted: i=1; AKwUvBwp0yTrkBMctu7EEZeiI0hg2F/wzVdpohcXJc2Ltbfth559gCq/BNgRP8EzQoJYban1ukGuS7bTSUN44g==@vger.kernel.org
X-Gm-Message-State: AFq9FYKfIYdb3SmaeZmH1Jc0oG1/oJDFY35JHjmou0HY012y8pM+eIsH
	aedudnddiXvONfsoDwk/dXfAlz9Y9zTURZ4QSbYLdqII9r5g177HCH5YWCbI+25IaxEkpXi3KSq
	YgNGPlfeEirKMzH5yJSzL2pC3FCBvNzFrEcsr/YEKpP4zX4vukq5hv/1qHPYON4tHQQ==
X-Gm-Gg: AYBFou12P3Tu4b04YZ0N5CxCZdA8nSCki5WSFTsiBjhyB8/T1hOYc09vLz+/CVBdbA+
	XiuCnxKPHXm+/WIXYhfTnTPcUOazTrl9NBFTEoOynUMjrBlbgrMMiZ+noQNaow66iMQk+y4YFLn
	RwR94NDA0mEW1ewptrhKFPqTC5tuPcP98BwpjTN7nY6bxqpyP5PdwePJucvWO0G1s0FpEZUB1AK
	oyFyDwRSmaSLuEfTOxwLLRPwBbpo6tcLWMwMOVGexYEtQ/an21TUjmQu0FV/RWY145ELm53vwC0
	aujAmgkZMeaqwu2F/ktZJKUCfZycAtlkPIxSDEsz6ORXFj/GIV/0Yp7w2W96xzqiyc0xr67n+kq
	9YwsTR352a4PaWI00QANzp1K9ZDp3k+xJwA==
X-Received: by 2002:a17:903:1246:b0:2dd:9b53:f9ba with SMTP id d9443c01a7336-2ea9c03e626mr53707855ad.1.1792995935107;
        Sun, 25 Oct 2026 23:25:35 -0700 (PDT)
X-Received: by 2002:a17:903:1246:b0:2dd:9b53:f9ba with SMTP id d9443c01a7336-2ea9c03e626mr53707485ad.1.1792995934668;
        Sun, 25 Oct 2026 23:25:34 -0700 (PDT)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b1a1c56sm12633415ad.44.2026.10.25.23.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 23:25:34 -0700 (PDT)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 11:51:32 +0530
Subject: [PATCH v2 22/23] drm/msm: Register the DCP backend
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-jshekhar-dcp-hlos-v2-22-7cf014efdee1@oss.qualcomm.com>
References: <20261026-jshekhar-dcp-hlos-v2-0-7cf014efdee1@oss.qualcomm.com>
In-Reply-To: <20261026-jshekhar-dcp-hlos-v2-0-7cf014efdee1@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowangio@gmail.com>,
        =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Flemin Jose <flemin.jose@oss.qualcomm.com>,
        Mahadevan P <mahap@oss.qualcomm.com>
Cc: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>,
        virtualization@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        iommu@lists.linux.dev
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792995687; l=1867;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=DnOVMMMul1WJd1CWK5XVZuD8++FkNWwJHoR8dINot9c=;
 b=QG83X9aBE4jBa1DAS4wPcmTipRI+XMBqCLy0NmwgeS2ERiIBadYlckpX6pOlVddmoKAl5KzcE
 g7G+3CHykn2CWWGLoyNuBrJN0+MFb1zULSaZ+b7RPKVSseb+q1g9A9G
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAyNSBTYWx0ZWRfX7y+JY0XR9v6F
 lvdzhIYJQ393/shjO/S01SMtrXXIOAYjINUM7AowW0hCP1tTMUSpf4D8iV5O8Dd18MeowEJlAry
 DpMOxwQ+2ykFqBmhGAp2mbp5+ghu7mY=
X-Proofpoint-GUID: EeHgw4kX3xVoBWW7eG8GUlzKTpMwMKjG
X-Authority-Analysis: v=2.4 cv=c+8+0h9l c=1 sm=1 tr=0 ts=6adef25f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=lVH-uUz8Z5eEn0x1YxIA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: EeHgw4kX3xVoBWW7eG8GUlzKTpMwMKjG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAyNSBTYWx0ZWRfX/RD8LDAl77CL
 Osgka9NR49+gTHrU1bJflsFv4zP8tlK7ps3PhwJkjJC5p8OnANhrIjkLg6IFfDaKR78pN5qXnyJ
 Lm6zFtvArqjoR2D/S+7lZWxCMZVHA3BcHka6XJG9LVd2Jc9PM9oiOXGEBMOar4Qxxz4NUBFxVy5
 p8wrvWIRFow0eDkkF1IkReJEnnWvbNr81REZCEaaazWmOE9AsPNjV/RtyuXK4cxyjMetMkTUPgR
 OzOVJXUKDHHX1lbcXL0HpXMzIOMj0ColqzafpFhKGi7mGSJCLcux+x6GjJQyZNXDZBjLudFHtwS
 HSuczVHUXLPL5sO/P+XR59uandu9R/3y3rhk3Yt/v8k6vCJaPkOipFzoNOeT5FUIkXFEVrf4SWK
 kF2J/TgwGepgXhgeFLJ9c0PRq5MjWvcTM7MFw8so7dPRaikb/XibogntHbDXM7q9WzVEG4HAqCi
 Z5AlfpurFqInbGhStYQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260025

The DCP platform driver provides an MSM KMS backend. Register it from the
MSM DRM driver init and exit paths so the VirtIO driver can use the backend
when the DCP function is discovered.

Add DCP registration hooks with no-op stubs when CONFIG_DRM_MSM_DCP is
disabled. This keeps backend registration consistent with the other MSM
display backends while allowing DCP support to remain optional.

Assisted-by: LLM
Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 2 ++
 drivers/gpu/drm/msm/msm_drv.h | 8 ++++++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 5816c64d7ce7..d413c361c442 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1208,6 +1208,7 @@ static int __init msm_drm_register(void)
 	DBG("init");
 	msm_mdp_register();
 	msm_dpu_register();
+	msm_dcp_register();
 	msm_dsi_register();
 	msm_hdmi_register();
 	msm_dp_register();
@@ -1229,6 +1230,7 @@ static void __exit msm_drm_unregister(void)
 	msm_dsi_unregister();
 	msm_mdp_unregister();
 	msm_dpu_unregister();
+	msm_dcp_unregister();
 }
 
 module_init(msm_drm_register);
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index aa5dfd82ac6f..befaa9f2cb5c 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -417,6 +417,14 @@ static inline void msm_dpu_register(void) {}
 static inline void msm_dpu_unregister(void) {}
 #endif
 
+#ifdef CONFIG_DRM_MSM_DCP
+void msm_dcp_register(void);
+void msm_dcp_unregister(void);
+#else
+static inline void msm_dcp_register(void) {}
+static inline void msm_dcp_unregister(void) {}
+#endif
+
 #ifdef CONFIG_DRM_MSM_MDSS
 void msm_mdss_register(void);
 void msm_mdss_unregister(void);

-- 
2.43.0

