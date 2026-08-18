Received: from mail-244107.protonmail.ch (mail-244107.protonmail.ch [109.224.244.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D274B04AB
	for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 06:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787035535; cv=none; b=WC4G2r2ZlgRseoE83kRhidfRL9bypP+eEsCKZUkBkoCP1XQtBdzP557A2gc2/YSVJlaSxOaQ2ph2+pD+dPTyFip2wosiTqGITD5uSUXU0wTVRx5+4aTe2bE57JbACVzeezy/sRlb0o7jmh63WIkQYvnwgfxp8fHiTiThlSjp0lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787035535; c=relaxed/simple;
	bh=8oQIGis4Vn1P7FN4gi/Tww4mCVaS8Zj+8pSNmGGhF2g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pqxNa2RYEj7r9Apo+0955/YkH5StUEa9awjg3CEd/5rd5nT8yT4SM3fWiNXJS3ikhMAAaQghPqgN4WhHb4jiMa9fbJ8EelhSTibOxF2WKAQ0YnARHQru5vSBakRYeUHyKH/WAdRisJwtvRJ1tUy9DZ9H2rwGE1W2eukpjSrKGZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=runtimeverification.com; spf=pass smtp.mailfrom=runtimeverification.com; dkim=pass (2048-bit key) header.d=runtimeverification.com header.i=@runtimeverification.com header.b=N1BnUAz1; arc=none smtp.client-ip=109.224.244.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=runtimeverification.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=runtimeverification.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=runtimeverification.com header.i=@runtimeverification.com header.b="N1BnUAz1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=runtimeverification.com; s=protonmail; t=1787035527; x=1787294727;
	bh=VzLWIBWdUGTRg8xaYf15XR+9ztGdjCtVIw4E10h8fN8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=N1BnUAz11qHxVyYOGF/ahXqelHXB2vq1e+kUgXf39kArY2AnDns7cHql5PG282JwR
	 HgfdBpgOFzN0MQVzfLCf+3GosjP3T64jvLIpbxgHWoHml7psSkFRB+knxpAWGeLxna
	 ag8hsNkG9IRM1G7r5+409C6mg6UGtscEMiZ5a/YIRJnsX4zjc61pgAZrVtMS0q8JVx
	 nIiU+1aCNp/N8Yfb4QWjf/YeIdU9r8T/jhdboTjw6S3lXSkqAMoF+ReDyvhL1tWzsx
	 K0Urmlb6mB9gtCw4v5LLf3tt6yRw+MwDsftfSFp3zFHm3D8CP74AeHAjJO74RmlI7J
	 Dl5bNisK1ZdIw==
X-Pm-Submission-Id: 4hPKvl4mq0z1DDWf
From: Natasha Klaus <natalie.klaus@runtimeverification.com>
To: noambs2999@gmail.com
Cc: ribalda@chromium.org,
	laurent.pinchart@ideasonboard.com,
	hansg@kernel.org,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Natasha Klaus <natalie.klaus@runtimeverification.com>
Subject: Re: [PATCH v2] media: uvcvideo: Fix integer overflow in frame buffer size calculation
Date: Tue, 18 Aug 2026 09:45:11 +0300
Message-Id: <20260818064511.104024-1-natalie.klaus@runtimeverification.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260812103251.18309-1-noambs2999@gmail.com>
References: <20260812103251.18309-1-noambs2999@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Aug 12, 2026 at 01:32:51PM +0300, Noam Ben Shimon wrote:
> +	if (!(format->flags & UVC_FMT_FLAG_COMPRESSED)) {
> +		u64 bufsize;
> +
> +		bufsize = ((u64)format->bpp * frame->wWidth * frame->wHeight) >> 3;
> +		if (bufsize > U32_MAX) {
> +			uvc_dbg(dev, DESCR,
> +				"device %d videostreaming interface %d FRAME %u: computed buffer size overflows\n",
> +				dev->udev->devnum,
> +				alts->desc.bInterfaceNumber,
> +				frame->bFrameIndex);
> +			return -EINVAL;
> +		}
> +
> +		frame->dwMaxVideoFrameBufferSize = bufsize;
> +	}

Ricardo asked me to look at this. I had been looking at the same expression
independently, so I checked your numbers and the surrounding behaviour
rather than only the diff.

Both examples in the commit message reproduce exactly. 32 bpp at
16384x4096 gives 4026531840 against a true 268435456, and 16 bpp at
16384x16384 gives 0 against 536870912.

One case I would add to the commit message, because it is the strongest
argument for rejecting rather than only widening. bpp=32 at 32768x32768
is exactly 2^35, so the 64-bit quotient is exactly 2^32. A bare (u64)
cast without your check would store 0 there, which is the same failure
the patch removes. Your check catches it.

I also checked when the check can fire at all. For bpp <= 8 the threshold
is unreachable given the u16 field limits, and it does not need to be
reachable: the largest possible result at bpp=8 is 4294836225, which
still fits in u32. So the check fires exactly where it is needed and
nowhere else. That seemed worth confirming rather than assuming.

My one question is about the error path rather than the arithmetic.

uvc_parse_frame() has a single caller, and -EINVAL propagates further
than I first expected:

  uvc_driver.c:495   return ret, so the whole format is abandoned
  uvc_driver.c:745   goto error, so remaining formats are never parsed
  uvc_driver.c:788   usb_driver_release_interface() and uvc_stream_delete(),
                     so the streaming interface never reaches dev->streams
  uvc_driver.c:1004  the uvc_parse_streaming() return value is discarded,
                     so probe continues and succeeds
  uvc_driver.c:2135  "No streaming interface found for terminal %u"

So one malformed frame descriptor costs the entire streaming interface,
not just that frame, and probe still succeeds. On a single-interface
webcam that means the device binds with no /dev/videoN, and the only
explanation is the uvc_dbg line above, which sits behind a debug bit
that is off by default.

I do not think this is a practical regression risk, since no plausible
device reaches 2^35, and the surrounding function is otherwise built
around repairing bad descriptors rather than rejecting them. What
bothers me is the silence: a user who does trip it sees a device that
binds and produces nothing, with no logged reason. Two ways to address
that:

  - dev_warn() instead of uvc_dbg(), so the reason is visible without a
    debug build
  - skip only that frame descriptor and continue, rather than failing
    the format

Either would satisfy me. If you and the maintainers would rather keep
-EINVAL with uvc_dbg as it stands, I have no objection to that either,
and you are welcome to add

Reviewed-by: Natasha Klaus <natalie.klaus@runtimeverification.com>

to v2 as it is.

Separately, and explicitly not an objection to this patch: a zero
dwMaxVideoFrameBufferSize stays reachable from the other end. Any zero
operand, or any product below 8, gives 0 after the shift, and bpp=0 does
reach the computation on uncompressed formats. Nothing between the
descriptor bytes at uvc_driver.c:254, :255 and :382 and this line
validates any of the three. A zero then goes through uvc_video.c:214
into stream->ctrl, sizes vb2 at uvc_queue.c:90, and trips
WARN_ON(!plane_sizes[i]) in vb2_core_reqbufs() at
videobuf2-core.c:951. That is pre-existing and unchanged by your patch,
so it is not yours to fix here. I am happy to send a follow-up if the
maintainers want it as a separate change.

One caveat on my side: all of the above comes from reading the tree at
v7.2, not from running it. I did not test on hardware or a UVC gadget,
and I did not build your patch.

Natasha
