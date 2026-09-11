Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A475637B030
	for <linux-media@vger.kernel.org>; Fri, 11 Sep 2026 23:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789169496; cv=none; b=cyGXP8fLtTZ9QHRXhJF0EKIXtPUoWDUYI3T9AX5SFu8n8l/m8eVLiJoQPK93sch/Zf4UjYIGhRjgBdvcNzGpRmo+fQJLwtmTfEANh8bVkDyuGQhiKq3bNr2IUe53P3wmGVcqd01iwizuth4JksVdFUPBCTSNDdFUEgxSeXrAB7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789169496; c=relaxed/simple;
	bh=HAa0TEXydOHgMfafBsDr+x6HKG9INzGOAMdWGMZFkrY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ElMCNGRjhdpN8QddNYANl5HVxf4GodbGk3e9CCaU5n3rpQ4EqgJnZfazIdhDDCOwxrX5RiO4MqspkLmIGeK8TZz+RL0RpJ90ZB4+EnV2kbTmVdF0Qk5hzaFttvuLxrO1h5yZnUZLOqvd/M0CRQrt9xkL/Y1brpO7GQlkRS2ZAys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U5wSUjjx; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U5wSUjjx"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-495437bb891so7548445e9.1
        for <linux-media@vger.kernel.org>; Fri, 11 Sep 2026 16:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789169493; x=1789774293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2M0oCDpR78/TpqPTtQy9t/cWrQ5LXXH52OEtpZSn+ww=;
        b=U5wSUjjxxX3Z36A8LqVLWJU/sQl2BzzhfV7a1G50RJfnGFLwYCKQOuSeAOzE3jKP/D
         GfkwfYqw71vdr0u6ETcmkw/6rIFgXAvVMBRTGLHh/wYMsRrcBkPbXuxq7xHx3SXA71+0
         zH+vSDxZk8g9ao9t6D/wBwEyLhcqfn1tiiC4dyJ+ZpZlxNh8PRuoHL4NiVQuB/wq9CEY
         L7MA/lq+IPNQcytgGHVVz9oCX9K37fUSPR9Vf9F7u8r9IaUBSoT8b4DIPpdsPTkNEPV2
         bWx0t1IncPl/P1/LC2Ew+vbG+dlJaj/vOJzNW6ErmN4NlJ/LjSyLwAr14TnjhjzpvwIu
         KtwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789169493; x=1789774293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2M0oCDpR78/TpqPTtQy9t/cWrQ5LXXH52OEtpZSn+ww=;
        b=AO7QEuGjyQGpRPi1C+BCxsdDja5ONCXyKL4EuUKiZx93n1LIYJdr2ePO9nZFs1//7R
         W095j7SZCJrcFVag2eWYofy0F7gRIsVxIF/AxLC3MSYnslt407v4XwWf2743kFwK6bEL
         F3DMiDZYS155xxBqj8BGOBnH8V6fz5jc8WKi6DL0b1LCVutm4lmkzu974q33P1bzsOdB
         AroQfLLFQ8xIAGQYSeiNBJpSOqte2cj9yluhgYN7+DhqhE0hUSw5voIW8UU44MxTLvy4
         1XcB/NEJxoKe5/gRAei9NoBPJFAwj+Pv+hQq6jxl0KvM+5VLrx7+wOb/2YHLTKzkRRwC
         QgJw==
X-Forwarded-Encrypted: i=1; AKwUvByhgr3RpeVA+UcDsDyTGE7gLYmY1J0wBAHbCq96ho2v+T7E925LFT8FwmK8ATJF2oJ9kud+7hOoPI8x8w==@vger.kernel.org
X-Gm-Message-State: AFuF++l6LGxMg/APly8ucJUilPaEgOGOSmZXJlF+IdXtk7e37FsKCO74
	etwT/fiyMn7ta/ShborzUsvT5hY4dsREJs96IIOEGQFsvcSbweCcBrlp
X-Gm-Gg: AYBFou0kttlsxnBUiHZ7m5IAYCnlR7s1Q7Pk5yQhMNycI9IHWV2w3+zmhISlmYGtgFy
	44HQGBd/yU0vizYs7JxEygcR0I7MB+X+sGH6T7eWEjKuB13+0CruVLMyuoGud9GNsvuHfxwLxPk
	TvDhtHtTrCbkVLyP242G3NQQ2tnNJ7yM96MXncxAoyswjUpz3IYqNNab+NEPRO/hWygJQ4OIBHJ
	QUG+GvnpZ6EbtiPTFOlSNetKNwjeLVupCO+BVcyuZbrHu6PzbXXQ+D6gn/hBQ7HKhpeh4+tOQSn
	jOJzdXTiWmatxlfA8EfU6wROMocofKKCgvOkZBhaNOT/MS3wQIQXp8bI7TIs4OrDdo0ouU0R9/s
	aBpfOKr+v4Q3jmepyF/AcDxUnyiow5QUtKnuxNwkyBRQAuoJnTUOtLUREUHarXnV1+yLeInVeXO
	SZPwQSW8MiyGKdAnqy7+8YLIyCfajuwmwxAHk1NGucTIGQbtPCdY76MrIU52Rpmq0VE52mZ8DHl
	HsX3IvTe02UJsVzZd92cviJHjcfv5Pvz0mkhP5fKMFXJcOTQ0AXnOWJwhpVMx4tokX/3WPJWNpz
	JdBZOlOjeQtyBWRROBwfRXptIvcz2BS4ThFn
