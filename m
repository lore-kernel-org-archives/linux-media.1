Received: from flow-b2-smtp.messagingengine.com (flow-b2-smtp.messagingengine.com [202.12.124.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B372330647;
	Thu, 23 Jul 2026 22:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784844583; cv=none; b=dNUv5KelzgZsu6rkP5B5lpy63IktI3BBAvWFAKo2Sw/b0l5cFLoVlL/hvH9xMC8qeHS56RG1j1np7z70eLQMjfLaGo0fjFywVVB1S3o2SJpElq8OpojDPX/pZ7zqJ8BteKz7HWpMCY3kW5f4QbliM9KYhspW0xF7uihzvggwYjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784844583; c=relaxed/simple;
	bh=08Vd4vj0vBOHxp6n6UUYarIgUYV6i+W7ia2Q7GQHbZc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uKHaxyrznlpV/ikHBUIUTycg4f00JC9tQ1OK+KnzPmb45gYY9ub9szg2IOulOh0F3PT2R8vOOuG0i8qxeXODpQ37Se1J6k1hkdtpnqHFW9LVPgQPKNYn1HLeHk0kUVqCfJpHkYXGkww4F4tZV+N1VutRpWd7nMrObbxA/yS/lZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gahingwoo.com; spf=pass smtp.mailfrom=gahingwoo.com; dkim=pass (2048-bit key) header.d=gahingwoo.com header.i=@gahingwoo.com header.b=Iw0GqnH2; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=pvNmtjve; arc=none smtp.client-ip=202.12.124.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gahingwoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gahingwoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gahingwoo.com header.i=@gahingwoo.com header.b="Iw0GqnH2";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="pvNmtjve"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailflow.stl.internal (Postfix) with ESMTP id 5EE431300184;
	Thu, 23 Jul 2026 18:09:40 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Thu, 23 Jul 2026 18:09:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1784844580; x=
	1784848180; bh=08Vd4vj0vBOHxp6n6UUYarIgUYV6i+W7ia2Q7GQHbZc=; b=I
	w0GqnH2zARrvIjMVElIGy99EtGyy5PDy8k73ogt/ccKAIoupm9R4L66BehTOJTgZ
	0ajqXUpLwQzqqJ30nbcgAao8Q8LdReMEtRoZBbZo7j6Hou1com+IlY0BGvdGctf2
	zYcoBgRKZrmsGSUPcDRcv348NZhPd4/Zp8y+yNsKi49EhO4afaLQMMi+bBHzNEDJ
	eeJbshnoI0sgV8qWX1Z3jtI+J7s9+eWLJHkdrtzRctlwBnfnPR4fE78PLgWLpAt7
	8u1O4tBgNjwq43LWDgEkVNrASHTOxYTcVuE0UbkCrujF/0AVlpyvQJ7Vzvnz3G3o
	khDFqJalanO2k078J2Kpw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1784844580; x=1784848180; bh=0
	8Vd4vj0vBOHxp6n6UUYarIgUYV6i+W7ia2Q7GQHbZc=; b=pvNmtjvedinG9BIc8
	Rq2e9k6xkjh5zwX6Q1ZCNXI5GkyHskVitn3u1ukPidIzU9k2zsTsclRy2bEPCmk0
	Hc3bt3k7wqJSQb0ZwOxGz42zDOdffEoSZx4WFMeAZ1pwjgzKZ6waxYNw4bQX/MPN
	NtoKeDIEeh7DNOwJc9OYf2V2HhzL6+mVBsjG0G0iQ+weuSSVBNZePcZM92DXCyeK
	zzZOm/1CaxjcCx6w7/6lq/ZX8s0CpMQ5DPTuoqDYetuFu4IiEa/rFgS5SVPqEu4S
	yrsV9EZZlOyQS66jdyPjJh1VWTxim4fmZJKbZqYe/xh5T9vHU0OEIReGRjoDa3BN
	Im4rA==
X-ME-Sender: <xms:I5Fiavj_fJMjrXZwUJJ_mp1WBJEkB1JIVcNJsoYIviY7mT517c8FFA>
    <xme:I5Fian1UIzfXE09PyqDROekqe6oojJtuhcw3ZKEIoXs-jcVCjxe-3tkQm_f9NFjD9
    0V_E_lJ-9PVm3yuObfV_xI3DSigN2pXUL2Sl2LXr1DMe5-uoNKWRnVs>
X-ME-Received: <xmr:I5FiakmFtWDQgiVHNPSzx6N_1FX-PfHw4Upx8RFKSD6ocGNjD6XrNE3bc8XdC8a_3bWFfpD06rnKImKg_N3_vXtFiVEpW3IRCYqagQZMqbTS>
X-ME-Proxy-Cause: dmFkZTEIDoSZFQH3ibbkdIMliwsQ8yGxUqGqOd0h8qFv/8gZwbx4zY14jxCs29cyvCKMMS
    8NbQc35lUVkljqLj7KRP3wdRrYrAXy4fKERbA/afDEAa1r4f6HrxX9dYd6J/CZguZpbRej
    P2ktg7gtK96Snwg+Ln3QayQdtU6L+TTX0GAB9D3nqW/3GEKYmcl0wiL1snFtU4ZcH3yUL1
    DSDFiP8W/zm+AUFQd/PYsrxEBf4rdc50SK16jE7QsyzUnYTINQSSni/do2vHIpTLWrKsUh
    dsB9AmtSVTBoMPcT5evRiy5QdFbkGK/Jf1ap9r+UJILaLx1Jw+d5gsGls5ar2xP03uJKSk
    6vrb1qjWmed1vdY4Pwkhmhh55jwsVHXhqljb2Wns4UrSfl22D6G5AqCN69fUwKPiGB2M8+
    Vzo7as6+uPd/SuXToYUI5W6TThWjfpT171iaq6EDwJcr57J2Bk/TSxJRzJR9rMNRmzKshK
    DSacqJuVa3bMPo/eCpzTmeHcNooKAf1tKDgHtKKQk7CyRhwQet1iu3Y+8xpGiNFw0g0sBZ
    kIWr4Q0gRRhaU01yXE6hErtxbiRC0JE8S0RzIiZQoZwuWA3avgxHjHd3IfNTHWPYhIRpZl
    JQe4XgzTQeiWg44RBQFdl+gvBpzpX/6AwG6ugFo/DKLhNRqrKsEvBs+u7BTQ
X-ME-Proxy: <xmx:I5FiautxUebroOImJ7i0ACgpQksj35zKeevJm2MOKigMPlIIJJr7qQ>
    <xmx:I5Fias3uEN2yrfn4ylTeNqPQfPOeIHROcRYS7O1rTvS1J9lUT7gg8Q>
    <xmx:I5FiaiQZvRGqK2A9A_DWptKlLSYmjH8FQZVB9MfIWAr7flFpatyHYA>
    <xmx:I5FiaouKghN75Fkag2DAXEAXz166lNvzqCKynd2LU34VYVKceDFfSw>
    <xmx:JJFiaoNZf8FCL9eQ5ivZNACoAvTk3lFxTrlkMA_h_9QVNwCXRYpNfICx>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Jul 2026 18:09:33 -0400 (EDT)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: nicolas.dufresne@collabora.com,
	detlev.casanova@collabora.com
Cc: paulk@sys-base.io,
	heiko@sntech.de,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ezequiel@vanguardiasur.com.ar,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiaxing Hu <gahing@gahingwoo.com>
Subject: Re: [RFC PATCH 0/3] media: rockchip: VEPU510 H.264 encoder for RK3576
Date: Fri, 24 Jul 2026 10:09:29 +1200
Message-ID: <20260723220929.2080095-1-gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <210b72e32d1bd757a36b2baf532dd9f7d46ca5dc.camel@collabora.com>
References: <20260722073417.2064667-1-gahing@gahingwoo.com> <20260723004642.2075233-1-gahing@gahingwoo.com> <210b72e32d1bd757a36b2baf532dd9f7d46ca5dc.camel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Nicolas, Paul, Detlev,

Thanks both for laying out the trade-offs so clearly.

Decision from my side: I'll converge on the DRM-ish / Vulkan Video
direction and sync with Detlev, rather than push the stateful V4L2
driver further. Nicolas' point about UAPI lock-in is the deciding one
for me -- I don't want to expose an encoder UAPI that then has to be
supported forever -- and if RK3576 is just a minor delta on Detlev's
RK3588 base, that's exactly where my hardware work is worth the most.

Paul -- thank you for the generous offer. I read both your Media Summit
decks and your posted series ([PATCH 00/14], the generic in-kernel
h264-enc core + rbsp + rate control on VC8000E); it's clearly further
along than I'd assumed. I'm not closing the door on a V4L2 version
later, but I'd rather not commit to maintaining two drivers up front, so
I'll treat that as a possible follow-up, not the primary path.

Where I think I can be useful right now is the hardware, since that part
is shared with RK3588 regardless of interface:

> I know in his case he was trying to avoid reconstructed frame
> compression, and it only started working when he enable that
> compression. Though, he had mmu faults prior to that.

Useful data point, but let me be precise about where I already am, so I
don't send Detlev chasing something I've done. This driver already runs
with reconstruction compression enabled (enc_pic.rec_fbc_dis = 0) -- the
state Detlev needed -- and the first inter frame still hangs. Disabling
it (rec_fbc_dis = 1) was one of my experiments and also hung, so FBC
state alone doesn't explain my stall.

The part that does line up is the mmu fault. I still have a residual
rk_iommu write fault on this path; I traced it from a boot-varying
garbage IOVA down to a benign IOVA 0, and I'd concluded it was a
separate AXI transaction from the recon write, independent of the
P-frame hang. Detlev's report -- that his mmu faults and his missing
P-frames cleared together -- is a direct reason to distrust that
"independent" conclusion and re-check whether the fault and the stall
share a root cause on RK3576 too.

Detlev -- when you have a moment: on RK3588, were the mmu fault and the
P-frame failure the same underlying problem? And did enabling
reconstruction compression clear the fault on its own, or did the
reference-read mapping (how the previous frame's reconstruction is
mapped for the encoder to fetch) need a separate change as well?
Whatever you can share, I'm happy to test on RK3576 and feed back a
Tested-by.

One point on the current code, since it came up:

> A lot of the code is hex tables generated from inspecting a running
> driver.

Fair, and I won't pretend otherwise -- the PARAM/SQI classes are
currently shipped as fixed tables taken from a captured encode rather
than computed. The one thing I'd add is that those particular values are
mpp's public default-tuning tables (the RDO lambda/cost and
subjective-quality tables in Rockchip's open-source mpp HAL, Apache-2.0),
so they're constants I can cite to mpp source rather than opaque state.
But I fully agree the driver needs significant cleanup before it's
upstream-worthy, and in the DRM-ish model most of that tuning moves to
userspace anyway, so a lot of it won't survive the transition in its
current form.

So: please point me at Detlev's shared branch / early code whenever it's
in a shape to build against, and I'll start porting the RK3576 hardware
bring-up onto it.

Thanks,
Jiaxing
