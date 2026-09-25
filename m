Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6BF4D0A03
	for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 15:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790351895; cv=none; b=r2jGrLXji8fe4HRjaAz0J132tb78TvUyqaEFvG7mvrb1j76DUtRDnwXP0C93S2fryGEmXH/8nMjADL0g9tpNZcf5UOC8TnMnz83EKvw7c2+LSIJ/opaM33p1STh9dgBGiOq4kMrwuaKP29HdFaLdMuvnsj7aL8J7k0KekptgFBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790351895; c=relaxed/simple;
	bh=H8Rbv3eBQpD9WgFbo2yB7uif+cAfBZh5zCbauor89yw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S5rgbo9y7bchFx218huEaDZElJnl4yEzEF1LBNbN2cRA1aOfEzjunw8N5Ecu5jxtzIZTuyOOAZSYwMKCABdgjrTxP9Z0UnYf4JI+HUBk/uAsWIvl4xVm+McvCA8KojN24QcGzNwDddLFO3r1NhW7smspi14iHXt7ghh472JEc2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WeVZen3y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WWmVaPOG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WeVZen3y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WWmVaPOG"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PBV8nd425742
	for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 15:58:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zS7HAWLYB2K
	PmMHyPqOeaG0eVqDjrURQXru3PTmytm4=; b=WeVZen3y/kyqt4GzvLiaHTnoRyf
	0jttmCryP7WG2a5THrEeUc3ec6gLqFVdEKSR+yOohOfKd6lA0X/5X3fhIFI+ImTu
	qmATk3FdhnabrwfDEVerNCuQiyff1wqt7u5FO+rNOcsDR2t/OnVlnaDeVJRnZBmg
	1GSkG/4WrGVLX56iHdFVVRs2j94RpENvp6Xt8GxuktOt3eWPZbOCXKcpHAy1R8m4
	DglMg+jA6+oHofSdidaJFWRPw5sBwVSRSQ+mHSq28uUxI2Dde3SUVcW3gzhDavmP
	fTke5X/1PEu9HjjDJMudD0IiSiQ12cRZzrNZMpNz8lcWsuQQ4YziFxkmOgQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwr5e8y0b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 15:58:06 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-86a74698972so948133b3a.0
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 08:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790351886; x=1790956686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zS7HAWLYB2KPmMHyPqOeaG0eVqDjrURQXru3PTmytm4=;
        b=WWmVaPOG4SNwqCpBhACBo6IRsiB0Nh41lphRPg7nLO/eOV1zfP7UeN5eW33T3IgR+q
         aerhRDjdmOhtxxUxlR6UcbCS0LFJCZ/1hRYXYcWvshECDB19DyQKlUwZc94xg7fg/hvt
         pMOgX/ERZHSVFEiBOadgdIWbOTSarUhqbTeRho7dni49kl8t2dbAufXj1vTPg4fLPhwA
         5ixETZ+51xvjSK2fI6j7/4pgRvRTGyYO3OykWU1vwsNl0AOcKqRX3dS8b7lPCYzW6Se0
         MYSOeRldKwZBXxe4yPglKgSZmrIXV6WlW1ZwPEIjCYyAIRFjlkWPYKwlyZFjwP6gKNUY
         hfig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790351886; x=1790956686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zS7HAWLYB2KPmMHyPqOeaG0eVqDjrURQXru3PTmytm4=;
        b=IR3nHPShGAnWIq4pvC48rI4+PiFf6rDFAu0/fz6VOP1BeMCY/rBiG35//aHw6JtUqB
         k0Oxa8qZMgzafJPypSy2GVw1xgCPLemotwO2rBfSz6rXmWUk1rWp8wskZBkw7e6/PV9r
         +LK/+sBglyF/51fUM8zEMSW9RiGYM6zne30huEZuSl5WpCCZK81wcjLRSelqAcH+QXDR
         0f67DQfLyXT7SUry+DxmFzGvGlZ3buj7Lv99+hdULEEfAI+JdNhL6hsDQDHr4h5ZdWMJ
         pcgsV4Y3GQ108yAynq7qQs4XaZkA4labl+vDIonsvCKN/QkUnyHQVTkcSJc/D7sGN24D
         OFOA==
