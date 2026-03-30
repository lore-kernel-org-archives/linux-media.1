Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D573BED71;
	Mon, 30 Mar 2026 10:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774865516; cv=none; b=qy2ZE0kz+s/KpBmGoYtbnf80lfxs873cbESYHtjuefXIyZ2s3r7SkECvolEKqIlqgr1jhkCH8NSQsDXxspPSImUoqLstP0HxbWbJ9dhAFinGOvDW/gqLH+gWgY09XZVlyJFCIgOt4OFMWEpWme4uEQiFww5Qdr8W7SsiyXaxLuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774865516; c=relaxed/simple;
	bh=6VibEfDAOyJ/XX44ABuAxySDVtz6MUTLimWq8vsgG2I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aimJtcBK5crEcMup3YKJTHc5+UlnukUvmcG0ZleNOJOdeQ4Eg/NcU6CO2NAsjWsuL9G0LmVLE3/AgvrUs5a5/8/RzRC804rGuxO7olO0YUtpB+X2/QSJgRRjxJUKUvGuoX6uCriJLqS/V48kXowVrGCEI9TGGHJFNedVO1dXCgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CxD6eS8d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CxD6eS8d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DD32C2BCB7;
	Mon, 30 Mar 2026 10:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774865516;
	bh=6VibEfDAOyJ/XX44ABuAxySDVtz6MUTLimWq8vsgG2I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CxD6eS8dLSI5fSuDPt9HIxzH6s027/A1HnNeldpnoEBXgJzRMkeIr+562ymzmYrJJ
	 42sKJjxz3AHoGe4apaOEbcJxxKFNd0Ok24ZIcslt/acboT3fi6R30tvoI/UDZU7mQg
	 EulGARPqdOuw/kbue1wapeLriOi64W4bb+VptFmcTnY42hjALaqVm4ESyIQbIZZ3Rt
	 QTUqwktOGlq4N6qyLOP1/Am//KemvQqMG4i39XT7g4TMSTXVps49TZvzxobdqj5An9
	 htdXeFx+w4TMOzP285Yr2K6Cx1HGxbpY7BkoyVpgw5QluibhnmwE3jG/8+QGXjIOq7
	 VJHnBbjcQRWrg==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1w79b8-00000006yvm-1VZD;
	Mon, 30 Mar 2026 12:11:54 +0200
From: Johan Hovold <johan@kernel.org>
To: Hans Verkuil <hverkuil@kernel.org>,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 6/6] media: s2255: refactor endpoint lookup
Date: Mon, 30 Mar 2026 12:11:41 +0200
Message-ID: <20260330101141.1664143-7-johan@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260330101141.1664143-1-johan@kernel.org>
References: <20260330101141.1664143-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the common USB helper for looking up bulk-in endpoints instead of
open coding.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/media/usb/s2255/s2255drv.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/media/usb/s2255/s2255drv.c b/drivers/media/usb/s2255/s2255drv.c
index 2c02873d09b5..0b8182edf8e4 100644
--- a/drivers/media/usb/s2255/s2255drv.c
+++ b/drivers/media/usb/s2255/s2255drv.c
@@ -2240,18 +2240,14 @@ static int s2255_probe(struct usb_interface *interface,
 	iface_desc = interface->cur_altsetting;
 	dev_dbg(&interface->dev, "num EP: %d\n",
 		iface_desc->desc.bNumEndpoints);
-	for (i = 0; i < iface_desc->desc.bNumEndpoints; ++i) {
-		endpoint = &iface_desc->endpoint[i].desc;
-		if (!dev->read_endpoint && usb_endpoint_is_bulk_in(endpoint)) {
-			/* we found the bulk in endpoint */
-			dev->read_endpoint = endpoint->bEndpointAddress;
-		}
-	}
 
-	if (!dev->read_endpoint) {
+	if (usb_find_bulk_in_endpoint(iface_desc, &endpoint)) {
 		dev_err(&interface->dev, "Could not find bulk-in endpoint\n");
 		goto errorEP;
 	}
+
+	dev->read_endpoint = endpoint->bEndpointAddress;
+
 	timer_setup(&dev->timer, s2255_timer, 0);
 	init_waitqueue_head(&dev->fw_data->wait_fw);
 	for (i = 0; i < MAX_CHANNELS; i++) {
-- 
2.52.0

