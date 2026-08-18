Received: from mail-244107.protonmail.ch (mail-244107.protonmail.ch [109.224.244.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600A045516E
	for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 10:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787049146; cv=none; b=jcmL3HJ3YrUqh/1DnCR4ZIAyH1AANJdiJz+gWOI+quyv+moCsAG4GcR9No8aYKKH83krUEfxcl3s1GC3Uc9NCyyieyN4twzeMmvyZtU0QPBYJugzYX7ttSQR8egeXsk5mTxo9e8sBDWfknB6mycsSriyh2kMB3hZF/4BA4CqC1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787049146; c=relaxed/simple;
	bh=5g4UEA+oLBbcBaeowrYXhfunMRQ36UEXFg8+pB023EU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=N80K88TqnsqjWf5f0PQjASMTK8lX7Y/P8cfEMynSSd3CYogmm9hwyuq+WtfJRr2Oiau+DKoBRp6GsN5LDyrHHnYjBHcE8kvNKGZ8GvLwVq6wJM48Gv6+8EwmUXujTbBf+HUT2vPBxQ1LsK3/zCw8xblawueuqoVTOa6OuLOrJSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=runtimeverification.com; spf=pass smtp.mailfrom=runtimeverification.com; dkim=pass (2048-bit key) header.d=runtimeverification.com header.i=@runtimeverification.com header.b=R2CQWxbm; arc=none smtp.client-ip=109.224.244.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=runtimeverification.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=runtimeverification.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=runtimeverification.com header.i=@runtimeverification.com header.b="R2CQWxbm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=runtimeverification.com; s=protonmail; t=1787049138; x=1787308338;
	bh=CtbaCwt8u/w/VYrHvpqdVyYzfteudPoIxclD5R7kVG4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=R2CQWxbmJP5CwhujtRzvQlSHFzi6z173lX0QiEqN/VmIiNYXCAr9Uvkq8OrF+jVEJ
	 afZBv29BpIc/pjxayAiPIyOC5PdrrVEHO18KsANuPiy9O6Xlw1qb21Bj73zW/iGX2K
	 nvKw73K9Sgp8TxK6IayJQYIK1I9szd6rzk0jVmb/aKvMyAptOQjvkcmqVkt/79RsUd
	 wEsZMZ3bY9u7emITcAw9RcBNT/VOEQP9jfRmsXa9iuXr8OBF0QF1erPLrUSU+ynoJN
	 h6feADq0nT8x7ad9glX4LhDvC+Bj5402NJ+qQ9CbhDHg0avweJpyCXIViiIavqYc9m
	 JpxlCKm+5mZqg==
X-Pm-Submission-Id: 4hPQxW5Cvfz2SchQ
From: Natasha Klaus <natalie.klaus@runtimeverification.com>
To: ribalda@chromium.org,
	noambs2999@gmail.com
Cc: laurent.pinchart@ideasonboard.com,
	hansg@kernel.org,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Skip frame descriptors with a zero computed size
Date: Tue, 18 Aug 2026 13:32:07 +0300
Message-Id: <20260818103207.431237-1-natalie.klaus@runtimeverification.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CANiDSCue8yyiGubzbAybRqSUTTFuB=-Y2TZy6yvOx32SpAASWg@mail.gmail.com>
References: <CANiDSCue8yyiGubzbAybRqSUTTFuB=-Y2TZy6yvOx32SpAASWg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Understood on the placement, thanks.

One finding while building your refactor: it does not compile as written.
Dropping the uvc_dbg() removes the last use of alts in uvc_parse_frame(), and
the kernel treats that as an error:

  drivers/media/usb/uvc/uvc_driver.c:233:36: error: unused variable 'alts'
  [-Werror=unused-variable]

I removed the now-dead declaration, which adds a hunk you did not specify. Say
if you would rather keep alts and identify the device explicitly in the
dev_warn() instead.

I also wrote the dev_warn() text, since you specified the level but not the
wording:

  dev_warn(&streaming->intf->dev,
           "UVC non compliance: FRAME descriptor is %d bytes, expected at least %u.\n",
           buflen, 26 + 4 * n);

Happy to change it.

To carry your refactor as 1/3 with you as author I need your Signed-off-by.
Could you send it, or tell me if you would rather I take authorship with a
Suggested-by: line pointing at your message.

Natasha
