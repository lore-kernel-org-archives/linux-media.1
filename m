Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201947;
	b=jddTO12zIl1L+5wi8JEAEioBI+IWDfz24D9aR1w5HokOK6mYCXJyEFVYmdHwUZHHYXAf
	 z4BET0gFJrKpXlwiBvr+axsAFmoIJcqD3ppcC4JlhWqaRcc9yptC7qfuka+NhJMgyLxOv
	 leoORnUYRE6RySF+9uRs/4JPWwOuRUtLcplkS0hObVjlbfyEOl9KJ3DXthDLpT7bfLoT4
	 aRpMItCCJ8FwvFPMENMeBceJtW47Id63zBnuibdJmmCZRoH78Oy9UC0451s+nW404zF95
	 yWppi5J1VecGEQjzrus8Lr5lHjDpwuf0SySHM8ww/nXR9W//d+RbhGnAV3xN8rsfplA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201947;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=2YqpHNpqDOLT8VYNbKToqFKV9CXwboGOUTNMy2MCQ04=;
	b=hezJ+kg2IV7VYrhmXBU+dZZOHvbwOmqfASZqJO+JWrCXVfgnijQ4oqsIB3PU6aSrg68w
	 F9iVTkesdPQjc5rrJltld1Log9P2VbeSPfaZFK5+ym2uQNerOZ9R8zYh7wGsg+PKzS+mU
	 sAQb17JslSTQJfY3pwTB5+gkMdjqHi6OZJc/Qu/GhZy+spEH0qVwPBho+pE9Inv96IGGg
	 twvxg/34MYpsMj0rjyIcKbor+bDu1uI/IUWgAFH60h6Gci3UsEzK8zvtPzF61ZHB5nCOm
	 3C0eZ+YPpEloi+HSdMQ0q5JUnBCCzeOiWGhnNPJZnVVVt4gnymaEq+cQZFJbBjmrAYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DnQPtUIw;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004E4606A31E
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 15:39:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 004E4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DnQPtUIw
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3acc96a256dso886258a91.3
        for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 08:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793201946; x=1793806746; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2YqpHNpqDOLT8VYNbKToqFKV9CXwboGOUTNMy2MCQ04=;
        b=DnQPtUIwRy+I2bjm1a5lupUuNF0QdFVhy/2wCSZqQ8LSIMvmYkPU7s0zuCVpHd1m1V
         p/PkTA9nj4uRlqNoazBgStQi15oc346+C7LmA7B4V7OLGVvK3xk14JdEGJonGn8dkRPA
         nE3289YyK1/0qWEW4F1umCxE56wOT9lSv3GGQxj9hGCqJlFGhb0W/9b9semF4awl36Fb
         pb/AEockeTA/T35qqS8aMRBHgcwZRy/19KUT/yjWOOYzTBQVecTiTJDNoB+dksmfuZD/
         J16sfC2iT+zQlBTGMdL1kJsCwn7enFj/pDThPea/5ObeH6awa/rGssM5D4yP1zbZa8Ph
         EMQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793201946; x=1793806746;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2YqpHNpqDOLT8VYNbKToqFKV9CXwboGOUTNMy2MCQ04=;
        b=RRUctPuXMammi7V6KOPyo5h89enj8RpetULMCovJ42D2XreD71Hqa4wjSiPkg/r35c
         kZlXCVqZckJMJLlmNXsYCaC4FHkFOQGJklWQci/l95SlNvzflm4j6V52xTm/GlfcPF9S
         ucgtp9kbM+q67wNJv7Qp2YQjDJLwJEbKtNOln+SwodX+wDuBH/BmsH+iiVc9W7Fu+kpJ
         8rYscY8lXvsNdZwKY3xYpgOhUOImpoXXoIp2SbYNv3nWNZxSgZbjvrDuObtES8vlc9+u
         NSc2jYnlAmxLWLdWdZ4BNgXBQk4mwjNni4O9TxYBHgUYlZ1YkpUymKyCg9b/RCacv02I
         QxSA==
X-Gm-Message-State: AFq9FYKpbDRb/jMQohsrZf6BaHCzXIdbpRrdJgf5F0wtaKTgSt99r9uT
	r7wOzheAZ/twujo/d1gdE/aiJAUWuUlAWMNm1ml2fcfNaLDR/VVvV6Ft
X-Gm-Gg: AYBFou1p0k263GHfyELMXNEYFqB62/oTxfVIIlrxP5wIUtcT7MCXLQG6zhVzB+JOM0a
	gNc84n5nwrYv5IESeD4GC//r35O3ciTm04glPnzu+ZYdhKXSzLfF1wD6lAuB3+/UL+2TY+b6ESp
	qwqnDQD+iRPXh3EgxikIra5YPrayceW9w5aIJZ+OJOvyH0qK3pRgtDto6lYstvYf0ITNj22YStP
	1dBSln/lRMyn0w2N1cpo328xOk2/WGFVRov8J0h/giyyqRiEag62tBF9T8mVVDUehsYlGseyvzR
	5FZoNZUA1tamn8KVR9PYnesKJOxtmasgcwcPGI4KhX8c1KhPCFbwkgJs6PleOriIYtITpcQGBfg
	6gVNXBCm4oxlgcSpn5kHQ7OfPleotwC5ZyP5ntYPcEwD8W8A66reLsmZSswVfW0it+gx6gMEkGU
	e/jlHe8OruImNZb5er6yb68VMllJInZog+ra8D2iLSRzDGuYvVg4hUkT6V5MtMo1AGnNPzWpZf4
	mQFQadrW7XAR4nKiAfp2F053gq2oCCmIlDPEco0gkjoMB7D+mc6lrfbJQ+DSxPWGIt7UUiT7MCg
	f62esrHTIexaGQ2KpXQZpqURKFkATnJbJRdTeHb4bLCMO8DD2gJ15kaAQwKUL8fGz8w/3H+j266
	C
X-Received: by 2002:a17:90b:3812:b0:3ac:adce:60b2 with SMTP id 98e67ed59e1d1-3ae57e33be2mr2149303a91.2.1793201946249;
        Wed, 28 Oct 2026 08:39:06 -0700 (PDT)
Received: from spiderman.taila3fd8c.ts.net ([202.112.47.77])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae579c5b77sm2033386a91.3.2026.10.28.08.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:39:05 -0700 (PDT)
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
Date: Wed, 28 Oct 2026 23:38:57 +0800
Message-Id: <20261028153857.3972168-1-lixicaicai@gmail.com>
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
