Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080A65B206
	for <linux-media@vger.kernel.org>; Sun, 27 Sep 2026 04:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790484355; cv=none; b=C19K8joewt9Rx4Sop9r7ZPpc8Tts3e/KSXt4zMLszJOxIpkIH8dlcRoVBaa+8famsw2T/hFX+livqGPwmVnvfUfHNxXQWuOro4c+vckoq9WGpgOp6s1WsCpm5YVecIL1Pdh/FiRYN1ElsREbW5Oz9Vq/vWcMIbyflqjde0wryzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790484355; c=relaxed/simple;
	bh=lwbuO94m1Y7nNgaCvIakrp+Jlj/Ls07Kcmk7d5tERa0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GWvR9g4toHU7MFn5+xa6BPZSpNyTe0tB6ZXDq1YiPsHLsr+SZq7zcL/ziYT4BSYrvk+5DsSZhl9a9HckMaq4p0XDuQiZ66n3A6p1OOetKBDc8IBkxTwzjeEG9EnKI79SzSq4F1Q6+GrsLQ7ob4eZVPOQGL4ZVcrJ+HPmK6vDUD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nXFRQ4JV; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nXFRQ4JV"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2dd77300825so11627475ad.1
        for <linux-media@vger.kernel.org>; Sat, 26 Sep 2026 21:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790484353; x=1791089153; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ILSKS40563v3cg9jd/GJ4zISgLCLK1UIjjAKEYNJvaw=;
        b=nXFRQ4JV4vIkc+BBIZ0Qz8+T9fNbi/b3nFYdqeYNasbq9grXxnsliYgd17j+vxpE4V
         gmomqKxIOZX1bptZBPJPWiQi4yJJl/UFnbQjhVWJJNqcI/JCOJ8bt5xRLWqziQNtUfgn
         /p0Za51WPxJELYhk99i8OGCBGcrzS3ACywXTPMjvKylMOmxZWn+fphCUdVWCJwyNZbWz
         3I6XiFe4FfYojHyQHslkk0N/s4gRR9vvvqQvN2PgoooYNEcejac4KqprW3Jej4P+wEe5
         tcqJWiOwsflWNcwLrIeY66Gvx9yqP29fwjux6JXnKKiI/5m9f/B6JfYMehSOJU2VsvBp
         4U4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790484353; x=1791089153;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ILSKS40563v3cg9jd/GJ4zISgLCLK1UIjjAKEYNJvaw=;
        b=mjcUFxxFgTTUUNqJpzop3CQFKkFe2QgSsi2fQ2ZSAUNZVmozcZcECwJnRteeQUwvJ3
         u7oSPeJ+nZeQZJ5MFmtJ4PyedwU4ONG1SvIsQ9mTxjUXcQy9xDwAzZhaeX1N/iZqVKvu
         Tg7jxH73OPq9kQhgy8f4ZbKGogOpcu7YJ2WWp0absVueOgmOUGFAsGKOHbWzRaGYqoY8
         ZwUO/ggRGDMM/sINE5vUPTEOYJWQGNlLVnE5kjaLaNxaVTD87GMVhYkX9ADQ+ufjC4DA
         fgPhlbn2HINA7YmEiZ08ya9cDaigULyzh/0TE+dOwezuLf/0OOJ1hGeFC8pKcXUADa7R
         qJ5w==
X-Gm-Message-State: AFq9FYJ6GY5akfK72ssGx2CotBIklMsMpP4EK/a9qp02mU9IPw5wKYs+
	FewKCT9wsu5omMnnxL7evZ8wIVV8VYylyuU8tlkj12BVZgzAYsSRSNN4g9iXYw==
