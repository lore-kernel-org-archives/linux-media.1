Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846157;
	b=qvHF8mUdAPNtuU+3FpeCgtlyAGeroVXEJR8hHkZ2qUSMVcsnVJ7Te2Us+UTZUVzR0zgy
	 DuC5n+i+T+GA5AgSwmme+PfzHp0eRlZxLjVLzTlcXdPfFzO8dtexV9ZdyXogXYAIQyrJi
	 t+jcFrVONCzKVQTyGcveVwEO0HtjJPcE5FOZQLDe+6+6o9OwRzSSFLsPfOgoHkO9Rndcx
	 I8fu5e4vyELMsFtK0feBX0kfwSehDiemL16cZkPJd2asAKEZ0eO5mW7EnodlgwFKGnpk0
	 TFMwcIaZFxEiW6H1xuLxTYsTgTrx5VnS0QjIcTSFyFNjJMnnGVLBvPGaayXlvupiROw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846157;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZiJ2cGdx8A1D88FHZg9zdVy/kI37kSxx0OtiuBRrPMQ=;
	b=dQnuSl0ung1iQHS9zvW0R+agTzyDlF+iOAp0fIAMqT+X6l8KSQ+ZGNZ4Ct/MECVNwmva
	 p7DoC9cgpuhgP+d/xWWXfvmFtLLJwALN8B+WcqTViuR1YRNKU20Zt1FRKpAXzz9G7dcDs
	 J+DvITmbm4GJJ61CT2lxZNedKNvRuRI2RsdIS9j2wz41kiEcidALSTQ9xqQBCZBWNGFg1
	 Ar5bllRmMKxKe/tuCMj/LLOhgvA6MuZrDzgnEpyKlHxgRXLZ0dghezw/ZXUU4UgUcv4fy
	 K3Wb4kwp4e7gI8s38lZYAeYXXQdZHGRf5RSvBg8FkZLpCC6ylV0KFbUpWYXa6OCanfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="KKVB/IqJ";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="aXW/QU7w";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A92606A32C
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 16:22:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96A92606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KKVB/IqJ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aXW/QU7w
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGGISWo1677112
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 16:22:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZiJ2cGdx8A1
	D88FHZg9zdVy/kI37kSxx0OtiuBRrPMQ=; b=KKVB/IqJmIHW43Y5iX/SbkcNv6M
	4wqpIJ0CiEte9tqfaDQrZ9zzJqnYBCXMghfBaExOruMjXJ8ySaPDeUAOikyeXHjA
	IDIh23CX+6N9Hv+dhZ9XUPvO9G+2D63QvC76GObIDhBkOXCjyJ7NW1Il6rL0i1gK
	et8Hi2v5ywKSBGtMzY/ChlxUx3+cmrJHZlDrf1LZubrqw1mnJ7X31N5/Lrr7zIUE
	YSTuEFj5Zes9LFQH/0eCVzIvvr+A/Lqhx4SlG8pg2z3t4ZKjG68W26dfQfbW8Eit
	IHcgJZ0bUc2vLc731T4bAv1gXUjt3SzEzSYm/1aVm+lW9kc+w4K+Nh4UR5w==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0003hc7w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 16:22:35 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-14373747468so1238198c88.1
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 08:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794846154; x=1795450954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZiJ2cGdx8A1D88FHZg9zdVy/kI37kSxx0OtiuBRrPMQ=;
        b=aXW/QU7wwo0KFJoURXoHe2aKBWEOXzCDZXZFqQ/dPY34of0n9KFFSmIgZ+eT5+EF7O
         h0qXD2JsIH9ZSUSH64HYjkrPt1MXGDPYffxyQy7jNdTQkd7wLlM/por0N41ydhxE/dit
         r7M2/0yhpP2HgRwQfFSuziYhwTIxUNBLa40lJRQgE/Uz/mDDX9tAD+E+QM9jaKA8HwPF
         nltSUXEEX7x4h8LRz9NegWLjGR6kkmE0hLVjRGcVA5zIB41DxGv8kwYOEF1zeyXbJ1B2
         cgrw3kNMtr/ZqgnJZG3HlEc78ZDydaZg5nqQddOdvvDFVN1tYobLPb1VeZK66U43veuB
         qbOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846154; x=1795450954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZiJ2cGdx8A1D88FHZg9zdVy/kI37kSxx0OtiuBRrPMQ=;
        b=z3UU6ktyaJybQrMU05mixVsbZ2ViWciQ4SZq5F3UeaC0OhFWiOEyklk85B6cUnvKj8
         6YgKQmlqAoF+FHKWdU83p3OIy9XtmQ/KB66wm/1N4N6eDg2/wmtxpuVABuKFapL/YWSq
         ah0mbs5otEiDQjTw0FGNqPy2TycMqTT58/kpcszmsUWtlFGywB+45mfc+Pna9EluMD+T
         SMxNuyLDUhA3GaFtOtsohxclLRpn0O6iSPNwHJHem16h3oy6GSZtiZ7ucLHFERv+k1ur
         Ya0pSRVTYf3Qup6UY5hIEkcQl8ilb3bZTvTaBapY4s/2WBIZc8UhPMBdVLrMWkJCccMX
         pbHA==
