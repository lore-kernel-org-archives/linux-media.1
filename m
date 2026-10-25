Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792943523;
	b=qqATNKX4upErC4tiUGGn+aMoBoTJY0uPSscti+esImiV+XuG1EswMxPlSjdM2c3d4QzL
	 nIVzoCpsGZ5wbH90s/V+1rO4aOhmpv1kLvPc1TG1Y0MEedFoR78KdBcbbQWbx2avhuyq5
	 89rVnq7Brmrtun67KJ4XrPWMaDlieaKhEcIBWTs96lG/tasaabFVToFB9HGeyUoEDe55H
	 aFVHkvmncvgVfnfDg4tKGgdK5ueet7O5MB9Vw6AtSIPgiYqtGmd28ikGfV6FpQJf2xN/i
	 K+q6MEiMSldwM/0WIYmcQKb0E0TOQ6Xa3pUvKr5ejbQAEXwnSkWaQo7n95gswEzxxeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792943523;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Q1JBqL4REYQMjgnChMEcU9naaseLOkmKZvcuWkusN6Y=;
	b=rYUEWOdFFvq1k/rVbgNLlShwzkNYQqFadrnKqoXMipmsrIOku3GC+go/sww48NNJoj10
	 K9PDde0kSluMyW5YjqdokoQyXhhvyr3sQhy1jqOWgJxLTr9suYW+ay5zDuuSSrX750hOw
	 4j9B4BeG3jQ8Gncu+/96oii/bSSg3Q02P+TeMNjfjbGoVD9MSVZu6ljAhVLMAwK55f3Pn
	 XBoXtBhThGnWlmWpD8H8iXIDk6d2RWsWXK97+wIufsjbc176TdglR7z/UXbKfwugLdAPW
	 89TVfYCNKtqdd3Jb4f3wrxKW7LTwQwydtMYDSDc/UyWG7ig11KqzaR5qRRkelZrsRtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Wn86IW+p;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1044606A31B
	for <linux-media@vger.kernel.org>; Sun, 25 Oct 2026 15:52:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1044606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Wn86IW+p
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a208d93758so25548405e9.3
        for <linux-media@vger.kernel.org>; Sun, 25 Oct 2026 08:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792943521; x=1793548321; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q1JBqL4REYQMjgnChMEcU9naaseLOkmKZvcuWkusN6Y=;
        b=Wn86IW+pYXkxgLkyqzxYJz9O5UvgnZy5cgMt+6PpqBKB7lc5DkdnVy2hwZ2bmXRjTn
         rTmBCIvUVNbA+iiz6P9/oh3T/9PbCeLEpYq3h8SUr7HgpL350vuRozZL4/inUH7hLJHp
         gvj9F8eFQOwlIRRkVrzCoSeA10zW+ry28UoqL3b6/Jp8mKIV9yLykDfv+JtDZBxzMHR7
         UbeOLgm4qoJ+vy1Zsb3SHsqIMT+sZLE+oxcRRpJgf/y9ARgKQhXzezP+7IQ2PtW0U4u4
         qTNrw/X776fpCmgxjGe+ZpANpx9dkm+Vx/mrpbJyciQxaYMmHbw922eRnQ1+jCfTZghS
         9cwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792943521; x=1793548321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q1JBqL4REYQMjgnChMEcU9naaseLOkmKZvcuWkusN6Y=;
        b=FhaJnFgY0LLIkH9XvhnCJlWFBJpE7+q8HNuKHsmF/+lGscnnRNEs3SrrQm/TooyTj3
         nmcpngu8GsR80sVW9VLBz4YABWsVCunP4QRr4ERvzkSQA7TxVaM8dqLZsrqxhNjLRkYZ
         q+r9LOzPS6qTXQX/nWdpOc7nHJuck77tWSORIuIGO9TrZBIFwExKsq5CK/FXn5VFTZ2b
         TbhRgbI3VCDBI/vA0uObg0f2XVY0OtLE+3KqaZGHCmZ4T/WJqxNPnZVgB8GYh9ANLXtv
         v2EEFfbfOXoB6IlmjHNtLy1otI1k5A46KTFgJiE+Kqsv7Jdo0661QIxZ/S1Ct5Kzae81
         /R6g==
