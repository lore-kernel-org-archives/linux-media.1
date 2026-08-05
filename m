Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4DD3502A5
	for <linux-media@vger.kernel.org>; Wed,  5 Aug 2026 06:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785910192; cv=none; b=MmQb4+3u9LjAcyVl2qtBdkMuOJZIv0BqnOMihRa5mUDZ45hpbOg8d3LwKjgTw54Q0r5q5J369NfiOZ2+FZy3ZeWhu9hJe8g3Ls1h+jk/JOdWuihA/xkhwPmVMftpFT+s71BKlsQ6n4ahvgEMh/3OwWuVzEjRsmoSNpO97W4rYVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785910192; c=relaxed/simple;
	bh=K0OUEcgXkxu18FWvcNQyWwFf74F74yYzP0AArcSr2+8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Kv11kzjyaB2cOliI7NHoZjpUSLh6XYY347k90DB9Oes0kDTKIpEaxu5BxT+EnSUXf9h1AGRbdx09KLjEyesYV1qp6pRF0MzBe61LiBPsWBtRcRRfc4P7EVJGD9LQ5iDywsludJqUWWTmCuz1f4EtIcss6ffJMCvQ+hzwDZqMJo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VnLlh5fW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H56lDaaC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VnLlh5fW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H56lDaaC"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6755krFd1680409
	for <linux-media@vger.kernel.org>; Wed, 5 Aug 2026 06:09:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=8L2Wvo1/28V+1RU6zGe1Oe4JzYrAx0U6d0C
	N1+O2FKQ=; b=VnLlh5fWgGYL3FbHa73Jtr5ROuQzpJE5disgcDufu2bN1o9akPV
	iGfe7Hg+KzN/vPiB2Z0FcH0eE0zdNuig+HavjVHKU5rGEifTP2CbZ2rW2qsS+lqr
	u3iHbgwF6ouabKLtHfh2PDWRYyYZUV1IfhzZbK9h0Ad5XgRD9jTQCwJaGJDcduYY
	AU8jkgeyiOClAdzLqp171zPT6sCHO0FJkLWgEVpVNARhFHUBO/hPtqtSMcoLm4+R
	W1kInuxcqx/OnzyAGHQm5C/EHWzxDLADSHizE9wPv5/kxaUgybYzvnd+wAP0uCG0
	IYCsL9nTbl8tB5vE3v+EEkx3uclnmcq5feA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fuk9u37h0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 05 Aug 2026 06:09:49 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c85798977dcso965280a12.0
        for <linux-media@vger.kernel.org>; Tue, 04 Aug 2026 23:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785910189; x=1786514989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8L2Wvo1/28V+1RU6zGe1Oe4JzYrAx0U6d0CN1+O2FKQ=;
        b=H56lDaaC0bctCE9Om1QW+osQGTqVjPjfkMvUJU4dp+RJebs4HYImyVCi8jOgiYhm98
         bGEhaVDKgFtyH8GWiaMzusA11tNaEcn7ODFsATgZAmWboyBy4KOgAybnooEfADAUN7w3
         M3+ioyvmvhuu9QdckDTEwzV0Jq/r0ssUkc+9AZeU4iUObj8lb8NpxE3/L9dZTDqSygMq
         7oWsDGPj/N6e8ABj3RPizC35fx5/i+gTliQoo3QpRqCxmpH+UD7rh0WOtCYaPLTOik7D
         QpOkVVmpibfAvvRMSqFXnM1tX4crGuNBdVrhewhwNbsAsjpzCI6og2VGnj+5l7DsAc1a
         rDGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785910189; x=1786514989;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8L2Wvo1/28V+1RU6zGe1Oe4JzYrAx0U6d0CN1+O2FKQ=;
        b=gp5o/KQQDXGzk8BXE3VcbWPZdlIApWABVI+9MiRJ+xKYa0rYbnnmFZrnm873yZV4ss
         2Pli31PpLU5AZchYN2iA7GztOQo79WcfAGgIhek08ZXEKWYZti/3tOwKnWw7FKv/iwG7
         sZQgtWvMndCPxsioiK5LnVZWUzsj7txd889o3itxm8m8/xkvtvBof/SBrYZ8yE3NdoRa
         ThNViZorrWL5RzHVzGK9Yu02o8OOpgobUmua/NLykDpF+5zxgaO9iN/CkB0lcqlG9xm/
         63PBUfUMRMX3Zor7XyThStNGjYzUgPrPALpa8Fs2ChSK+/v6xMAYSpFKEqTuvMhVq3V7
         82QA==
