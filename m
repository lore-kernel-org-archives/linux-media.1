Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795435372;
	b=MxJil74nViSHYOtxZvvFDhIpbV9czGFOjacnaowyzM3bNxMj9CDYTjKe6F7hh2/v8JSZ
	 8rLVCCRG4XuM+0T0dVEi3f08A4p7yIpiJ0HSekKKQH/nlN4N9Kr5MJtjaEDs+hetgF1q9
	 UwCJLqV88tDiHdTZNjP1Xgkn2tzrF4bQXWkrBAEAJSMmF+aBiv4fH9spIy7bEzkLoSaFb
	 3y9Y5Jd+CeMDja3xkLFanDb3tn4w2KZFWHyWnh7s9mPAA1w9Hg/6WmbY7ZB+DudQctQTo
	 krJsbC5hHHrtRRLtv2HQq7nOHWzSE/bNul7EzXyIpGCr8pAYL/77oe4XaEQuhBJMt/Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795435372;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=fDCjlxFw14RtgaI/j7p3GPKMlaXycqIYqSsA9IPw8fw=;
	b=DFTyHq1D2Se+tW28Snpcubxsi4LpZLNLGEkYS2GUiQJV8jgDCVNn47cnDw1fmyd8MHHN
	 hA4h+6xUSF60xhqD1hIYBrakjk0ZtbWW253HFbAveINWtkayYyVe1VQ97dJCK7iFP/0Sy
	 LOvwmHSiHeyhojWivsrBTTKcXAZ2oNXr3bVbILDC8WG7RyszPJAr4W48i/rl7T2OHkzHp
	 uz/KdlEwDwy152jNwmWW6yasEbu9KASXjZV3qdKk7e+Ja0goo0C+BysOUudrCRcrsBxC6
	 J+V7WOwlWTO16bQanlOTYJSxYKz+IEC1vV62kPzX2QtLBc2DoBBQArha87xyp8yAeJA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F+r0hfJN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EAB0606A31F
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 12:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F+r0hfJN
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795435371;
	b=M86Za967rcgzv+rP8bwmo2SxFqQGbh8kpBYSbOMMpt62etrbeOT1clIPhlhA4PlPATC2
	 oI/megqntSmYLyYaOvgDOKEEVF0GbjBMJ9U9vo9MdsK4DsCqnjZgeP/ANKlzNU3N0KZV1
	 d1gXzZx0vJ4yIzXw3WxHHOiCGvFejhyUgacpzMnQ72k+rFGy3sWPJTQNHFAf3NoQ/5Uk4
	 Qj0bPcnZGRhAVY81icocRJY8ZMTm2/Jgq4d54kpxt2f99xPJc5X9CZuOHRDkCFzK9nksD
	 wghSdenWW0/ioiIVMCB2pSJghX0kDBLGqAjk5Z4HsqNKOqmDZDFha/3lgdkfHbHtIaw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795435371;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=fDCjlxFw14RtgaI/j7p3GPKMlaXycqIYqSsA9IPw8fw=;
	b=z/DVuTOWF2yHB2fiWidmykbuxcjpfH/N2O4NHn6bpyGIuai49Gd7rGw6XkHnwUvcMtO+
	 2wUkPXuncke9kwyuypCg2jsg8X/JHcmEfPcOdSoLbDEJLs6AJ7Hs68LAj7VzNpw/fICTK
	 wCypBlcZSRdjicBSjrIe3+HHwqai3aVNlq9YCAQhdLMN4SZOe5kDjJn3LQjyGjEdwNG2I
	 +kzu/Ul10XDWLREEmNk3JGR1N20/Dt6lFMnTX8kB5pNHTUdIaEEaA7FpuSjRkFB6TpwHl
	 1geeZ7Uabm8xItUusWq+eXPSSX/7G2OC75a/O47eEUmVh/VQslfOV5amlDPPGz/0q+g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 78D3C1F000C6;
	Mon, 23 Nov 2026 12:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795435371;
	bh=fDCjlxFw14RtgaI/j7p3GPKMlaXycqIYqSsA9IPw8fw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=F+r0hfJN0cHi0n6GfEIrHJ/2cfFWHfDVzRbl45TjogmltHEzftiNs3/8RnWNoPuhl
	 Os9PaZe8EIhjhGmZhPz27Ae+2rw1Y8+gW+x6BsbA9cDdvsUdd1HmpFBVDELO53ju7h
	 DqyeC0LoAnDX8QJs06uMADH+sNgEdNBeOnJksf/8IXTjAVlED0rJKHUYZKf5aebUyl
	 /oqxsROm5Wi2DFFF4RGh2BesqW/kUp7ZTIgLFgcBpmVxhURTVFxZ0eRukCmJMZ8f/h
	 KklcSvYjw2M0N4f0xV8+3g3AV94c1EOreWvMUymWBehCXhCmz9ipnb0onobcD4eql9
	 KX8rDnnzRe+kg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id EFDDF4C442;
	Mon, 23 Nov 2026 12:02:40 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Mon, 23 Nov 2026 13:02:39 +0100
