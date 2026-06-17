Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E40DD31690E
	for <linux-media@vger.kernel.org>; Wed, 17 Jun 2026 02:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781662782; cv=none; b=NCPTh48gPjiI+2rDKp64EJIEeVgr5Ol8nygqYdp4ejQ09Jw/Eso8/yYiy7gmKD2gn3RNRuE6WrZUelYdEmVdvAwW8p/G9uG9c24LK7DC5HCxpO70xrPYgmd5leYxou7awGk6DU6BZparQFrivb3fX6gaoJnEKvEymbahIgYpeII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781662782; c=relaxed/simple;
	bh=3i4QeDycCO3r/ucndzMy02HXEhVxiJ9F2xV6pnKpIWg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pTN6h3doLtqUmYFDXuTMD6Ngtba/6TRB2ha/4T10hFqDcDrm1Ara2L8zl9pulsgoogjUs/XFHT12NEnr95bNSArM5iR3cJOiqTrpTt1NXG+UUGV1kwYWPx6bVLBLPz4bvcmubq+hHe9UWgreWBW0cj+CZwLsOWjdrY5B4aND9rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZQCwAwpc; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZQCwAwpc"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-9159f631656so66006785a.1
        for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 19:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781662780; x=1782267580; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J8O/pXXJ//moyFh/7MLx1Wt0Gv3Nz0eHoldtSppYnyw=;
        b=ZQCwAwpc2RJwRENm8C4gvsPbjYleVCuPiuA/O11CYdWI0+N6y2RFq5JDiiRUKaB3Ij
         iSWgqgbdffD9tlvO9DVKWPSK9A0B41gTpc4rNjCG6Lr66a+NBFsCe/5f0pSx/BlG1kUS
         iRiVPSNJ/WD07mQrJw+3GtgpPkBVvgjnQmtxx/yYeomo4Ietwp3grgm0LWCJjLfzLbVL
         eY5qfZfeGG43nMZi7k/Hg0us6nQ9jmYCyhdUBdqfgclg9LfEwus2tQVfEyKxagFEOpRd
         cDQg0DcH1lxOsBS5hAZ+JAJMG71vCtUEad1jF2szn3ZALiQbS+2Hf9XeObW0KyadIHqj
         ssog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781662780; x=1782267580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J8O/pXXJ//moyFh/7MLx1Wt0Gv3Nz0eHoldtSppYnyw=;
        b=BVoC4fNpaJTVf45yAe3TAEYwodvrZF1wf41hqoorPLcsRliBwZSwgFwEBq9SoLJ7rj
         0n5aO0qqdBnG4JEgzZrXhhVtga3zcGZ9VhCR+q7ap2npCrPhJeQllMmjxh0B+Uf97NiY
         gHGG3C88VJEi0Mc7Usl6pA3eIfknrc1El2gYROCCUmPfFGCxy5gjUkWp6UvYO6e9U3fP
         pXNAJeBsAJsPmAtWG5B5AFdBGURmknBclMhjIuiMmp4L5ZlQgKCV30dfp7quY8VJV+wj
         5Bm0yrRCRBwLuHIoW+drtaYYcx1UYom0beFYi79aVlA56wAswTHqXE7RB6ZnDGAPg6R5
         Yv1w==
X-Forwarded-Encrypted: i=1; AFNElJ+ffxeletrgp+iEVArWyP9PGQvqQa4r3CbmO6CaXwGmiUnED8G2MMbGAN6+bEEv2GqR+rxHLxtoKhdO7g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yymuue1/eEPatmIvaC7Dk7OHVTbIYq/7wfHON6fe5hE4gcoO7tJ
	ZtUB6K00/9PCI6VgJEpcb65m3Cl72iGZgDny7eRnCnhiGGyUlOGbHj4u
X-Gm-Gg: Acq92OHfzf1pcxJm7m/iLBbNWdWaiFIuS9Zn9K2Ud02k/cURMhdasPbOvsfCDp1nj4O
	rMjcRDLOBrzORdFycbnbbxaC8RsZX/bU+f/r4IElNJ8ZecE9lFFRqvUmHJd9ya4YBaun20Drzbk
	9laWUUoEua669fGshD8TpPGVVpk+YMsJf22vcuyD69epv0X4TJDm+UNhh8bBEEDxOMBBezJZ14+
	Qh9GFUnBOHiHaAtWW9zoCBlIe82XvEZBWbfLwnxQATzOSDVj6a5V4p1wEttxtUhK9OVe3oEESBa
	kipAlYnwOu9lRuXEL+p9EhlYNT51ZxvPC3QhN9nTs2JCTFFIYIZrmgs7egFl1xlnNzWjUinJugX
	VGJBhaZMfnVkuDfvGoJityxJpUHR8HKL6pGRx8f3PcqhQ6As0fo/BiNtaIp+3aYm11AiERBmsYv
	KDS0FVSFslK01ToeE/j59qa6haRgYXJTOKWxInAXKsMAZVMZovNMejuMYpbfAeDDkd5yVkv0rJL
	cgwuejvqA+Btzsh+Wv2Q4DvtlK/Lqei
X-Received: by 2002:a05:620a:2948:b0:8cd:d688:7aef with SMTP id af79cd13be357-91dcd160370mr170783785a.19.1781662779948;
        Tue, 16 Jun 2026 19:19:39 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9161a006e35sm1657646285a.28.2026.06.16.19.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 19:19:39 -0700 (PDT)
From: Michael Bommarito <michael.bommarito@gmail.com>
To: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Heiko Stuebner <heiko@sntech.de>,
	Kees Cook <kees@kernel.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 8/9] media: mediatek: vcodec: bound AV1 tile-start copy to the array capacity
Date: Tue, 16 Jun 2026 22:19:05 -0400
Message-ID: <20260617021906.2746743-9-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260617021906.2746743-1-michael.bommarito@gmail.com>
References: <20260617021906.2746743-1-michael.bommarito@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

vdec_av1_slice_setup_tile() copies tile_cols + 1 / tile_rows + 1 entries
into mi_col_starts[] / mi_row_starts[] from the bitstream tile_info. Bound
the copy to the array capacity.

Fixes: 0934d3759615 ("media: mediatek: vcodec: separate decoder and encoder")
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
---
 .../mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c       | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
index 2d622e85f8271..49d9b4a72387e 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
@@ -1299,11 +1299,12 @@ static void vdec_av1_slice_setup_tile(struct vdec_av1_slice_frame *frame,
 	tile->uniform_tile_spacing_flag =
 		BIT_FLAG(ctrl_tile, V4L2_AV1_TILE_INFO_FLAG_UNIFORM_TILE_SPACING);
 
-	for (i = 0; i < tile->tile_cols + 1; i++)
+	/* Bound the copy to the mi_col_starts[]/mi_row_starts[] capacity. */
+	for (i = 0; i < tile->tile_cols + 1 && i < V4L2_AV1_MAX_TILE_COLS + 1; i++)
 		tile->mi_col_starts[i] =
 			ALIGN(ctrl_tile->mi_col_starts[i], BIT(mib_size_log2)) >> mib_size_log2;
 
-	for (i = 0; i < tile->tile_rows + 1; i++)
+	for (i = 0; i < tile->tile_rows + 1 && i < V4L2_AV1_MAX_TILE_ROWS + 1; i++)
 		tile->mi_row_starts[i] =
 			ALIGN(ctrl_tile->mi_row_starts[i], BIT(mib_size_log2)) >> mib_size_log2;
 }
-- 
2.53.0

