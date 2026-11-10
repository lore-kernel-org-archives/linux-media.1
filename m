Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794353838;
	b=GSVq+oPBmjYzkrntndOZC450ggfEV+exdcYGwswF6m3U4mUb/Lqtz8NyktyA9++NTtvW
	 Of41VEu91JNXxYkSg3cg9nXh6BLk9DdukSfVc4c24VIzHs4MVyTsPYPe57tVKKxf+IOoM
	 lPdCG2fi6tUadCN8C03RnuJr18hZd/yGB+2sMoS6f3tJZnBDTIFxl+zZIehp5xrlS/QO0
	 STQ+e9ileK5ISySgxA76Okr/v93001kDWtGyfQC42gQAcnOdH8Avmx93lWOgTTW8qjjh+
	 DyqcK7u7fiTalEttG2pfoLcOZoCP17GoOLGzwJfJCSMII+BSvc1X/D0n+g+sOInLoeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794353838;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=nucm/aleCVbqWE1ilGDcefpNzHQgxL4IFzC4QCL3uuo=;
	b=R4QxH8qIY8HOgI3ol6URcqZROU4Bk/+6PD9cyeW5Zd0m+nbs6TtPxOKlOhSFn/1KFp5r
	 Hb8MMC7pGXFvxPYqx/HCsdg91X1m4RU8tXyqZ2ok1BK5I9Bi838UPN9dhpyECc4RCJdFL
	 QvmZFY9PUj+Ci2+T0ZKAY5JEuIe0aky/zm380cXnx8Wtc0EXlu5FDy+Ra+k65ulaHZXGh
	 JN9E+L9HFysoLtXYiHl0cOfj0TmORI9NItbE/TzbBOZO8CI3lUmqGNA7ylVeL4vMChWVg
	 3lpXpxMMxXIkRtKqOlOtnuIAoK3Rg3fRr1P0IPmKZAE1OWA+/JELhctbtJSPQYKN7pA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U6zkm0r+;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3542D606A31C
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 23:37:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3542D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U6zkm0r+
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-170135e43c7so337640c88.0
        for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 15:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794353837; x=1794958637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nucm/aleCVbqWE1ilGDcefpNzHQgxL4IFzC4QCL3uuo=;
        b=U6zkm0r+Li0Gw+HszhANqyt3xoRZtlLyb5QfVwaorfokcRRa9+8SuufNx11mYAigdO
         UI0ONO0j7dw9r3ouGdCazB9drEGI+AOKGYB2T+u82KQk/BDGn6HbAYh0+b7yF2QGgOQw
         weK1SrNYANzm1DCaTZzA4Cov4dx3vRqGKH6t097njBU/WiyIN5oLKbPgwCgPcxmYxOZV
         I0BvswsPSbj7BbUPaE4qnUFRi3GwXFUGgWYr102xEFEiSEjyqV06LGcvrpn9N9fq7q7r
         qM2hIfcpgE2NW+VbDSKTCJwddFnHub4hDH04UOnjMM0oybYsAN9WWbBTMS4amhaucuph
         SIKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794353837; x=1794958637;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nucm/aleCVbqWE1ilGDcefpNzHQgxL4IFzC4QCL3uuo=;
        b=uPkIYLrIOFVgN6wAnjOeg+asWBbScgYMKAL6z7Abx5ruFgljsJYmKXNfTciELxOBK8
         DiZ78Ms8hU0B9K5Zr49VXg/oIRl1smfjqXwsu6jcrdNyBfHyJe/WM2rjwvOZBdvMnIfn
         tkm40P3/aYdbxaZ8fBvUtAcNGQcXKdTP5SFTCWLrDzNch7kCVQ+uUuQ7QRk5zYhBUH1C
         j8FDmemdrWP8/dwG9RkIh2HLWV3uDGZ6Lb9X48eiW/gPhbAt36m9znLl9UgUhTAJnVuk
         ksrD9P0yi2iNi5pYTb9RjG/Vbvsehiz+z48wkHwLPLnmiKDf2mLX3mtcEpDJm3lMa5Me
         1OTQ==
X-Gm-Message-State: APuU4Z8d5RDeVLR2uJc52bNWVtZDWrehs7NwO5cdGH+uiAYRWcgAOJQH
	zbjg0DRDwgKBFkEZgwyDkf31buIwHx1BLBBT3NKpduuzWayseTYwI0SV
