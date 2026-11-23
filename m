Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795435372;
	b=IxE7vws5Qw/Jm2DfyeNdHyQaq9//ERCg1Wf31r7rzWLDm+Aejuxjvaf/J6lBxjT6W/RO
	 35OUT1jQ+hOwJeTwQDzlWGc5IEE0iRDmCyfESLUDrisK1NDYSgDz7DJ4zJ7ngZKPw9Abc
	 wm3QKmthD6wWdMStJwkCM6MA5FfStkarctdL7rJj9AiYMLD2c2u6Qai+iGBQar50Iy5/y
	 KAsjQ02T5p+MM60EUTNSbKhT5YfuVhxk4E9ndhgX14H15k05r2gPFVdgoOPj1tmgz+0xr
	 mfEL5FQDtWKZx6hNIq1TMROv+f93sO9BDfN4qe6pEbxH8EkGq+0EYzP9J6vF6tz/1+Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795435372;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=oUirJsS4XjnxPv1K9CuzGiSS1jobaClpOw0JoL7K+0o=;
	b=lSkteRpi+uWUlDN3AK/nc/qox8jD3YIKDyvpDIaI1DAgHwW5HrUBn+UXWOpEAnDDw3gu
	 lJ6VLoIdylqXr4pejjQVOuJFFbp2nc+QvrQ3wIffUj3eFFQYXJR7eJWjxXRQ7EWOe7/5a
	 5FXRn2mt3uGrZ5e0f9rS1NHNsyBjZcv96w0gB+4XojVvz9j1LcnQ942714dAKvjAJWhWy
	 /ko9TFgPJwRHr9LsYbf3Y/WlMPVT2sfowqiR39QXKMadD7qXPdKMpXEmPGlJdzlRXq53/
	 5/nYt/aJn3Bo53CkvYOONC5nSHdYvHRb/Lyf7X7fTlQza2l56W4f9O69UiOzz65dulw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L5hjTHcf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADAAE606A32D
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 12:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L5hjTHcf
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795435372;
	b=ehv3rjOGfCS+DTH+bonW0bkr8p6ZsQdnnjR+hoSGUsp06uLi5VRKrI3GYgSNsn9yK7DE
	 SuVQ+Rds/WDOrZrFiDPiq0opYjZribm2qxUQ7JmgwK5hsHAPrKy2JTAqI7WSb+xsMSx8s
	 XUIRJOdz+IyCU5KQD9jViRH7vnsAcaud0kvNdNvsaH8SVaBNVRy131Fi0Q2lzFntpqolM
	 ZOSeQH4isi8ZZSsa9Z9Wv3XzGli2x/aMODvNfxMvZSFRpsB38lX/weIc+XQZ55s1N4a0Z
	 Hn8snkfmENuJdA5ue0EDh2kO9MKRC9l+jHpYE4FM8LLrP5dP+B4JGWPZ/VVve+3O2Iw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795435372;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=oUirJsS4XjnxPv1K9CuzGiSS1jobaClpOw0JoL7K+0o=;
	b=bBC7xUVJYOkdKDO+dNTbtJce0ccRXSvCh3gvjw/gv4bJlPRo4736QeR+wWNa9WCcEhGn
	 Kb0kqBXqaAYU/avHKo+toInOhNGgKSih97JiN4GLAyAYtNPbmp10dLKp5rK1DXITbD9f3
	 DVj/Y/yo3Jd1SEKgv4UyFG5LWBMILva+LgqR9YmHw/8dJ6KWAQ/mrR7B23LCElCfFDHGc
	 yl3jEmKwVNnQjVIESYHHQrSsT+b75zCl02GjhGYGCid6jZJ+YKKi0v6uCnTl2eTA6lkSD
	 EbRbAbNpvYA22sBp/zezXvaOw4ET7MpAtOb2+hbiPrFqmEw5W1OjgGLpttL3g4jdI9A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8D3311F000CF;
	Mon, 23 Nov 2026 12:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795435372;
	bh=oUirJsS4XjnxPv1K9CuzGiSS1jobaClpOw0JoL7K+0o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=L5hjTHcfwf8nhz0Gi95ar66rGVKI/RaqpqkQYKmrn181SlyikaMgPD7DXPevraGII
	 Da6YlxMTVMnwBruS3LI/xY+1LyUvMBBwC0artGlkEZgOr+SvcjfGLZoNTQHXjXWn0h
	 k9Gufttki+HVowZMUT8igTxuVCy/NYAz4MulcjHZSfSHfqgGChZ/Y8DPerLGY2OzAZ
	 jLq2xsTzjlNFsza+qZDQ9EIFMf/iz3GEaSCT367LW0cAE5b8/CeqrWgh9udWr2YJYX
	 qeBX8YkXxgteRN6ZNWLcXEo/x4lys3EmtIvBEzd+rLT55dLscVlhrmzRdhxwoRNRoV
	 WheXtnVvDJdhw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 17A634C45D;
	Mon, 23 Nov 2026 12:02:41 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Mon, 23 Nov 2026 13:02:40 +0100
