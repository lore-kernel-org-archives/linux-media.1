Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793161340;
	b=tHnVK7Q7xIOzoiraJQFxcUb6cOV3ggBcXCg0eykuUKJK8wQ7m+F71kaKp3S5/74LCaBO
	 Be1ZviKc1LpLY1yN4o1m6xD480qtSL8AceXBEFQB5gqiSwje/oJ8QJMA5qL4pn6ULg2rG
	 cxRsSf4+2OsTgYqqMAtywrzzH10zC5Qc5R8Uo005+vfHd5mxcx+bTNihKDuglufxKh3+X
	 4UaMhE1FLf+WZd16gUJAwObTqHmsW2y2tImpuHTtd5tC/6MNYDDeYhRUfZQpaGxHdWTxI
	 JksB3aWK2si+XS6SUCtUfsobdpLx7Tc8tJrPmRuG95Nq/RVtBbzicFLKMXagOhUmYHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793161340;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=2YqpHNpqDOLT8VYNbKToqFKV9CXwboGOUTNMy2MCQ04=;
	b=OianaOXLMehQnCDxH4UQ763vyMJTw2rscvj/USxzsJonOgTX8GVlAcjvnIPe79a+pJzV
	 3m9uDXM/Pasb+aRraUQlrlfRoF71AdcM4uIXu3vIWNPH/JB4UT8+B7+AuWig97FTRbpgZ
	 AviLmu66WuKuiKEDed8iBvdvykWbqqBwveN8OXaqHXYivoIYwSCblq8O6iTnd8kqZ4Wiy
	 Atg9naZE5mUklfnNFlol8yCX2eRF2uqQI1aJ476g/IbvR5M6L+qGWQJuL1+FeDYl50Zh0
	 3pSx3SL6EwwHguPrPstUbL/XtUpNXGw/ZwHGLVBJh9n6/EWbuFIek+xVWN5+Y0Ey6LQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I1JGt23F;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9735606A31A
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 04:22:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9735606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I1JGt23F
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3acb11973c3so414171a91.3
        for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 21:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793161339; x=1793766139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2YqpHNpqDOLT8VYNbKToqFKV9CXwboGOUTNMy2MCQ04=;
        b=I1JGt23FsHtgCOscyKDdKGx5k/HZmyZWe0YBK2uJx8EpM+33TUn+kE7JGAkMnn+xJ7
         kvWotbmiCHFo2fZ+lAor4COcxEb+FjyWiHMyJ+Q8WAKaN/aB0Fd0mP58A13UwCZLWRi/
         Dhl2vISj6YIljMsi02mxodV4rAJ60nfdHNUdOQ+bnzpzLG6WRhb3JUtiQfVArs+cMPgq
         bafiqn95fiDdSU9nlPldMoQDEMwLOUW0cO6pu+oGOcxsZoSqO5oYRl+GdAXuxtVebrrU
         XGAl/AwHYmghVIwn4mEhvXaukADgKXiDBY4/lW4jsxLeuRZMXc8StdezhMuwSX0y5TR5
         L5EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793161339; x=1793766139;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2YqpHNpqDOLT8VYNbKToqFKV9CXwboGOUTNMy2MCQ04=;
        b=KENZhX1hzqRDfPsFA9J1VpR2RR89Nffr9ILIebnkYAzewsxCwBiYcGJZOw6k3HWWPd
         kwTGhMAl01BJMEUBZr1JLavGPGpM8dEfHFej7I6y7MHsuVzj2OoveA9nitRoVeVUcIon
         Tsf4e8aYrVLj2T664H22ThboGgEdSdAZv5XkFAQKE9xR7s/OMZX8njf+hST1jDO/l8VH
         PaThylUO23yjV4opeVPwH7wJFZf0S66MuTZAE4mV5kCSSPTrziVkkMNx9H4NE1M8wcOB
         +AEdCzD4Auk57kj1u9ANdVTN9IYPzwHQxmLO/GGT1ItGpZAYym21k3bB/1V1tlcUv9Pa
         MZWw==
X-Gm-Message-State: AFq9FYIjga2rk7GFiV3lqNgiwljIzHwtgRSXm0XWp8+RcBjTVszPxcgM
	GsFyydY8dleCw30Ocy+T7avMcbjTI3sdfG0oTc8YiQMSn0fPEtPyuLDx
X-Gm-Gg: AYBFou0Q0ZL6zZhIqiY3nq3cxbA3wNoP43n/P+klVYfzJAcEFI0j1jpTeoASGlgn+0F
	lXaDcranFipSv3A2OdYv7aL7y2m5tmUFG4vWOc3s5EAr3WUIpajBs0ojPHMo+kTvxtKPRAjItG0
	c6jdrBopdhE6AyAByBobAuQxlem/NndKtByEQaoPcW0qSAhIgzMDRiNrrEa9A2hfN2wEyDUSquo
	nRaPgHH4x2uILX2f3F8xhGmUXGNLWFzqFXddM1BjV8zWDHzMVc5zhjTFhuL/P2NJYp3HojzqGGW
	zwi9EKsAVCEcmp3QnswGlEMYxlP8zC4K59+hcvWZ1vIKH6VCFq/lV45hphST4rYFF9ZPlX6dxdq
	9O/svHvQ2rLl96SJKHkbTpGh9mPRgQy5pHtsLfjB7wlUdwrsZXbtUAMii9Wz5rDUqZbGllGuuMv
	YTcVdOjKkoRD7vChmMc3JSJqBfVchio49nEuLMq2JTlggVaYiuQKO1uSYt6rBRS4UFmnRXlPQJZ
	4yN/xkzNXqXpWgWvzzqGambncxQ5NNHiQdn9uGtzE8JAcRPnTNht6MnFdbPewCQxIB/dAXMABEQ
	56l9npxrR9TZeQg0K9mp5hWSb/8KV41dVAHQB8KDGhBcwPju
