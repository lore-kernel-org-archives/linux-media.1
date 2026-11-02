Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793639011;
	b=R5uQt4S37tqRjRKBjAlaZSPF8HbT9WfL7y5LRdEPdc3Pt3y0K7ldmZkYcyga25laTtQC
	 DZsiH3obMR6ScBBtd6Kfn6OOGjjnlvtxqQeN5aHJWGULX4nMwr5BTSSsLK2D4AcSbd9Lo
	 G4yfQwz57wLEbhhXvjPnlFzzqtSNTSDQN7UkUdR9lNJmxqDcwW6EC8bdf0SVeVhhCIpl4
	 9TCjP3Qee4cwSt/XxCLGgeLXb33M4EcUEyWBL47djNMah6DfYec2pv+xFn56nu0g5+r/K
	 RAwzb5Hx1cul3Hipck3e893QDUoMMODjJ694DaCbY4nvYjqnH0n29QktZrTILoZ1d8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793639011;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NKzzwtKTgXz6R9jTvzKIhg/OY56xKISF3o/pTEJt26A=;
	b=jz1bk4zYDbpX9klFiuZM5+xJucVg/TdbxP3bsPsAKjyHlXPsxRj5kPjyR4JEPm0YYnVL
	 UY43Gc/CR9du79VUlFhFJEEf18kutqW7sGVYtfjMrDNFy/zdpCAnpKMrOHPyOG8zMEJkm
	 H5EJ6GegzIAZhTZMNdSwLhu0aldToj6fjG3bkFbti6GkV/qM8W05PqWvmwzz9g0Wwl/wO
	 w3nlR6D6TMbZlI/DhEpgvBJEN8E+TndPdJDw2+zz6uUhZ/sojrQHLUN6jeiG/dd2M/BQL
	 +00WclWKzTpZA866+91b+XqH77i894yJLTEsA/kgQIKDuRMqdpAZFqMfpIb8di9oeJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BuWHqt5V;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C644607BDD6
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 17:03:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C644607BDD6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BuWHqt5V
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a208d93758so34885475e9.3
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 09:03:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793639008; x=1794243808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NKzzwtKTgXz6R9jTvzKIhg/OY56xKISF3o/pTEJt26A=;
        b=BuWHqt5VzLYepYCUJileVJnI/3vztC281ximLogJkdQgpWZlIvdFSapFuVCiXO/wnd
         stuCMGPPeHllzneN+h7Vmg+tzjvFwh58hwKeGcrqKSuObq2I77bXidAATD/Vema55ktt
         w8olA7KV9JE9mc5gF8Z6CmkCsgidyddgEelmfJp0pDoMPf7Fqn+h3YCQGng2nUgcHONC
         JCBCO6VKAQV3Wm4KHEqC7D06/mZgR+MyMiqtJiIUFOsP2xCVyqI1Kgcl4Fk2K67lcjPO
         9wkj3TwZ3hYjaaFwDnPG3sjZcQvvtKDjaMyFef1iq1iSO/AhuAGY1Oe9WDRxZY4OA4ad
         MoeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639008; x=1794243808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NKzzwtKTgXz6R9jTvzKIhg/OY56xKISF3o/pTEJt26A=;
        b=Vp+wy20kczXiZKo+c8xsXY6dLZS+cEaWHVHYZ2pogf5epZf/2t6b6oXIkXCpHw4TTC
         QIzUUkkMT9TO8p0hsGny680XFY4cjostJnYJa8Mh1bXGx15x2pl/v4ZiCJQGWXJuSMaT
         M3GYujsRUSo0O2jSYKseaXKQTMQNjSlb2j2G+5uS8Nf7QaBv3whUVfAEXxDrstU0sIMi
         q1n6u4BmFkPZ1jd6j7cexQfaIM0EXTaKCpbrsg5yBpFVReSoCvRDLRfEi60N0EN1Bz2e
         8THF7ja2kKM3IkCp21hhRM58Vc1ee7o8Z7g3n405Zq+iCF/e910lCCpWyofgUgim/v+e
         0DSw==
X-Forwarded-Encrypted: i=1; AKwUvBwhIyqM+rmIdRKPhgqLPosqyh36mx5ttHnOIPZF8bF+IbCW/0hOv9bRkqFEH0U7o1loSIJehn3HHikysA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIOhF4QW4NxKXySm3BEqTh+07DP/l7Eh50Xly6XnR2MKFFrolkd
	WrhogAuzvA83ZMKQrEfgA7BWdcyL2ijYoBmxvP6rahJL+64D0pPd8mYu