X-Received: by 2002:a05:600c:3584:b0:49c:ff66:7d88 with SMTP id 5b1f17b1804b1-49d26d7f8a2mr181278145e9.7.1789169492807;
        Fri, 11 Sep 2026 16:31:32 -0700 (PDT)
Received: from localhost.localdomain (dynamic-095-114-033-154.95.114.pool.telefonica.de. [95.114.33.154])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb330bdcsm9650804f8f.13.2026.09.11.16.31.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 11 Sep 2026 16:31:32 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Keke Li <keke.li@amlogic.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: uapi: Fix C3 ISP type references in kernel-doc
Date: Sat, 12 Sep 2026 01:30:11 +0200
Message-Id: <20260911233011.30951-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The C3 ISP UAPI comments use singular names for the AWB, AE, and AF tap
point enums, and misspell the parameter block header struct. The
corresponding definitions already used the correct names when these
comments were introduced.

Refer to c3_isp_params_awb_tap_points, c3_isp_params_ae_tap_points,
c3_isp_params_af_tap_points, and c3_isp_params_block_header.

Fixes: 6d406187ebc0 ("media: uapi: Add stats info and parameters buffer for C3 ISP")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 include/uapi/linux/media/amlogic/c3-isp-config.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/uapi/linux/media/amlogic/c3-isp-config.h b/include/uapi/linux/media/amlogic/c3-isp-config.h
index 92db5dcdda181cb31665e230cc56b443fa37a0be..fc70b3124ccacff635a7d9c0135d4e3821ba1a33 100644
--- a/include/uapi/linux/media/amlogic/c3-isp-config.h
+++ b/include/uapi/linux/media/amlogic/c3-isp-config.h
@@ -247,7 +247,7 @@ enum c3_isp_params_awb_tap_points {
  * from :c:type:`c3_isp_params_block_type`
  *
  * @header: the C3 ISP parameters block header
- * @tap_point: the tap point from enum c3_isp_params_awb_tap_point
+ * @tap_point: the tap point from enum c3_isp_params_awb_tap_points
  * @satur_vald: AWB statistic over saturation control
  *		value: 0: disable, 1: enable
  * @horiz_zones_num: active number of hotizontal zones [0..32]
@@ -305,7 +305,7 @@ enum c3_isp_params_ae_tap_points {
  * @header: the C3 ISP parameters block header
  * @horiz_zones_num: active number of horizontal zones [0..17]
  * @vert_zones_num: active number of vertical zones [0..15]
- * @tap_point: the tap point from enum c3_isp_params_ae_tap_point
+ * @tap_point: the tap point from enum c3_isp_params_ae_tap_points
  * @zone_weight: array of weights for AE statistics zones [0..15]
  * @horiz_coord: the horizontal coordinate of points on the diagonal [0..2888]
  * @vert_coord: the vertical coordinate of points on the diagonal [0..2240]
@@ -342,7 +342,7 @@ enum c3_isp_params_af_tap_points {
  * from :c:type:`c3_isp_params_block_type`
  *
  * @header: the C3 ISP parameters block header
- * @tap_point: the tap point from enum c3_isp_params_af_tap_point
+ * @tap_point: the tap point from enum c3_isp_params_af_tap_points
  * @horiz_zones_num: active number of hotizontal zones [0..17]
  * @vert_zones_num: active number of vertical zones [0..15]
  * @reserved: applications must zero this array
@@ -487,7 +487,7 @@ struct c3_isp_params_blc {
  *	| | | b_gain = ...;                                               | | |
  *	| | | gb_gain = ...;                                              | | |
  *	| | +------------------ struct c3_isp_params_awb_config ----------+ | |
- *	| | | +---------- struct c3_isp_param_block_header header ------+ | | |
+ *	| | | +---------- struct c3_isp_params_block_header header -----+ | | |
  *	| | | | type = C3_ISP_PARAMS_BLOCK_AWB_CONFIG;                  | | | |
  *	| | | | flags = C3_ISP_PARAMS_BLOCK_FL_NONE;                    | | | |
  *	| | | | size = sizeof(struct c3_isp_params_awb_config)          | | | |
-- 
2.39.5 (Apple Git-154)