X-Forwarded-Encrypted: i=1; AL+hErGDGeVnFsaAMMaxSRRCTSuzDwyv4qvE+ef2AHLtZc0hy+2lnR6KsUml5OCGRuJ7EeXuMyhPAbqpqc2LNw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8MXV5cBjY90mMaePl+E0YFEb9fQdftkEwCT5zqVmgzU/S7FUDI
	NWx/cqzeAGyEhk3iRDgcS2ss/zoibXgyMeshRQj0S0D+bJq1+yyoKY0EAPaw0z1LMYwOXNkXuQQ
	HHimwaSqc4PaNwyJJE9Rm8QtfCoTLap8bYaWTY9Z/kx6mMwDW16rjltSpQb1k9aecKw==
X-Gm-Gg: AYBFou0t/hG8cG8QSOseBz3Wc6lUBMdcf10RJJaAog9RoX4maTm9v46KLnfdD0MwVBi
	LNg7el5JEB+X/8UXznnyvBlK9atH3j38SHm6cC1uPIeujXS/q6eSxr9xOtQI/uh6gYgK/mDOCc9
	7FWxq92e5bllCRCtEGkS5vwpy5MLo+4bjWLl9ZDkh+3PXmIHCyB99dLQrACWWOHTap1fPDK0HE1
	kdMsMG+o5k1Cuyqq1wiVoaW4pVZqa9ZHW3boOP6qqggFxNBHFjCRZPYPSqWyFq6z0d1sykGayx9
	+BXt4mBVDwH4BTE7hqhTxJzrXAO2JTuXBx52toHAL2wtTfMWyYXOqJV7mU3SwqRmFoD3fv8B9lc
	w1Hz1is1uxfcR2jHuO+Jsng4jV4JxOZ3Y8/cGKJgmk87zIaHjzw2eTAD0ns1G8qjVb0CnYVRFMF
	cI
X-Received: by 2002:a05:701b:450d:20b0:149:49c:233 with SMTP id a92af1059eb24-1b5030bb598mr10533725c88.27.1794846153704;
        Mon, 16 Nov 2026 08:22:33 -0800 (PST)
X-Received: by 2002:a05:701b:450d:20b0:149:49c:233 with SMTP id a92af1059eb24-1b5030bb598mr10533694c88.27.1794846153043;
        Mon, 16 Nov 2026 08:22:33 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm38623826c88.5.2026.11.16.08.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:22:32 -0800 (PST)
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
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
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
Subject: [PATCH v3 3/9] drm/msm/adreno: migrate zap shader loading to qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Date: Mon, 16 Nov 2026 21:51:42 +0530
Message-ID: <20261116162148.2864501-4-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116162148.2864501-1-mukesh.ojha@oss.qualcomm.com>
References: <20261116162148.2864501-1-mukesh.ojha@oss.qualcomm.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: GrlgKiFu-Mbbl-jID-EltNhKdTXTFZPm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfXz98JAct6eaMB
 U+gAS5mTEsGBH0UncvVO1XpwAxisGQWe6sxaT6AupjmKjjIUz6IuMK7Y5wl1eOK7UaJQJnMhzNi
 MTl/Qs3nt2RMknfPopQyzpF+G4DPhkY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfX2Qnv3z+vgfZK
 RGqcU5j7QakAbNyrp410l7dld/KtJMDH/zN65a/9kOyqOwGpp8YB9K1GyOMtxbnuh5AzGk/qe41
 WfzrD6MVdEb/TV4yl3JNLRglX5m0cILRyeETVeEJ7PnYOSgpbEJUvnXGB3rKivdmDDoV/Szcq23
 wU583qA2JdILf+8UE32KAdNyVJ3lS3SNQipdMjV3BQjmk4EDeFwkS2FtbHiiNrePZ2BqQErlprd
 2DbE9v98/tqtOJCq0+ew6jfNaps4+5ZjuZMc/7oGoE5Z3mTiwgQ780O84T0NiJm75z3kVlotkdX
 qyw4EqFNrjBAJiBjuyjOGvn/vsGPm1MUzmavwooQ2EOChnrYWKtlJXeUSDZia34TSPl4DF97ppa
 jMboXW/F5ETRN/fUCe8taIhOG356UfucGWy/8hflamnrHYjEc9aS34PS3q6Rm87f+KJHnb+qmm9
 Fu12sou9EzyqvJ9vl3Q==
