Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.29
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795391923;
	b=EO0/UIU0YUUpLGpz8LSiWVGIBKtTk9V43MxaWkBqh9+R0j+EAc8HFOsRbni+ZYi1RL4e
	 wDlgpl8sWBZwrdgyt1QoDz7qedOy9vcLgussQxkD3SXgJWjnbn9RfJx9hMgLR9naQNEMm
	 toh1CuBsnzlUEB159W++fxnOLouv/3LljvLG2dGg6hFtRJ3lua+pFO7K8LumdpZ0y7hMl
	 fjKgABFe3Ns8nxzURADgQaswGaVfNy3y2lJSog+lqsD2T75gBaKgL56e2OMnrFPKOV1W9
	 GxmLq+UQZCFs69S63UsiHgoVyVHDScQslunciUB/q2QT02A4J10xBqSfaQgzD1dQIxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795391923;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=4gNy8roLwOc1L+J3BtP1HrH6hRU3IEez5wKIQNQ7iSM=;
	b=z4/CPYs2NXW1U8Ji6nDW36IrlXG7+JGDPRlSTRZffVggm+QE8unTr4RuBJ4AEe//+Ldi
	 0r9INT2HZyxp54zulOpBydMtbw+SRnxen6QGeOsxefYO2JKqPmDYqiBwcmpEz2XUhm5Yl
	 dBLqR/i5szH6XQAqoLMkSNo9HtMcveJjQSKG+XNknxpxd0CRay7J4UJ2VBzTww8cXGAe+
	 mX9yOWF9pL529Pj6PqdBTlmbFGRf842msmvR7duw+ZoOMvfTBCtR36UNA+Dj5eHH9R/LU
	 /AfPM+TSyJh2+1Heejv/Ia6LMzj02vSutx80YFuRoN1p46VnnHevAvPl1XWKMSZH5TA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=protonmail.com;
	spf=pass smtp.mailfrom=protonmail.com;
	dkim=pass header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=Tcf8RxQ8;
	arc=none smtp.remote-ip=79.135.106.29
Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch [79.135.106.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6D7606A32C
	for <linux-media@vger.kernel.org>; Sun, 22 Nov 2026 23:58:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A6D7606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=Tcf8RxQ8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1795391915; x=1795651115;
	bh=4gNy8roLwOc1L+J3BtP1HrH6hRU3IEez5wKIQNQ7iSM=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Tcf8RxQ81NeFVPWjqoCo0gU05OmsowWNPtGHfubmin1MpzGGAXX7z1A37MRTsv6bP
	 bAi48j7vteg4IjZlszEJv3/gdXIyo9kW55a/zsTxJ6idxvOoIDLFQya0unjbL1g1rN
	 LTakutNajavIJdFfJrchVpYraKp/ArE9QNkVLcW7wBzb3z1gs8QDnrGNoljAsXYWsH
	 P40EOjv1QzCZZRST4HWzKDp5yfP0bB3nic60dbtlph1qPULnKQzIiWB7gqod8AoL3a
	 QaAJCLHF+UcvulQfYoq5W12EelQVPHnPCr3tnG3wQIbxnJCu5xUa+lLj+N173rrK30
	 BZdaoBQU5zGOg==
Date: Sun, 22 Nov 2026 23:58:33 +0000
To: fernandezfernandezpol@gmail.com
From: Bob Summerwill <bobsummerwill@protonmail.com>
Cc: laurent.pinchart@ideasonboard.com, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/2] media: uvcvideo: add device entry for Logitech C920 (046d:08e5)
Message-ID: <20261122184500.7c9f2e1a@protonmail.com>
Feedback-ID: 475798:user:proton
X-Pm-Message-ID: f05ee7a42ad6d3b376f96f1df81ab75ef3e4ea2e
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

Field confirmation of this series' diagnosis from a stock, unpatched
kernel, in case it is useful when considering the patches.

Device: Logitech HD Pro Webcam C920, 046d:08e5, bcdDevice 0.21,
directly connected on USB 2.0 (no hub).

Kernel: 7.2.15 (Arch "linux-omarchy" build). The camera has no
device-table entry here, so it rides the generic UVC catch-all and
uvc_no_drop_param is at its default of 1 (deliver error frames).

Behaviour matches the commit message exactly: intermittent gray
bands over the picture in applications using strict JPEG decoding.
Setting the module parameter nodrop=3D0 -- the global equivalent of
this series' UVC_QUIRK_DROP_STREAM_ERR -- makes the artifacts
disappear entirely. With it in place, 300-frame MJPEG captures at
both 1280x720 and 1920x1080 sustain ~27 fps, with per-frame mean
luminance stable to within 1/255 across the burst. The camera has
been in daily use since, artifact-free.

To be explicit: this is confirmation of the failure mode and of the
workaround on the affected hardware, not a Tested-by for the series
itself -- I have not built these patches. I am happy to do a real
out-of-tree build against 7.2.15 and follow up with a proper
Tested-by if that would help the series along.

Bob Summerwill

