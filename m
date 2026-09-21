Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E4E314D1F
	for <linux-media@vger.kernel.org>; Mon, 21 Sep 2026 11:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789991569; cv=none; b=q4Z6kGisrRIXxabvCzNVfAUef9AB0GMBa9PttLvbymATEldXEQrIf4uzp1eGMXlJCow+RM3KKJ+4H6ctmdOHs/LPmeE1ft5gnWGF0cvzIMe6ne8283wYPtajetIMzSbOfJVv2R9zKBYV6zDeFx+blTaLeOMLNgvVbsmDBCMRB+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789991569; c=relaxed/simple;
	bh=m6bfsH1PTtGg5+RCO8ZPFwn7hrHmGJ0UIfClhvC1u9U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VyCfmWfSabac2UBU5sb6NC50SvmvmlAn/TgrB+5efxH3hU22U6O2zzaZT081IlfGprlX+/AHUHqO+tDzlacjX4ta0MVq96agjZLNup6uqrAdjtSfXu4S0Slk34KXyeR/FrLjcv9G++7tL570HNajvCZVrWtgbrZUzcTm0W5az7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D2uuYBN1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D2uuYBN1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2127C1F000FF;
	Mon, 21 Sep 2026 11:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789991567;
	bh=vt4qmFlVtfpKqJXvGGK4OzlPvlTvPcZDz2S/Ir+JGoc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=D2uuYBN16xPA4utaoYAtRlhDjSS8KkNTY4xkRazKqAi1NrmBi3PEl9lIgl9xNEXW5
	 7F583qNt2ayklEYv+ETAm2GxerkXhSfmFOTxgQ3JIUZqLWthxeevdYb8dDZxaX/AA6
	 SPpisBzNrjPRAGshgggh3xUqWqVfy9d97sPr5EYjXlEbzbz05beCZqbp+8Dx9cBBJh
	 lbFy5SWVDNJQvhMHOwfZbjpV0tCEXs1p1ekGTcuXlWgy2bml2naO37VpWGNrSTbvC7
	 cHc1R3xQesX6o3hUNzQ1dIaevyrgQnmvzPbSJ+mevFL3mPebRQEod08Ztc6tsGYrxu
	 elKWoI0dIuKWg==
Message-ID: <90afd37d-ea90-42ac-8d8c-7b8a30375228@kernel.org>
Date: Mon, 21 Sep 2026 12:52:45 +0100
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
 <cadd6ff4-ec70-4ff9-9125-a0c4342261f6@kernel.org>
 <uVVv8mqM2Y5t-jyuD77yRDxWpqtE869qfapajmCag2Z4krmhWK7dVywtWcvivpsSj4P4UHnXEqWjdeZ7qOnboQ==@protonmail.internalid>
 <20260919222915.GB1179126@killaraus.ideasonboard.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-GB
Autocrypt: addr=bod@kernel.org; keydata=
 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
In-Reply-To: <20260919222915.GB1179126@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/09/2026 23:29, Laurent Pinchart wrote:
>> V4L2 owning sensor -> inline engine is already supported and won't
>> change. For subsequent steps though each stage hands off in-kernel
>> without having to involve userspace.
> That's fences, isn't it ?

Perhaps fences in v4l will do exactly the job I want. I'm more 
investigating than specifically pushing a solution.

My understanding of drm benefits are:

- drm_sched
   job scheduling based on dependency fences

- dma_resv
   fencing, sync

- syncobj
   user-space sync primitives which can be
   shared with say a compositor

- TDR
   Builtin fault tolerance.

Probably the best thing to do is to implement both a v4l and drm wrapper 
around the functionality and use it in anger.

There'd be no specific barrier to implementing a libcamera pipeline 
around a DRM device, I mean that's what gpuisp is even if its wrappered 
up in mesa so.. :)

Nicolas mentioned the idea of implementing codec drivers in DRM for 
reasons similar to the above.

Anyway I'm curious to know what the DRM advocates and detractors would 
say about that. It's a question I have not an assertion.

For an inline ISP where you connect a sensor to a CSI block the 
media-graph seems like a nice well defined thing.

The offline ISP I'm describing - truthfully has elements of codec and 
elements of ISP.

Probably the only way to really know is to experiment and see what falls 
out.

---
bod
