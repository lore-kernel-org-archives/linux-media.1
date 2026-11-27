Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795811425;
	b=BxNX7GuuQcZYk0IiGB9GwIJLagyrp46zEh4jyghlOnEgubA9hmIQrpKJBCSx+JicC7ql
	 E7wxWY1/BVw6JDupa2N7xTvvTdFxqtBfDxAyu49rWbXAQm8x4KKbe6ju7Puf62s21TNJc
	 dv0ol/NOwFF0OKK0R99YRqqe2et+RgZ3z+X3gnoTYYufLLhHJU1Y2yI78yv1E6nam4v9t
	 7S0BafGpU1svUmR+Jtd2+sjqLTKmRo1TLzsNv58Jc4GGGau5E6OzVYp/ZDSToarugUefw
	 /uMdaqEI9o0jN1sclW6xJYrofTzjpcdxwvk1Lra5vPLYL35h2VMzWzXZk82Yd1uqgcg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795811425;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ygJkMbf/2he9r7p0Cp6RA+yU3y2u6bX36KvBsDq4T6k=;
	b=lfN2lhXn6mJ7iyS7HD8wGO6/2qqYboXBzqIONcHPn1P5MyoQVI636nXNK46kmTBB3XLh
	 TD1Roy9SLNRRSSB+0pzmAiB2g47XyaZFqLbdGB0QOJqCc6GXiKBuirnozd2h5Nd8KWfO3
	 k//sKv6U0X27PFTj3RJm9Vm1gDuE0UeZLTgbfxSeaWQt2g7nvF7z+wUC9291OQoLDiLT/
	 pL3wZBOjc5j3hUYeWkYs9xXzv3AXA3LVEEyoI9uRy1LkcEVYJuS74Yg1zCyCS6d3cLnLe
	 oQ7loa9ckz4P4DNuQJ/nWicR0dttlOIQSVQ3pd/tGZ80u3TZ8teE0qbYkEYMw7i1L6g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gyaFtbb5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C46B606A31C;
	Fri, 27 Nov 2026 20:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gyaFtbb5
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795811425;
	b=YE7qw9NtwGMewlo8BqixXeBzFDIdDefhChkajPi1s79lW/ujJjyJUpi0I8cCmumd/5Uz
	 yec3GSEXO9nKd3hf19IWvTFeSMEtiR1fCl3Sw7ir0zPy9TqnRIH5BddwIqfIOV3+oZz8N
	 1HCS+cW3GGYML34SrUMtNbPDWgL0KJL8C21mwlwhLim7EE+Fa16Vw013uUvba85QURDlG
	 K9TjZ+k9K1VZJc+01JroVW7pRsV/DWJe3DyeymBg+BU6xZpHK47tcWfj+5LRy2PJmKO53
	 b2s/dwxp/7O9P0J8rmaACm2HGmkLIicn0N/ZuOA+2oM73vxomjjA+T/ZpYzgZQSCr5w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795811425;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ygJkMbf/2he9r7p0Cp6RA+yU3y2u6bX36KvBsDq4T6k=;
	b=dwr5p6CXIY0fsjSyMORF/FO/obeXGcyZcZWivkUXW4XWr6dovcaLJSIWqKz9n3v1CBM6
	 snCD3XFaRRV4yPLXIzf3uoAqn/azpQneZTUDu8bZ/ZSRVlm2Pd9zBMMLmfdlu8HGYdEYT
	 9YRvlfS62XAJD8CA9Bw/7JJTyPvUQ8NvnsqEz/tSruHbofDQGHWRaG/w4TFbMBgUamGac
	 f/ayI/YlP18h1hHkpW6XrghEQJOabP0s0EymQ0KDLSROi5sEJdt+2x23VMOv/GBVuMO31
	 nGNbHyshv5av7T4zJW1X5y5o3KCVV5TYrOCJXnvUoUqOrrMEWUoQf2tujnnxzQGBhrw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DA4781F00899;
	Fri, 27 Nov 2026 20:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795811425;
	bh=ygJkMbf/2he9r7p0Cp6RA+yU3y2u6bX36KvBsDq4T6k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=gyaFtbb5S8itdI6g+LYDLWsjpZQ0zkXbLset/zMSzssaDjlYCUBScH0/IZk8naEto
	 rUr/gt7VnQz1KojcLZg1X84Yejr240odBwhBzfuP9CRzonyrWhsTKh40Eha4f0glWR
	 NFLSqSrYLqTmfKfsGTucQQ3ZILtVRn2uEV8xw7vOt5D7iNvN+TVNs4017gyeoZ8+fY
	 AuFzshsw3MHhNaBO4hoBhfQ/Lxlcsmu4vkBLhBMBQwF4DpJpU0NTXjmWMRKfnNOUxk
	 Z4s+IdAzRfSCvRbWssQ0WGCRYA/8c7z1j+B2v3+Szy7fXUmMnYIzmHNkBqUzaIBPHc
	 OI888aejHiy9A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 64D6E4DDBF;
	Fri, 27 Nov 2026 20:30:13 +0000 (UTC)
