Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6AE34388E
	for <linux-media@vger.kernel.org>; Fri, 11 Sep 2026 07:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789111742; cv=none; b=HcgGFR8wxIl9JLJPOniOhtPR8Uwln+WnlDxwPyHNMar1x6k2/l1JF8RXwiitvnJ9TiQT2KshrFcdZQtmKDtwUCwJM6eqX1r+wUhiFfeP5j52QAKaUG35oMFYlcLnxBz6GAwzdJ8D8UXrZF/tIJ+vMx3JBPDFDtzSnTf3YS4hi8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789111742; c=relaxed/simple;
	bh=Z2f584rsTxN4vNXBvIyfoYnITRHFa56BuDW3dG08HOM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Sz0rXjtETGJAxRHgZrwkM5Bd83xf6PLLS5sKPeu0gCuRTRRidrF/AXdojFT9EMKYulAcgAeoDg4hpZ15ByRwAelLsgO/8VD2UpiN7PM9pGL4ljUWNI6xtHZ+s1SrdD7oCNNHHzSyPZkEqd5n+fdWetrU2dpWY0brXRIM2re6j4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WzhafR5U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WzhafR5U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C731B1F000FF;
	Fri, 11 Sep 2026 07:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789111739;
	bh=Siv/JOnOWpp5ACBj6LSRMBtmW7jmZUuRAjwYs4ybOoY=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=WzhafR5ULsnJTgfpYBr3Z2Xkbmpzl9/J80h7G+iGODawiT7LV0uMOEtudGclsMPf8
	 S2zjA6yvXpBYHyN9i1HdZj/WABbgEC2Hzdz9N9Qs/0Y1ZUl6oKJs4DI0/pJa0AQXir
	 RaUEr1bSLRlRMEQYImtica4NndOz7Lnj38SPE1tNXrnyAWbue02IZoPHaxPo3Eu55c
	 lcsRwBouKGOmiHanw2i6xoWdCi1BVEtfNzes2yfaKZ6En0DOqwYMCscSJ3WG20FmkZ
	 iuatFzd9w7inVznH50+c2WktrmoeE8GiakG5qS58Xxq7ZOTeEBGzfaTCzWLnD81dBp
	 3BhV7CEZH2PaA==
Message-ID: <3b2f5c66-f64f-469b-830d-0661bb8e5015@kernel.org>
Date: Fri, 11 Sep 2026 09:28:56 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [BUG] DP-CEC wake NACKs after S3 with UGREEN DP-to-HDMI adapter
To: "jason.boukheir" <jason.boukheir@proton.me>,
 "hverkuil@kernel.org" <hverkuil@kernel.org>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <TFctb54_X3tcJgjwjgYtyT0zWzSn5O7i9SiOF6Crr30KLAJD4n6qYghg2xEVKLYMFjfBi1I8pwYciNDpGyJspN7kI1vsaIxXIdFsffhIOnc=@proton.me>
Content-Language: en-US, nl
In-Reply-To: <TFctb54_X3tcJgjwjgYtyT0zWzSn5O7i9SiOF6Crr30KLAJD4n6qYghg2xEVKLYMFjfBi1I8pwYciNDpGyJspN7kI1vsaIxXIdFsffhIOnc=@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Jason,

On 08/09/2026 17:59, jason.boukheir wrote:
> Hi Hans,
> 
> I'm reporting a CEC resume problem on my desktop and would appreciate help identifying the right subsystem and next diagnostic steps.
> 
> AI disclosure: I used OpenAI Codex to inspect retained local logs and kernel source and prepare this report. The observations below come from those logs; the proposed cause is AI-assisted analysis,
> not an independently confirmed diagnoses. The attached local patch is an experimental workaround without independent upstream review, not a merge-ready submission.
> 
> Hardware/setup:
> - Sapphire Pulse Radeon RX 9070 XT (Navi 48), amdgpu.
> - GPU DP-1 -> UGREEN 8K@60Hz Active DisplayPort to HDMI Unidirectional Adapter, 0.66FT -> Samsung QBQ90S TV, HDMI 2.
> - Exact adapter SKU, chipset, and firmware are unknown.
> - NixOS, locally customized CachyOS-derived kernels; deep / ACPI S3 sleep.
> 
> In a July 31 capture (CEC driver version 7.1.5), the TV replied to power status queries before suspend. After S3, the adapter still reported physical address 2.0.0.0 and Playback logical address 8,
> but all 30 directed Image View On attempts to the TV returned "Not Acknowledged ... Max Retries". The kernel journal independently confirms S3 entry and exit.
> 
> A later setup with a local kernel patch plus separate cecd retry changes logged restored CEC tunneling state, TV wake ACKs, and an active-source announcement after resume. It did not receive a
> confirmed TV power-status reply. This is not a controlled comparison: the kernel version and userspace both changed, and another CEC wake service ran during the baseline capture. I have not reproduced
> this on current vanilla mainline.
> 
> The suspected mechanism is converter CEC state becoming lost or stale while Linux retains its enabled adapter state. The patch checks the tunneling-control and logical-address-mask registers during
> unchanged adapter attachment and replays cached state if needed. However, we have no raw register capture proving state loss, and the normal EDID removal path should invalidate the physical address
> and trigger reconfiguration.
> 
> Would you recommend investigating the common DP-CEC helper or the amdgpu resume/HPD lifecycle first? Which tracepoints or register captures would best distinguish these possibilities? No known-good
> kernel has been established, so I'm not claiming a regression.
> 
> Attached are selected log excerpts, detailed investigation notes (including limitations), and the experimental patch for context.

After reading the long, rambling AI generated report I conclude that it boils down
to the fact that after suspending, then resuming the video source, the CEC adapter
no longer works because it has lost all state.

I don't think I ever tested this scenario, although I'm not sure about that since it's
a long time ago that I worked on this. Most likely, when suspended the 5V line of the
HDMI output is pulled low, and the DP-to-HDMI adapter loses power.

I will debug this, but it may take a few weeks before I get around to it. I'm not
very familiar with how suspend/resume works in drm: after resume, does it assume
the same display is still connected, or does it do a full 'discover what displays
there are' process? It depends a bit on how it works to determine the right solution.
Your patch may actually be on the right track.

Regards,

	Hans

> 
> Thanks,
> Jason

