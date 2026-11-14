Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794686140;
	b=yT+UBfWDBwIRxpb0oE0oY86SM6AnWbhlEgIQK1F0VdF+eHLL1fP41CQ98x8kbMnrt48C
	 2auWsonZuSC4yDuh3fCKQro9floufUPbMMzTTHEnBEAb4XPRR57K4JlPHWCBPvaXUo/ev
	 wYMEs40rQtTHjyVQbCuQ8XNv7UVtpV5Mj4ObjHWKI25ARdkdXIAI2uSXEZA8K8wyKdlNb
	 Mvj5/5oNjE29C8Ai3e2TsUY21p9Pm33fuHznBbZATGTj5mNg0ShiQv3iKJN0KCGbTv7VF
	 G58AsvZA5alQGzVX8abD3eyoZenBCTNVJY2SurT82oak7hRYX2Jzhc+tzFLssVi2rPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794686140;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=iaqGcKaTw5TXT0yCWV56x+z3Ed02VPPNFpP2p8sMn/Q=;
	b=soKXVj0sZBM8qn8qOmeKYy5XEgttJUbPtRvYwOAKFevWa/dTTl/72MR8XQQG8210bHOH
	 JSvOMw9hTKT8fJXThTHjHf68jOpRuHPaGzy8Grdp64vHNe6nG23mOR2MNKm5xqUpqqhh0
	 ryBHz/jr9x5H/JqD4jo7QPhduBRkapv4aQ964zlwQ1mngwRS4svzYEFxwfzdfna+8VdnU
	 x+HaQG29kX3IYp0ubkSzjPPAobO0yPWpgntYPAL3N992fu6fqrP6Eyls7IFS4V1a0ZnZN
	 An6lfL9VkodHB5bua99lLdYDTRoDWaw+cJqdWxzXBOjQxU/Ksa8GQ1GnthHm1VfAwRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ragnatech.se;
	spf=pass smtp.mailfrom=ragnatech.se;
	dkim=pass header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm2 header.b=tiyNv7Jt;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=sVdiP+XP;
	arc=none smtp.remote-ip=103.168.172.151
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E252A606A8A8
	for <linux-media@vger.kernel.org>; Sat, 14 Nov 2026 19:55:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E252A606A8A8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm2 header.b=tiyNv7Jt;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=sVdiP+XP
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfout.phl.internal (Postfix) with ESMTP id 3C535EC00F3
	for <linux-media@vger.kernel.org>; Sat, 14 Nov 2026 14:55:39 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Sat, 14 Nov 2026 14:55:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794686139;
	 x=1794772539; bh=iaqGcKaTw5TXT0yCWV56x+z3Ed02VPPNFpP2p8sMn/Q=; b=
	tiyNv7Jt4Dh8YHCCFQOyJa4+eOoEulUtn9jh5eBG2TXKQYreOpuZmJoIylj+7ISP
	abHgxEAHvoSMPALkagnc5vbLuje+y+yy3NVNXFKyHFu04eI5oB/n1tWAASnVJPbo
	z9dRBgKJfgN0RJXOxoChrR8NNydvUjNAxA0a2UBPxwH4S4HA8zwdT9dcbWOQjzQ7
	WDlb8r4qeqg9i4PNTu3m/1ftif+mNJcFjgqjP2CdT+L9rkYgGLGiq7bS/kR5bmbs
	d9aIS5X65+zLuk/4ZALksSwhoJiYqdlVEyMRxf++FSJL+TO6yuMBnExybE+3bhPk
	TNMfY6Ud83PI/sDYtxs/XA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794686139; x=
	1794772539; bh=iaqGcKaTw5TXT0yCWV56x+z3Ed02VPPNFpP2p8sMn/Q=; b=s
	VdiP+XPUsVG2A00US9Tg1dp4rrfXzqUbANFp4slEl9a8z3eGYBwczpU0UD8EI1sg
	0GIyaLYpSqThTxQl2DorMZMsUafLzR/FRsHCuaj0AHAGl0nSnlLZSoQ9YZz+DGfj
	4MLwoZ9qtBDv5AMO7VLg1SVmB5CL4WZaK8P9sp3PzqAIAhLJOufIpEWTdwRjnk+M
	e+l20eB4Rsv32AdiyVzgFDk0AZHnDJXVoL1GEbwb0LOnm4pnnYT02MahXdALrLfx
	qo3Sv8UWP29HSA5fMeQ1l4qL79BzBt4J5qHNUKmn0qu3pxJPb6udXJqz5wp82oPl
	cAJqhDDwTreR1dXO7JYRw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=ragnatech.se a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794686139; d=ragnatech.se;
	mf=PG5pa2xhcy5zb2Rlcmx1bmRAcmFnbmF0ZWNoLnNlPg==;
	rt=PGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZz4=;
	s=fm2:rsa-sha256:MAMNg87HWxybU48c3fNghQt2osSZpN33efbn780ypbklKUs
	UtfUS56eEfk5tmkb5/oFqjD5VKYPJvc+ci/EjMBNxBSMMbZYuwO9WfF6AX97s7p8
	4km7UvMF4wgF/W1R1ue1zx18Y+BL8bnTgX9+5OHvW54vuNzilwVXwGaqhsFAbn3r
	XwshGO+thEJm2dkaKrRf6t1g4hJpX3g954gHXbjQPF/Sbsz+A6JcvRIdsreZW2i+
	TGiBIglVJVYQbeiTK2hOsndVFaq8yV6QpnDF47HT5yu3qAixjbdAVvl/Mj2jGvmt
	+aTWbbYePUei6Reuic+9c8EkjJlvCbsQFyYhmYg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:jAw4eGCiowZ/AWdWFjxFJOT4MgJH+y8cXlID72HvhqU=:m2zOi/rnz6OCVlX66HJiMB8cxo5ldbo3J1tIw8pQ2CQ=;