X-Received: by 2002:a17:90a:ec84:b0:3ad:c4e9:7beb with SMTP id 98e67ed59e1d1-3ae58299f81mr884221a91.43.1793161339299;
        Tue, 27 Oct 2026 21:22:19 -0700 (PDT)
Received: from spiderman.taila3fd8c.ts.net ([202.112.47.77])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a501083sm1163714a91.8.2026.10.27.21.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 21:22:18 -0700 (PDT)
From: Li Ximo <lixicaicai@gmail.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wang Haoran <haoranwangsec@gmail.com>,
	Li Ximo <lixicaicai@gmail.com>
Subject: [PATCH v2] media: mtk-vcodec: vdec_vp8_if: guard list_first_entry on empty fb node pool
Date: Wed, 28 Oct 2026 12:22:13 +0800
Message-Id: <20261028042213.2729117-1-lixicaicai@gmail.com>
X-Mailer: git-send-email 2.25.1
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

From: Wang Haoran <haoranwangsec@gmail.com>

list_first_entry() does not return NULL on an empty list; it returns a
wild pointer computed by container_of() on the list head, and
dereferencing it corrupts memory. vdec_vp8_if.c has three unguarded
list_first_entry() calls on inst->available_fb_node_list: two in
vp8_dec_finish() (one unconditional, one on the show_frame path) and
one in add_fb_to_free_list(). The pool holds a fixed number of nodes
(VP8_MAX_FRM_BUF_NODE_NUM = 10) prefilled by init_list(), nodes leave
the pool on every successful decode (two per show_frame decode and via
the vpu error / resolution-change paths), and they are returned to the
pool only through the userspace-driven get_disp_fb()/get_free_fb()
calls -- which themselves use list_first_entry_or_null(), i.e. the
driver already treats the pool as exhaustible on the return path but
not on the take paths. If the VPU firmware keeps reporting a stale or
zero prev_y_dma, or if userspace decodes more frames than it
reclaims, the pool is exhausted and the next list_first_entry()
returns a wild pointer into struct vdec_vp8_inst, after which
node->fb = ... and list_move_tail() perform an in-structure
out-of-bounds write and list corruption. This was found by code
audit; we do not have a reproducer on real hardware.

Fix this by switching the three take sites to
list_first_entry_or_null() and bailing out when the pool is empty,
matching the existing style of get_disp_fb()/get_free_fb() in the same
file. On exhaustion vp8_dec_finish() now logs an error and stops
tracking the frame instead of corrupting memory, and
add_fb_to_free_list() simply drops the buffer.

Reported-by: Wang Haoran <haoranwangsec@gmail.com>
Link: https://lore.kernel.org/r/20261023075633.3662574-1-lixicaicai@gmail.com
Reported-by: Li Ximo <lixicaicai@gmail.com>
Link: https://lore.kernel.org/r/20261023075633.3662574-1-lixicaicai@gmail.com
Signed-off-by: Wang Haoran <haoranwangsec@gmail.com>
---
v2: add Link: tag referencing the v1 submission as requested by the
media CI; no code change.

 .../vcodec/decoder/vdec/vdec_vp8_if.c         | 22 ++++++++++++++-----
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_if.c
index fd15d462b..ba34c71f7 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_if.c
@@ -308,15 +308,23 @@ static void vp8_dec_finish(struct vdec_vp8_inst *inst)
 	}
 
 	/* available_fb_node_list -> fb_use_list */
-	node = list_first_entry(&inst->available_fb_node_list,
-				struct vdec_fb_node, list);
+	node = list_first_entry_or_null(&inst->available_fb_node_list,
+					struct vdec_fb_node, list);
+	if (!node) {
+		mtk_vdec_err(inst->ctx, "no available fb node");
+		return;
+	}
 	node->fb = inst->cur_fb;
 	list_move_tail(&node->list, &inst->fb_use_list);
 
 	/* available_fb_node_list -> fb_disp_list */
 	if (inst->vsi->dec.show_frame) {
-		node = list_first_entry(&inst->available_fb_node_list,
-					struct vdec_fb_node, list);
+		node = list_first_entry_or_null(&inst->available_fb_node_list,
+						struct vdec_fb_node, list);
+		if (!node) {
+			mtk_vdec_err(inst->ctx, "no available fb node");
+			return;
+		}
 		node->fb = inst->cur_fb;
 		list_move_tail(&node->list, &inst->fb_disp_list);
 	}
@@ -352,8 +360,10 @@ static void add_fb_to_free_list(struct vdec_vp8_inst *inst, void *fb)
 	struct vdec_fb_node *node;
 
 	if (fb) {
-		node = list_first_entry(&inst->available_fb_node_list,
-					struct vdec_fb_node, list);
+		node = list_first_entry_or_null(&inst->available_fb_node_list,
+						struct vdec_fb_node, list);
+		if (!node)
+			return;
 		node->fb = fb;
 		list_move_tail(&node->list, &inst->fb_free_list);
 	}
-- 
2.30.2
