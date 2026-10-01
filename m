Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146394E7802
	for <linux-media@vger.kernel.org>; Thu,  1 Oct 2026 10:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790850968; cv=none; b=syUBW/kUfpsAw8H88nwiKbICg5Xslr+D1s1Dydi00eBntksDhM3nAkJ034obfq2KC/xw+hWwroQ6lwwFzv3aY+UsvT1tS3AhnHkPrJ1RJl+q/HrAjKTU4buBoKYYYgh+Gq7/dUgzpb95YFl0fzEe4Sgc9qg0Y/NqM8t+9myyRug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790850968; c=relaxed/simple;
	bh=HhCxkhHC80M83iFDtddgusy89CkLNEEIkWSg3w+KLHg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VwatcoNv+EJxADQ1hCZ3ayjMBKtf+jEZi0IfYGDpcUo3SieINTZIuWC98bxBBf92txHVDjcPjiGV/6ZwmufgJrWGY3vGkevuKYIcnv8HGErnLLKSmTNTutOHnn+6DwRAGeRIq7sXBIwWfjNzrwj6yrg5XmvRq/mt8z9CXlBFYIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jiihi2mc; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jiihi2mc"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccd66bb4so2925923a91.1
        for <linux-media@vger.kernel.org>; Thu, 01 Oct 2026 03:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790850965; x=1791455765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kYIBt1hk8tdANPvKjF+MKq4E4FKuwQRW+z3jTE+Vt3E=;
        b=Jiihi2mceTR9jsExdS5YvR60BvW/6LTjPaSCWPyeJkoVqqiI1h/JsnOjrpBIkRA2ML
         QHWSmIH6hmc38yIcSGhIXwFcRqmnZWduD7YxPe1uGcyJh+4p9xeFErj04mP+/zoONNGL
         4ZjLgvgUgu09H/YRlq/eZDljnLBeEDiNw1QwfPnLgUHpWeeUCrGAcMyzHDXcTMAzpTuL
         mRIE//6+DRO4ZiUvf6k+hIk4EIDCDdD3I2fQRFdx+yV1QRQAWtBzm+dwGG0TlnTPHP/H
         jQ36vlohfuCflETrlgTM/fw4/bYO2pRJchn4TdY3eWOIGfi/Sam4q6iQuu0b6eV831HQ
         0lEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790850965; x=1791455765;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kYIBt1hk8tdANPvKjF+MKq4E4FKuwQRW+z3jTE+Vt3E=;
        b=Y9r87aFQ7mmTO6R0M+kH/0R6Fh2L8v+07ZSTsInK7850jIvPyj4fGLCYTS480JmwYQ
         vTn/sDpgg2H3y2IgR/Y8OKwEy8dpBViiK0ChcgVG/wV45rQbqE1cH3wkiK+ZBuIRtTlw
         aJtBJ7ArqMKL1AYMsl0myjR0q3uMtuY+pfXYs0ZB4C7X1tqIRym1S3ljZtfEfS/HWNJZ
         lCQe2dxghMuZ3ZgnVIHDL9KgR+g76r+Vf3lYA+Ctf2Wik8L8BI1MU5izAQx5Ms2hdWZq
         UdJ0fUpui+n1MrVu3A202q9C8FG6Tm4uQETjJTGyb1NBj+aaqZcFcoEzGRrHm0iDmci7
         DZ8g==
X-Forwarded-Encrypted: i=1; AKwUvBwgnp3V046cc6HqbLogzIEXtVFRfiog6sn+ZNO6SZkZ1+0kg9rZkv3knI2dINwWtHXpoiUYbCSX0NB1Fw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLhRV7zpiAF4B2xnw9Ea68luYUH6XdmgrqOqR5o2R74zrtVqkPN
	RwUENgoJhJ1Nd7Jic9aeV1xvlV6NGPnEQ77LFp6f8IslY9EE6PVxfUQc
