Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795661296;
	b=JT/8s0eLV7x1TFBEiFiHXlSOLrjwBZL1VBs2EJlJU60CZdwPVdy+rx7P2PPJ8JUlniET
	 6rYWNvPbcr/8mV7S6uVJ2wgjM5KvyCErjas3hrFEsHZEN+vVZBTbydnAiLWBiHzOo3V9k
	 5Lmvz14sa6h1ybZrhQBtjFwsToGrzAB+HXsbgGjdbPytQg9OwxR+4iY6srcwiXgUBN7T3
	 E625uV1m02mBKOTtJbXj8B4uzRCMowkPLzSA3RtR5t7nWHIDeQob0tzNenZsydYXud5I/
	 BmrbtR13qQvFXhehXXmiJ86p3Pae24MT/eeYCoR3C0n6xcucfdH/p+tu0LmCKBRNjXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795661296;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=6MU1/48ZybrBDzSqWU7nC+slwlNUnGGFJ6ROpqcIX4U=;
	b=umy/tIqHYeOkfcIZFbP3EojzHsVD40nZVpDht7UGrf8S+O3N82QaIUiFx2dpuk+GiRxQ
	 HMGvq5ZsPPN0JvKOutjZU+rp31AqTaEuH1AJqCdD4mLnFIoTXlC7s4DyW8KiZFFDIIAFm
	 913CbV8io8T1nwAttJBRhkFyUM6nmZrkNfxar/17FlUC+AZ4vuNlO+QXT9eAAh6SbzW4A
	 FeMTwEQH++OgBzBvE/tpq0gYXDy24hHHeUorTn4qkHHXpU8q3VBBLpEahh4cEdca0N4ys
	 4CSxSLjODxHuRhjAkG8V5YJvXqJEWE5bCos0g0wWL8P4JcNU/rBnjLIn1WqrBOFFsCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IZFwNIh7;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7DA606A326
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 02:48:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA7DA606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IZFwNIh7
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b487f44ee0so2533131a91.0
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 18:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795661295; x=1796266095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6MU1/48ZybrBDzSqWU7nC+slwlNUnGGFJ6ROpqcIX4U=;
        b=IZFwNIh7WzHe3PbjJQ/iynoH6m5rUuCSzTBDF4gGxs+nS7INS1cVB6T5u40XFSLvfY
         Cv7t3ZB0P4TYE+M+XbyRc2PIKO9ZpszHfipULoVPN8rBvj1X0e0F/+N7Fk5zTtxi0Uwk
         pPxO8+okHgpuP0oXgWox+0A5oKObsyOBGV40tlU2UrRJ3aOenRZnW6txydUsNrxF+Gix
         l76p2UghEvND8FyvfptD4vEMbg02BPH77LRQilvbJHj3whyFs7IGVA+Xk4aNEUbrb3jh
         +cs2eAs8UbpwS3rpHLd0B3cpKH93XBVMF+43bXs6HZjBYgSCbB1qj/fFpGIl+T08Yi6/
         OHZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795661295; x=1796266095;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6MU1/48ZybrBDzSqWU7nC+slwlNUnGGFJ6ROpqcIX4U=;
        b=U8sUQrZD5BX9K7uF/RaciOAq8XMHjEUCO6fbqOhSZnVqYyLJEW4M5fFmBMJquR490k
         LateFkLa3kG5Wf9FOWczPy0jl4Vh7UiZxfxZQozGY7hBETkFX0Bhek6a4/+dZ3mdIjX2
         OOjGxBnuF1cUce7dSRZlX8mL3Ylbz9JX9vCh1JotHEoDyQ/J1+tKYXLat9Y/9hU42g96
         6/6PuCGWuH19zs6uZchji2BHYz8tZxERJBFQjLyUQ4iqLbVy//1j3JWLs/JbIR9AtzA8
         rxd0wt+JiQQIm5Wrd4a2IyfanYTqiMgnV+B5iKaeTQTPpNsAIHwZZYSY2JXqN6e/r8Rg
         RBJA==
X-Gm-Message-State: APuU4Z+MRgkZuNZLNLDebX8WiIAqxlM/eCv0XPFnuRoPMcvcRkOL61Vj
	wzbzuHdkzC7ZuILam2Cq21r0YfEM6x/zZi6ypw3SNs8c4+Zz5yMgfLpo1JjSo3rk
X-Gm-Gg: AZFdTZdbrAhCx7IkRieD65rsh+bqjwc1qPhlcspyHc8brD/SqaFhGZMwM7n7fRGU5Kk
	WxOt1gUr0sFPcod6RZFOZpkbWIGFfFIyK+VT6SJvQaWu84PPHQDnxzQiXc+npFVbY/uvzBbVeP3
	/VrKWk9m4qt2oQxhVMeWOuBpZpBQG1/ZLdFh/iiylmmxmTACY3+w+AF0jgmjRsWnoTsHFiHPrrS
	4h7rNQAg2bSiu8UnP3PSZXIqsBkb5y2RZANT+zK2yAe2otLxjmHe9c5t2vIj3sl35MmPbVrSnUw
	NvBPk5fhNZNKI3fSoe5dVtJX+BWeQlSxd111XU4ymC87oOxX4JzWgog4+auIJnx1y382YFJeQRG
	MMtnWwCF+jVPqTnEQ1e1iSas0+tMFvRVFhW1O3dpYUb8NvhR3ETo/IHBHWAziWD7FDXRLgO4GMB
	NSjFAuwWyTkmhaix/Qhzav9Or0P7sf9X9F9fgiQ+O/8r+b6uk8CHyVuMh8blWMstGrqGzQucHkC
	5eZ20h0PZq7MRV6vNcb/SSKHFfpS4w1YcEJ2l/5zvDr9UIA5Nww3zBwA8box3JhK8r9a5xAteGG
	njWgopWAGHLIbGK63FRhDcCarvxBk94LLOyYaDT0GQ==
