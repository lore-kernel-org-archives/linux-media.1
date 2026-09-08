Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993CC4ACC8B
	for <linux-media@vger.kernel.org>; Tue,  8 Sep 2026 10:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788862242; cv=none; b=ucLDrQezUF7g54uZB9RFrkpwkRR7GXxmnX4og9ZMokbjzA8ToNnZLO1nNpYWXapiw9QqMLCezQoUivvEyIQi9LNtD8ywq8YiOixBqd/7lvEz3HKBoR0kt88CMOv199kjoiRq3Uy2Up8Bli0pB/fu7Vy+i7giBSfiOzmxw9Z0H4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788862242; c=relaxed/simple;
	bh=+ujdfW8YxHVPRr77DGmnHeLhpLDIDjGR/+8B+WNt41Y=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=QsbS2/RPfWZyQAFCzC59y3nFCZQ/fwwjaI2uQSKQQdeuU5z4CP7eiPU/7zlU5SR67mutw9q/VbhxtuOFsQ/MTBHRzhj+0xpuYf4MRokbyXTpHfnyDx3IW2IdUZn431+LTy77PVsUCtZnU1lC0gFpTDOmfgNfTqjT1j3aBP/L7kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c8Lp0jqu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c8Lp0jqu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAA5E1F00A3A;
	Tue,  8 Sep 2026 10:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788862241;
	bh=rA1/W9Y36q+86qNcgQb2p+pv6ZIAHvM45gs/2wcmLrU=;
	h=Date:From:Subject:To:Cc;
	b=c8Lp0jqulB6VMjvjBGiYJS5mt9CnJfQdxjDGAd+uHBrKZpr/dG2QRxoY9rQq/vpjI
	 MV7+4ykr3UEaPzMxFcXkfHhhI1WJ6BIcWFRbReshnSP5m/M1dKUcodsXE8l4V8j+ap
	 6c6OU5SpddEqrr0OXC8YeaL3Ot3TYXko6nqPPt2A2x0Kn9g4EWn+Y53wsixapyQ3d/
	 eROwBm5iM7Iz+iy61qqZaHWUKzmawgwpAknc73MqGi/n0MopQQDcZDU3STqslj4q4H
	 3POPtT+C+vOOKcC3elPHj8MffNr88GXxqc1Hb85oo3UkA7Crq9Wc+XExCa51pD+QZM
	 cehK7Bom+Peog==
Message-ID: <4485e8c1-d59d-4f01-9612-35b5cf734816@kernel.org>
Date: Tue, 8 Sep 2026 12:10:39 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Content-Language: en-US, nl
Subject: [PATCH] media: vim2m: give vim2m a proper control ID range
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The vim2m driver has two driver-specific controls, but the
control IDs were never reserved in v4l2-control.h.

While these control IDs clashes with the range reserved for
the old meye driver, since that meye driver has been removed
from the kernel quite a long time ago we just officially claim
that range for the vim2m driver.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Reported-by: Nicolas Dufresne <nicolas@ndufresne.ca>
Closes: https://lore.kernel.org/linux-media/71a3fa9710cf1afbb80ebe850878557c3e95a1b2.camel@ndufresne.ca/
---
 drivers/media/test-drivers/vim2m.c | 4 ++--
 include/uapi/linux/v4l2-controls.h | 9 +++++++++
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/media/test-drivers/vim2m.c b/drivers/media/test-drivers/vim2m.c
index bb2dd11eef0e..b16111067f68 100644
--- a/drivers/media/test-drivers/vim2m.c
+++ b/drivers/media/test-drivers/vim2m.c
@@ -150,8 +150,8 @@ enum {
 	V4L2_M2M_DST = 1,
 };

-#define V4L2_CID_TRANS_TIME_MSEC	(V4L2_CID_USER_BASE + 0x1000)
-#define V4L2_CID_TRANS_NUM_BUFS		(V4L2_CID_USER_BASE + 0x1001)
+#define V4L2_CID_TRANS_TIME_MSEC	(V4L2_CID_USER_VIM2M_BASE + 0)
+#define V4L2_CID_TRANS_NUM_BUFS		(V4L2_CID_USER_VIM2M_BASE + 1)

 static struct vim2m_fmt *find_format(u32 fourcc)
 {
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index affec0ab4781..9e3a59638287 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -123,6 +123,15 @@ enum v4l2_colorfx {
 #define V4L2_CID_USER_MEYE_BASE			(V4L2_CID_USER_BASE + 0x1000)
 #endif

+/*
+ * The base for the vim2m driver controls.
+ * We reserve 16 controls for this driver.
+ * The vim2m control range clashed with the meye control range, which was not
+ * intended, but since the meye driver has been removed, we can just keep the
+ * vim2m control range.
+ */
+#define V4L2_CID_USER_VIM2M_BASE		(V4L2_CID_USER_BASE + 0x1000)
+
 /* The base for the bttv driver controls.
  * We reserve 32 controls for this driver. */
 #define V4L2_CID_USER_BTTV_BASE			(V4L2_CID_USER_BASE + 0x1010)
-- 
2.53.0