Subject: [PATCH 1/4] media: ccs: Use dev_dbg() instead of dev_err() in
 ccs_enum_mbus_code()
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
Message-Id: <20261123-ccs-clanked-fixes-v1-1-fb2bcc87a517@ixit.cz>
References: <20261123-ccs-clanked-fixes-v1-0-fb2bcc87a517@ixit.cz>
In-Reply-To: <20261123-ccs-clanked-fixes-v1-0-fb2bcc87a517@ixit.cz>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1866; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=GfKr+K5WGWXwwETAeSQOVutcMvwdnlaUEXm6+5Ib7/8=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBrBCtfQDSpYx+xIeb6yn6+r9P/tpHAqG3wdobEO
 bcCHHWPI4yJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCawQrXwAKCRBgAj/E00kg
 ciXHD/9tPEb1mYDS7IGmsCwheeD4oSigaV4cLtu67HgAXkIPAg7yib8qSr4aCHa4S2MPaauDdsr
 3i1gXCxMZ8sKMNd30nXKzEfR0bHgNi82s/tQJJZN1hdPx7G4Ee0mk/47SGI9oS72gsXGGPwktiF
 pnDusV/tYoet32puz9W6n7VUy5Szow08VNpw7SiQQiikMMOlcLeyTeTNjWUJtqdkhdAd5+EN/wu
 /+fp/9adCwlHoYAykrWhOXNJa3DDyNAyWFnAFivVaIxjJ2RCJyH1/xGSs9y8k6x0vrkvrKaekGd
 jCxd5nNW5GutzkKihifuNmJ/2D0G3ke4EavHJVTDZYtl8YT1TZRacCGdeU1Ra2gcyo97NY0FBHk
 ddwry87yCmcE/Dvaz6Sp/VYaMIU9A9cecGPbPVDBfFulY1UTuTbeUP9uffT1mZk7y6Enldi/alv
 hvpatHvMVHJZMj5/nhbLnWn+duwhk+Zbl6LqK+gcevBeeS91FGP6BNsRQFN4JSvNZ0xPkECthoh
 qYb3L2hO3Uv6FkYOST/Uw/Kg7fr+C8uZrT/nI8MujePaqAK+4ysIIc2Ob7l/LaPFjSI56DCUg98
 F2UGavHcv7jzCNqrL+7spNShA0/zNbAISFsvILTXAh1uljHoS+HHlpLEYK9DBcW+RK1RQxrTHMy
 /WfDWMb2YyOg6BQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
Content-Transfer-Encoding: 7bit

From: David Heidelberg <david@ixit.cz>

Commit 63bd19442f08 accidentally converted two dev_dbg() calls in
ccs_enum_mbus_code() to dev_err(), flooding the kernel log with error
messages whenever userspace enumerates media bus codes.

Restore them to dev_dbg().

Fixes: 63bd19442f08 ("media: ccs: Use %u for printing unsigned values, remove extra debug print")
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/media/i2c/ccs/ccs-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index c3592317ee575..284cfbd89349c 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -2104,17 +2104,17 @@ static int ccs_enum_mbus_code(struct v4l2_subdev *subdev,
 			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_mbus_code_enum *code)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(subdev);
 	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
 	unsigned int i;
 	int idx = -1;
 
-	dev_err(&client->dev, "subdev %s, pad %u, index %u\n",
+	dev_dbg(&client->dev, "subdev %s, pad %u, index %u\n",
 		subdev->name, code->pad, code->index);
 
 	if (subdev != &sensor->src->sd || code->pad != CCS_PAD_SRC) {
 		if (code->index)
 			return -EINVAL;
 
 		code->code = sensor->internal_csi_format->code;
 
@@ -2122,17 +2122,17 @@ static int ccs_enum_mbus_code(struct v4l2_subdev *subdev,
 	}
 
 	for (i = 0; i < ARRAY_SIZE(ccs_csi_data_formats); i++) {
 		if (sensor->mbus_frame_fmts & BIT_U64(i))
 			idx++;
 
 		if (idx == code->index) {
 			code->code = ccs_csi_data_formats[i].code;
-			dev_err(&client->dev, "found index %u, i %u, code %x\n",
+			dev_dbg(&client->dev, "found index %u, i %u, code %x\n",
 				code->index, i, code->code);
 			return 0;
 		}
 	}
 
 	return -EINVAL;
 }
 

-- 
2.55.0


