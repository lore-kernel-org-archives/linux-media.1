Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794286696;
	b=jerIH2vPOBdilnG2vZg2Q+In0DD5mdwTgq3HzWibaL/rQbsGLWPVTpwmRacmWv3AOAZu
	 XsJQio/vcIPMco6TpsS3chNc6CmKGW9OgnkcJY+M9P5rpb/kKloZs14CAkwMuIcfS7lYy
	 kLVM3VwbUa705AEhNp/UhYBydwONXdy0BZ2pLIL+BGpkiOAdyt3rijsugFq9nM04Jkkrg
	 b1MaZDoDgtdmUSMq7YtdnHZHjwnvlgRoaOVBVLBkh8bojOApWqVNonCbMyuJoZuu32jfs
	 Wht0YYg5sLbjBvY95ylTjsl9Fpr6x9BN7xjgfchAfm3ddwsdgSBloUbcrvshDxkP9Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794286696;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=33/y7FEbAJRMpWgPc6HOmiquLc0W6X+Eem8um5Z3JJ4=;
	b=a3ayWkr8oEpT7P0kEmD3U+EBzGk4QGxd6iSQmhHPagab6O9tHLdzSg+Gnz7j8Crh0ku0
	 Z8VeGvJa6BBIkokMf7sXokR7K+9p3y+HQnOUNldxce9Eno/PlSLyeAvWNrBjoeaQB1r7y
	 3D6FY3SapVhCfOp8bDjs65mWRSl89yOixubLRVtNUfg+nKOYyvKHv8z4PbhHEhevk6Kyo
	 aSE12F6/3ftjHK37tJ/++8WKGSIHnZ6HdnGuZxbNfX7t3wYyipXri/Yi4EJuspTDEGu47
	 jh9g2uSLa5BdJ+du9BhqfhcJ/tTWk41h9MrEOUAgLj4cgwS2ov3Pflp77L6A7z6gm8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NXv0S8FL;
	arc=none smtp.remote-ip=209.85.222.181
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D99060A2611
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 04:58:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D99060A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NXv0S8FL
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-93f269e335eso184831085a.3
        for <linux-media@vger.kernel.org>; Mon, 09 Nov 2026 20:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794286695; x=1794891495; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=33/y7FEbAJRMpWgPc6HOmiquLc0W6X+Eem8um5Z3JJ4=;
        b=NXv0S8FLOQHfhuO6I2CqBGOOuCAG4lhUOeaMh1B27tF2xMlL7EajxdrJ9D08qAvZzS
         hMYCojNslIXK3SYzg2S1GlJNvnd0NN+fTUpCVyycsdK9wwyQlgWf2xMK1Y5tgX0X6Xls
         diQpEv0AECqtRsIiaQKBeki7kB1bIucOSUpyNNzZ9aQn8SKztUDqGB9iKPr5hJBHD4mz
         E1cMUbtoQPOHOsSTpBzHXuFItKjy9nB3GFWRpjit1gXuy7Sk9TM2TCW7czZGPoA3iSNX
         6AaJYmf4PjHpVrjhfF/xEyCOl/oG3nEy0X3KXTchvY0ymBsRsNB5NQiYmzFW0X+PYfbT
         2npQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794286695; x=1794891495;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=33/y7FEbAJRMpWgPc6HOmiquLc0W6X+Eem8um5Z3JJ4=;
        b=sGVhdHDxssVT1i/HuCzVWq16zwmojJd8PR9FpPZQZRJYfmKZl3icIlJ2bAikYt6Q88
         GgvOCMFtW2Q4PVIUBgN1Xj3HplPVZPHR7t45NCHZC0PWiWmbqlw/1ukLGeJ5Hzwz7k92
         cCWxRY2BaX5PZXvLuMUV4w+Q75XCkmUMxRggxOs+FeMwb+QhkvbRx4G5fblLquY1wA8S
         eLgG+gOWBdHYyueaApfZgRm7yX+WuNUYcjYrd7wHOKLsod8Th00iZ6I2rFw0Ctgt3Hfv
         JKkUIdF2DkUfxaODjGlvP6LyCNMaVjoCVhP66LjDE5t/obWALdmdudDTBfUTaLblSxyO
         t5nA==
X-Forwarded-Encrypted: i=1; AL+hErHTr/lPBPxkbk9DuORxP3qqgs4P9WH1j3vyWuwdMyoydgIccH7oWdOpQpemT+rvfQYTBUcBKNoyc/q/kA==@vger.kernel.org
X-Gm-Message-State: APuU4Z84VzqnXxnOYf7opiQzlSddHGwlatEUd0XQELK0meDNqrZL8ONB
	kDorlS/bwvyV7glkW8MgSvBMz459knKNGp7dW+TZ5wXDRySybHU+a1Y=
