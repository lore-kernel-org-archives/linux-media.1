Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33567368D65
	for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 04:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787028938; cv=none; b=sKT7ujscO9EaDkTsKKEWTTqJaU2iDTMrQFH8Ki3ELQD7+Z1+Gw1qaXtmGWxeGuUq2ugy0n7xapMd6mRfqEpdJg9Fx7J88D6W9+Tnva7zQYu8fRo/CQudTnCWT+oWESsf2Ht/O85V2jCqD+ZzzudFb/RsVw+AG73ylibi+lmdb3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787028938; c=relaxed/simple;
	bh=o4+aZ6qS0S9nkK81uPz+cUCUIngJN+MKKpptDZdgbkk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ah8pzUtpH7Br6k641A9x3xFoSQzi4A82ZXf+xB5kLFcWc3Zws8UWvkLP1IXjX/F+EcU4ixbOx8zDyJR9AUwb16Hs2x3xPi5nybM8Q/IkPBfLrQCB5iUQcpqvNzXF0DJ1wK2Lq7nGSd4IlZ4uNu5w/SKrCDIYRZNsTDWLagPEKH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R9+r6LDA; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R9+r6LDA"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-8edda5d56a5so44434456d6.3
        for <linux-media@vger.kernel.org>; Mon, 17 Aug 2026 21:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787028936; x=1787633736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wc1B4UKGofVVH26ecK+ofT0cydYY+iUUwt3ZyLVBedk=;
        b=R9+r6LDA3Xn+S/lYbFDZCeT8SGWO01cNC4BvR7OwUBV6EM4RPLA5M7UWrLWvPKTDK3
         GLLdICa8NOVoEtU4Ve/nPkW8HeOc2DKUAZFHJgiWBN/JvjXQco/uAxS/wtF5DEFv1cbX
         OSb53Xr86zUHNM+sqCUHyDp1l4fGLRptFimOnuGHvaFb8Sb0rlXSvtpyiH5keKVrc4xm
         cPNs/d8YnTihaA1lI9qHzj0NObvHVgikRLm9W8U5M8XywTsLmcq+vRaafgNc0PWIHdOX
         j2Kh6XFPoHgVX73fE7oy+RJcLfg257xx/AydkZAgyi/d/kLf1ZSNzxHWrYyyvKOFjNTs
         Qkpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787028936; x=1787633736;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wc1B4UKGofVVH26ecK+ofT0cydYY+iUUwt3ZyLVBedk=;
        b=EkxuVCtJ/xndP3bm1ib8gIqwHKiRjYNzw0EKdwXIaZ3TZZgeW6whjL+zdLwINiyg78
         wQB4irzml6VJFZVsUL9jZg3OzA7NVb8HpKQ+S0sHW62wYaNAS7G+SUwYBk6YCC/yvKcS
         g5028+rTNMlcQq2CK/ntoRd5O6Ac3na+WslsQ2XRVCPhaMCmm3p2LsCSXfj+1IyVYceK
         RFqgtYkHoUMkMpPjqVWBXnxF+507uSvfGjjaUtTzNKPGMPhDRRY3Wy1h2iZzico5+ROh
         jQ17ToYAm3fvWerKDICXe5SAZVmY5mK3KSZBE3tb4BKi7gM8ByQ4/XYVlxYpxhWbE3Tg
         8qTA==
X-Gm-Message-State: AOJu0Yxpt9NdXBJoXAWpaE+PHZGe1LksLDJN8pJq/L90NNFiYYj2QopW
	Pvpu3sbKthiXdkC64cgI/Euf06y3vPsmUdP30BHKM9OiVijn90tyeZfFkt/u6ITv