X-Received: by 2002:a17:90a:ec86:b0:3b3:ab75:c940 with SMTP id 98e67ed59e1d1-3b41c9b2ddamr19126643a91.18.1795661295006;
        Wed, 25 Nov 2026 18:48:15 -0800 (PST)
Received: from a-VirtualBox ([168.188.125.88])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4afeaaa84sm14486670a91.10.2026.11.25.18.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 18:48:14 -0800 (PST)
From: Minseo Park <hiyoukou@gmail.com>
To: linux-media@vger.kernel.org
Cc: m.tretter@pengutronix.de,
	kernel@pengutronix.de,
	mchehab@kernel.org,
	hverkuil@kernel.org,
	linux-kernel@vger.kernel.org,
	Minseo Park <hiyoukou@gmail.com>
Subject: [PATCH] media: allegro: reject S_FMT on OUTPUT while buffers are allocated
Date: Thu, 26 Nov 2026 11:48:06 +0900
Message-ID: <20261126024806.33434-1-hiyoukou@gmail.com>
X-Mailer: git-send-email 2.53.0
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

allegro_s_fmt_vid_out() stores the requested frame size in the channel
without checking whether the OUTPUT queue already holds buffers.  The
CAPTURE side does check, with vb2_is_busy(), but the OUTPUT side never
got the same guard.

The buffers are sized from channel->sizeimage_raw when REQBUFS runs
allegro_queue_setup().  Growing the frame size afterwards leaves the
queue holding buffers that are too small for the format the channel now
describes, and nothing catches it: allegro_buf_prepare() validates the
field order only, not the plane size.

allegro_device_run() then hands the encoder the small buffer together
with the new geometry:

	src_y = vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, 0);
	src_uv = src_y + (channel->stride * channel->height);

and allegro_mcu_send_encode_frame() passes channel->stride along with it.
Going from the smallest frame size the driver accepts to the largest, the
12 KiB that were allocated are described to the MCU as 11.9 MiB, with the
chroma plane starting 7.9 MiB past the end of the buffer.  The MCU reads
whatever follows the allocation and encodes it into the CAPTURE buffer,
or faults, depending on whether an IOMMU covers the device.

Check vb2_is_busy() before storing the format, as the CAPTURE side does.
That is enough on its own: the core records the queue_setup() size in
vb2_plane.min_length when the buffers are created and rejects a DMABUF
shorter than that, and the queue offers only MMAP and DMABUF, so once the
format cannot change the buffers cannot be too small either.

This was found with the help of Claude (Anthropic), which also wrote the
patch and this changelog; I reviewed both against the source.  See
Documentation/process/generated-content.rst.  There is no reproducer: I
do not have the hardware, so this is compile tested only, W=1 with
COMPILE_TEST on x86_64.

Fixes: f20387dfd065 ("media: allegro: add Allegro DVT video IP core driver")
Cc: stable@vger.kernel.org
Signed-off-by: Minseo Park <hiyoukou@gmail.com>
---
Tool disclosure detail, per Documentation/process/generated-content.rst.
The assistant was asked to audit V4L2 S_FMT handlers for driver state
committed before validation, across a long interactive session rather
than from one prompt.  The candidate list came from a script that
flagged .vidioc_s_fmt_* handlers writing driver state without a
vb2_is_busy() guard; it was calibrated against a known case first, and
its output was read by hand.  The asymmetry with allegro_s_fmt_vid_cap()
and the path through allegro_device_run() were established by reading
the code, not by the script.

Review and a test on real hardware would be appreciated.

 drivers/media/platform/allegro-dvt/allegro-core.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/allegro-core.c
index dc76986ce48d..b241a7208deb 100644
--- a/drivers/media/platform/allegro-dvt/allegro-core.c
+++ b/drivers/media/platform/allegro-dvt/allegro-core.c
@@ -3461,12 +3461,17 @@ static int allegro_s_fmt_vid_out(struct file *file, void *fh,
 				 struct v4l2_format *f)
 {
 	struct allegro_channel *channel = file_to_channel(file);
+	struct vb2_queue *vq;
 	int err;
 
 	err = allegro_try_fmt_vid_out(file, fh, f);
 	if (err)
 		return err;
 
+	vq = v4l2_m2m_get_vq(channel->fh.m2m_ctx, f->type);
+	if (vb2_is_busy(vq))
+		return -EBUSY;
+
 	channel->width = f->fmt.pix.width;
 	channel->height = f->fmt.pix.height;
 	channel->stride = f->fmt.pix.bytesperline;

base-commit: 4dce97c6c265544342e716e62fd24bbb232590c5
-- 
2.43.0