X-Gm-Gg: AYBFou21/WMJQSXZs5gS23D0A/1WTqUjPB89sc+Wxn/5jL8IzvQlol3iECu01NilmLS
	+AnpPkB1tGTS4fbzQO10M12bgJx1LLsQ9cWosh5ObD6nJiQQ+EyxM6CiKlI7n/tmDM62r3rqRXq
	TUB5nFo0EuHF2NjaUmUqwP0J9a/3RQ+flCk+uS1ZdEA2tyXGrd/PV6Te95PotZmgIc7B7U2Zrzw
	PxDORfBEoEOA352rhKabfbMWj7vW9h9skxCdyemTImZqwHrloxsn2564tFi5bM4su49cryh0NRS
	PGrJfiOlIPuSFO15S8iGCIGeIJODGj/+zpScliUdERPZgJg4vQQGnxpgrKLYJ+0UO8xqE8jK3vz
	PXEksBOFwLKodTXDWhzo5+jt+tJd0fnFcAf8jSmXQVMXM+rAvl4Nn/IinW8X/A9yApDP232VMxS
	1lk71aaRmrasdOKl6VhYz37Ak3OBH7ve7tf2uCG2oM/RH+KVT4XSX7c75f8thfZtx7gKTFbcUeq
	0uc71BtDfk5sgcTCU5eezedc+X12wGj59XfnyUdH2EGafOfkfOnDDlhjiEFUTKrX+BBN5mf/ZlP
	BErXI/78obPVBcefc4UxyHFGOsgfskMZERmFa1VtbHTIcnJZhc7xLH9CxtNu9MiWm74btIWgAHT
	H2TaVbjcuzPY+NOJXAKNxOeWCwO+iy6qpDxHxLtXRe9dv2CF3ZwvV4N4YrEZP2pU3QFdBrybsRI
	1KXsJV7Ojx3w==
X-Received: by 2002:a05:620a:2614:b0:947:8018:978e with SMTP id af79cd13be357-9479f22d879mr260742685a.6.1794286694660;
        Mon, 09 Nov 2026 20:58:14 -0800 (PST)
Received: from localhost.localdomain ([104.39.152.7])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ef04f89c1sm12462836d6.23.2026.11.09.20.58.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 20:58:13 -0800 (PST)
From: Myeonghun Pak <mhun512@gmail.com>
To: Eddie James <eajames@linux.ibm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Jammy Huang <jammy_huang@aspeedtech.com>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	linux-media@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v2 2/2] media: aspeed: drain IRQ work before stopping the engine
Date: Mon,  9 Nov 2026 23:58:09 -0500
Message-ID: <20261109235731-aspeed-v2-2-mhun512@gmail.com>
In-Reply-To: <20261109235731-aspeed-v2-0-mhun512@gmail.com>
References: <20261109235731-aspeed-v2-0-mhun512@gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Last close cancels resolution work while its IRQ producer is still live.
A handler can queue work after cancellation and buffer cleanup. The worker
can then turn clocks back on after stop has cleared VIDEO_STOPPED.

Release the VB2 queue before shutting down the engine, since streamoff
can need capture and mode-detect interrupts. Disable and join the IRQ,
drain work, stop the engine and free its buffers before re-enabling the
IRQ. Check VIDEO_STOPPED before enabling clocks in the worker.

Fixes: d2b4387f3bdf ("media: platform: Add Aspeed Video Engine driver")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
No hardware testing.

Changes in v2:
- Split normal last-close ordering into a separate patch.
- Balance IRQ disable/enable within stop; add no reopen state.

 drivers/media/platform/aspeed/aspeed-video.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/aspeed/aspeed-video.c b/drivers/media/platform/aspeed/aspeed-video.c
--- a/drivers/media/platform/aspeed/aspeed-video.c
+++ b/drivers/media/platform/aspeed/aspeed-video.c
@@ -1423,6 +1423,7 @@
 static void aspeed_video_stop(struct aspeed_video *video)
 {
 	set_bit(VIDEO_STOPPED, &video->flags);
+	disable_irq(video->irq);
 	cancel_delayed_work_sync(&video->res_work);
 
 	aspeed_video_off(video);
@@ -1438,6 +1439,7 @@
 
 	video->v4l2_input_status = V4L2_IN_ST_NO_SIGNAL;
 	video->flags = 0;
+	enable_irq(video->irq);
 }
 
 static int aspeed_video_querycap(struct file *file, void *fh,
@@ -1847,11 +1849,11 @@
 	struct aspeed_video *video = container_of(dwork, struct aspeed_video,
 						  res_work);
 
-	aspeed_video_on(video);
-
 	/* Exit early in case no clients remain */
 	if (test_bit(VIDEO_STOPPED, &video->flags))
 		goto done;
+
+	aspeed_video_on(video);
 
 	aspeed_video_init_regs(video);
 
@@ -1901,15 +1903,17 @@
 
 static int aspeed_video_release(struct file *file)
 {
+	bool last;
 	int rc;
 	struct aspeed_video *video = video_drvdata(file);
 
 	mutex_lock(&video->video_lock);
 
-	if (v4l2_fh_is_singular_file(file))
+	last = v4l2_fh_is_singular_file(file);
+	rc = _vb2_fop_release(file, NULL);
+
+	if (last)
 		aspeed_video_stop(video);
-
-	rc = _vb2_fop_release(file, NULL);
 
 	mutex_unlock(&video->video_lock);
 