X-ME-Sender: <xms:urz4ah-PLMox1tbBAVMdC-pZBIEOzyL9msxVohqf8pRV6YaYTy1SPA>
    <xme:urz4ajOtEGqMMB-s4zRp1x_TNZPuDjqBgb0s4j0m23jDWD84Se4mn3WgbU8LjzWVD
    _8p_jvN02b_qU5HxKx2u48JuQk4UPl4X1D7jpzofzetcWm18m7cvA>
X-ME-Received: <xmr:urz4ahqEf6fgAraBl2ThvYMaEODuvTzC4_4dCh6I8wp5LzIQfmmJ0Pa2BY6qJuk6k4VesKRfZFFm0GpBxJPufDiqHNWE76E>
X-ME-Proxy-Cause: dmFkZTEmPVUMPzW/uVzvu9DgDp3nMJm61oFIDaC3QPBTICH5cN89yMpUl1KStN1ZjXFY3b
    Q2f1Uao/0Tu4woRnv05g2Zw725oyY1evcbi/fXJRPSHudv2BWLJayfP76gcySWs1MdJbDa
    nw1+g8tP01WTLuevWC8sxiVhzaqTAne+YGNsrWKxD5nO01v21Yq9+t2O3Ju/VRoR1KdXYA
    U+pSLj3qv5ZtCuWmo1OMXOPF1jpXZf4cZV0HWVzYz174rrwu1OZoPP7BFmXwIkZcam7yRj
    Trwfkt7fWGKlwNIgBXWBVTugFcu+gBLt7ByUQJeonsTQQVAJoRwXtoNqfNN8I+gErAoVYb
    4L2PUTNGa/+7ijoqZXpVyG1fKiO6WoaQOzIEMVZZIvVbnlzAcQ+M2eGdcG0j84NwvlIWWM
    pIHyGWF9gGzQULBgYK0KQH8vI9PZzPz8LBK/vpLXKsFx9A5Hj5gSVbtW0hsiDIwupzMHsH
    o61Gm3999Yn2pNZOfx4uezh42uwhwDVVeMUKIlZbJkYzVz+Oqq6xNc/rfgszUbvKcbRusd
    YyjniFv7Rh1combr9qyMI5ExYcTbyg0x6w0T9ioNta3OuB2p22nGzmMSXCVwFDMA9Xqkxj
    PSmXrJY4Lcoxwcb7LRd8sfQ4BJRyCW2mGJgc5hCkOViXHD1iYDZ2O1fbARdg
X-ME-Proxy: <xmx:urz4aq7oaf0h86qvdweNWsjAdXGrDfRrASnX7AGhQM1UGfrqhECppA>
    <xmx:urz4apGtDKIDw5kOd9kEZQ0ib-EFDkDYtvSSSGlcaV7qO_YEQd5E1w>
    <xmx:urz4as20bELf2qY4A8ss1uhff8O9__8xGZzvyysc1i2zu--R_muc8Q>
    <xmx:urz4ampo0wOmxX0xp8bYmd_uPdqxNmXtRN_SJpRcux8_XOpWMIydOA>
    <xmx:u7z4atoUK390DXWKJpiEUTj99pS4sR2_OjoM-HonVow8glxkvd6GPrjn>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 14 Nov 2026 14:55:38 -0500 (EST)
