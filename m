Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794532726;
	b=NAjufhiU9ou+anPrhfL0dL7DXYt86+W3mBJ1s2awThv/LBmVh0KSx5jS5OiKPYAS2eF8
	 1+2LBtr4T1bTGDzoWdtTHDjCO+5HNGMLeN+VSIK+7cUnoPk/mOAs4i+EK48QR18Wr3Kqb
	 8OFQF/nyMIzdoBF/uD9zCfXA5P2vPTbe4CFgUjFTt9+wL8AyAR66EqixmVmHYDAT+CqbW
	 6SfqcHSiJ2naI/E4SSrhIJsK2oUAbcHqRFcWv8pw720/4gtPnlXUuWtTjC3Wj7d4fwBVg
	 2ddy9zCSixFPl/Cb0eci5vujUkdZi98FxsA8x/p42UVqmHNZLwZEK/XfE7toxHbihWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794532726;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=VasWpqSUZYD0V4VYxxbwomWuyZegnnIz6kc2wFLpprs=;
	b=hq7RcJDx/Be8V1QMsPcgQdY/2XXlDNagPQuODH+3EWlHHwGIsrdTE2biSn7JqEjgab5n
	 xAAV4urxw9DRoWLyxxhQlOL9XihZK+dzR0itkhevq/LIvHf10eDVHMtRVxJq9GNC7P/MF
	 zbCGAeyyUrlNvfUiK0iw2wMWptdcdwSpFeO5CAh0f0gqTFxC1XrocLpMbiGvS/huDqQ/b
	 l0Xme0ny0d3+aEO1tjoOEWlvx2Vh/5OLgnDCF0x0++YLtr0NogXc2IGL8gTGFtpspZDEQ
	 +VEYQklK/tu3oNQ7L3UiL3OBlrbh9KnWNP9ZGsWxsQRTgsKaVxUXXpRVWL2mKES+N6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gbwr0IK0;
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC19606A881
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 01:18:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EC19606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gbwr0IK0
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-843cf077f10so861683a34.1
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 17:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794532725; x=1795137525; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VasWpqSUZYD0V4VYxxbwomWuyZegnnIz6kc2wFLpprs=;
        b=Gbwr0IK0qd1Y/y7HBMuf9IUXwTm1GD3GcGNZPmJ1lAYZJxS9CEQryMc6NhKoIJE+Bo
         d/DETRVD7Yr2TJ8MnzMvwdJDeGO9PKieWKkwVjxjdFHx0x19ePXKYdMSqKnWlb6hb9nH
         HLwKuCTlpOhDLIIzPqad5DgqCy+q7YvwdAH1w70j2nhoeD9L0veIb9fe7xqnNpLV+1Ro
         hoy7/e9qlNO958nQJ5LfomK6a1419t6AZ6MEdEbyJ+YqNgg9rTUe1pRbBNLpgzyJt78S
         wqm3q4S8sjeCQf1kBhJfKIWq/4VHU3brAqcQL8gYfp06+ntjJmGtD9NBGWRPEOwhXoQ+
         ytDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794532725; x=1795137525;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VasWpqSUZYD0V4VYxxbwomWuyZegnnIz6kc2wFLpprs=;
        b=FWArtOXv8zi7z9qDVXBpdnWE8J884qD4vaao21rk54nd7r3yIhxwK4zsENDRIwnAKZ
         xIzvpjhAvjrInHT7p7YFIpCC4MN/Fc+N6KdAZ6RrJNLnz4aNTqGRSAc68PeifGGm+966
         j4x0WAX3rZoj3lRK7pwZSmYH4B+2VdQicYeNT4tyaavkahe9OkCDUtioTEZccWuBby+q
         +kSv2gBbHPRoXBQ6+QLDlDRaxzr9PZde1maiujejKU/4JaJRnua0GMKzbSc5U3ABk+ST
         puc8SrS6DxL0iMOUc6T1aPJaFjP7fUFB3FTGUq1SloU/Rg/a1kleTrd9JorJJcvtTTWs
         LUYA==
X-Gm-Message-State: APuU4Z/CF2CkDpWjrHsNgNCqfzsgDdDVZqIAVnkFUkcKOBwvbceopcWJ
	R1UUTaIXu4D4Fm+OWnObQf2UwGS1fFjgTjPAFP/P7cPmf7UJJZYWNxVh
