Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3945E394783
	for <linux-media@vger.kernel.org>; Sat, 26 Sep 2026 18:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790447515; cv=none; b=EFp2HddbIEqPPu+0dbcK/1d99r+itbxC3AF8Dx/QhWnyNhtph0y9Ea5oazNhGdpScCM0E8XQGJ2B11JLsam/z4MbRPBaDATEksPBRePs1/NIQ9ffYJ/Rw71MP07IZab98iniRx2M3lHldm8Bn1xi393nm6b3Lh0nV3O4J7GxY+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790447515; c=relaxed/simple;
	bh=tmNZS7gK4Tgwj0fix+5XSNtf3Yw00ArJb0upxGNDZws=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AF7e8XgIYjx0zn/csKegdfu7cyPVU6/W+comhELkOgaASk2cha4WGvSnJkL8T+IwiNFfImoXvyXmowmW4g4JSxkK2LdsXUMLOG3aHw1BOk3OrdDCMVqnBSuRXj/e/rF8riKIdcOiG9ehEnIesj8NNM/IJKEsVO1OUhnnbO0i09o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oV5nFhld; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jhtKfO8j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oV5nFhld";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jhtKfO8j"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68QGxQol1449964
	for <linux-media@vger.kernel.org>; Sat, 26 Sep 2026 18:31:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=UHevoU0mUWQ
	x4ft8vjLQeW50AdjnP3/fAvkpCtYXRno=; b=oV5nFhldQhWp8jcSOs5fQMEyDrQ
	HnE/WVNrtB73A+o87XdiyV1FvdypyY1bBVZLwDzhrnrhtgPNFTu5Za7aB0fU+VIe
	E2Bv4hgqppqSWyFSFHQtO11wnaoMNAqFUBL/i3eesk3aO7RZDRVL/qAfck4iEq/V
	epDdklTLrNsLn+6CBEl/g+dO0yLF+wopE56V+krqHz/Jh+FTedd/B0eCHmzRTmOp
	5w19BvGbYgmalZLylkilpCSzPYT3ABhYtzeTf+bypalwH4RC0XZ5ZlNIc08U07aG
	yHhc++pDy3Ezq4vM1q/LOGmVjkjgsWgDJYwaSnHNzdrQ71GioHkbid5jPZg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx3rfssu7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 26 Sep 2026 18:31:50 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2dd8920c132so27402815ad.0
        for <linux-media@vger.kernel.org>; Sat, 26 Sep 2026 11:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790447510; x=1791052310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UHevoU0mUWQx4ft8vjLQeW50AdjnP3/fAvkpCtYXRno=;
        b=jhtKfO8jVuIP7Hc6ugEEoIMbI7cn8U2kIWY+ZL8cmhtfOPaTFUQZOyyKNvRt0hKTuA
         9zM55ITEAwlrSXWZff4wKc9WQrDijLNJ5PMWuxPZb0e6pFK2j3bBPlNifjvRU0ihgJMV
         /GKdej/nyPOuo5WrZ1vfwyGFScXADXyDE1hC50JEoKk65rC6Nk97LxnocrEPp8c89XHd
         qAtQo8fJamVpmmdoRy+PUj1qUx4hWyQ4ZOF9UGhnvIttPv+u0NBfLM/Q1g17zgCkp4EJ
         XLXytdtOOOY/oqNXdFvfuGPx5oTF8iY7+1sTwERBrc8hawDriWw5gQ/KvFIfCXb5NQ2U
         jA+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790447510; x=1791052310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UHevoU0mUWQx4ft8vjLQeW50AdjnP3/fAvkpCtYXRno=;
        b=vu+0WIbegArK0GTjHBl4CZ2+Q1F5TwYupZVZC/7u96CUvL1OlW8sEsxmYRZJ7GM9so
         h5Dwssp8cHuHr/dWiR+l7xIU6eQ8k6dN8GxCWUN17mfHYdu83NDBnMHSOQvLZsNlBq7p
         4aU/Nusi6jhClBBolMTRmrVRHTcaRRTvBb3HYB1HQ4UB2j6rFcsHNtS5chYEFj3CM9q9
         hYUaRl6ooG7WObjRsAGbawT62zYkghlPkLBIcoUoyduKNbTUnkICswIzz1TUbN4OT6v7
         MbSwx06Sj13VZL9vphL/bn2lWSvVxt/xLpGwOdYMRshicZK7vy94In/+vl6nJuXMBTou
         ECRQ==
X-Forwarded-Encrypted: i=1; AKwUvByv8+/5FyAUgObrIJ3yin3ST9MPdZaWWnH/x95Ii5ibqy8vhmt42PGahZldoFMRsx8rzJkcuPnJojOl0g==@vger.kernel.org
X-Gm-Message-State: AFq9FYIpSLd5HI2sx+V6Y8Tbs29FP7jR/GZESygspbReu5vUt5q8l2Ka
	C5yTIMGxnJy09Sine+0+8EfPky2lvtShMOdLpCvqyoL8chWMbfmkN99yj40X2vEU0JHwCgBKzik
	fDC4oqpMNXCiGz0JyBLfnXxh/MTAQ6WQfdaDqXK5XrbAxFoeRJFe/qRO1W3rlR7+lFX1AxEyYOQ
	==