X-Forwarded-Encrypted: i=1; AKwUvBzrjSITv0Ll/Fw+n3LGC02T0m2R7bnFi294fJu0eOuxcT6PU3UJ5RxD/rOgIpCdRiLGuREkt+5bCAB+pw==@vger.kernel.org
X-Gm-Message-State: AFuF++mGmed+wO7bLQTmlBtjaWS96rCbTzTZb0/Bl/z9ZQGW5BRb5hkK
	69+R89Mp1/ywNb5j6besMhaMzkE6iTncJYZ+Z/TwOtdzWsx09JYyW6MdaG4L+pbjnfA0bbpDmtt
	6rMDiCbbnTf4uR3vmCU90Ty4vEZfrSqbBd5lfGWqmz6WSaHiifYXG9GQsGTP996Ej+A==
X-Gm-Gg: AYBFou0q+m4Bgvhmc9cZLLcP0/7xXgnbMkJf8l09fl++Ao9ALCRmb+FX+FBqPdJ9PKo
	XDNQx4pMDDz7qIkVlGffthGE6J0r35O+5EBuoUA+AwYT1Hlc7za/Lon2Jg+jWv5eduSi51OKtLn
	rwwtH4j2BD2gy4ZTsQRSbUTzAiKO1hfPRrLJcd8HxQuYM9ntALdwEJQkUfW4Z67CNUb2eaKwefA
	piy6iK7p6uLSHLWzB5LE3h6jqN8mFWjng0fV2USyA6gpH/rb+tU1STmfivn6KIvzgoR/xejFgwX
	SsRZhqf9yjdzHlgShq0WXLY9hO8cH1l6DFRyJNJ1aHHXc37NO4SYQMgJSxMHjzfe6WYkUBiLKta
	AejDXgzPUdYfcVHZPkGTAdX+ZBWM=
X-Received: by 2002:a05:6a00:3e27:b0:880:fe7b:bc61 with SMTP id d2e1a72fcca58-880fe7c01afmr530795b3a.50.1790351885714;
        Fri, 25 Sep 2026 08:58:05 -0700 (PDT)
X-Received: by 2002:a05:6a00:3e27:b0:880:fe7b:bc61 with SMTP id d2e1a72fcca58-880fe7c01afmr530719b3a.50.1790351884190;
        Fri, 25 Sep 2026 08:58:04 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87ff354d854sm1361299b3a.2.2026.09.25.08.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:58:03 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 1/8] remoteproc: qcom_wcnss: migrate to qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Date: Fri, 25 Sep 2026 21:27:30 +0530
Message-ID: <20260925155737.4161358-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925155737.4161358-1-mukesh.ojha@oss.qualcomm.com>
References: <20260925155737.4161358-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MyBTYWx0ZWRfXyQdA0K+4CJDH
 fZ/3nH7lE+8ncd/CiaVvwgrzARLwGx6Z0oy49QB9ezcZN7QK5ltwS3gRLDGFqpLqAsgiT/DmHOW
 kU+4PKnu3VG7oHil2KoUgox3rPodM7M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MyBTYWx0ZWRfX81FXz5JpxmOy
 SouAuAVnCAwChZm9JTrLCIzNbN0H0+F4oVbohrx4CCq0YIjTmOjQvSXAZCvQrMpsJX1UrI9iXeq
 dJyjWhVDpMy0WO8IoEt9bGeIel9lV+n46eP+5lxP3XarIDKQ8qn+IJKBhixcg6QSyVps+Evt8xm
 D9yMiNIoWuoJiy9/8ovjUbnWseUQzKrgKrOurAd6LvtPXnqcbzF49NRk+RTaWamAhnleOu4g6bA
 hDBrQPHq13Nlr9MbvDz2mxDXZo/mtS+dnNycU9U6fYoltsYYY8xkt4HjkHyMSKNnsrisvV7zbv5
 HjGSBI9+PV16dtQYn2mhXjf647/8j2z40UvFcZ3iDXiODuBFuTeoNyXNlq6dX6+Qko0q4/BhwM4
 YAkrJb5oHcv+7SRt8SLqowl64Ey8611RZJlDk8TME4UoGrOivVjvpYkwOOs+l+V448im11QNJhu
 XkbU0oieucoFZfNL9CA==
