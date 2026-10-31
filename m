Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793465066;
	b=CnfZaT0IqLUwv5NR/2/mCWqWPI+z+VMTybYuicWhL3TeRmOnyc5jA+52BYu1UthIJmXL
	 1OyHxzPrc/zTLeAx4d+E70QPlS71zuuYQhQgwfbu/ZIVMUTtit0p5A5uBKDgGY9pG8Yq7
	 67Lig/5rzJxexIjnuTCQ45mpBp6iOpsXIkxnLPQneNaHzEuWs1y3NVPaxQFyyX+SEI0/S
	 Ko+DwaX2ge96kooerEKhUQHTM4loeaQ/57ZUtfaxfbjZGqA/jWSnot7gVCxHtbg0ApAC+
	 2+S+w/ckuGXqAGXbnug17yrOVshn3iIJk/bh4M4Pz6Zz+iBuyX7AMv/aBb+uoNBEtLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793465066;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=X7cn4ZV0x0ZMDrVEWu9sE8OpsZZOKYyBGhdrFpwB/co=;
	b=gg094b+uhfp5Djeq66pzP3ZkNzj0PGBZzCewLHFsY6LUZ4Es8qFdf6x42ifnvKYPZdqP
	 /Jv7Nh4HfSVqhaOsej4UtGa58BlQph521Z7uyQuZRbc5NVj7pbsorNFEmN9kaaqbSuyAR
	 7X2pTCnb1FSi6pm8v5WpxYjxKPud0meEMeZMkSmf6Za89QqdDoXFzhDg5MD2wBBFhqiF6
	 T/LhYhALWkkubQTSAriI4cPiW3oNrq4GyRpBgHJalR2bxpBzPTy4Bn0YReK//MTYtA7FG
	 Xke4mCfStD8uBBE/Co9nlAZMtx11vrnPmmDvxuqq4PpLWOiiDU19Oa41UI8DGMD2pug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=GapK3r4U;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=vycQHPpv;
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE79606A331
	for <linux-media@vger.kernel.org>; Sat, 31 Oct 2026 16:44:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BE79606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=GapK3r4U;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=vycQHPpv