X-Forwarded-Encrypted: i=1; AHgh+Rp/lxNxSJGTABwJw7z+FHCWaE7avHurB9aYNdLnkuLydL0Yk2hJPQGLt+ucCAp99YvLLN5zkbIVvTS1Vg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOIBmEk0YfKRvApXOYvfmZZSVJqQc58xbMRQ6Xb0GoZ3pxuHok
	qwBvIQiHVeqmNjE1F3q6DQQ7IxLOBIu/zL9Zz2cENlTLOLHEcm30X0GeG9b9rfvFCojkFaLCRvL
	jAZWD/ZUTowVUVll4n8VH0LLrF8Num9104RTuOTIbZ2pbv6zU8c/UZHHpg0ddjjLQxQ==
X-Gm-Gg: AR+sD132o/1JjqjPIAOJZ0d6JzHcRvUoNQmDNSZHO4HVOBFP0mSMz5T96uFdcSYDMrZ
	DLaS+q9dyfe6SAKqJq4DkUI6h8/L3wvqqh1v+msqLGsQ0/NEe+64IDthDrjrUnM5vV+SlRWVVhP
	BQLunZCGJKpqL4IVPgC7Bkql1FFw+uzJn71TUZ9FP/++FMqAoanksZoFKiF3GLuhOCKH+O8MqVH
	Sr2sVaA5oM+3tzZ9gTu1cV72Yw7s28325R2KE2keYzwI+0IoYYVfblz+RxztCSbIs7cNcfrfj1D
	YoSwDLXTWkBf3U6IdAI8vJrVMRyRmveMYJo0ZdBUSkVvgTvY9OAVg28WQQIq6QFydrwjVHnGIrW
	tbfeFiVfzXodUnj9JYDfP8v0c2bmE3zuNeLRk7Mc6wfPF0QWsz6DyCj0mJYWyzEjmoZkpSIIJig
	==
X-Received: by 2002:a05:6a21:a38c:b0:3bf:a681:a262 with SMTP id adf61e73a8af0-3cb8603af5dmr4959771637.38.1785910189112;
        Tue, 04 Aug 2026 23:09:49 -0700 (PDT)
X-Received: by 2002:a05:6a21:a38c:b0:3bf:a681:a262 with SMTP id adf61e73a8af0-3cb8603af5dmr4959702637.38.1785910188598;
        Tue, 04 Aug 2026 23:09:48 -0700 (PDT)
Received: from QCOM-SocCW5bzXR.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe70909386sm728690a12.28.2026.08.04.23.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 23:09:48 -0700 (PDT)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Jianping Li <jianping.li@oss.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Ling Xu <quic_lxu5@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, quic_chennak@quicinc.com,
        stable@kernel.org
Subject: [PATCH v3] misc: fastrpc: avoid duplicate DMA mappings in fastrpc_create_maps()
Date: Wed,  5 Aug 2026 14:09:40 +0800
Message-Id: <20260805060940.41414-1-jianping.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NInlPU6g c=1 sm=1 tr=0 ts=6a72d3ad cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=jcsToSEUEPbHcpESBJIA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: NkzsRXz0d3eKhNj0RuIgWMPSa75DgIUc
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDA0NSBTYWx0ZWRfXwx7Mxb+8XYKO
 yZLv8hWm/2p4JOTq+e46yssVJkk3njAtGrM1EGJxv6lwk1DC4dKdpDwpCn1G589NUyn45yhU79y
 PfRdyYOKF7682jCLCogfrMaFi4OMjHk=
X-Proofpoint-ORIG-GUID: NkzsRXz0d3eKhNj0RuIgWMPSa75DgIUc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDA0NSBTYWx0ZWRfXyIsnBoy6bLLW
 dRwcss5wymaTIZo2w2rKTHRmMyPQ54B5a6CqqjwK2oP0DnPJgVNsF9luQSsImQY7rT/JQOJ72zk
 gkrcXs6hC2evjL1mjiVOp0e2DIJcV4nQCm1BnTHDl3A/aN05Qb+ohboU1WhWNsl4MLNExaC7lt+
 NWcLFl7HBP4VIONBDHirl22vK4RgIQ13qlqZcK1bG4A2NVFXGqzvLPW4uVqA0iUspGvloSbFrrz
 uEaK8NaAW2x6+TuEJgIHc4//U3Aok5qgnZFEfqYvIOxYltuYpRL2XsPCX76aLFsK4URHipvzmC+
 UQXnR4gxbGGHr14pBhcXUbEAzvxPUbk8f4jg7OaE9x4pHA8MRBYYhnRpmTLvKUHpExz27KxoOn9
 hKf/6X9Yg8YoBH22o3t/1CqmCpgwbfZ0GKKnrws16Dn0E7+TEEZtoA1az8B0rnpwNRLJQT5vPfg
 o4bzH7UpsNGcTXdMB2Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_02,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 clxscore=1015 adultscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050045

