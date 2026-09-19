Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF04A3612E0
	for <linux-media@vger.kernel.org>; Sat, 19 Sep 2026 21:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789854304; cv=none; b=ssuWmFH7PEzEPkdyKR17gWRF1/pwvp9nbf0NeNxj97nuptBjB/XOCm+UHalg/zsIJmUyKMlt9GWshtWS1QmwiUiBL/lKz7fmIK8IS6Ei5Pn5VfZEESrEIkoPp/S2rNXkyb/J6H3u6SbnlX4xgs7B/iJ1E9mpgC1bbBLHLFRaHts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789854304; c=relaxed/simple;
	bh=/J6/R5eMStO0t7fjKCOrC/RwSSLONCCwybQBO92GoxY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nVchx5d1ABWuDa32Vn5dZcwwXnbGhL2zQPRuKy3Q/brM/HawItJjsc6FNgbJu0vr15muhUSDZdvXlYmxR0g8UtH3rsnTX4SiEA/TQFEeYOuXOW+iYvzWr00AaluZuAnopiy3A5DAL8NQ5oAPcR+Jp3q3fzDNdXOSyVLn/tfn0SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TJH7tZ5N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TJH7tZ5N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC5691F000FF;
	Sat, 19 Sep 2026 21:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789854302;
	bh=lNeyUiRwW75kz/IZ/WrUAfCXKM+26FTbCqZ24pMG0gA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=TJH7tZ5NG20J6BWRXjDYnHaAC8dGaLNvwqwwcONpI1f99pn2qYBlA7yVMq+ugjvLD
	 oOu56+AmDXdlfru2/0Bmi8LzyR3Z1ZVDpj4q6tPlgC+1+Ogk4aDtOAbhPKWKVTY8d/
	 KsPniI0PSiICVa47vzHMVzZOqRfBiVM5l4nqnVXCdLTsMzewo6ZzF7onVNoP/Dq6Yt
	 LdLu2Zw/FgrywffAJxgHDexy1hV77H+QvBWf0Il9vEjeSG6zImUT2UX4orJcjCZfxm
	 r964KcRWR6NeTjAxa/3UIEoS6QpAZrRyGA9B7asQWB9uGDxiPQbo2i0R/KJTvpNkpe
	 UpaVO43UZXVpA==
Message-ID: <cadd6ff4-ec70-4ff9-9125-a0c4342261f6@kernel.org>
Date: Sat, 19 Sep 2026 22:45:00 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [ANNOUNCEMENT] Camera & ISP at Linux Plumbers Conference
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: libcamera-devel@lists.libcamera.org, linux-media@vger.kernel.org
References: <UzpC1s2YnBtZIaRCab_Y8AbCecyauDUO4OC7Nhd1-h4TE21aLSghbwDuOKgdwJQugvPMjM4foPHuL-UKnBLD6A==@protonmail.internalid>
 <20260914233810.GA2796257@killaraus.ideasonboard.com>
 <00cc46b2-0729-46d3-8e3b-ea717ec1675e@kernel.org>
 <xkoP0dfwjjBYtv2XeWuIvuqK5HAhjNFHul45Rvx8GUs5XTO3O8Mjnbwn4rV7ToCR6aqLrANyfzmKa7ssGAWk4w==@protonmail.internalid>
 <20260918091806.GE59058@killaraus.ideasonboard.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-GB
Autocrypt: addr=bod@kernel.org; keydata=
 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
In-Reply-To: <20260918091806.GE59058@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/09/2026 10:18, Laurent Pinchart wrote:
>> There are clear benefits to having a loop of NPU/DSP to Offline ISP to
>> Display that drm/accel seems to offer some interesting solutions to.
> What are those interesting solutions ?

The chain I'm interested in is

Inline - V4L2 streaming
-> Produces raw or YUV

CVP (&& ||) NPU - Likely implemented as DRM
-> Produces motion vectors and/or further warps image

Offline - Sharpens, GTM, TNR (could be DRM, or v4lm2m)
-> Produces YUV

Display - DRM

V4L2 owning sensor -> inline engine is already supported and won't 
change. For subsequent steps though each stage hands off in-kernel 
without having to involve userspace.

Given though it depends if you need user-space to "do stuff" at the 
offline stage. If the offline stage has a firmware perhaps user-space 
doesn't need to be involved much past setup whereas if that offline 
stage has no firmware, then user-space really needs to drive it. The 
difference between the OPE on-list right now without a firmware and the 
ICP which does have a firmware.

Taking the example of sharing params and stats between Inline and 
Offline - in this case you are constructing a single ISP around two 
blocks basically in libcamera, whereas what I've described above 
traverses several blocks and isn't really an ISP - the ISP is already @ 
stage 1 - you have an additional fully offline block with its own 
firmware, sessions and runtime context. Stage 1 and stage 3 don't share 
kernel-side stats and params; they have their own isolated contexts, in 
contrast to TFE/OPE on Agatti where its integrated and must live in a 
dedicated libcamera pipeline.

But because you have a functional ISP @ stage 1 - the question is does 
the firmware based offline engine provide better overall system 
functionality as a DRM device ...

Its actually the question I'd like to discuss with colleagues in sunny 
Prague :)

So I think the tension comes from wanting to have the DRM scheduler but 
acknowledging that it is probably only for some use-cases possible.

You implement the device as a DRM device, you are still free to have a 
complex user-space context for that if that is your need - whereas if 
you have a use-case which can tolerate non-intervention from user-space, 
then the DRM scheduler _is_ what you want for complex hand-off from one 
device block to the other.

---
bod
