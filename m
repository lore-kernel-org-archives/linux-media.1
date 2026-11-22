Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795327473;
	b=JFfxG8337DD9+WqyD4W9fWuW6b7ZdpY9oOt4Y6G+J19SlJC+8GfI93ifUm/4sWEQZx4X
	 GToBP1LB+N1+ExnnG1jXTDApBzbQRXSEQUBJYm21u6pdrcyRUHTwYZdcy0Ez6Xt8NvSSo
	 jECyp4sWrJAPZCbuRXtTP3vRVDSmRzvwlF12h9prlHUcRPZOviP+0puwQp9nWPGJJRrDN
	 GR/V6a67rg2xacV2hO5dC7nv9UkjpOK9HQC4tf6RwzSl4JZHVXKRzuhVBsF2dMPH+hMCo
	 tMiLLYWcg/rYRaqJAyrYwbxbyK9ocOQJdfnob6H0KGXqxyEMycnrZxr6bE80G03i97w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795327473;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=awzUDbrVWKOy5FFPtclQbQqeaRlUhfiIBRPwruNE5fo=;
	b=VG+Zq47q5wI/Qc75au+dgE5A+7eoGXd7EIqsa7ywZMdxqelDBB8PLCnHmw73qM4sq8a7
	 8oz7EEJP9OUh1OOhPQVuLwWBoHEMonTuEbyFz2Qf2WPdNCYtPABB0mZLrTMl0er5OyC1F
	 1ZUJ/yV3YHiPaOj3P8NP68rdAxU/m12L4ho4+TWEfMyGMvTUxJyP5loFh4oYpgFPh5kLh
	 fUtRlREgIVsCVORU+Izwvoyjn49uBZQreu3eXhD/Xzr+8YQXdIVN0SQavbSXVHdH+9yLn
	 P5GTeYDRT/qDRL9z1rgdYqg1JW/U5ruWaw8CmFdj6qksFidTSg6iTVxghPkWdysjAsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CTWsSYWt;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2AD606A320
	for <linux-media@vger.kernel.org>; Sun, 22 Nov 2026 06:04:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F2AD606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CTWsSYWt
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3282db206d3so6717381eec.0
        for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 22:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795327472; x=1795932272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=awzUDbrVWKOy5FFPtclQbQqeaRlUhfiIBRPwruNE5fo=;
        b=CTWsSYWtOqbO3AkZZka1hr8vUC1Oq1DOyapviemlWpBPgwcSszL75y4tExEV6yS9B2
         gA8Hl4Cxe2ktPk/dv+R5C3of9Wyn1hv1D4RXcKEP8I6SSuFuVA+J7Oww4ssNWkLvzx7C
         6g83ZbUdafrJOCxoEzhDjDnMa7I3LjMQuX7Z+DcHyOI/JfWJEAz2kDEjQDO5Xa3gtU3L
         6g9j6XQIOG5Hl+1YGtmdsHsTHVSFuiZi3G+pPOm+EjE9LMaG0VUE5mi7foP4EvDa2paM
         86n5MB0PEHGlCdTFA0S5PsO/GjFl0O9uXZ8RkBcwTVtS7XJNPBdDSbvhR3OCuEBjHFFO
         D2uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795327472; x=1795932272;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=awzUDbrVWKOy5FFPtclQbQqeaRlUhfiIBRPwruNE5fo=;
        b=0ftz4CCtilqYtK8cgCnfWjamVbngUHZORSD+C+bXvzJu+yXl5DCjHFExUD8koZzxNP
         8kx3WLapncsvwWnq8fHRR/9YO0jW5LJ1/iEVJl6WYHNEreWfY8v0ND7qHSfID8mvuwVn
         gwnDQLJAZ58jdPWKpa4sk5UchLCrb+uWiaS7N+Jz3Fcy0p0oU1yt4nBZtFSoZD+DR0oD
         cPF2AtEWCQ9RdiOiMpliGvTPXwgV0HxRtDqgxhhb4Qy0fzSpHLK5dNETCBa2zU8HQCGL
         rmUm4fIP9AZ/WLUFcuL74unACOBivcVZDcGY3l2CgnBxrW2nO+4e7E/zf95Nmv04FTsa
         zd5w==
X-Gm-Message-State: APuU4Z+c62M3kRpFKQP/4bmDp+Sgg27zZzCZ6HwPwf58Borh25S3kSEk
	QBnp9iZGZ85SfFBIAfxt0l+A9lrABLQWrswY+L8B8U84dPnlP8aq+DxFJloNLqwV