From: Robert Ijtsma via B4 Relay <devnull+robertijtsma.gmail.com@kernel.org>
Date: Fri, 27 Nov 2026 21:30:14 +0100
Subject: [PATCH 2/4] media: i2c: ov7251: use pm_runtime_put_autosuspend()
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
Message-Id: <20261127-ov7251-strobe-ncont-v1-2-cefa8c6c020b@gmail.com>
References: <20261127-ov7251-strobe-ncont-v1-0-cefa8c6c020b@gmail.com>
In-Reply-To: <20261127-ov7251-strobe-ncont-v1-0-cefa8c6c020b@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Jacopo Mondi <jacopo@jmondi.org>, Todor Tomov <todor.too@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Robert Ijtsma <robertijtsma@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795811412; l=1739;
 i=robertijtsma@gmail.com; s=20261122; h=from:subject:message-id;
 bh=gErO0p9aK1yRxQdJb89ZcwQcXYtyiVlMBOlVrQz7Oiw=;
 b=88n+Sz8iFxi/ox+amXJ2lbBOdkooWOAkdyRY+efoaTeoZznwZZRTZszLOIqubfdoFSJnrqzOd
 OL0JlSWKKi2A4ZtaABy0AzBgOlCQNVndftg0/YJ/tYH4nT5gkVq+IQl
X-Developer-Key: i=robertijtsma@gmail.com; a=ed25519;
 pk=qiDyKVqFicxFIR5sB5m+p9SWPKL2/+mMoiQnUx0C9P0=
X-Endpoint-Received: by B4 Relay for robertijtsma@gmail.com/20261122 with
 auth_id=1604
X-Original-From: Robert Ijtsma <robertijtsma@gmail.com>
Reply-To: robertijtsma@gmail.com
Content-Transfer-Encoding: 7bit

From: Robert Ijtsma <robertijtsma@gmail.com>

ov7251_probe() configures runtime PM autosuspend with a 1000 ms delay,
but ov7251_s_ctrl() and ov7251_s_stream() call pm_runtime_put() without
updating last_busy or using autosuspend, immediately powering down the
sensor on stream stop or control writes.

Use pm_runtime_mark_last_busy() and pm_runtime_put_autosuspend() in
ov7251_s_ctrl() and ov7251_s_stream() so the configured autosuspend
window is honored across back-to-back captures.

Fixes: d30bb512da3d ("media: Add a driver for the ov7251 camera sensor")
Signed-off-by: Robert Ijtsma <robertijtsma@gmail.com>
---
 drivers/media/i2c/ov7251.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index 77ac60fad62209eda0444015196e52564a0e947d..5a50a5100c1e995714201fb509fb207fa03c5f39 100644
--- a/drivers/media/i2c/ov7251.c
+++ b/drivers/media/i2c/ov7251.c
@@ -1074,7 +1074,8 @@ static int ov7251_s_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	}
 
-	pm_runtime_put(ov7251->dev);
+	pm_runtime_mark_last_busy(ov7251->dev);
+	pm_runtime_put_autosuspend(ov7251->dev);
 
 	return ret;
 }
@@ -1378,14 +1379,16 @@ static int ov7251_s_stream(struct v4l2_subdev *subdev, int enable)
 	} else {
 		ret = ov7251_write_reg(ov7251, OV7251_SC_MODE_SELECT,
 				       OV7251_SC_MODE_SELECT_SW_STANDBY);
-		pm_runtime_put(ov7251->dev);
+		pm_runtime_mark_last_busy(ov7251->dev);
+		pm_runtime_put_autosuspend(ov7251->dev);
 	}
 
 	mutex_unlock(&ov7251->lock);
 	return ret;
 
 err_power_down:
-	pm_runtime_put(ov7251->dev);
+	pm_runtime_mark_last_busy(ov7251->dev);
+	pm_runtime_put_autosuspend(ov7251->dev);
 	mutex_unlock(&ov7251->lock);
 	return ret;
 }

-- 
2.47.3