Received: from pps.filterd (m0167071.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VDmPQ6629017
	for <linux-media@vger.kernel.org>; Sat, 31 Oct 2026 12:44:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps01; bh=X7cn4ZV0x0ZMDrVEWu9sE8OpsZ
	ZOKYyBGhdrFpwB/co=; b=GapK3r4UAiGKvHngHi+r0R1DgOpvzZDBYS7+39q8Eq
	apQz3tClueWSWZ16luQPLQIsMJoDPZN0gmyjyg4MUTHsgmtJxcSvv5qiqxkKsZRv
	75jab9LKGHNzgTdRL3+csMTlVFWVJ9MdR7sMGduAB5xl65f/I9cvPfihlp4E30qw
	Ae7i86Q7yMoW9eqO6OVjrvtBeTPL9qIL8jOQFM3N6RtQYhqzmCT4ThjR+vngHHBa
	KpTUPrLiPD0ItSHh/Se2Gbo2DYWuoPEFPLyFE2Kr6XCO4Ta6Dn2hwPrypPwZ3074
	HtJRux9p1nlLNUbbqkANEHXRpztS2hbG/MorWfoFXUVQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4hnd9ja480-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 31 Oct 2026 12:44:24 -0400 (EDT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f1e62510cso389208385a.1
        for <linux-media@vger.kernel.org>; Sat, 31 Oct 2026 09:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1793465063; x=1794069863; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=X7cn4ZV0x0ZMDrVEWu9sE8OpsZZOKYyBGhdrFpwB/co=;
        b=vycQHPpv/htYqiPtUyog51/mdirSFE/aPCEd3c3kjxniztCvBZQ1xEOb3WEy2hNs29
         +74daTuH0/skeZRqf3HWiwXNytnLBNSYY4pK6Gp6JBXbxy9yV69jIRUOJc4kiGHpk8/j
         q25drW2sbp01ABHdCqF2ny9UCoD2pQrmPuuyTZ7O94Invmc8QRc/6vmav8SvplMol4Fh
         VNwKVig+6sh/99eBqPaYQwIEbaAj4hYox+8OW8rJq97xNjLuWbIpyG84HK8PA+yWtusH
         5oN9yvRriUtQuLPv9DflNA0voyDjSAf5BGVEvkUM6U0ZjO2Nq9dJSDCX89hfljIyGINx
         HanA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793465063; x=1794069863;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=X7cn4ZV0x0ZMDrVEWu9sE8OpsZZOKYyBGhdrFpwB/co=;
        b=l6D/0jy2QSnZ3hvDH2adZMnP3JPj3x6qUY1HwVI8cqLcFx5gasVdO+VUsgWaW2NsSK
         +dAqPdpXUdlY7m33MLGJvmEPWw2QC6brVjn4CCkF2XwIXjCTkcuiGKMbCVUCZi5WRgCm
         WnnP5rHeQUtWpuf80VKiTr6oqmQbh1n01iKtiWs6oD6h9bPusjwy3hBXpKkjMnso4dAh
         AtqLKFG0DiORgAISNuK1bRyrp/Hv6dcnJXHeUahN3IsJXSPXH/s+QaR2JLJ5FvpXY4OJ
         nVaxnJ15gWGITPLva/2pNYlQUmysctqvZlSGX5oN9fCgiCoSsnmLfeVbIssaAU3UdWti
         7Qig==
X-Forwarded-Encrypted: i=1; AKwUvBxq4NjnIXz/RAhp/K3q8Ddo/QVGe9vxPW4bCfjQ+M/WotGzdPIQo0zlSe8Ty4lxrq3OfbMLUNcwi18mWQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKng+2XSHjCQ3KkGkV/sjIeG1gQioBbjLxULzp1uljlCvmOrRlm
	DTnQxfd8gjRFtkte0DzU5R49iRqt5J02r8lK81WGVjn+wg9ya1znojyYFxBr36ZPIBbUu9Go4Sc
	QUxaE+/eX2MOqhyxRdNCIVD3ml6fIfTIwG/iGbQGhDJS1rdBBD5PqiSITCAXHdmrNe4x3
X-Gm-Gg: AYBFou1OdU6FYiszq/7KOukundGCsizj3cG/wFoldw6R8UQKSBXR8vGv7o490Ulc9JO
	oHwijsPWX3zDAYORunp5oSw4zhGD48wQt+JTvJogn0NxJawmRYsSlenH9TBTYGO8p0ApkCcktzQ
	6KKmKNzJvh7aiawLzPc8IpmSLyVz1icfj5Qo09lBXxO4ZGlom/TZC378h1fHtOKvczf3ya1sfIg
	hGqtRzIKJV/NnYEwWh/5MVpWJNFCPJ+Rjq/QCLW5WFlamujVZDsXs8Xkapz7e0pITlZQ27UFnsw
	hg3UG9rg+TcDQKtjDykBVdRREoJ6etXrZbCWERs2ugi29Sc+rmgHD3HJGr23T8kRRg48xyTUNsA
	lQpAl1H+beeHt+Qo1WXoaqVKZMIgwFmbwll4IwPOMEvZY00N3+KO2NCQygQ==
X-Received: by 2002:a05:620a:4487:b0:93e:c12c:9b77 with SMTP id af79cd13be357-94421841ae1mr945199585a.82.1793465063423;
        Sat, 31 Oct 2026 09:44:23 -0700 (PDT)
X-Received: by 2002:a05:620a:4487:b0:93e:c12c:9b77 with SMTP id af79cd13be357-94421841ae1mr945196085a.82.1793465062899;
        Sat, 31 Oct 2026 09:44:22 -0700 (PDT)
Received: from [127.0.1.1] ([37.142.159.89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b9a3b1sm10420517f8f.44.2026.10.31.09.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 09:44:21 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Sat, 31 Oct 2026 12:44:06 -0400
Subject: [PATCH] media: videobuf2: mark pinned pages dirty when unpinning
 them
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
Message-Id: <20261031-vb2-unpin-dirty-v1-1-701a22f124a5@columbia.edu>
X-B4-Tracking: v=1; b=H4sIANUa5moC/yXMTQ5AMBBA4avIrE3SjqhwFbHwMxiLkhYh4u6K5
 bd47wLPTthDEV3geBcvsw3QcQTtWNuBUbpgIEVGK53i3hBudhGLnbj1xFyTMYoy4oQgVIvjXo7
 vWFa//dZM3K7vBu77AXD4BLJzAAAA
X-Change-ID: 20261015-vb2-unpin-dirty-912660272e32
To: Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793465059; l=9244;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=0Zgg5LuaLNQVXitGF2rcc/q5f373bqNV8WZoIIzGqec=;
 b=VptzJgCTZbgyasiwYdNAqG11XxP6rlJg51oNYHfNgBHGxifTKsKlgDin88RGrchsLEOLaWWss
 6UXMUbOpsUqATAqJ1OQy0Rtb7Wm0VVh4Q01gZSW5pn4EibUjdhACfsq
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA2NiBTYWx0ZWRfX3pb7Ju4nybK+
 20ep+L8S5TYuEeoWxjJzydCsNbHCE1IdpuLaXLjCU29FjhwlcKTsnAwvJ5A+U8v6Ruqr8SIstpk
 qx4DiU5T28o9QS/BQTE20eHptGLhuKX1RgUhmPH5GRcTMsIRRf+8DJleK2H7KiRPyHfj2sDdU79
 b+cMWoPAA64nkGSrb6L0OCt1CjK8ati0B+VoNpZUN5LR4y417ox4d2Hi/ruBe9x2JhvW5nKgmX0
 FGaenZDWzSiK6rcPR2C8MNvFJdq2d0eSuttJZxaLxW5NRhXANa0z1xzkkJCyKzptQHG6gL0pmn6
 JoQxnpWoM/Wd6fDJTaMgXo0s8DoO2IuTWfjK2QQ8YrwAT7vx3iwTbLQl/IX4A96ZYcJX4Cr/SrE
 ccC4CNo2zxanI9AzeK+Sy8XIGw1uqBaLIBTZiMKWkceM2I7O8fXoT6R1LRi5MWYxUR7kFpdHZpn
 52GTqEOnV+jxIgsC15A==
X-Proofpoint-GUID: 6KyD95KCAjbjgNB4CWdHq_06NNUZ5yp6
X-Authority-Analysis: v=2.4 cv=TM/Q2Fla c=1 sm=1 tr=0 ts=6ae61ae8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=P+xgYyhW+KadpqoI50EQPQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=79PYxaXUQd1wl-QFWJnA:22
 a=UdNpxy7SnptkXq1s2ckA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA2NiBTYWx0ZWRfXwZoI0kSJPhkE
 eGTNj0Yrje5OTvzJXRJ50MN44Ob2yCQBWUQuQo03a4/td3gBnE9KI5SeiWWQCkQruah0Fr2HOKz
 dt9dgTgdolXN30IRjjm4JanalrUSvA7Z+O8d+ZMUhPXwOLk6FeWo
X-Proofpoint-ORIG-GUID: 6KyD95KCAjbjgNB4CWdHq_06NNUZ5yp6
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11952
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=10 lowpriorityscore=10 spamscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 bulkscore=10 suspectscore=0 clxscore=1011
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2610310066

The three USERPTR release paths each loop over the pinned pages with
set_page_dirty_lock() before vb2_destroy_framevec() unpins them. Use
unpin_user_pages_dirty_lock() instead by passing a dirty argument to
put_vaddr_frames(). unpin_user_pages_dirty_lock() works a folio at a
time, so a pinned THP is marked dirty once rather than once per page.

This removes the last callers of set_page_dirty_lock() in videobuf2.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 drivers/media/common/videobuf2/frame_vector.c         | 11 ++++++-----
 drivers/media/common/videobuf2/videobuf2-dma-contig.c | 15 +++------------
 drivers/media/common/videobuf2/videobuf2-dma-sg.c     | 10 +++-------
 drivers/media/common/videobuf2/videobuf2-memops.c     | 10 ++++++----
 drivers/media/common/videobuf2/videobuf2-vmalloc.c    | 14 +++-----------
 include/media/frame_vector.h                          |  2 +-
 include/media/videobuf2-memops.h                      |  2 +-
 7 files changed, 23 insertions(+), 41 deletions(-)

diff --git a/drivers/media/common/videobuf2/frame_vector.c b/drivers/media/common/videobuf2/frame_vector.c
index 41f289c75cbb..d4da45cc5624 100644
--- a/drivers/media/common/videobuf2/frame_vector.c
+++ b/drivers/media/common/videobuf2/frame_vector.c
@@ -72,12 +72,13 @@ EXPORT_SYMBOL(get_vaddr_frames);
  * put_vaddr_frames() - drop references to pages if get_vaddr_frames() acquired
  *			them
  * @vec:	frame vector to put
+ * @dirty:	whether to mark the pages dirty first
  *
- * Drop references to pages if get_vaddr_frames() acquired them. We also
- * invalidate the frame vector so that it is prepared for the next call into
- * get_vaddr_frames().
+ * Drop references to pages if get_vaddr_frames() acquired them, marking them
+ * dirty first if @dirty is set. We also invalidate the frame vector so that it
+ * is prepared for the next call into get_vaddr_frames().
  */
-void put_vaddr_frames(struct frame_vector *vec)
+void put_vaddr_frames(struct frame_vector *vec, bool dirty)
 {
 	struct page **pages;
 
@@ -92,7 +93,7 @@ void put_vaddr_frames(struct frame_vector *vec)
 	if (WARN_ON(IS_ERR(pages)))
 		goto out;
 
-	unpin_user_pages(pages, vec->nr_frames);
+	unpin_user_pages_dirty_lock(pages, vec->nr_frames, dirty);
 	vec->got_ref = false;
 out:
 	vec->nr_frames = 0;
diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
index 9ce6284cd5f2..94e00e6bc0fb 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
@@ -533,8 +533,6 @@ static void vb2_dc_put_userptr(void *buf_priv)
 {
 	struct vb2_dc_buf *buf = buf_priv;
 	struct sg_table *sgt = buf->dma_sgt;
-	int i;
-	struct page **pages;
 
 	if (sgt) {
 		/*
@@ -543,21 +541,14 @@ static void vb2_dc_put_userptr(void *buf_priv)
 		 */
 		dma_unmap_sgtable(buf->dev, sgt, buf->dma_dir,
 				  DMA_ATTR_SKIP_CPU_SYNC);
-		if (buf->dma_dir == DMA_FROM_DEVICE ||
-				buf->dma_dir == DMA_BIDIRECTIONAL) {
-			pages = frame_vector_pages(buf->vec);
-			/* sgt should exist only if vector contains pages... */
-			if (!WARN_ON_ONCE(IS_ERR(pages)))
-				for (i = 0; i < frame_vector_count(buf->vec); i++)
-					set_page_dirty_lock(pages[i]);
-		}
 		sg_free_table(sgt);
 		kfree(sgt);
 	} else {
 		dma_unmap_resource(buf->dev, buf->dma_addr, buf->size,
 				   buf->dma_dir, 0);
 	}
-	vb2_destroy_framevec(buf->vec);
+	vb2_destroy_framevec(buf->vec, buf->dma_dir == DMA_FROM_DEVICE ||
+			     buf->dma_dir == DMA_BIDIRECTIONAL);
 	kfree(buf);
 }
 
@@ -676,7 +667,7 @@ static void *vb2_dc_get_userptr(struct vb2_buffer *vb, struct device *dev,
 	kfree(sgt);
 
 fail_pfnvec:
-	vb2_destroy_framevec(vec);
+	vb2_destroy_framevec(vec, false);
 
 fail_buf:
 	kfree(buf);
diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
index b1d0695cda26..c80d3232436d 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
@@ -271,7 +271,7 @@ static void *vb2_dma_sg_get_userptr(struct vb2_buffer *vb, struct device *dev,
 userptr_fail_map:
 	sg_free_table(&buf->sg_table);
 userptr_fail_sgtable:
-	vb2_destroy_framevec(vec);
+	vb2_destroy_framevec(vec, false);
 userptr_fail_pfnvec:
 	kfree(buf);
 	return ERR_PTR(-ENOMEM);
@@ -285,7 +285,6 @@ static void vb2_dma_sg_put_userptr(void *buf_priv)
 {
 	struct vb2_dma_sg_buf *buf = buf_priv;
 	struct sg_table *sgt = &buf->sg_table;
-	int i = buf->num_pages;
 
 	dprintk(1, "%s: Releasing userspace buffer of %d pages\n",
 	       __func__, buf->num_pages);
@@ -293,11 +292,8 @@ static void vb2_dma_sg_put_userptr(void *buf_priv)
 	if (buf->vaddr)
 		vm_unmap_ram(buf->vaddr, buf->num_pages);
 	sg_free_table(buf->dma_sgt);
-	if (buf->dma_dir == DMA_FROM_DEVICE ||
-	    buf->dma_dir == DMA_BIDIRECTIONAL)
-		while (--i >= 0)
-			set_page_dirty_lock(buf->pages[i]);
-	vb2_destroy_framevec(buf->vec);
+	vb2_destroy_framevec(buf->vec, buf->dma_dir == DMA_FROM_DEVICE ||
+			     buf->dma_dir == DMA_BIDIRECTIONAL);
 	kfree(buf);
 }
 
diff --git a/drivers/media/common/videobuf2/videobuf2-memops.c b/drivers/media/common/videobuf2/videobuf2-memops.c
index f9a4ec44422e..605e24aa710b 100644
--- a/drivers/media/common/videobuf2/videobuf2-memops.c
+++ b/drivers/media/common/videobuf2/videobuf2-memops.c
@@ -59,7 +59,7 @@ struct frame_vector *vb2_create_framevec(unsigned long start,
 	}
 	return vec;
 out_release:
-	put_vaddr_frames(vec);
+	put_vaddr_frames(vec, false);
 out_destroy:
 	frame_vector_destroy(vec);
 	return ERR_PTR(ret);
@@ -69,13 +69,15 @@ EXPORT_SYMBOL(vb2_create_framevec);
 /**
  * vb2_destroy_framevec() - release vector of mapped pfns
  * @vec:	vector of pfns / pages to release
+ * @dirty:	whether to mark the pages dirty first
  *
  * This releases references to all pages in the vector @vec (if corresponding
- * pfns are backed by pages) and frees the passed vector.
+ * pfns are backed by pages), marking them dirty first if @dirty is set, and
+ * frees the passed vector.
  */
-void vb2_destroy_framevec(struct frame_vector *vec)
+void vb2_destroy_framevec(struct frame_vector *vec, bool dirty)
 {
-	put_vaddr_frames(vec);
+	put_vaddr_frames(vec, dirty);
 	frame_vector_destroy(vec);
 }
 EXPORT_SYMBOL(vb2_destroy_framevec);
diff --git a/drivers/media/common/videobuf2/videobuf2-vmalloc.c b/drivers/media/common/videobuf2/videobuf2-vmalloc.c
index 63f023696f3e..bf6273f3bc86 100644
--- a/drivers/media/common/videobuf2/videobuf2-vmalloc.c
+++ b/drivers/media/common/videobuf2/videobuf2-vmalloc.c
@@ -116,7 +116,7 @@ static void *vb2_vmalloc_get_userptr(struct vb2_buffer *vb, struct device *dev,
 	return buf;
 
 fail_map:
-	vb2_destroy_framevec(vec);
+	vb2_destroy_framevec(vec, false);
 fail_pfnvec_create:
 	kfree(buf);
 
@@ -127,25 +127,17 @@ static void vb2_vmalloc_put_userptr(void *buf_priv)
 {
 	struct vb2_vmalloc_buf *buf = buf_priv;
 	unsigned long vaddr = (unsigned long)buf->vaddr & PAGE_MASK;
-	unsigned int i;
-	struct page **pages;
 	unsigned int n_pages;
 
 	if (!buf->vec->is_pfns) {
 		n_pages = frame_vector_count(buf->vec);
 		if (vaddr)
 			vm_unmap_ram((void *)vaddr, n_pages);
-		if (buf->dma_dir == DMA_FROM_DEVICE ||
-		    buf->dma_dir == DMA_BIDIRECTIONAL) {
-			pages = frame_vector_pages(buf->vec);
-			if (!WARN_ON_ONCE(IS_ERR(pages)))
-				for (i = 0; i < n_pages; i++)
-					set_page_dirty_lock(pages[i]);
-		}
 	} else {
 		iounmap((__force void __iomem *)buf->vaddr);
 	}
-	vb2_destroy_framevec(buf->vec);
+	vb2_destroy_framevec(buf->vec, buf->dma_dir == DMA_FROM_DEVICE ||
+			     buf->dma_dir == DMA_BIDIRECTIONAL);
 	kfree(buf);
 }
 
diff --git a/include/media/frame_vector.h b/include/media/frame_vector.h
index 541c71a2c7be..daf40b9b3d3d 100644
--- a/include/media/frame_vector.h
+++ b/include/media/frame_vector.h
@@ -17,7 +17,7 @@ struct frame_vector *frame_vector_create(unsigned int nr_frames);
 void frame_vector_destroy(struct frame_vector *vec);
 int get_vaddr_frames(unsigned long start, unsigned int nr_pfns,
 		     bool write, struct frame_vector *vec);
-void put_vaddr_frames(struct frame_vector *vec);
+void put_vaddr_frames(struct frame_vector *vec, bool dirty);
 int frame_vector_to_pages(struct frame_vector *vec);
 void frame_vector_to_pfns(struct frame_vector *vec);
 
diff --git a/include/media/videobuf2-memops.h b/include/media/videobuf2-memops.h
index 4b5b84f93538..8a66ec46bc71 100644
--- a/include/media/videobuf2-memops.h
+++ b/include/media/videobuf2-memops.h
@@ -36,6 +36,6 @@ extern const struct vm_operations_struct vb2_common_vm_ops;
 struct frame_vector *vb2_create_framevec(unsigned long start,
 					 unsigned long length,
 					 bool write);
-void vb2_destroy_framevec(struct frame_vector *vec);
+void vb2_destroy_framevec(struct frame_vector *vec, bool dirty);
 
 #endif

---
base-commit: 27285b099fbc5cb2ae3aef20f3bbd7b3c88b3005
change-id: 20261015-vb2-unpin-dirty-912660272e32

Best regards,
--  
Tal Zussman <tz2294@columbia.edu>

