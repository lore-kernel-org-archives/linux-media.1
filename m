Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171BA358388;
	Fri,  3 Jul 2026 09:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783072483; cv=none; b=Dz9Ak5fZuwcVmxLjUm7AbJGRDuD0XSJulWH5oSxWuQ3E+9A4znMqS3KbI3cdMTQD/+0mLUCAqmOGZx7c7d0AhSdyspScdGEhYM5E9QVNv5JUcQV/s+0T3Ui7FvjRseQt9UQfyGx395JJY1MX/DApXnQpn0dKhMo7Nr+76WEESHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783072483; c=relaxed/simple;
	bh=+/G7D0z0QRfTM6h+e8Ab+Ip0R4CdqxyQZvwKOIiK14E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PWJMqxwYOhs91sVZhkvW8KeT3gu08IgeKohB+5DtqHyhnupOVnaWlx7GJl/8dzKz8Kt5zMm1yw6kA94HPE82HXJc+0QOXldSRWUln71IN1T/8R4SRESdPyi0CuKdNSwDqqt5YUtkwVJVhTJFVXy+R6mQN2IMKts3F39tH375eVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FYZKd3pj; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FYZKd3pj"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:8a87:d565:effa:ccf8:a720])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 295A41121;
	Fri,  3 Jul 2026 11:53:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1783072432;
	bh=+/G7D0z0QRfTM6h+e8Ab+Ip0R4CdqxyQZvwKOIiK14E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FYZKd3pjniX8FZwEH0D/CeKD8sK/F7C2Yp4vbt0nHIC3P2w5vsg4kKgJUJVTakKd4
	 dOmRfqxmDcLP/24PpNih08bXmeEQkb0IutucLcLjYMhcSRW6c+woMMNYMRHAepLWXT
	 hhbpo8zWXN+lWlL0dvuz5RvkNHZxYwj72s84FoTc=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Fri, 03 Jul 2026 15:24:06 +0530
Subject: [PATCH RFC 01/10] media: i2c: imx678: Pass v4l2_subdev_client_info
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-imx678-meta-v1-1-7c4924a0df05@ideasonboard.com>
References: <20260703-imx678-meta-v1-0-7c4924a0df05@ideasonboard.com>
In-Reply-To: <20260703-imx678-meta-v1-0-7c4924a0df05@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Lachlan Michael <Lachlan.Michael@sony.com>, 
 Ryuichi Tadano <Ryuichi.Tadano@sony.com>, 
 Kengo Hayasaka <Kengo.Hayasaka@sony.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1191;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=+/G7D0z0QRfTM6h+e8Ab+Ip0R4CdqxyQZvwKOIiK14E=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqR4bKFHOSxfcV/yT/ZyWGF4AmOm/4swqT9wre/
 uV1FEDbF8eJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCakeGygAKCRBD3pH5JJpx
 ReRRD/9w0CRzmemBWg+KkjtGhmx7y0HsUF4+3BO1JB2lg96kjuPYgmpOFL9QjNIBibZSbQcvPcQ
 iiyUhnwN6auVuuBDqCXB9j4jzNFA0bTUxi3uPKktV2WwcqhvQniOZfgqgMPKjJMUvLtuFcmGTu5
 vmzOCRkZmygp0lPH7AGqfvWJ4rQn67JtHeD+dNnwEMw3bU86ACmCmplnJF+iDUegcM+fiVNHSmL
 ZrNXksXujBnGetvnWocVDgN4BAvrICwbJyKexvzhKYPnzbHdRceMq4nQ0AukJQf5cQnd+/3741i
 nvTtcQdfSvrSooImZBQQmbhSnao2CDUP6dPWriNugzOj6XbXQhcnZc/O64kc49viyeTPaK6Jil8
 O9glSKOQvy3641Wsa7gvbRLy3Ofu95FXjqQw7axNFlXmhU/fdMu0h9eeSCgYQPPJHROWNUr21Hb
 kiWe5X/sr8tVRd5GGTKAmWu52GT1ugjHdLsU4bcj4K2n9TQ3f8JT4+UmJpSGu+ijCooVbk53F9b
 c0Vc0UMlQWeDD6n6u7aA2MF1Z3OM6YZMThCZXFJAQ5ZtrfpigzQQ0GiXX6bs0BktczTQp9BpDPo
 sOUhopqqLrRGywOolnwGuuDAiqiTIdNTfetIkEJYguCet6kJB2Z55yhx1m70kifA5zxLTb6PxSd
 J3BHCWjwfkl9BPw==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

The new common raw sensor model series has modified the hooks for
set_fmt and get_selection to pass v4l2_subdev_client_info structure.

Update the driver to make it work with the new model.
---
 drivers/media/i2c/imx678.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx678.c b/drivers/media/i2c/imx678.c
index 83626c3eb744..e8bf01bad7f2 100644
--- a/drivers/media/i2c/imx678.c
+++ b/drivers/media/i2c/imx678.c
@@ -848,6 +848,7 @@ static int imx678_enum_frame_size(struct v4l2_subdev *sd,
 }
 
 static int imx678_get_selection(struct v4l2_subdev *sd,
+				const struct v4l2_subdev_client_info *ci,
 				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_selection *sel)
 {
@@ -1129,7 +1130,7 @@ static const struct v4l2_subdev_video_ops imx678_video_ops = {
 static const struct v4l2_subdev_pad_ops imx678_pad_ops = {
 	.enum_mbus_code = imx678_enum_mbus_code,
 	.get_fmt = v4l2_subdev_get_fmt,
-	.set_fmt = v4l2_subdev_get_fmt,
+	.set_fmt = v4l2_subdev_get_fmt_ci,
 	.get_selection = imx678_get_selection,
 	.enum_frame_size = imx678_enum_frame_size,
 	.enable_streams = imx678_enable_streams,

-- 
2.54.0