X-Gm-Gg: AYBFou2+UrFhuLm2EINsVLc3RdAtFkQGD6/DAwibbXj3k1ICVn3hjSqSn6/ki41cUCM
	Vs7GfJDZVnJz0Ojy3Nr+ylAJHIIWRnNJyg+PvEQ/abC1ncXdMGDGv4KyOGJmuEycj6/6jQ8ufMs
	BYiXfDmLDafNIKy3EU9YsaLcfvL6/tdbXEYHVUm+VnSn3rFhVUjlW/X4hp2xO5DCNEghQf1eIm4
	nOAcHGlzM0LFdSCJUTNAm/2vnTp6EZQLBXsw0UqKTbaSu0sOWYWbTf3JO1n/job754MT4sZDYxR
	OxMyen6h6mbOCd+xpjzeJ4Ip/2iJrk5oNz02BAFoGKnsqLu4IfJO3bfupg1u8cMAy7kfLDPnzE+
	I96or3hQxfvBiOU0C+HBZVT1ayUpvM6tHTIWxs/eq0XniflLnAFM6txQsDGkDDVnPfx45SnR5eA
	msevsMH9LzmBzK2461zaTm8h0GY35KxNKwvcXjNQbPe4e/a9nVEPodPVNaC9bEQYx/X0d+0a47C
	JIYwfBa9PE3Xv6L3aa4r1/nCKHRT4mAI9p6/B6N9klCSTOkfiX150m57qYhKvuB6b7vAN0MHeKT
	9AKnVAyM4JrCaeoCyD+ZU8e7O+Vov0qMHhYVZdGQi41OUQOOfi+9DC4LCuCOEdnbLpkWT5YX41q
	RnQuHnBiL7Pmz38wzKVWNlOtqAiI7ksCCNuu4Z8EV0inVa3AwZmr1zr7OUYh3TyvBVqgTTAGluu
	ftGUiE59ZUriPyU1DbcSnbS18quH/VxP9I0i5g0RN7MvRzQ0njQinwCAz+EwyCkG33zxMFAHCFQ
	61Yn/Dv8fhLlCTeIcADCFo/IuuAjcy0YtSASc5eUlmfYl+Uxg==
X-Received: by 2002:a05:600c:1385:b0:4a3:5991:718 with SMTP id 5b1f17b1804b1-4ac182dc0a1mr261716365e9.16.1793639008306;
        Mon, 02 Nov 2026 09:03:28 -0800 (PST)
Received: from jernej-laptop (194-152-27-116.dynamic.telemach.net. [194.152.27.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm23362309f8f.7.2026.11.02.09.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:03:27 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 07/10] staging: media: cedrus: validate VP8 frame size
Date: Mon,  2 Nov 2026 18:03:00 +0100
Message-ID: <20261102170303.1973892-8-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102170303.1973892-1-jernej.skrabec@gmail.com>
References: <20261102170303.1973892-1-jernej.skrabec@gmail.com>
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

A VP8 key frame can change the frame size. If userspace doesn't
reallocate the capture buffers, the hardware writes and reads past the
buffers, which shows up as IOMMU page faults and decode timeouts.

Check the frame size in try_ctrl, like for the H.264 and HEVC SPS.

Fixes: 3c39a16d30d8 ("media: cedrus: Add support for VP8 decoding")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index 45deebddb630..756243795de8 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -77,6 +77,11 @@ static int cedrus_try_ctrl(struct v4l2_ctrl *ctrl)
 					  (sps->pic_width_in_mbs_minus1 + 1) * 16,
 					  height))
 			return -EINVAL;
+	} else if (ctrl->id == V4L2_CID_STATELESS_VP8_FRAME) {
+		const struct v4l2_ctrl_vp8_frame *frame = ctrl->p_new.p_vp8_frame;
+
+		if (cedrus_check_pic_size(ctx, frame->width, frame->height))
+			return -EINVAL;
 	} else if (ctrl->id == V4L2_CID_STATELESS_HEVC_SPS) {
 		const struct v4l2_ctrl_hevc_sps *sps = ctrl->p_new.p_hevc_sps;
 		unsigned int bit_depth, max_depth;
@@ -270,6 +275,7 @@ static const struct cedrus_control cedrus_controls[] = {
 	{
 		.cfg = {
 			.id	= V4L2_CID_STATELESS_VP8_FRAME,
+			.ops	= &cedrus_ctrl_ops,
 		},
 		.capabilities	= CEDRUS_CAPABILITY_VP8_DEC,
 	},
-- 
2.43.0