DMA handles passed as invoke arguments (scalars beyond nbufs) may refer
to the same dma_buf fd as an input/output buffer argument. Taking an
extra reference for such DMA handle maps leads to duplicate mappings and
an unbalanced reference count, since DMA handle maps are released
separately when the DSP returns the fd through the fdlist.

Fix this by not taking an extra reference for DMA handle arguments
(take_ref = false) and tagging them with FASTRPC_MAP_DMA_HANDLE. As
these maps are borrowed references, fastrpc_get_args() re-validates the
map via fastrpc_map_lookup() before dereferencing it, so it is not used
after being freed. fastrpc_put_args() only releases maps flagged as
FASTRPC_MAP_DMA_HANDLE and clears the flag to guarantee the map is freed
exactly once.

Also reject FASTRPC_MAP_DMA_HANDLE in fastrpc_req_mem_map(), since such
handles are already mapped implicitly during the remote invoke call and
must not be mapped again through the explicit MEM_MAP path.

Fixes: 10df039834f84 ("misc: fastrpc: Skip reference for DMA handles")
Cc: stable@kernel.org
Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
---

Patch [v2]: https://lore.kernel.org/all/20260716113254.570-1-jianping.li@oss.qualcomm.com/

Changes in v3:
- No functional changes.
- fastrpc_put_args(): document that clearing map->flags without a lock
  is safe because the DSP reports a given fd in the fdlist only once,
  so no concurrent fastrpc_put_args() can race on the same map's flags.

Changes in v2:
- Rework the commit message to describe the DMA handle reference and
  lifetime problem more precisely.
- Introduce a new FASTRPC_MAP_DMA_HANDLE uapi flag and a 'flags' field
  in struct fastrpc_map to explicitly tag DMA handle maps, instead of
  relying only on the nbufs boundary / take_ref.
- Plumb an mflags argument through fastrpc_map_create() and
  fastrpc_map_attach() so DMA handle maps are tagged at creation time.
- Re-validate the borrowed map in fastrpc_get_args() via
  fastrpc_map_lookup() before dereferencing it, to avoid a
  use-after-free when the map was created with take_ref = false.
- In fastrpc_put_args(), only release maps tagged FASTRPC_MAP_DMA_HANDLE
  and clear the flag afterwards, so such maps are freed exactly once.
- Reject FASTRPC_MAP_DMA_HANDLE in fastrpc_req_mem_map(), since these
  handles are already mapped implicitly during the remote invoke and
  must not be mapped again through the explicit MEM_MAP path.

---
 drivers/misc/fastrpc.c      | 60 +++++++++++++++++++++++++++----------
 include/uapi/misc/fastrpc.h |  2 ++
 2 files changed, 46 insertions(+), 16 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 90fd669636ec..8c98c8af6084 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -253,6 +253,7 @@ struct fastrpc_map {
 	u64 len;
 	u64 raddr;
 	u32 attr;
+	u32 flags;
 	struct kref refcount;
 };
 
