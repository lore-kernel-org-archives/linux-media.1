Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792863904;
	b=0KdNthLJJK3ZhBb21SAnCibJVdx0bh4fMAui+YvP5HqxqHypWym65CelYrGr4mmw6Tcf
	 kAgwyZtvGQeR3mJQSe5ZCjfwgwNU1ih4m9fyIk0yHEyYVxiuGMSfMyUCDmrm4o/k62mVY
	 baEyRvOqs4MtZkUEQ67qsLbqWejutEfC2EQ2xEMGhSHlGx4bH5TWR0mHKE1WB/xWqpoV6
	 KVtLwSjYKUB/QIU4gWacV442n/kCivGEAKyH/xCZvd5N9waZBKSzqVJgBbFET/Bzud6j8
	 6KhLI+s4Qvoiz2KAZVB1aIwQk7cKx4Qtv6dVTjVqLNOITHzAOSiOnLsOoM6nL1NpplA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792863904;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nn33RrLK2jP6yegXcMbyk7CADovV75ox65AHlodMd48=;
	b=NwkEcYdNgHZfx76wK2CVhLWxuvYqtDuLmdPv83LO0QF5CMIS2uRDNL7lwZ5JLSouwIXk
	 FxP4oPvbjScw7yvZC99XUvzIQxRfB+rxrXZdKlsHdcpQSw16JGdgcn/w6u4N4JagfDV6a
	 B/gGBDw1xroCLFZebuTjzBjr5Qhs6JiwFTRKDDRnB/biWyEjtcAjb3rIJaaf7l58SvFu7
	 dAaPvA+Xe8+UogAKWdSvNaSCYzxOEK8iXlaIgCj1sZwwgXs9yrrgm0dIkgx3CY8DcUcmf
	 C+wV+pL40/qbjiBg6nsNKCW5UV8pDr4KBdz78yD3rLgOTW7DiowjF7LfSYH8KgQAvSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=U9KL1kyn;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC2A606A326
	for <linux-media@vger.kernel.org>; Sat, 24 Oct 2026 17:45:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEC2A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=U9KL1kyn
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso1554863f8f.2
        for <linux-media@vger.kernel.org>; Sat, 24 Oct 2026 10:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792863901; x=1793468701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nn33RrLK2jP6yegXcMbyk7CADovV75ox65AHlodMd48=;
        b=U9KL1kynmW4e9Kq9IiiNvGdF+51Gbk5+qvhsS4w4NciYSk8hrON1hl1eSeMWhlxgjN
         pJHRkV1N4GJXQQur+n8FXZctAO7+Dj1Vye1rez9Y+Ycum0mArRSLaVD3n4rUgNhR9ptg
         dxY7bl83dz4U+bPOs2ILmjuOUdPlB+BaKLFvDanLiLUO7xWT9mD/H9J+CUUevoGo6UiL
         vnMiw7BshVQdKn0A4qJ+iW7KDfB70MLXj+uLB6GVTHd3dHzfVBsZZTLTv0Lli9Fgi2fv
         6hBF/sURvxQ/bJKeTJ+YvGJ/uw03P0vqo9HnqSfziYQiEYAeAy5u88zgQ2kC2X2H7aKS
         W6hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792863901; x=1793468701;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nn33RrLK2jP6yegXcMbyk7CADovV75ox65AHlodMd48=;
        b=vf42NlGTgarhJhMgy4uE8zsVn4guxxBwoB0j7+riMkPXF5GK1WUEu94SuIP1SbYJug
         uVA0xPUomTTQVWULXUaGjPRFVfAQm12CWgV6a8lKvs9zslI/UZo3uNcPEjl7GljF7Kej
         BO5ncARUW1iQndc3mWO9TVTcIEj9xx1P60N8hwUqfGnSnwTn0GtIl4A/gxMT910fSvya
         /dC8nDzzypnyEEAbRDwdbhSHti0pfN96W5Dz5O+EtOVmxV25JLdBI+xXaKoZQunTrOo0
         9W+vXregzWw6XpvmYUbBKuwbgvHEqtQCWD7gCMD/RkrX2BZVeMTOuLngOsuO6fJS5OVq
         ksrA==
X-Forwarded-Encrypted: i=1; AKwUvBwUXcCJjOLE12ZZvyPP6W4B2BrvmnRzMlEicHlTeMyxKBaGtf/xTpiw1WjBlgOECb+wonyiMSfcYHr8VA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIjOfTBav46nAWhzOAuhDi3aTZU/+7/GJIo8mzSNqsw2kSd3tGb
	fTxEt607yupw89e/hmz3kKHI7sKkFdfU9gYEwyU4OkY1gvrgARUQC9AjzIl1+vD5
X-Gm-Gg: AYBFou0ImmsY7P9hIy4bO6FGRxfF4pUYYGkOh1CbK1cNIHoJdpk6f2TTCzu3Ibk8RD6
	Lad6+ZfLdCqKLYwEsXXxvO0t5dr0CAAe2dRqdLgt84X+/RfWyRoV8OTpJ6stRXNnP/yLU/NARBj
	ZeMtTAvaHXf/8j6C6x40ATidFIeScXc+c9mxmeAX+u2/LizdM5se2LzxKVi59sspb3QhqYECb+1
	eLLdIJeYEQ3mnMDWk9wewGUTm0NaRBAekd0BfsNNS3JD4fa3ZrjVk9P8uBrXQLlUWgHyqvGlBdw
	1cKGyxw462knhH0N8dYDR+otv+FlGfNL0qhL/mTSS3HHuZ0HoWHyvWNAOWTwdZpiSrOHXxpontg
	hoLyfLJas5aaoFSwIHE0EfcfRXllTA5iviagNHxguUYxmDfdERjcpZGJovICKB7MF61G4tDgrJF
	zkq8i9BopWVJZ2jUQpPIxK8K/4T9BOl+0trxVCOA70G1BuB0ER82tENhWfUuHpYuPd1yCclW668
	jfghbZf7JoZeCirYebwnpTLlCiicNdqTWj1yG1O9M1CxWYrJwAB1M2mMF9TvomIUdC2MWdHmGOx
	LqUem33vPQnlvCittbZ4qYvu5b0=