X-Forwarded-Encrypted: i=1; AKwUvBxrW+Ah3ODzjI3dRs2F6VzTqbvD16uAmNZRW//0OIsIkC9u9jd4PFIYODgPczDfXVtA3CWThiIyY5ocOg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJTNZFS7fmjftxfB0o7W8SMsTaPFV4tbTyPHpKRMTCnqRLQ9eQZ
	+h+qQDwyahPfmSaAqnZ/Xhki6Opm3fxYGAI+K/fl3Emz8FznR4DCdKIQ
X-Gm-Gg: AYBFou0CWs1SeNxn1aOSfYDfoB4QRUDXWBR+M8k+ku/eDD/VrYJOojI5I8SEaQpOLs3
	IMN04uf1Nhscn9KJvg9EVKt38T+KDLEahVRwgMhwqEDj1nTRsVuh7ZLJ1uWckh9ctheeS7pyDUE
	WCnwziWfOtnf3Cc741dNK/6WWvBesD/fkmuZDsu+oceVhjb7zCBFWKyf2ipjZGIF9aHCaQCjPYS
	SWLbQjg+N0BeGjp26MliwXGH05WEDTnPmVh/8k99dx6Ru1eCtynK3ZSANMbVrPOoRYfrEXAIbT7
	AheDd5zLW+sd5vDFD+3qdSogBeZnFP+9G5PyPYxzHBscDVMRm0mmS/NLNAKvk3wceLrNL4CqmW8
	czIkUEo+OYK2qtTTmsf3yeTyA2qFhcJS30Xl07kuRoflbko9iCmUT/DEAgurjK4XBqcVcqAGsDW
	HoDQqi1pi3hL3AERmd83JavPSLHbC9u0YqmldvWniBw8CgnZlju/epAMaDbAO/Bj44ROX9Yd5Us
	ftsOWlAfuUbsJh7lzwsHW3Vml5DYuMyhnJtfJPhN7OdSkbJnKkuEMJ52kyzN5JPbUpotRz7jy7P
	ZM+/YmqGm/Ixhw==
X-Received: by 2002:a05:600c:1c1b:b0:4a2:1a:a116 with SMTP id 5b1f17b1804b1-4a35aae5c48mr85627145e9.0.1792943520880;
        Sun, 25 Oct 2026 08:52:00 -0700 (PDT)