@@ -879,7 +880,7 @@ static dma_addr_t fastrpc_compute_dma_addr(struct fastrpc_user *fl, dma_addr_t s
 }
 
 static int fastrpc_map_attach(struct fastrpc_user *fl, int fd,
-			      u64 len, u32 attr, struct fastrpc_map **ppmap)
+			      u64 len, u32 attr, struct fastrpc_map **ppmap, int mflags)
 {
 	struct fastrpc_session_ctx *sess = fl->sctx;
 	struct fastrpc_map *map = NULL;
@@ -896,6 +897,7 @@ static int fastrpc_map_attach(struct fastrpc_user *fl, int fd,
 
 	map->fl = fl;
 	map->fd = fd;
+	map->flags = mflags;
 	map->buf = dma_buf_get(fd);
 	if (IS_ERR(map->buf)) {
 		err = PTR_ERR(map->buf);
@@ -970,13 +972,13 @@ static int fastrpc_map_attach(struct fastrpc_user *fl, int fd,
 	return err;
 }
 
-static int fastrpc_map_create(struct fastrpc_user *fl, int fd,
-			      u64 len, u32 attr, struct fastrpc_map **ppmap)
+static int fastrpc_map_create(struct fastrpc_user *fl, int fd, u64 len, u32 attr,
+			      struct fastrpc_map **ppmap, bool take_ref, int mflags)
 {
-	if (!fastrpc_map_lookup(fl, fd, ppmap, true))
+	if (!fastrpc_map_lookup(fl, fd, ppmap, take_ref))
 		return 0;
 
-	return fastrpc_map_attach(fl, fd, len, attr, ppmap);
+	return fastrpc_map_attach(fl, fd, len, attr, ppmap, mflags);
 }
 
 /*
@@ -1047,23 +1049,25 @@ static int fastrpc_create_maps(struct fastrpc_invoke_ctx *ctx)
 	int i, err;
 
 	for (i = 0; i < ctx->nscalars; ++i) {
+		bool take_ref = i < ctx->nbufs;
+		int mflags = 0;
 
 		if (ctx->args[i].fd == 0 || ctx->args[i].fd == -1 ||
 		    ctx->args[i].length == 0)
 			continue;
 
-		if (i < ctx->nbufs)
-			err = fastrpc_map_create(ctx->fl, ctx->args[i].fd,
-				 ctx->args[i].length, ctx->args[i].attr, &ctx->maps[i]);
-		else
-			err = fastrpc_map_attach(ctx->fl, ctx->args[i].fd,
-				 ctx->args[i].length, ctx->args[i].attr, &ctx->maps[i]);
+		/* Set the DMA handle mapping flag for DMA handles */
+		if (i >= ctx->nbufs)
+			mflags = FASTRPC_MAP_DMA_HANDLE;
+
+		err = fastrpc_map_create(ctx->fl, ctx->args[i].fd, ctx->args[i].length,
+					 ctx->args[i].attr, &ctx->maps[i], take_ref, mflags);
 		if (err) {
 			dev_err(dev, "Error Creating map %d\n", err);
 			return -EINVAL;
 		}
-
 	}
+
 	return 0;
 }
 
@@ -1195,6 +1199,16 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
 		list[i].num = ctx->args[i].length ? 1 : 0;
 		list[i].pgidx = i;
 		if (ctx->maps[i]) {
+			/* It is possible that map is created with
+			 * mflags FASTRPC_MAP_DMA_HANDLE and take_ref
+			 * is false. Check if map still exists or is
+			 * being freed as take_ref is false
+			 */
+			if (fastrpc_map_lookup(ctx->fl, ctx->args[i].fd,
+					       &ctx->maps[i], false)) {
+				ctx->maps[i] = NULL;
+				return -EINVAL;
+			}
 			pages[i].addr = ctx->maps[i]->dma_addr;
 			pages[i].size = ctx->maps[i]->size;
 		}
@@ -1244,8 +1258,17 @@ static int fastrpc_put_args(struct fastrpc_invoke_ctx *ctx,
 	for (i = 0; i < FASTRPC_MAX_FDLIST; i++) {
 		if (!fdlist[i])
 			break;
-		if (!fastrpc_map_lookup(fl, (int)fdlist[i], &mmap, false))
+		/*
+		 * DMA handle maps are released when the DSP returns the corresponding fd in
+		 * fdlist. The DSP is expected to return a specific fd only once in fdlist,
+		 * so no two fastrpc_put_args() paths should clear the DMA_HANDLE flag for
+		 * the same map concurrently.
+		 */
+		if (!fastrpc_map_lookup(fl, (int)fdlist[i], &mmap, false) &&
+		    mmap->flags == FASTRPC_MAP_DMA_HANDLE) {
+			mmap->flags = 0;
 			fastrpc_map_put(mmap);
+		}
 	}
 
 	return ret;
@@ -1621,7 +1644,7 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
 	fl->pd = USER_PD;
 
 	if (init.filelen && init.filefd) {
-		err = fastrpc_map_create(fl, init.filefd, init.filelen, 0, &map);
+		err = fastrpc_map_create(fl, init.filefd, init.filelen, 0, &map, true, 0);
 		if (err)
 			goto err;
 	}
@@ -2246,9 +2269,14 @@ static int fastrpc_req_mem_map(struct fastrpc_user *fl, char __user *argp)
 
 	if (copy_from_user(&req, argp, sizeof(req)))
 		return -EFAULT;
-
+	/*
+	 * Prevent mapping backward compatible DMA handles here, as they are
+	 * already mapped in the remote call.
+	 */
+	if (req.flags == FASTRPC_MAP_DMA_HANDLE)
+		return -EINVAL;
 	/* create SMMU mapping */
-	err = fastrpc_map_create(fl, req.fd, req.length, 0, &map);
+	err = fastrpc_map_create(fl, req.fd, req.length, 0, &map, true, 0);
 	if (err) {
 		dev_err(dev, "failed to map buffer, fd = %d\n", req.fd);
 		return err;
diff --git a/include/uapi/misc/fastrpc.h b/include/uapi/misc/fastrpc.h
index ba1ea5ed426c..c04749bf4f96 100644
--- a/include/uapi/misc/fastrpc.h
+++ b/include/uapi/misc/fastrpc.h
@@ -45,6 +45,8 @@ enum fastrpc_map_flags {
 	FASTRPC_MAP_FD = 2,
 	FASTRPC_MAP_FD_DELAYED,
 	FASTRPC_MAP_FD_NOMAP = 16,
+	/* Map the DMA handle in the invoke call for backward compatibility */
+	FASTRPC_MAP_DMA_HANDLE = 0x20000,
 	FASTRPC_MAP_MAX,
 };
 
-- 
2.43.0

