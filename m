Received: from mail.auroraos.dev (unknown [95.181.193.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2688F2BEC4E
	for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 20:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.181.193.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787256745; cv=none; b=aFc63laETfBVM7bltySHvcLVbrg6dNrHOZ1lXlEb+CCYobo5Vr55Ws/eb2vjGu/fXv4w/Bdy1HBF4hCoBbvmLOgW/epL4o+roaeSedpcvRtxAvxTY/5xhvf5D2i4ne+dbqYYPdFzHurrwtu+S2iuSm+wnhYjRo5F6dFHuw8PsXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787256745; c=relaxed/simple;
	bh=KkQc4zQW+W/cFQ0dJ/fRdgRHFixpS1zk3XGOkhr+QzI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=n73Q/GLi5e+6v6PWOqZuWEmUAwhEZBzDwMIUuO9YiZmZmWYWV9NLtBhPF2QtSjsHKv+NdPSe2PU6D+Ma+BFB4l7wXoBsbXm3Yws3KbCD+UszLnn88QQmX+pdJvWOGtBdoz4/Dwgvt6dpJJ3OZA8qqv+GuQNKgvcziTGmydntoE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=auroraos.dev; spf=pass smtp.mailfrom=auroraos.dev; arc=none smtp.client-ip=95.181.193.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=auroraos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=auroraos.dev
Received: from wasted (91.79.14.115) by exch16.corp.auroraos.dev
 (10.189.209.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Thu, 20 Aug
 2026 23:12:06 +0300
From: Sergey Shtylyov <s.shtylyov@auroraos.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede
	<hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	<linux-media@vger.kernel.org>
CC: Sergey Shtylyov <s.shtylyov@auroraos.dev>
Subject: [PATCH] media: uvcvideo: drop useless assignment in uvc_parse_format()
Date: Thu, 20 Aug 2026 23:11:25 +0300
Message-ID: <20260820201128.35669-1-s.shtylyov@auroraos.dev>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: exch16.corp.auroraos.dev (10.189.209.38) To
 exch16.corp.auroraos.dev (10.189.209.38)

Close to the end of uvc_parse_format(), the parameter buflen is decremented
(again) but that statement seems pointless as buflen isn't used afterwards.
Drop the useless assignment (gcc doesn't generate any code for it anyways).

Found by Linux Verification Center (linuxtesting.org) with the Svace static
analysis tool.

Signed-off-by: Sergey Shtylyov <s.shtylyov@auroraos.dev>
---
 drivers/media/usb/uvc/uvc_driver.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index e289cc71ba98..0e78e8bcd320 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -520,7 +520,6 @@ static int uvc_parse_format(struct uvc_device *dev,
 		format->xfer_func = uvc_xfer_func(buffer[4]);
 		format->ycbcr_enc = uvc_ycbcr_enc(buffer[5]);
 
-		buflen -= buffer[0];
 		buffer += buffer[0];
 	} else {
 		format->colorspace = V4L2_COLORSPACE_SRGB;
-- 
2.55.0