X-Proofpoint-GUID: LZAVe8RprX99aE_SLV65Ph18XfVaMCQ-
X-Proofpoint-ORIG-GUID: LZAVe8RprX99aE_SLV65Ph18XfVaMCQ-
X-Authority-Analysis: v=2.4 cv=Hf2B3SE8 c=1 sm=1 tr=0 ts=6ab69a0e cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=BENypEIf3hN4rM3MEzYA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250063

wcnss_load() calls qcom_mdt_load() which bundles metadata init, memory
setup, and segment loading into a single API that does not expose a PAS
context, and wcnss_start() calls qcom_pas_auth_and_reset() which skips
the shmbridge prepare step required before TrustZone authentication.

Allocate a qcom_pas_context in wcnss_probe() via
devm_qcom_pas_context_alloc() and store it in struct qcom_wcnss.
Replace qcom_mdt_load() with qcom_mdt_pas_load() in wcnss_load() and
replace qcom_pas_auth_and_reset() with qcom_pas_prepare_and_auth_reset()
in wcnss_start().  The existing devm_ioremap_wc() mapping is retained
for wcnss_da_to_va() address translation.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_wcnss.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
index c856a92af43c..01f9076aa0b1 100644
--- a/drivers/remoteproc/qcom_wcnss.c
+++ b/drivers/remoteproc/qcom_wcnss.c
@@ -96,6 +96,7 @@ struct qcom_wcnss {
 	phys_addr_t mem_reloc;
 	void __iomem *mem_region;
 	size_t mem_size;
+	struct qcom_pas_context *pas_ctx;
 
 	struct qcom_rproc_subdev smd_subdev;
 	struct qcom_sysmon *sysmon;
@@ -157,9 +158,7 @@ static int wcnss_load(struct rproc *rproc, const struct firmware *fw)
 	struct qcom_wcnss *wcnss = rproc->priv;
 	int ret;
 
-	ret = qcom_mdt_load(wcnss->dev, fw, rproc->firmware, WCNSS_PAS_ID,
-			    (__force void *)wcnss->mem_region, wcnss->mem_phys,
-			    wcnss->mem_size, &wcnss->mem_reloc);
+	ret = qcom_mdt_pas_load(wcnss->pas_ctx, fw, rproc->firmware, &wcnss->mem_reloc);
 	if (ret)
 		return ret;
 
@@ -257,7 +256,7 @@ static int wcnss_start(struct rproc *rproc)
 	wcnss_indicate_nv_download(wcnss);
 	wcnss_configure_iris(wcnss);
 
-	ret = qcom_pas_auth_and_reset(WCNSS_PAS_ID);
+	ret = qcom_pas_prepare_and_auth_reset(wcnss->pas_ctx);
 	if (ret) {
 		dev_err(wcnss->dev,
 			"failed to authenticate image and release reset\n");
@@ -600,6 +599,11 @@ static int wcnss_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	wcnss->pas_ctx = devm_qcom_pas_context_alloc(wcnss->dev, WCNSS_PAS_ID,
+						     wcnss->mem_phys, wcnss->mem_size);
+	if (IS_ERR(wcnss->pas_ctx))
+		return PTR_ERR(wcnss->pas_ctx);
+
 	wcnss->pmu_cfg = mmio + data->pmu_offset;
 	wcnss->spare_out = mmio + data->spare_offset;
 
-- 
2.55.0