X-Gm-Gg: AYBFou3yj51JILC0rmwGzEt4GYrLwU0MC2NJD86mQYDx9Ja0JVjIvv9zYwIM6Gl0D43
	rpkbOjdOuqoQVMRBJhoygjBvQHW5D0KPh23DaG6sAeQhpFPGC46Rd1DFIw7jj+/DIqDxiLGTN4K
	2iJDrsT9LOyJ+XIdExl5ETT5ePYu6DbE2hTJSltHoBDQqV5LLQWoxZqajL4dfFHT2kxL289pGjo
	HfI10SUOQj9/9TzrcXUW9r5rChV7If+2RETRXXNIl8N4M5i8Y0YqI3z5hbDE2au3MlcRjgRPwl3
	svCfdv2evjCmpQAeaZofdwvkzPd2/MMRBeiyiMKKWez0NfZiQU2LsFmQu1oW7TJECRnZ3foAIzN
	UY+pg7Dx4YIVmR51Mk3VTPeiyUX2TGUl/szWcBwgJ334ZV1X6/wOtRU0B6OINtdf7QnXXtL0v81
	ZVfIZetG0SRvb+285JKJKsd/XnRzDgcmd7cYtcJCh+w8GK3GWCmpMGRa12RjkuMr7yF0EDSCyGy
	JhT1hIndacBKgF/AdAZAPm7+0la1tlslOplvA8Q2BKLPuVG3GD6+ZUQ+RmdqK0zIiX+5SV7Mxk+
	KSRdjfUBM3hwchzpifx3JCJcFwh8ZAc0l0OqjDYPviRXQVE5vFeWUvQu2Avi3v8lPZ4=
X-Received: by 2002:a05:7022:2608:b0:18d:96e8:b913 with SMTP id a92af1059eb24-1b3c036707cmr794553c88.47.1794353837204;
        Tue, 10 Nov 2026 15:37:17 -0800 (PST)
Received: from localhost.localdomain (wood.seclab.cs.ucsb.edu. [128.111.49.37])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11346sm11981419c88.7.2026.11.10.15.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 15:37:16 -0800 (PST)
From: Praneeth Balasubramanian <praneethb2002@gmail.com>
To: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Praneeth Balasubramanian <praneeth@ucsb.edu>,
	stable@vger.kernel.org
Subject: [PATCH v2] media: hdpvr: Hold io_mutex when restarting streaming after a timeout
Date: Tue, 10 Nov 2026 15:37:08 -0800
Message-Id: <20261110233708.318348-1-praneethb2002@gmail.com>
X-Mailer: git-send-email 2.25.1
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

From: Praneeth Balasubramanian <praneeth@ucsb.edu>

hdpvr_start_streaming() expects dev->io_mutex to be held by the caller,
as its comment says. Every caller takes it except the restart in the
read timeout path of hdpvr_read(). Commit 6bc5a4a19275 ("media: hdpvr:
fix locking and a missing msleep") added the lock around the
hdpvr_stop_streaming() call there, but not around the restart.

The restart checks dev->status before its USB control transfers, which
can take seconds, and sets STATUS_STREAMING afterwards. In that time
another thread can start and then stop streaming with
VIDIOC_ENCODER_CMD. hdpvr_stop_streaming() sets STATUS_SHUTTING_DOWN,
drops io_mutex and waits in flush_work() for the worker to exit. The
restart then sets STATUS_STREAMING and schedules the worker again. The
worker does not exit, so flush_work() can wait forever.

Take io_mutex around the restart, like the other callers. A restart
that races with a stop then sees STATUS_SHUTTING_DOWN and returns
-EAGAIN.

The missing lock was found with an LLM-based tool that checks callers
against the locking rules stated in kernel comments.

Fixes: a503ff812430 ("[media] hdpvr: fix interrupted recording")
Cc: stable@vger.kernel.org
Signed-off-by: Praneeth Balasubramanian <praneeth@ucsb.edu>
---

Notes:
    Changes in v2:
    - Add Cc: stable, as the media CI requires.
    - Resent so that the author matches the Signed-off-by. Gmail rewrote
      the From: header of v1. No code change.
    
    This was found by an LLM-based static analysis (GPT-5.6) that checks
    kernel code against the rules stated in its comments, as part of research
    at UCSB SecLab. The patch and changelog were drafted with Claude Opus 5.5.
    I reviewed the patch and take responsibility for it.
    
    Testing: builds without new warnings with W=1 (x86_64). Not
    runtime-tested, since I do not have an HD-PVR. The hang is from reading
    the code, not from a reproduction.
    
    The patch applies to mainline 9ba46df34488 and to next-20261109.

 drivers/media/usb/hdpvr/hdpvr-video.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/usb/hdpvr/hdpvr-video.c b/drivers/media/usb/hdpvr/hdpvr-video.c
index 4290b2367fa3..b7afcebe80e6 100644
--- a/drivers/media/usb/hdpvr/hdpvr-video.c
+++ b/drivers/media/usb/hdpvr/hdpvr-video.c
@@ -475,7 +475,9 @@ static ssize_t hdpvr_read(struct file *file, char __user *buffer, size_t count,
 				 * streaming.
 				 */
 				msleep(4000);
+				mutex_lock(&dev->io_mutex);
 				err = hdpvr_start_streaming(dev);
+				mutex_unlock(&dev->io_mutex);
 				if (err) {
 					ret = err;
 					goto err;
-- 
2.25.1