X-Gm-Gg: AYBFou2BcXCohRBASL+S1FUWxmbYnAfwIdfFAVGTLe9FZopW2c4wLEy7ZFEr2MuXPMY
	DZkaJojujjgf5HmkSyD6PvJgj46FodENmtrmZ3BMxwFe9LG7LzCwOXqzJQNRY8SnnKNuR8i/4B4
	Lph+M4e5qIxsD7sVWgM7UQpZijDkCHFhkM5elg4L5fI818kFalnWt5u6WS93UTHpSXa0CWYDLGr
	2GLRpccZhEQoGP+eULapeCmkrvaj2nlnDn7Q4gsIPjBcE8qyKTgDAMsNhhsoZNJox0VEPs7vm92
	yiZQeAXWY9vyTjxY+OxR3JvvDNfdy3Rc0PttuJ38YAELakl1ndjBW7ViMdU7ZYxMg4/2/Gj9qdh
	qkJuKQiRL3XAVmZpeRYIYxCMBcLpP+xFjwaFI1mKC0bO+d4I=
X-Received: by 2002:a17:902:fda8:b0:2dd:c100:3134 with SMTP id d9443c01a7336-2df7e23b4f4mr73595965ad.48.1790447510128;
        Sat, 26 Sep 2026 11:31:50 -0700 (PDT)
X-Received: by 2002:a17:902:fda8:b0:2dd:c100:3134 with SMTP id d9443c01a7336-2df7e23b4f4mr73595835ad.48.1790447509680;
        Sat, 26 Sep 2026 11:31:49 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df913dfe98sm23353725ad.22.2026.09.26.11.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 11:31:49 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Jianfeng Liu <liujianfeng1994@gmail.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-kernel@vger.kernel.org (open list),
        linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b),
        linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b)
Subject: [PATCH 2/6] drm/msm/gem: Mmap imported dma-bufs via the exporter
Date: Sat, 26 Sep 2026 11:30:42 -0700
Message-ID: <20260926183051.25754-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260926183051.25754-1-robin.clark@oss.qualcomm.com>
References: <20260926183051.25754-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI2MDA3MyBTYWx0ZWRfX6WehL0HUp8cA
 9BtAsfs1dv5KIiaG88cO9a9es2nYE8FidGkg69MMg8vKlBetLWiUN0DHBV0Z15FQdvZBBSj9bRg
 NwX/E2tqoaUCm6Z40AlQ2xC48iUoTW0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI2MDA3MyBTYWx0ZWRfX2CghQHpURU7a
 dHeAtuV27xPr9uoBKwGWVzbsGicr4edXMYTtrnMdbA//ZzOecfbf61613cYk586cVS4xMi1KJfE
 Srvx2iBYd0meYr9c6Vcm5Iu8ZLVt3xv54UyquFR3F9T/Oa5ip430AILIkAMu3cJERdjkY/GPtwc
 Jq/jxrq4/+iHSboT8MlfDnep2xk55Fuc9qqTsNRlhWR6QeavtoBPgKhO0Ngv9G2OXA+MJRY/zTz
 kN0+HEivEndy6YWZ9FLjuJRvqz3+yOlDsPHymUg0IQuAjeixbSYIGrxxMlJ1pVPWdkvMfWxk2uI
 HbdDPKCwzioX7xQd1TafaxUOGFOg0bv/vnEzS+eyv/RmIKlURzdXfROBf6i2xhxYpDgb4oXlgQU
 iWme+T1gkF9Aakmf4VIl3htrfhKzjKotdKveq4Q759tz1KJ2Z4kacino3te4Dzr5z986p2vvrDN
 rpTh4hA2wMk2AtH5big==
X-Proofpoint-GUID: Eh3dJeHOW-ECKLwCDS9rx_JjysMyd0eD
X-Proofpoint-ORIG-GUID: Eh3dJeHOW-ECKLwCDS9rx_JjysMyd0eD
X-Authority-Analysis: v=2.4 cv=K6G3jCWI c=1 sm=1 tr=0 ts=6ab80f96 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=plbGacqYsnyxf3yiAH4A:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609260073

This was always the way it was supposed to work, and when we drop the
page array for imported dma-bufs our fault handling path will no longer
work.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index e8390ebd5dd5..c90336b3b231 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -23,6 +23,8 @@
 #include "msm_gpu.h"
 #include "msm_kms.h"
 
+MODULE_IMPORT_NS("DMA_BUF");
+
 static void update_device_mem(struct msm_drm_private *priv, ssize_t size)
 {
 	uint64_t total_mem = atomic64_add_return(size, &priv->total_mem);
@@ -338,6 +340,9 @@ static vm_fault_t msm_gem_fault(struct vm_fault *vmf)
 	int err;
 	vm_fault_t ret;
 
+	if (drm_WARN_ON_ONCE(obj->dev, drm_gem_is_imported(obj)))
+		return VM_FAULT_SIGBUS;
+
 	/*
 	 * vm_ops.open/drm_gem_mmap_obj and close get and put
 	 * a reference on obj. So, we dont need to hold one here.
@@ -1126,6 +1131,25 @@ static int msm_gem_object_mmap(struct drm_gem_object *obj, struct vm_area_struct
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 
+	if (drm_gem_is_imported(obj)) {
+		int ret;
+
+		/* Reset both vm_ops and vm_private_data, so we don't end up with
+		 * vm_ops pointing to our implementation if the dma-buf backend
+		 * doesn't set those fields.
+		 */
+		vma->vm_private_data = NULL;
+		vma->vm_ops = NULL;
+
+		ret = dma_buf_mmap(obj->dma_buf, vma, 0);
+
+		/* Drop the reference drm_gem_mmap_obj() acquired.*/
+		if (!ret)
+			drm_gem_object_put(obj);
+
+		return ret;
+	}
+
 	vm_flags_set(vma, VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP);
 	vma->vm_page_prot = msm_gem_pgprot(msm_obj, vma_get_page_prot(vma));
 
-- 
2.55.0