X-Gm-Gg: AR+sD10akeqgDFN6BvXippG/XmHLp4eMZBR3Tt+0O7r9G2HktfQ8X88JBAgfULj4p1Q
	VApwbZ+d1sksa4qPBqqUIFzWicnCZpN54+O0toLUENH2bSIxgdZ4pHphY92oRd37NrPIShL9jTR
	zoQNhsGA/kTBnJyOycKb+YrIUKnUrRyInA+yLFfEQi8oBDA1mrSVevNVhXPQ+hWMeId4pRcR/GN
	bZ5B3X3F9oT8/AbHZJNM4MM+v5GVPUDXBUlsw9+pRh9slE5pBA9IYBPnBAEt3GGsEEch8bflTiU
	HXUcee0l6OzEI6ZdQuuPmhd//iye2ifj1b5pgXnK9j2lLgpCjWX0PNc3taKUZtA1vDePvKr0uqO
	4SFRkYbvmvIlXSaWfDiExDL8JTButYcswvZjlqyLLMuMK73VwD4Q7PNJtdPJfegk8C3IFL3lVQw
	vG8hMPYiHe0jIUfbuyky0odwtaFSQ/mNWoQeHI4oKE2gDJQz8QeXr5H7VitCs8jBuQJLsrLIMAz
	HX3yUw+r4EN079J6Q==
X-Received: by 2002:a05:6214:53c3:b0:906:2b80:4684 with SMTP id 6a1803df08f44-90a91cf1279mr338284886d6.3.1787028936056;
        Mon, 17 Aug 2026 21:55:36 -0700 (PDT)
Received: from i4-l-hqh5357-03.ad.psu.edu ([130.203.139.71])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c4d0c0360sm12345536d6.16.2026.08.17.21.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 21:55:35 -0700 (PDT)
From: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shuangpeng Bai <shuangpeng.kernel@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: dvb-core: remove active network interfaces on release
Date: Tue, 18 Aug 2026 00:55:21 -0400
Message-ID: <20260818045521.1600266-1-shuangpeng.kernel@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dvb_net_release() marks the DVB net instance as exiting and then calls
dvb_net_remove_if() for each network interface.  The latter rejects an
interface while it is in use, but the release path cannot propagate the
result and leaves the netdev registered and its feed active.  Callers may
then proceed to tear down the demux and driver resources on which that feed
depends.

In ttusb-budget, a concurrent netdev open can be starting an isochronous
feed while disconnect passes the failed interface removal and frees the
driver's URBs.  If URB submission fails, the feed-start error path can then
call usb_kill_urb() on an URB freed by disconnect.

Keep returning -EBUSY when userspace explicitly requests removal of an
active interface, but use the exit state to let the final release proceed.
Unregister the netdev first so the networking core blocks new opens,
synchronizes with an open already in progress, and invokes ndo_stop for an
active interface.  Wait for the feed-management work to finish before
freeing the netdev.  Since set_multicast_list_wq can restart a feed after
ndo_stop(), stop any feed left by a completed work item.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
---
 drivers/media/dvb-core/dvb_net.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/media/dvb-core/dvb_net.c b/drivers/media/dvb-core/dvb_net.c
index a2159b2bc176..a5726a006bc1 100644
--- a/drivers/media/dvb-core/dvb_net.c
+++ b/drivers/media/dvb-core/dvb_net.c
@@ -1404,18 +1404,26 @@ static int dvb_net_remove_if(struct dvb_net *dvbnet, unsigned long num)
 {
 	struct net_device *net = dvbnet->device[num];
 	struct dvb_net_priv *priv;
+	bool exiting;
 
 	if (!dvbnet->state[num])
 		return -EINVAL;
 	priv = netdev_priv(net);
-	if (priv->in_use)
+	mutex_lock(&dvbnet->remove_mutex);
+	exiting = dvbnet->exit;
+	mutex_unlock(&dvbnet->remove_mutex);
+	if (priv->in_use && !exiting)
 		return -EBUSY;
 
-	dvb_net_stop(net);
-	flush_work(&priv->set_multicast_list_wq);
-	flush_work(&priv->restart_net_feed_wq);
 	pr_info("removed network interface %s\n", net->name);
 	unregister_netdev(net);
+	flush_work(&priv->set_multicast_list_wq);
+	flush_work(&priv->restart_net_feed_wq);
+	/*
+	 * set_multicast_list_wq may have restarted a feed after ndo_stop().
+	 */
+	if (priv->secfeed || priv->tsfeed)
+		dvb_net_feed_stop(net);
 	dvbnet->state[num]=0;
 	dvbnet->device[num] = NULL;
 	free_netdev(net);
-- 
2.43.0