Subject: [PATCH 2/4] media: ccs: Fix sub-device index in ccs_cleanup()
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
Message-Id: <20261123-ccs-clanked-fixes-v1-2-fb2bcc87a517@ixit.cz>
References: <20261123-ccs-clanked-fixes-v1-0-fb2bcc87a517@ixit.cz>
In-Reply-To: <20261123-ccs-clanked-fixes-v1-0-fb2bcc87a517@ixit.cz>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1332; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=pC2UfNfNMyg9YWe2H2VHn7jSLy//n125s+CsRlecDeI=;
 b=owEBbAKT/ZANAwAIAWACP8TTSSByAcsmYgBrBCtfl3ucccsr41EtQsY1tPLhfvv8RdIboiCFY
 ZmD4/8AKcSJAjIEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCawQrXwAKCRBgAj/E00kg
 cmTkD/dLnQWqaCqykHC9phyfzLJiCMhlcjV9KdN+aczegXLSFT/Yh8qgmakLz+2ehuAdxG5+OMN
 pwj667xTtwFIQeB+wHVCAKWuSimVzRvJbXHMG/kF8sQMVRPuiplo6YwED8K/NXHcaQ+/ig94iPY
 VnvPqHEQE2AgOKmcdY/vtbu2qYfTos4KHqOvEOiy9/8Nhl5vAhhtsy3ZTGYDOLVLwqjBb7a4ahc
 fYH59yoaZr+0fQxJA4SvqqS2pVjPmOdaHC1HUwo16TEOK4LdhxOIPgjRRXQjMT+rdi60sl7AOfo
 PPlYvZxoxS2XPIQqs8wyXb+3qiVI0vQTsACxGmT+wHjwHPGvv2La2YJzMoE6Ln+5bCJf5buRKDt
 5HlQpDVeP5AizHO8gDW39zSc9AJqAxYZHL45KMezigYcfG2p/fDr55319WRhyCGbenneo1sK5SF
 3VC5nqwPAkZEarZVaICzAOpNDVm3L/HKDtqgSWhQQ9txWB8FLpyXkI7ymkl51AAnrCgIemejwWz
 LzgJ4QBhZaoFvP+s5H7senkeHX5njpO20KY4G9Dv3xR2BA90Vd95cyvrVEByWUoJZqEk2PJ4TKp
 Kme0kIU9oa9RTLfn67XKGRnODJ98xFyZCWsfuRAMq5FdhPdl+yRobSxdpayqgFlIRLzEkOOTDoD
 Xiu6HkUzjPY2t
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
Content-Transfer-Encoding: 7bit

From: David Heidelberg <david@ixit.cz>

The cleanup loop in ccs_cleanup() calls v4l2_subdev_cleanup() on the
hardcoded element ssds[2] instead of ssds[i]. On two-subdev sensors
(without a scaler) ssds[2] is uninitialized, and on three-subdev sensors
ssds[0] and ssds[1] are never cleaned up while ssds[2] is cleaned up
three times.

Use the loop index i.

Fixes: d8bca3ed1d70 ("media: ccs: Use sub-device active state")
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/media/i2c/ccs/ccs-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 284cfbd89349c..df636b8df0b51 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -3002,17 +3002,17 @@ static int ccs_registered(struct v4l2_subdev *subdev)
 }
 
 static void ccs_cleanup(struct ccs_sensor *sensor)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
 	unsigned int i;
 
 	for (i = 0; i < sensor->ssds_used; i++) {
-		v4l2_subdev_cleanup(&sensor->ssds[2].sd);
+		v4l2_subdev_cleanup(&sensor->ssds[i].sd);
 		media_entity_cleanup(&sensor->ssds[i].sd.entity);
 	}
 
 	device_remove_file(&client->dev, &dev_attr_nvm);
 	device_remove_file(&client->dev, &dev_attr_ident);
 
 	ccs_free_controls(sensor);
 }

-- 
2.55.0