Received: from raviolimobile.tail5f26fd.ts.net ([84.70.180.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359fb08d5sm209216595e9.1.2026.10.25.08.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 08:52:00 -0700 (PDT)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: Sergey Lebedev <lsa.uz@pm.me>
Cc: Fernando Rimoli <fernandorimoli11@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Peter Marshall <pm@petermarshall.ca>,
	George Neacsu <geocausa@gmail.com>,
	Hao Yao <hao.yao@intel.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] media: Add the ST VD55G0 global shutter sensor
Date: Sun, 25 Oct 2026 15:51:56 +0000
Message-ID: <20261025155158.44392-1-fernandorimoli11@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019162722.25587-1-lsa.uz@pm.me>
References: <20261019162722.25587-1-lsa.uz@pm.me>
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

Hi Sergey,

Here is a run of the series on IPU6: a Surface Pro 9 (Alder Lake-P,
8086:465d), whose infrared camera is the same SMO55F0. The sensor
reports revision 0x1111, cut 1, and your built-in cut 1 patch is
identical to the one I had been using. In short, it works, and I have
three findings from the run.

The setup is not media next, so let me say how far it is from it. This
machine boots a 6.19-based kernel. I took 2/4 as posted and made three
local changes for the test:

 - dropped the struct v4l2_subdev_client_info argument from set_fmt and
   get_selection, which 6.19 does not have;
 - renamed "dovdd" to "dvdd" in the ACPI supply names, because the
   6.19-based int3472 here registers this sensor's two GPIO supplies as
   avdd and dvdd, so dovdd got the dummy regulator. Hans's int3472
   series reworks these names, so it is worth checking against whatever
   lands;
 - fell back to GPIO 1 when there is no st,leds, since 4/4 has no
   Surface Pro 9 entry (see my reply to 4/4).

I ran it at the 396 MHz from 3/4, with a cold boot to load the bridge,
and at 600 MHz, which is what this machine has used until now.

What works, at both frequencies:

 - probe, bind, and v4l2-compliance 44/44 on the subdev, starting from
   both auto and manual exposure;
 - all twelve combinations of R8, R10 and R10_CSI2P with 644x604,
   640x600, 640x480 and 320x240 stream 90 of 90 frames through libcamera
   with --strict-formats. R8 at 320x240 runs at about a third of the
   rate (15.93 fps at 396 MHz). That is the IPU6 limit on narrow lines
   in its packed capture path, not the driver; R10 and R10_CSI2P at
   320x240 run at full rate;
 - the strobe, through led_mode;
 - the system relay this machine uses for face unlock, which arms manual
   exposure and the strobe: it delivers frames through the driver,
   though see 3 below.

1. The Surface Pro 9 has the same clock problem as your Surface Pro 11.
At 396 MHz every mode runs at 47.31 fps where the controls give 59.14,
the same numbers you reported on Hao's thread. At 600 MHz it is 57.20
against 71.49. The SSDB says 24 MHz, INT3472 enables the clock through
the _DSM with 1, and everything the sensor derives runs at four fifths.
The previous driver on this machine behaves the same way at both
frequencies, so the cause is the clock.

Unlike on your machine, Hao's v2 does not fix it here. From a cold boot
with it applied, nothing changes: 57.20 against 71.49 at 600 MHz, with
the clock reported at 24 MHz, so the patch does pass 3 to the _DSM. This
firmware seems to give the sensor 19.2 MHz whatever INT3472 asks for. I
have reported it on Hao's thread.

That matters for 3/4. On this machine 396 MHz puts the sensor's MIPI
output at 633.6 Mbps, below its 750 Mbps minimum. It streams anyway, at
every mode above, but it is out of specification, and 600 MHz (960 Mbps
here) is not. I had kept this machine at 600 MHz because 380 looked 17%
slower, and that turned out to be this clock, not the link frequency, so
the frame rate is no argument either way. The specification is, though,
as long as the Surface Pro 9 clock cannot be fixed. Since the driver
needs a multiple of the clock it believes it has, a separate entry for
this IPU (8086:465d) through the per-IPU match in ipu-bridge would let
it run in specification without changing yours.

2. Nothing bounds the exposure while the strobe is on, and the
illuminator has an overcurrent limit that a long exposure trips. Your
maximum is frame length minus 64. At 640x480 Y8 and analogue gain 8,
ramping the exposure with led_mode set to flash gives (frame mean, with
the same exposure and the LED off in brackets; the room light differed
between the first run and the other two):

  frame 1860 lines, 600 MHz:  lit through 1200 lines (158.2 [119.9])
                              out at 1300 (123.0 [118.3])
  frame 1860 lines, 396 MHz:  lit through 1200 (108.0 [27.2])
                              out at 1300 (42.4 [28.4])
  frame 3480 lines, 396 MHz:  lit through 2100 (159.7)
                              partly at 2400 (97.6 [42.0])
                              out at 2700 (39.9)

So it gives out at about two thirds of the frame length both times:
65-70% for the short frame, 60-78% for the long one. The longest fully
lit pulse above is about 24 ms, against about 13.6 ms at the cutoff for
the 1860-line frame, so it is the duty cycle that matters, not the pulse
length. It recovers by itself: the LED comes back as soon as the
exposure is lowered. A ceiling proportional to the frame length while
led_mode is flash would keep auto exposure out of that region. Half the
frame length, which Peter used, leaves a margin.

3. On IPU6 the stream needs a CPU latency bound, or frames come out
corrupted. Through the relay, with a static scene, the frame mean jumped
between 150 and 230, and the log showed

  intel_ipu6_isys.isys intel_ipu6.isys.40: csi2-3 error: Transfer FIFO overflow
  intel_ipu6_isys.isys intel_ipu6.isys.40: csi2-3 error: Inter-frame long packet discarded

while holding a 50 us request on /dev/cpu_dma_latency for the same
capture gave 60 of 60 frames with a mean of 150 and a deviation of 0.4.
That is not this driver's to fix: the ISYS asks for 300 us
(ISYS_PM_QOS_VALUE), and Peter has a change to 50 for it in his tree,
not yet posted. But anyone trying this driver on IPU6 without that
change will see it, and it looks like a sensor problem when it is not.
The previous driver on this machine hid it by holding its own PM QoS
request while streaming.

I will add a Tested-by for the Surface Pro 9 on v2, if it has an entry
for it.

Fernando
