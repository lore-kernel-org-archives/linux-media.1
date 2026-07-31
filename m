Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA09C415F08
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 10:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785494226; cv=none; b=inGrwJZR/nbRf831jpQbUucmu6rTbB6AQtrSaIk9eZgIM+Lh/V8kY+13obJn5G9LcU8BM+i8gKRsJocy2Q23Iko/L5CJdyPvZTqWjlWrzToJh+/ZyWMIXDFMEufkwIobmDjgbeG+f/RLqmQ4rCV8Wix/cbmkK5InIGhIsIhO0sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785494226; c=relaxed/simple;
	bh=jppbrgL1e434Zvo2vKYd/ncpb23uszrnDj8xJ7yy9R8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=N8PSlO18qT4DE3hbhLMlG9MNxIBqVO1nmNYG4Pqs2VkosXbv8xQ4dgt0+/jNdHrbjEFCLpWE+pv1+T9hPnM9SBc9V+Vj3OL346daMRar1T0TR19jaWFEzuxiUY6XmGmt7TF+0Mi4V3a/umN/PEzMoP0przHxlo9mrtmo7o3gt6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZTGy+gq8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZTGy+gq8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1086F1F000E9;
	Fri, 31 Jul 2026 10:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785494214;
	bh=0IW/GP4KAfBl6nkn7QxL67BjLSeMG2m3tLi0mVG+PN8=;
	h=Date:From:Subject:To:Cc;
	b=ZTGy+gq8+udtpRF0f9wz1JeG+niV62X9RRJqZYZX7gwo8AT5kpWGppvvQDt0Fuz2A
	 s8guDzg3HX1bTT1TskopAqVWuC8tDud7Wd2h7KSivRjkTBC/L3aq863Rqk3ONxv6n2
	 lfV4O5ggRCpB8XOXF9z5jSYjclRehxbaDDUpAaMvnyXX2UzkP+e3WT+8N+yTgwpPwn
	 YV56bQojQIHnBIHZ3lKwMYmFvj8YF1bt78Rk7m98KjoV2cXpJALK3Dnj0ymTTGVdn1
	 0E8Pu043FFQSAYR8EMqRwjZWuVeJJvI9Ny5vgnoBAIrnrkEh9qSkBiIow1veBjh6l1
	 JYZIuAIJoYUMw==
Message-ID: <3e01154b-ab4d-4cb3-90d7-a5dce4e5b2c4@kernel.org>
Date: Fri, 31 Jul 2026 12:36:52 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCH] media: usb: em28xx: check if vbi is supported before calling,
 vb2_queue_init
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Lars Ljung <lars@matholka.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

If the device does not support vbi, then the vbi queue is still
initialized with vb2_queue_init(), which fails with a WARNing because
the q->lock pointer is never set.

Only call vb2_queue_init for the vbi queue if vbi is actually
supported.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Tested-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Reported-by: Lars Ljung <lars@matholka.se>
Closes: https://lore.kernel.org/linux-media/8ede91cc-b505-458a-94ef-fb02270f9701@matholka.se/T/#u
---
 drivers/media/usb/em28xx/em28xx-video.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/em28xx/em28xx-video.c
index c418add65bb5..3e72d9613dd2 100644
--- a/drivers/media/usb/em28xx/em28xx-video.c
+++ b/drivers/media/usb/em28xx/em28xx-video.c
@@ -1410,6 +1410,9 @@ static int em28xx_vb2_setup(struct em28xx *dev)
 	if (rc < 0)
 		return rc;

+	if (!em28xx_vbi_supported(dev))
+		return 0;
+
 	/* Setup Videobuf2 for VBI capture */
 	q = &v4l2->vb_vbiq;
 	q->type = V4L2_BUF_TYPE_VBI_CAPTURE;
-- 
2.53.0