X-Gm-Gg: AYBFou1d2aAlKVHkEtWhBIb7hI9mfyyPH425MJLDt6dlgP2FbSWxLfogkEbKZD/BaPQ
	Hp/PhqWoAgo62Iaa9AU+BrMILvLXxjX1woUoVqxWor59eiSfGabiZDq7CVHwk/zKPZwT/P74HE8
	QMWmuIWVugjDLjwgb4vZIxfkhgYpI/4lbOtLgWyu+jr9+hGrac23wvrZF4VdJ0lUhydXtM4Uswb
	KmoEwXSj+P9ouBJB1fGQfRHZN7XQPYdLvFvGz1cty8gT0zYeToVB1/C/pbrQRJVHnxEw3+kq5Xo
	SjoKHc6tGqRvMTgE8RCzMOOSV7CF+fzRUeXT1Wr7wBEJXETuAhK0JQINycH8xqsgEoLjpALX9YH
	39l0t+LDN/JquaItUplrhAZZiU+wr0/kUHf63ADJB4tfr/LgcliG2Hs5yXFWQPl4v4qODbPMruB
	g9cN9CkD8eF+98gpBJdgKpYWMOz7HW/41FhwkUNPnY+/zTJGXY5Zo2ArnACIj3Y05qhMdWtFD37
	ocAIWZ8oKKyyoZsPg==
X-Received: by 2002:a17:90a:dfcd:b0:3a0:631a:ba6b with SMTP id 98e67ed59e1d1-3a098db9593mr7472762a91.33.1790484353317;
        Sat, 26 Sep 2026 21:45:53 -0700 (PDT)
Received: from thangnn-ASUS.. ([2405:4802:1d4a:e90:3a0c:2ea9:4ab7:bd1b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0c719f86fsm10628448a91.7.2026.09.26.21.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 21:45:53 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Antti Palosaari <crope@iki.fi>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>,
	syzbot+c35815bad054e6ad396e@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH] media: dvb-usb-v2: set active_fe before the demux goes live
Date: Sun, 27 Sep 2026 11:45:47 +0700
Message-ID: <20260927044547.26979-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dvb_usbv2_adapter_dvb_init() registers the demux devices before
dvb_usbv2_adapter_frontend_init() runs. Only the latter set
adap->active_fe to -1, so until then it holds the kzalloc'ed 0 while
adap->fe[0] is still NULL.

A process that opens the demux and starts a filter in that window, which
lasts as long as frontend_attach() takes, gets past the active_fe == -1
check in dvb_usb_start_feed() and passes the NULL adap->fe[0] to
streaming_ctrl() (or get_stream_config()). mxl111sf_ep6_streaming_ctrl()
then dereferences it:

  Oops: general protection fault, probably for non-canonical address 0xdffffc0000000061
  KASAN: null-ptr-deref in range [0x0000000000000308-0x000000000000030f]
  RIP: 0010:mxl111sf_ep6_streaming_ctrl+0x2e/0x2e0
   dvb_usb_start_feed+0x57a/0xc70
   dmx_ts_feed_start_filtering+0x129/0x220
   dvb_dmxdev_filter_start+0x434/0x10d0
   dvb_demux_do_ioctl+0x48b/0x540

Initialise active_fe to -1 before the demux is registered so early
feeds fail with -EINVAL.

Reported-by: syzbot+c35815bad054e6ad396e@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=c35815bad054e6ad396e
Fixes: ad6b9e517b39 ("[media] dvb_usb_v2: move from dvb-usb to dvb-usb-v2")
Cc: stable@vger.kernel.org
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
 drivers/media/usb/dvb-usb-v2/dvb_usb_core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c b/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c
index bd86d250433d..557451b541e6 100644
--- a/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c
+++ b/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c
@@ -637,7 +637,6 @@ static int dvb_usbv2_adapter_frontend_init(struct dvb_usb_adapter *adap)
 	dev_dbg(&d->udev->dev, "%s: adap=%d\n", __func__, adap->id);
 
 	memset(adap->fe, 0, sizeof(adap->fe));
-	adap->active_fe = -1;
 
 	if (d->props->frontend_attach) {
 		ret = d->props->frontend_attach(adap);
@@ -795,6 +794,9 @@ static int dvb_usbv2_adapter_init(struct dvb_usb_device *d)
 			adap->max_feed_count = adap->props->pid_filter_count;
 		}
 
+		/* demux is live before frontends attach: no feed until then */
+		adap->active_fe = -1;
+
 		ret = dvb_usbv2_adapter_stream_init(adap);
 		if (ret)
 			goto err;
-- 
2.43.0

