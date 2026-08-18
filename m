Received: from mail-106112.protonmail.ch (mail-106112.protonmail.ch [79.135.106.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D103932EE
	for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 09:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787046823; cv=none; b=BdLC/gHrMBrV55Anr/sTTBuyBiyDrvpq79aC+P6Hbf3lVpYr6WmsvErZ3/jzHNiqAuRrSbht20YYsIjl0H3O4Jts9AYCs98ZKjN/sK3sQ2BNdDUNnNB9mGIJS67zKoCipI7hCrx8qQ8OQgeuNi/XNQC2YTxjJaIYeSRadQkYpzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787046823; c=relaxed/simple;
	bh=9luHGON2wvOVH0eHgE8BxiZ+qOB4Tg/p6Fe76BNvPmA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WbXE8ZzcSYlBWaxTp7eSO0zAz5+vwjywEy6J8WhGz+6a2/yGww2c8qpvd+bZSPiXvQfwgXZ+R90HmwYEY+RISk0Ik4wpGivqn7DRAm0fzHlILP6vZEi2ql9iDTHkhwfU0llyY99o0VWcwNMdnqWY6OPzGu6rdC0WaQ9NY0v9z28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=runtimeverification.com; spf=pass smtp.mailfrom=runtimeverification.com; dkim=pass (2048-bit key) header.d=runtimeverification.com header.i=@runtimeverification.com header.b=b5YDbcbH; arc=none smtp.client-ip=79.135.106.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=runtimeverification.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=runtimeverification.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=runtimeverification.com header.i=@runtimeverification.com header.b="b5YDbcbH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=runtimeverification.com; s=protonmail; t=1787046818; x=1787306018;
	bh=9luHGON2wvOVH0eHgE8BxiZ+qOB4Tg/p6Fe76BNvPmA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=b5YDbcbHTsBr93QKneFIDNQS0xOaNjDepRxoNhc+B6/1HYW4H0e/bjgoYHNuYVMAJ
	 tzMxQK8xCknoRQX/Butrcof8T+I4vYS/7J8tWqjKJLEDEH5KRd1K8MFoBnmozkC2qt
	 DeFJwTkd0uh+8G4nRPfyQhs7z2HOPhMi6o9Hp66y48d4gK2jqwIHRmxHHdbssXZNVn
	 SnZvXjc02rCTtD8GjYi0Sg1lrk45CxGkfzlC1iDdv08UJJhw/C/59v0CP7rYhQh9G9
	 OGLBSWYbm5EDz2Z1sX0iRdJ35oWCMBsZiLqoCg/MIquUx3cItgfepgr6Xae34Id9fA
	 9hKF39wOZgGHg==
X-Pm-Submission-Id: 4hPQ4t61Qcz1DF6r
From: Natasha Klaus <natalie.klaus@runtimeverification.com>
To: ribalda@chromium.org,
	noambs2999@gmail.com
Cc: laurent.pinchart@ideasonboard.com,
	hansg@kernel.org,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Skip frame descriptors with a zero computed size
Date: Tue, 18 Aug 2026 12:53:27 +0300
Message-Id: <20260818095327.372080-1-natalie.klaus@runtimeverification.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260818094010.353021-1-natalie.klaus@runtimeverification.com>
References: <20260818094010.353021-1-natalie.klaus@runtimeverification.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Three more things on the refactor, from reading it rather than running it.

Placement: bufsize is declared at uvc_driver.c:300 and the block closes at 327,
while interval parsing runs 329-354, so at the proposed position the variable is
out of scope. And the exemption a check outside the branch would need is
format->flags & UVC_FMT_FLAG_COMPRESSED, which is the branch condition at line
299 itself.

The compressed case is worse than frame based alone. For UVC 1.10 and later
uvc_fixup_video_ctrl() at uvc_video.c:214-218 never consumes the descriptor value,
the size comes from the probe response. An MJPEG descriptor reporting zero is
inert on those devices today, so a check outside the branch would skip those
frames and break cameras that stream fine.

-ENODATA already appears in this driver with the opposite polarity, at
uvc_video.c:1284 and :1310, where it means drop this payload and carry on. Using
it for the fatal case reads backwards against that.

The mechanical parts of your refactor hold: buffer[0] cannot be zero because the
USB core truncates the config at the first bLength < 2 descriptor (config.c:706,
:785), the interval array is pre-counted at uvc_driver.c:718-729 with
*intervals += n after every skip return, and all frames[] access is positional.

Not tested on hardware. I will build and test before sending the series.

Natasha