X-Gm-Gg: AYBFou2SniMwRpccwo+NfdUykfYbhTViJzenis5FuOX1YjaN5wWBQtIZw8kwfD8DiSv
	ZKZwDixMv/cEp0PKJkvxoVn69j9AKq+ylG9t/SZOifHC+1tx+LSQqXCqsxpaM/y7UrnPosZ9L+N
	oUPuZz5V26+fc+8UaMxNeZjYTtjiIPZY3OGVrJeUv322oK6prCpKluRGB+LCxefTCQOw9KhpFOK
	nIi1+7ZraYD5S2wY3v52a0MLw7z1df1dyrecdj1lVWtcsaNn/cLfjmzEbAl9tAtqKIGwqXhCb0j
	LXxwGBZDgKbcR/tjRJIcCN0kj7Un/HYWsxrQ5/dPUa1+JRUMNPfmwpmUty077o2mm1O4qqh19Qa
	Otb/fhHeFNbrAPffsc0ydXQjSpAs4DifzKu2qFwBz3/QxopFL90WTTwF3MWO/pwRwhpuBt3wVoY
	wA0wTJuyCfSFko/+2ndcaVM0l6nlM3rDexMA7cNGnNW8LdtLcvfmFmhPqbzOWHKPerlP/MosA=
X-Received: by 2002:a17:90b:2803:b0:3a0:c621:74a with SMTP id 98e67ed59e1d1-3a4d1aff7f9mr3329053a91.35.1790850964653;
        Thu, 01 Oct 2026 03:36:04 -0700 (PDT)
Received: from ssakura ([133.86.250.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f46b6bc6sm3882215a91.6.2026.10.01.03.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 03:36:04 -0700 (PDT)
From: Sentaro Sakura <s.sakura11500920@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	Antti Palosaari <crope@iki.fi>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+3df044e20e6ff1fb3cf5@syzkaller.appspotmail.com,
	Sentaro Sakura <s.sakura11500920@gmail.com>
Subject: [PATCH] media: dvb-usb-v2: initialize active_fe before registering the demux
Date: Thu,  1 Oct 2026 19:35:41 +0900
Message-ID: <20261001103541.177073-1-s.sakura11500920@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dvb_usbv2_adapter_init() registers the DVB adapter and demux in
dvb_usbv2_adapter_dvb_init() before dvb_usbv2_adapter_frontend_init()
sets adap->active_fe to -1. Until then active_fe is still 0 from the
zeroed allocation, while adap->fe[] is still empty.

If userspace starts a demux feed in this window, dvb_usb_start_feed()
passes the active_fe == -1 check and calls streaming_ctrl() with
adap->fe[0] == NULL, which crashes in mxl111sf_ep4_streaming_ctrl():

  KASAN: null-ptr-deref in range [0x0000000000000308-0x000000000000030f]
  RIP: 0010:mxl111sf_ep4_streaming_ctrl+0x2c/0x1a0
  Call Trace:
   dvb_usb_start_feed+0x57a/0xc70
   dmx_ts_feed_start_filtering+0x129/0x220
   dvb_dmxdev_filter_start+0x434/0x10d0
   dvb_demux_do_ioctl+0x48b/0x540

Before commit e48b2a68617c ("[media] dvb_usb_v2: frontend switching
changes"), start_feed() also rejected feeds when active_fe >=
num_frontends_initialized, which covered this window. That check was
replaced by a plain "active_fe < 0" test, while the -1 initialization
stayed in frontend_init().

Initialize active_fe to -1 when the adapter is set up, before the demux
is registered, so that start_feed() rejects feeds until a frontend is
actually initialized.

Fixes: e48b2a68617c ("[media] dvb_usb_v2: frontend switching changes")
Reported-by: syzbot+3df044e20e6ff1fb3cf5@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=3df044e20e6ff1fb3cf5
Signed-off-by: Sentaro Sakura <s.sakura11500920@gmail.com>
---
 drivers/media/usb/dvb-usb-v2/dvb_usb_core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c b/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c
index bd86d250433d..b77406a649ec 100644
--- a/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c
+++ b/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c
@@ -760,6 +760,7 @@ static int dvb_usbv2_adapter_init(struct dvb_usb_device *d)
 		adap = &d->adapter[i];
 		adap->id = i;
 		adap->props = &d->props->adapter[i];
+		adap->active_fe = -1;
 
 		/* speed - when running at FULL speed we need a HW PID filter */
 		if (d->udev->speed == USB_SPEED_FULL &&
-- 
2.53.0