X-Authority-Analysis: v=2.4 cv=Z4N5j3RA c=1 sm=1 tr=0 ts=6afb2dcb cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=zg618T-2U28-L6wfSYIA:9 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: GrlgKiFu-Mbbl-jID-EltNhKdTXTFZPm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160064

zap_shader_load_mdt() calls qcom_mdt_load(), which bundles metadata
initialization, memory setup, and segment loading into a single API that
does not expose a PAS context.  zap_shader_load_mdt() also calls
qcom_pas_auth_and_reset() for TrustZone authentication, which is the
intended behaviour.  However, a new qcom_mdt_pas_load() has recently been
introduced that works with a PAS context and can handle everything
qcom_mdt_load() provides, along with additional functionality such as
shmbridge creation and retrieving memory from the shmbridge buffer when the
same remote processor needs to run while Linux runs at EL2.

Replace both with qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
using a stack-allocated struct qcom_pas_context initialized by
qcom_pas_context_init().  zap_shader_load_mdt() is guarded by a
'static bool loaded' flag so it only runs once; the stack allocation is
sufficient and avoids any heap overhead.  The manual memremap/memunmap
pair is removed because qcom_mdt_pas_load() handles memory mapping
internally.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 54f337475231..8e4aa8e22108 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -34,11 +34,11 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
 	struct device *dev = &gpu->pdev->dev;
 	const struct firmware *fw;
 	const char *signed_fwname = NULL;
+	struct qcom_pas_context ctx;
 	struct device_node *np;
 	struct resource r;
 	phys_addr_t mem_phys;
 	ssize_t mem_size;
-	void *mem_region = NULL;
 	int ret;
 
 	if (!IS_ENABLED(CONFIG_ARCH_QCOM)) {
@@ -121,39 +121,32 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
 		goto out;
 	}
 
-	/* Allocate memory for the firmware image */
-	mem_region = memremap(mem_phys, mem_size,  MEMREMAP_WC);
-	if (!mem_region) {
-		ret = -ENOMEM;
-		goto out;
-	}
+	qcom_pas_context_init(&ctx, dev, pasid, mem_phys, mem_size);
 
 	/*
 	 * Load the rest of the MDT
 	 *
 	 * Note that we could be dealing with two different paths, since
 	 * with upstream linux-firmware it would be in a qcom/ subdir..
-	 * adreno_request_fw() handles this, but qcom_mdt_load() does
+	 * adreno_request_fw() handles this, but qcom_mdt_pas_load() does
 	 * not.  But since we've already gotten through adreno_request_fw()
 	 * we know which of the two cases it is:
 	 */
 	if (signed_fwname || (to_adreno_gpu(gpu)->fwloc == FW_LOCATION_LEGACY)) {
-		ret = qcom_mdt_load(dev, fw, fwname, pasid,
-				mem_region, mem_phys, mem_size, NULL);
+		ret = qcom_mdt_pas_load(&ctx, fw, fwname, NULL);
 	} else {
 		char *newname;
 
 		newname = kasprintf(GFP_KERNEL, "qcom/%s", fwname);
 
-		ret = qcom_mdt_load(dev, fw, newname, pasid,
-				mem_region, mem_phys, mem_size, NULL);
+		ret = qcom_mdt_pas_load(&ctx, fw, newname, NULL);
 		kfree(newname);
 	}
 	if (ret)
 		goto out;
 
 	/* Send the image to the secure world */
-	ret = qcom_pas_auth_and_reset(pasid);
+	ret = qcom_pas_prepare_and_auth_reset(&ctx);
 
 	/*
 	 * If the pas call returns -EOPNOTSUPP we assume that this target
@@ -165,9 +158,6 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
 		DRM_DEV_ERROR(dev, "Unable to authorize the image\n");
 
 out:
-	if (mem_region)
-		memunmap(mem_region);
-
 	release_firmware(fw);
 
 	return ret;
-- 
2.55.0