From: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Date: Sat, 14 Nov 2026 20:55:18 +0100
Subject: [PATCH v2 3/4] media: rcar-isp: ispcore: Look at number of planes
 when programming
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261114-v4l2-add-nv12-v2-3-a3f5ecfd48d6@ragnatech.se>
References: <20261114-v4l2-add-nv12-v2-0-a3f5ecfd48d6@ragnatech.se>
In-Reply-To: <20261114-v4l2-add-nv12-v2-0-a3f5ecfd48d6@ragnatech.se>
To: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
 Jai Luthra <jai.luthra+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 =?utf-8?q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze+renesas@ideasonboard.com>, 
 Yusuke Goda <yusuke.goda.sx@renesas.com>, 
 Yuya Hamamachi <yuya.hamamachi.sx@renesas.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1159;
 i=niklas.soderlund+renesas@ragnatech.se; h=from:subject:message-id;
 bh=m2zOi/rnz6OCVlX66HJiMB8cxo5ldbo3J1tIw8pQ2CQ=;
 b=owEBbQKS/ZANAwAKAQm0/3kE+U0kAcsmYgBq+LyxcZjf236PLp9yRWVlkxUKGJYTYbJ0IvREG
 SDZ/AY8i3KJAjMEAAEKAB0WIQRwy9J0OLNPX3a0+3gJtP95BPlNJAUCavi8sQAKCRAJtP95BPlN
 JMk+D/9zeFyRABPswpBCSnlRGX1CrCQDDaVo7RQMNQhVxn0PBfLxPatVTolsPcdUMbX7s4lBmBV
 uFsCUYtWO2dvmaR+1rwrP3UnuxslvtlkqVcDicjNxujf3KgyveMBm2JflP5Nn0JNr2q5HpbJggU
 4ym+RPwJacDSRkG17FSjJfVSnBbHGSL7Kos/VbbbgIcEXvbe3w82fWXQe8UGJ68eheTdHEHyEpJ
 isXbHlI7Ks797076BpSa3ZcwGt2qSyiSRzjrXrxYp1fGRcmJSVmotjp6uXTNgjZ05iYMSwayrY0
 U+JBbKpRPRkM6LJeG7K4UbqrQ4YZa74pBYyGWzHCyqTIT8DNDamUuoiZWWbr4wyxocKcVykj7mg
 oiI358ez6qozi4xppfoa/8Cnte+Xk6QDhfwdSEYRHGWAqg6lg8d1xLUuePzMm/7QUqwXyQnfI+0
 WJ7oRLglWfGuaEUqEUhZzANigHA5hvWwBXGc9ifqUp0z8b5l7k+mm2zCxFOMCslxApyM+RzQV6F
 e6uSI7YHRpezfIc0AsdP/W+ekyWK3GLK+aWxgI51ksFHzE1z2FDv1NclVPr7WYbLUzXk5UMfqiG
 wVTd/hff7Sq3jWItDWwrElTErvryEtTvBHzedSQvYoYcBgAWbub9dMgn7rPn+qYuCGIhVsCXer8
 Rwqs1wElejXCA+A==
X-Developer-Key: i=niklas.soderlund+renesas@ragnatech.se; a=openpgp;
 fpr=9976695FE98693307BF360A2F1591ABD9588DA5F

Instead of expanding a list of formats that uses two planes look at the
format information directly.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Barnabás Pőcze <barnabas.pocze+renesas@ideasonboard.com>
---
* Changes since v1
- Use '< 2' instead of '!= 2' to be more future proof if we ever add 3
  planes support.
---
 drivers/media/platform/renesas/rcar-isp/core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-isp/core.c b/drivers/media/platform/renesas/rcar-isp/core.c
index 8908496c734e..5cd21134a2d7 100644
--- a/drivers/media/platform/renesas/rcar-isp/core.c
+++ b/drivers/media/platform/renesas/rcar-isp/core.c
@@ -126,8 +126,7 @@ static void risp_core_job_run_output(struct rcar_isp_core *core,
 		mem = vb2_dma_contig_plane_dma_addr(&buf->vb.vb2_buf, 0);
 		risp_core_write(core, reg, mem);
 
-		/* Only NV16 uses 2 planes. */
-		if (fmt->fmt.pix_mp.pixelformat != V4L2_PIX_FMT_NV16M)
+		if (fmt->fmt.pix_mp.num_planes < 2)
 			continue;
 
 		reg = ISPCORE_DMA_IMAGE_FRAME_BASE_ADDRESS_COMP1(0, frame);

-- 
2.55.0

