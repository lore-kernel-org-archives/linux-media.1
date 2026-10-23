Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792742207;
	b=vxIKHJprkCo5TfuNUbeJRmok8+RbXkxPliDrMvjSyQokro50pY14ttbYy+THq0oHgcDs
	 sBGJNPC/xahe3FsjT/JdpSQts4DPKTGCPXGEwYveGqIefLSOW/8nnn83l60BVr+XxNZ/t
	 O4HATHcX9LcgJ8z9wsigeMQRJEYLEHjID9onEECQGxQyz7xr8piy4QZzbsN4+Z3UT+cpO
	 C5WOcBrJkc4+diUURMMx/jdzlkOA7pei9x4w51cf1CBWtBHgGVHh5W2O7MIT2U+FumJsX
	 U8Sck138b8Wc72C7yRhZ+PLfSAXPrnS052w52GvpPSjjPu919xsK0m5cFs/zbyvOt/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792742207;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=DfG6IQdCHVcjOz6fH5EIp6RTNiOXw697TBLXZk9szkc=;
	b=q2SJG310bvosb4gko/AmmP8+L88bfEooPjhau3vYiSrwWYmsqDqA0XUl7XwO+kb0jR6q
	 5VtXFg3QtKOGAuh403xqCWRqoS9gzdniB9HhhcqXGdQNqHdPOeYhqqrloJsGLzIPk7ZZM
	 Oa85EbupwBZWmEsFusNkiCrZGKcYHEYOg6fOAsTb1eDS8IlrJasYt2mkCjIu1CTVClAjH
	 ulVcpE9nm3emry1J8rVTkEjvmPcKMdZY23HQ4aLQcXQhzZqxTgYPoKdUcisETD3olNz24
	 i5lYOjI2zQBJ//LeioadwoFHN/do0K/vwKtmUxcAM2+HGVI4LLVLgis2NVuvqpTi1Xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AE78vyvh;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A48606A31D
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 07:56:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77A48606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AE78vyvh
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8a05f2d5cd3so272103b3a.0
        for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 00:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792742207; x=1793347007; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DfG6IQdCHVcjOz6fH5EIp6RTNiOXw697TBLXZk9szkc=;
        b=AE78vyvh6pkCM6fwA8TEVkYW6bk0oAve46hIm+EBvVO8eXS9UkcyuDpO8jEAfTVZTH
         PZ+S9PFYTB9UWgydOTr2ymakLk6eVhPoM+I1+O3lKjOu8ZikE9cs6lElR02f76FZog5e
         522CjFGkQASD2+G0QnBGpnd9N6NhL1QJxHokqGf+gl6ndsWgqJYS4t32O5O5FjnIYq5g
         T+NfLevvxK8QhyJiV+OoDF1e1OjHXlmTP4NWBzVlcYYllgeMViRshwm7j2/id172RSax
         aOU1+7qD7PLXQH61xaYJBKdyfEfL6+82PD96/al7/5Q6BcnV6kTltwh3l6PItZO+xhHH
         pHcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792742207; x=1793347007;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DfG6IQdCHVcjOz6fH5EIp6RTNiOXw697TBLXZk9szkc=;
        b=VLpNxGcvxhQIayGjb6yGZoT+fZDWwTDJ6JxyHT1eSa02DLbwZLsfkPSm7wQRNlagkW
         2LwN92ZIUUPZMZSA1yJiTWLLE+oh/jilERoM8shM8AZp7AeGoZc5aneJ8UnHpzyYClZH
         snFbhnubNSrOrz8xj2ZlerH4jLFIzNK7zeP5j1tqiC8r6j7q/9bx5itfAfRNlzoUyprt
         cWZlzRIZZQMCxwsJ0TAV85ByFTk5oTO14TIrKxoDqekrQkUCsOeWrs9f3sWOEnb/ANr5
         MYsZ+jzsyuBHZkUZ8oQMbk/h7N8h7uOu8CRdLbi73jZU4tabuF893FNxV92q7IxbIYsW
         /poA==
X-Gm-Message-State: AFq9FYIa4Pszdk3t8J/lMD8/HdkDZDbw0FnxayFLs8E5Q9QtPzbU3Ts4
	+8QItm5X6ecqrxgHkBsbi9W+CdP4BYM0SMnKtuKuiSzhmU5rlXDWNCV+
X-Gm-Gg: AYBFou3Y2MH9e9Wixg+d6mYTT/N9T9IaUKHOsFAGOQ1cYUHzFR7cSD/muLPrOAa/Sl/
	ah4CNi22MrmLU9+ypMxKPpOHfgDoV3HWTV2rn7go5OH/yLv9IFgtaYmnSGUhuO3BTYzKgs2vFk9
	evZDnryh1WgPDEpJ+yZtSug4NX3BCHkoNE2vWDUjiShKwZyOMsx+EwyeChqcUw9mp26bjo7N5Uz
	x5L8SgIuu7suBpfCLIBk9HP/TWgJLLj4cMgBFx1badtuXpqOqjVCa31LdCxMyGJmThAIidSB4v9
	xVGPxtdyoogbKfTMFR14Ae+pjP100fFOhCMMCyYEmLloJErv3nysd6PjQhk8b6EtXMOu9tZ18jf
	X7cW3VpuyWcYCaT96rqRhs1lSIEpRI+dwAxbtxfq+8nOAGqYprNC4NjRJogXxnPX1UuBoyskRrf
	YnRa1ZPkpE1JKin6ksDneKBwa1/TmJPkcNNcgGOF9aFzomjcCjWdNx98yxOVlKuIvn4tOulgDID
	asBjGrxG1apqV4ts/HOLuacyk67g64GKfzKtkgUnv7kb/CgLMRRoZkDLNo0d3R3YiFnqucA9Yh4
	k4UzkP2a8yg7mweC/EGdlzPyNsw=
X-Received: by 2002:a05:6a00:2d22:b0:89f:9ea6:1dd9 with SMTP id d2e1a72fcca58-8a2c6d927damr1178514b3a.38.1792742206707;
        Fri, 23 Oct 2026 00:56:46 -0700 (PDT)
Received: from spiderman.taila3fd8c.ts.net ([202.112.47.77])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a2c930dec7sm437340b3a.52.2026.10.23.00.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:56:46 -0700 (PDT)
From: Li Ximo <lixicaicai@gmail.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wang Haoran <haoranwangsec@gmail.com>,
	Li Ximo <lixicaicai@gmail.com>
Subject: [PATCH] media: mtk-vcodec: vdec_vp8_if: guard list_first_entry on empty fb node pool
Date: Fri, 23 Oct 2026 15:56:33 +0800
Message-Id: <20261023075633.3662574-1-lixicaicai@gmail.com>
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
Reported-by: Li Ximo <lixicaicai@gmail.com>
Signed-off-by: Wang Haoran <haoranwangsec@gmail.com>
---
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