X-Gm-Gg: AZFdTZfGdOQi0aRL/gQdjeACBqtMujuMwRBQu+8J/eG0jrZSUwsiGdspMtpgS02lubE
	1/JV0lGdfVVRgWGlIahxz9yVdHecteuODI8uqA/b+EtOxCrb6YT8Tg2LgkTuSYx6RjMDd68UtHz
	wSmC1R9mRboDV65eBQ9loMKV2u9ARZ19CF2FwrgX7YcbrSbk90yvIoGPHzirfUyaNZ+JZVLDGud
	EiKyAxmGcF1MKVMwwa6M5s0exOZ3N61wadCbbwoQGQBeZUTv77bbMaCjINmRtU5O/BAlNOphko/
	zJDGAw6jNXCwayBsn7eDCcQmP5OFwfb3KyTRipXLE2uMuVqi6hfYYdZ8d2hD0KY6JnF2Y/2wSlz
	bdKCqvRoh3o/DQSLORLmzxgHQUDzx7JNThS5vPZlqhP1QEfdhbJefIvBNg4Rc+Zj//b8x4DThsj
	l9wRaSONAq77Rq/n0LRcM1LZIdGDTNm52vjtxn7b8qW6QswjARi1RxbYCVEvNa3l+AOkCeFc+rr
	MueeMOal7z1ZGa1dIsiv5TDq2xkw66o1ZZRzyaNuerVzvw8gGiRv44D14e4VdW6pg0J6lIDiV8x
	3WNlOi5nBz5FazbaYIIuemNLcmKGUO+PuYE+KJ5fCNDykJpVXVG341OlUqMLv82BwqXj
X-Received: by 2002:a05:7023:a8b:b0:18c:e014:6f1d with SMTP id a92af1059eb24-1b5567ab595mr8320034c88.1.1795327471045;
        Sat, 21 Nov 2026 22:04:31 -0800 (PST)
Received: from hp-envy ([2407:7000:b098:4a00::6])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55684c85fsm26704718c88.14.2026.11.21.22.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 22:04:30 -0800 (PST)
From: Parmjot Singh <parmjotsinghrobot@gmail.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hansg@kernel.org,
	mchehab@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] media: uvcvideo: fix HP True Vision 5MP color streaming
Date: Sun, 22 Nov 2026 19:03:07 +1300
Message-ID: <20261122060309.105714-1-parmjotsinghrobot@gmail.com>
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

The HP True Vision 5MP Camera (04f2:b767, USB revision 0.05) can
disconnect from USB during initialization or shortly after starting
color capture. The first patch skips a malformed default probe response
using the existing UVC_QUIRK_PROBE_DEF. The second adds a startup delay
for the color interface between SET_INTERFACE and the first ISO URB.

On stock Arch Linux 7.2.14, selecting 1280x720 MJPEG succeeded. With
streaming enabled, COMMIT and SET_INTERFACE succeeded and ISO URBs
completed before the camera disconnected about 127 ms after
SET_INTERFACE. To reproduce, use the color capture node:

  v4l2-ctl -d /dev/video0 --set-fmt-video=width=1280,height=720,pixelformat=MJPG \
      --stream-mmap=4 --stream-count=90 --stream-to=/dev/null

With both patches active on Arch Linux 7.2.14, FFmpeg decoded 90 frames
each at 720p MJPEG, 640x480 YUYV and 2592x1944 MJPEG, followed by 300
frames on a 720p restart. Color capture was also reported working after
a reboot. The media-next series was build-tested on x86-64.

350 ms is the tested delay. The minimum reliable delay is unknown.
Infrared capture still disconnects and is outside the streaming fix.

OpenAI Codex (GPT-6.2 Sol) helped draft the fixes and analyze USB and V4L2
traces. Testing used usbmon, v4l2-ctl, strace and FFmpeg.


Parmjot Singh (2):
  media: uvcvideo: skip GET_DEF(PROBE) for HP True Vision 5MP
  media: uvcvideo: delay HP True Vision 5MP isochronous start

 drivers/media/usb/uvc/uvc_driver.c | 23 +++++++++++++++++++++++
 drivers/media/usb/uvc/uvc_video.c  |  4 ++++
 drivers/media/usb/uvc/uvcvideo.h   |  1 +
 3 files changed, 28 insertions(+)


base-commit: ccf78740d63813c452c035b57d17a650492562fa
-- 
2.56.0