X-Received: by 2002:a05:6000:178d:b0:48e:75f:477d with SMTP id ffacd0b85a97d-48e3eb262f0mr3872646f8f.7.1792863900975;
        Sat, 24 Oct 2026 10:45:00 -0700 (PDT)
Received: from john-desktop.station ([93.107.83.127])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb8d5sm5748244f8f.28.2026.10.24.10.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 10:45:00 -0700 (PDT)
From: John O'Callaghan <johnocallaghan@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] media: meson: vdec: reset the VLD before H.264 decoding
Date: Sat, 24 Oct 2026 18:44:36 +0100
Message-ID: <20261024174436.1835068-1-johnocallaghan@gmail.com>
X-Mailer: git-send-email 2.50.1
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

The H.264 decoder outputs wrong luma until the second IDR picture of a
stream. Chroma is correct. The top-left macroblocks of the first IDR
picture hold garbage that is different on each run. Intra prediction
spreads the error over the picture, and inter prediction carries it to
the following pictures.

vdec_1_start() resets the VDEC1 blocks with DOS_SW_RESET0 before it
powers on the VDEC memories with DOS_MEM_PD_VDEC. The VLD then starts
in an undefined state. The vendor driver resets the VLD, IQIDCT and MC
again in vh264_prot_init(), after the memories are on. This driver
does not.

Reset the VLD (DOS_SW_RESET0 bit 4) in codec_h264_start(). The VLD
reset alone fixes the corruption. The other resets that the vendor
driver does (IQIDCT, MC, DBLK, PIC_DC) make no difference.

On G12A, every decode session is affected. On GXBB, only the first
session after power-on is affected.

Fixes: d7647e7c90f5 ("media: meson: vdec: add H.264 decoding support")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: John O'Callaghan <johnocallaghan@gmail.com>
---
How this patch was made: the bug was found and the fix written with an
LLM coding assistant (Claude Code). I reviewed the fix and ran every
test below on my boards. checkpatch is clean; W=1 and sparse give no
new warnings.

Users see this bug in normal playback. On G12A, every H.264 video plays
with the wrong brightness until the second IDR picture: the first
8 seconds of my test clip, with a band 72 levels too bright on the left.

Tested with H.264 High profile clips (1080p and 720p, 600 frames, IDR
every 250 frames), GStreamer 1.26 (v4l2h264dec) and FFmpeg 7.1
(h264_v4l2m2m). Every decoded frame was compared by MD5 with the FFmpeg
software decoder.

Radxa Zero (S905Y2, G12A), Armbian kernels 6.18.45 and 7.3, staging
vdec with Armbian's patches:
- before: frames 0-249 wrong in every run (10 of 10)
- after:  all 600 frames bit-exact (32 of 32 runs)

Odroid C2 (S905, GXBB), Armbian kernel 6.18.44:
- before: frames 0-249 wrong in the first decode after power-on,
  later decodes bit-exact
- after:  bit-exact, including the first decode after power-on

Odroid C2, plain v7.3 (no out-of-tree vdec patches), GStreamer:
- before: frames 0-249 wrong in the first decode after power-on
- after:  bit-exact. Two GStreamer starts failed first with the known
  poll() start race, so the decoder had already run before this decode.
(v7.3 also drops the second-to-last frame at the end of the stream.
That is a separate bug and is not addressed here.)

The DOS_SW_RESET0 bits were tested one at a time: only bit 4 (VLD)
changes the result.

Not tested: GXL, GXLX, GXM, SM1, interlaced streams, 4K. On G12A the
tests ran on Armbian kernels; their vdec patches do not touch
codec_h264_start().

The same fix is in Armbian:
https://github.com/armbian/build/pull/11098

 drivers/staging/media/meson/vdec/codec_h264.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/codec_h264.c b/drivers/staging/media/meson/vdec/codec_h264.c
index a6074de15..497fbada6 100644
--- a/drivers/staging/media/meson/vdec/codec_h264.c
+++ b/drivers/staging/media/meson/vdec/codec_h264.c
@@ -182,6 +182,14 @@ static int codec_h264_start(struct amvdec_session *sess)
 	if (!h264->sei_vaddr)
 		return -ENOMEM;
 
+	/*
+	 * vdec_1_start() resets the VLD before the VDEC memories are powered
+	 * on. Reset it again, or the luma of the first pictures is corrupt.
+	 */
+	amvdec_write_dos(core, DOS_SW_RESET0, BIT(4));
+	amvdec_write_dos(core, DOS_SW_RESET0, 0);
+	amvdec_read_dos(core, DOS_SW_RESET0);
+
 	amvdec_write_dos_bits(core, POWER_CTL_VLD, BIT(9) | BIT(6));
 
 	workspace_offset = h264->workspace_paddr - WORKSPACE_BUF_OFFSET;
-- 
2.50.1

