Received: from mail-qk2-f6.google.com (mail-qk2-f6.google.com [74.125.230.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C198D2D9EE4
	for <linux-media@vger.kernel.org>; Sun, 13 Sep 2026 20:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789331044; cv=none; b=HmMiGEZQNH2XkdjtmCMWLf92ea/gGbZ05YnYwCrDU/akaNjN++e9YpeqfzKC42PoVnjrpCVJADOHBAIXMPEz+WlWTCoJGM/mXlPLKokoFb3jcgzL/wvu6LgP48NQyIK0WeBQzjlG//WcCN6FHjal5dnJhPW/gPNDkoXMqKC8kuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789331044; c=relaxed/simple;
	bh=kwl6j4C8sSi5y4AOUqro+lR6JR2cXbktFrxPE4rtRi0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aO+NN5vg/V1UKo4eOKEwTcYZVwlnEdu4WBwkZINlqSsAhupPn2pG5nhGl6jKqAzPC5e7g/SsS+lxx3qv36KasFHqsldF1NpLVv6Zp8fqaux5j9n70pDbTFyeutIjgbexzCvV35MKPm2S4962YeBqUuleggEmw0ryy9h6NfB+KXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ua0s8hOF; arc=none smtp.client-ip=74.125.230.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ua0s8hOF"
Received: by mail-qk2-f6.google.com with SMTP id af79cd13be357-93a0da4df41so52880785a.0
        for <linux-media@vger.kernel.org>; Sun, 13 Sep 2026 13:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789331041; x=1789935841; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xkmhys9cAuPiWHBa7yCHnDI51ie9gImx91dKHwhn/Co=;
        b=Ua0s8hOFaHCdXCC7d/ieJhPZyeZ2jGPMoNI0grDH5VW7nn+E3Ftzd5kj55vVJYQ1v5
         XkprDgkGklC+dhQqVb/aHmQX82AULzMb7CHKgK8sA53CPVT0HL9EVQba5cNmdkFb8Y+a
         Uvv4OjBDalt+j5c8JTh/Fin+/2BSJKWNIcDq/l3dvMYLOE46rhBpwLDx6voA/pdfmi0T
         vnDKB1nUc1okr0MvMXDOe5oaLVK8FQSi6NpPq3jnD0nGx0GNitPDkPZXaTsv8HjvgZJu
         tSocEool0/QROq5isGlZXwWnkjZPPP/G/NtHGJ97T5+uHc/OgjdFN3+O5TKDremLmvC+
         9zgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789331041; x=1789935841;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xkmhys9cAuPiWHBa7yCHnDI51ie9gImx91dKHwhn/Co=;
        b=QSjiwj9n/oseVspYfC4M1o2EggHq+aV7g3aIQyUPE/6hnW20PYQi0JK3vUNNPI94Xr
         YwPxFv11SXs/Yb5WTmgcWLxJ6ER6OrZXuIYBvcPVYNmTsq8Lw/uchSaBNkdfh3nLnVSW
         EP4TNAfwNOku+yrDC9JU5Ycmzysss9dPGZraUAuEssTSMRY9eIRNaQHavh2urIY+cHQe
         yjayIbNJPkilh1YwU8fpxM7ud5rQ17tBoQ03e4FXONdtwzjwpPn1NAHibzs9SheYtdiN
         aCp2737lERkQ8M19dTcwd27XK0AaQUvi3Spcy8iJ9W+VlojaGxzDKUyZVrm0LOTkFNQe
         gX6g==
X-Gm-Message-State: AFuF++lCCNZQfYN4D5N3J563MwSN8yi7Tc1r630QoyLCJTtUgaIRCnmj
	P9vODx8PD70SwGHWq3W5Y3OR2OnlCHO3Kbk2848QKO/nQFIEhhtZ9rcpdO0+HttUaJvp64RV
X-Gm-Gg: AYBFou07oBGJPKnF1UA3oCknF7MTzK2S8Fx/FFNVOKWope4zO/dZTpskANWgqD/48zW
	kuPnJeDa/ubC6YAfeImfKLCi48ZF0AfjbBwFCLQ4+dR9iwSEOdaU6zT2aLq/RcKrufRy7bxDZQn
	WbwSMx4fnqpG72fSmxwA2a0kNNZAhyPdLReK13dMvLIMuG9SHNg01j4Fa48RwlvUt/Pp8mak0dM
	JLP2fgsvSf0xNiUuJ4pJ1Am4hV+F9HL03b2PI9nbP88E7hwbC1YOM5xV2u/q1zhzpA5OvrItE2N
	zpwC2G4g0xEVJTwfqjH6AnMCy26QaQ6j3sSG2cvDaMLnIAPg3DA1JsWqgVQM44oRwGabTSvM960
	B2jAquxf5nzxIeiYLSTyeAXZWRUHWywufAT1+dW+WwLxT8oFSmSR7JSic6xN6udj44gySdF8r5m
	yxz2e1ioKrtarKBLEmdSh8ADtAWfP8Secf2Mp+Izyd97HW2Dwd63miyintUoSAQum+XyeGkcYCl
	Y1v0L7kF0mSEZwvkoqXs5RcURBheQ==
X-Received: by 2002:a05:620a:6e91:10b0:93a:14c:32a6 with SMTP id af79cd13be357-93a014c4195mr910721585a.48.1789331041553;
        Sun, 13 Sep 2026 13:24:01 -0700 (PDT)
Received: from Interstice (pool-96-239-109-94.nycmny.fios.verizon.net. [96.239.109.94])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939e8047194sm809399585a.20.2026.09.13.13.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 13:24:01 -0700 (PDT)
From: d01 <d01.devel@gmail.com>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org
Subject: [PATCH] media: em28xx: fix silent audio capture on EM2860/TVP5150 reference design
Date: Sun, 13 Sep 2026 16:23:12 -0400
Message-ID: <20260913202312.1511971-1-d01.devel@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The EM2860/TVP5150 reference design (eb1a:5051, "USB 2861 Device",
card=29) captures no analog audio. The ALSA device yields a flat noise
floor of about -85 dBFS, identical with the audio cable plugged or
unplugged and regardless of mixer settings, while video capture works
normally.

Audio on this board is not on the em28xx vendor path. Chip config
register 0x00 reads 0x50 -- bit 0x80 (vendor audio) is clear -- so the
board exposes a USB Audio Class interface claimed by snd-usb-audio, fed
by the EMP202 codec's ADC. Which input that ADC listens to is set by
AC97_REC_SEL (0x1a).

em28xx_audio_analog_set() does program AC97_REC_SEL, but only under:

	if (dev->ctl_aoutput & EM28XX_AOUT_PCM_IN)

ctl_aoutput comes from the board's per-input .aout field, falling back
to EM28XX_AOUT_MASTER when it is unset (em28xx-video.c). This board's
entry sets .amux but no .aout, so EM28XX_AOUT_PCM_IN is never set, the
AC97_REC_SEL write is skipped, and the mux stays at its reset default
of 0x0000 (Mic, which is not connected on these boards). Nothing is
captured.

Set .aout on both inputs to select the PCM record path from Line In,
matching the .amux already declared. ac97_return_record_select() maps
EM28XX_AOUT_PCM_LINE to 4, which em28xx_audio_analog_set() mirrors into
both channels as 0x0404.

EM28XX_AOUT_MASTER is included so the master volume continues to track
the V4L2 volume control exactly as it did via the old fallback, keeping
the change additive. It is not required for capture -- muting
AC97_MASTER by hand while leaving everything else in place does not
affect the recorded signal.

Diagnosed on eb1a:5051 by writing AC97_REC_SEL directly over usbfs with
everything else held constant:

  AC97_REC_SEL = 0x0404 (Line In) -> -21.8 dBFS, line-level audio
  AC97_REC_SEL = 0x0000 (Mic)     -> -85.4 dBFS, silence

Then verified with this patch applied and the rebuilt module loaded, with
no userspace register writes at all: the driver programs AC97_REC_SEL to
0x0404 on its own at probe, and capture yields -25.0 dBFS of line-level
audio once the mute control is cleared.

AC97_POWERDOWN (0x26) reads 0x420d throughout -- status bits ADC, ANL
and REF all set -- so this is not an analog-power or GPIO problem. The
codec is powered and simply listening to the wrong input.

Note that the V4L2 mute control defaults to 1, which gates the bridge
audio path via EM28XX_XCLK_AUDIO_UNMUTE in R0F. That is a separate
issue and is unchanged by this patch, so "v4l2-ctl -d /dev/videoN -c
mute=0" is still required to hear anything.

Signed-off-by: d01 <d01.devel@gmail.com>
---
 drivers/media/usb/em28xx/em28xx-cards.c | 4 ++++
 1 file changed, 4 insertions(+)

--- a/drivers/media/usb/em28xx/em28xx-cards.c
+++ b/drivers/media/usb/em28xx/em28xx-cards.c
@@ -1148,10 +1148,14 @@
 			.type     = EM28XX_VMUX_COMPOSITE,
 			.vmux     = TVP5150_COMPOSITE1,
 			.amux     = EM28XX_AMUX_LINE_IN,
+			.aout     = EM28XX_AOUT_MASTER | EM28XX_AOUT_PCM_IN |
+				    EM28XX_AOUT_PCM_LINE,
 		}, {
 			.type     = EM28XX_VMUX_SVIDEO,
 			.vmux     = TVP5150_SVIDEO,
 			.amux     = EM28XX_AMUX_LINE_IN,
+			.aout     = EM28XX_AOUT_MASTER | EM28XX_AOUT_PCM_IN |
+				    EM28XX_AOUT_PCM_LINE,
 		} },
 	},
 	[EM2861_BOARD_PLEXTOR_PX_TV100U] = {