X-Gm-Gg: AYBFou1lQBY7XIqPlrfvR6f8++pSPp4BFlyG1+XTgVj4r6hhuUXwK2SRkNIEhzqbeno
	KEao+v81KxhZQDYQRTVm1I3PtpHx51Y1Dord5ZIrsIkecqZMZ/52LAFUPectY1q2KpdHEoxFouL
	/RrydmSr+GceWwF//5Kxmt3z4ztex7t97dHqorGt9bwLW0qRblIll0wYlO85hOhIokOdrEAETgS
	Km+MBS9aDgtOIe13Oxkqz1tmnpBgpuCmMTQWhuAVyN9/fZvRWYXY+QXpa0tC1cC5mNFjL9HLfyW
	KaHOtW01jg4VQ7bA0beYopxIX9XUjWKFzQ5+5yjIxx8sm7yRYTDnrElxDAbYtT+E2WsjiJVm0JP
	d9igJfNaESPJ6XihonRdTkuBkzNHGmlZRJLcsttcEAmdztT/4eT+sTKNGU0ktMPxftxm8+vIhrn
	Drr4hvnNiZasIetbcy4MF+VzooGv/56sGqDEPzbc3u30kYt4w0LddLi8iu/llgDkERqjMhMz15S
	OsOjkZiXK7P0wGHz0jQR/RgCdvmQ8n8qAf/IbA+E3mKM3sFslZTtYbLh9Jt6baOjPsuceNNoxLA
	mym+s3NZXqeOSyShCI0JjbsACrib0lGwlh97WVWnRdIJJjHqX/n5zg6kaqxnnJJIBy8B5pzxiYl
	8Hnj3CNPjW1ils0v8Rh62deaHyDEYf+bQxQxUOars/8OQnp+KLoZe95M=
X-Received: by 2002:a05:6830:914:b0:843:8982:9532 with SMTP id 46e09a7af769-8628992d65cmr1277963a34.28.1794532724575;
        Thu, 12 Nov 2026 17:18:44 -0800 (PST)
Received: from cachyos-x8664 (fixed-186-96-141-48.totalplay.net. [186.96.141.48])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862880a5298sm1230599a34.7.2026.11.12.17.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 17:18:44 -0800 (PST)
From: Diego Fernando Mancera Gomez <diegomancera.dev@gmail.com>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Diego Fernando Mancera Gomez <diegomancera.dev@gmail.com>,
	stable@vger.kernel.org,
	syzbot+1a7507a194fff09e5c44@syzkaller.appspotmail.com
Subject: [PATCH] media: em28xx: clear dev->v4l2 when v4l2 init fails
Date: Thu, 12 Nov 2026 19:12:34 -0600
Message-ID: <20261113011234.45270-1-diegomancera.dev@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In em28xx_v4l2_init(), if an error occurs after video_register_device()
succeeds, the unregister_dev error path unregisters the video devices and
drops the initial v4l2_dev reference, but leaves dev->v4l2 set.

An em28xx_v4l2_open() call already in progress (such as from v4l_id)
that blocked on dev->lock while em28xx_v4l2_init() held it will then
find dev->v4l2 still non-NULL and succeed on an unregistered node
instead of returning -ENODEV. When the device is later disconnected,
em28xx_v4l2_fini() also sees dev->v4l2 is still set and calls
v4l2_device_put() a second time, dropping the refcount to zero and
freeing v4l2 while v4l_id still holds it, causing a slab-use-after-free
in v4l2_open().

Fix this by clearing dev->v4l2 under dev->lock in the unregister_dev
error path of em28xx_v4l2_init().

Fixes: 288254383674 ("media: em28xx: use v4l2_device release callback")
Cc: stable@vger.kernel.org
Reported-by: syzbot+1a7507a194fff09e5c44@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=1a7507a194fff09e5c44
Assisted-by: Gemini
Signed-off-by: Diego Fernando Mancera Gomez <diegomancera.dev@gmail.com>
---
Note: compile-tested drivers/media/usb/em28xx/em28xx_video.o with allmodconfig (no warnings); not runtime-tested locally against the syzbot reproducer.

 drivers/media/usb/em28xx/em28xx-video.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/em28xx/em28xx-video.c
index 84424284d486..f78325a41124 100644
--- a/drivers/media/usb/em28xx/em28xx-video.c
+++ b/drivers/media/usb/em28xx/em28xx-video.c
@@ -3129,6 +3129,12 @@ static int em28xx_v4l2_init(struct em28xx *dev)
 		vb2_video_unregister_device(&v4l2->vdev);
 	}
 
+	/*
+	 * Clear dev->v4l2 to prevent an in-progress em28xx_v4l2_open() from
+	 * succeeding on an unregistered node (returning -ENODEV instead) and
+	 * to prevent em28xx_v4l2_fini() from tearing down the instance again.
+	 */
+	dev->v4l2 = NULL;
 	mutex_unlock(&dev->lock);
 
 	/*
-- 
2.56.1

