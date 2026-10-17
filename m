Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2C52DF3F2
	for <linux-media@vger.kernel.org>; Sat, 17 Oct 2026 21:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792273251; cv=none; b=eyq1KZ4J44hvHBqlS3TCCOKYXMQzbo1vR5Dej9wJ1abz9YENHUHyQ3xU4goY1wccL9QGGC0u8ujcEEdFUyKoATXxYj74tlRtwQkPxIZp+c4axtBXXpgslPrdWN3/6VPpJ8ZEtM/bmUT4b9Zt6YXNccc6n+f3loqXBxs37AO3qbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792273251; c=relaxed/simple;
	bh=pKJj/9Wwtc4TG4Knbq09oNmo8hoqs+7fYuFsxQmFjxU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=md+LG5BBJJsACXldH2VIVWnvrMpxmep4HUlgY3KmmoDnmhIh18ZewZSYLae0ZdsIVGx6/49Odxb8x1TuhJJI5zwyxxHyDgWrsqG1BkJRKGoGgFRXcKj5VYPqHPS4J1E6S6sRsvy0+nTGu7VVEkg3vPgFzxNokOuBsoc5vgw0d1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nilk.net; spf=none smtp.mailfrom=nilk.net; dkim=pass (1024-bit key) header.d=nilk.net header.i=@nilk.net header.b=Dsvj7SQa; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nilk.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=nilk.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nilk.net header.i=@nilk.net header.b="Dsvj7SQa"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6c8f6a53fabso1990088eaf.1
        for <linux-media@vger.kernel.org>; Sat, 17 Oct 2026 14:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nilk.net; s=nilk; t=1792273249; x=1792878049; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pKJj/9Wwtc4TG4Knbq09oNmo8hoqs+7fYuFsxQmFjxU=;
        b=Dsvj7SQagN55qe5grrXisJXizcRr0/JBlbjJ8TlCg1fzrOEQrGboDLY6hCxFM3UlB/
         Ntu6gjYrGnvaDVSvPmGoVlX04IIUQngdxq7+f/esnosRpBLWllCL7OGnonZ4CiJZxD3G
         26DeFAvv2qAmkm+G+BdBlR9UTkF7LVv/HkzBo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792273249; x=1792878049;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pKJj/9Wwtc4TG4Knbq09oNmo8hoqs+7fYuFsxQmFjxU=;
        b=DTo9rZyKIg6W3cQXOAkX0MW694nudaYJP+J50oCVR3Y8t3JOasT5dHTfRJheAiozZE
         JV3ZmOiE5GBfJXF10brJ66ou/yUeANbiEUrkjJM7BMXeMArT2ntwjPPZ6eYfkJYuTa5v
         xrxvZHcD1gwfD96W3GSZQij05wdICXJ2ZBFJttt/FPZ2nJqg5za18l9+MeR++wSWwb2F
         YrxlDNoG15iWiVfZlte8KDeypCIpkkCcbFOaLcE1E5tNO1VggFChCUB0vHBCluRDjTKU
         4RMT00g/jJ/5GKa7kSFGEjIuh58PTMnueLCSxRV3+2L3kZQgTcbJTF7nMIF5/fH1dw4p
         ch+w==
X-Forwarded-Encrypted: i=1; AKwUvBx7sVty54PMl0YQD/eRgqsA89x/V+EfZbjTJ2gCHvztr9zYZhHbyFIhFjvejNd+K8rhIpTU+6zq0ai8lw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIQtekKtRNFvjtPSJfeh11pRhYVv9gVy6xv+jUSPxoPXWjmX4Nf
	LArPSC3rkD0vPiI6yHwdkN7ecq59/7SpSbBcGwuGqIzXg8qyGeVPHbFN9Sy2fC0Ou6UB5W8l8Vh
	egheOg0LM
X-Gm-Gg: AYBFou0GQ+vK3TwfQd0rfbM2SM4zCvxPx/mAkUyVN5im0k2uSdSOuZcMMnTXvLhcmyj
	1TITZrIBF/3GPZiYpPXt2lXf09W/altSr2NllwG7KPRdBvLEOoHNjBIOwnHVQhkcTeVs8IoekM2
	LNGsJJ+Cm0HBeVV2H7jAO0M2Uq4Ch/FWovmYe87PSVHw/KOwAFlidAI2wJDMVyI1gkOzRC6pY0H
	3MveTcFtmTWnO5MOHLWN5ZsNXrN8EA9gASKTBDUSDkL7rq+uZOe6TcNsS50I0J9k63R7QdqdNcp
	jNGrL9kI9/m09BZiAnB6DZ37obnqAWO+TAi8bIa7o5m+Cz1ecfgkaN2mI49EuRg8I0GJkA1FXva
	Vi8CL/qEZqmG4f3mPgkeTmheslmBhLSKt+8ARSb9GRmbcT5QxmqeJr3gNyve+FwYPJLqn/V8a5R
	Qb7snYP+rIi9lNSH/irWtx6dXwYILbIjsdcNe/PLAq23DNcTXjCMU/bC+7i4Qaf94eK6mGkVmAP
	VHI0eVLo9TCAHGS/6tXsil6OQZDAfloQ0S/nToG/zuT/lw2NK4p8fea4RnY+ya1qlYTfwpoBgqs
	17NVNPYlzEDy33Afr7EGznvkWpsjc9E8mFDQpkXefvSmMi4q5sqqB3//Hs7j7P7BsLeTkrAM6rG
	ef5nRMOI72Yo06uSXkUM1Wh/4L+l0bbsXcHOoCHYJA3h1HGOvvvs=
X-Received: by 2002:a05:6820:4df8:b0:6f5:a844:b12 with SMTP id 006d021491bc7-70116e4a975mr3984515eaf.57.1792273248461;
        Sat, 17 Oct 2026 14:40:48 -0700 (PDT)
Received: from [192.168.0.114] ([187.14.252.51])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-842a6e12e06sm5109596a34.22.2026.10.17.14.40.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Oct 2026 14:40:47 -0700 (PDT)
Message-ID: <02feb114-960b-46e4-a126-9b8659fc4394@nilk.net>
Date: Sat, 17 Oct 2026 15:40:46 -0600
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: i2c: dw9719: power down on detection errors
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Ijae Kim <ae878000@gmail.com>, Daniel Scally <dan.scally@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20260913041828.28430-1-mhun512@gmail.com>
Content-Language: en-US
From: Chris Simpson <chris@nilk.net>
In-Reply-To: <20260913041828.28430-1-mhun512@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Sun, 13 Sep 2026 00:18:28 -0400, Myeonghun Pak wrote:
> Moving chip detection into dw9719_power_up() introduced direct returns
> after the regulator has been enabled. An INFO register read failure or
> an unrecognized ID bypasses the power-down path, while probe only
> cleans up the media entity and controls after a power-up error.

I found the same leak independently while adding DW9800W support for
the Surface Pro 9, and wrote the same change.

I tested both error paths on a Surface Pro 9 (DW9800W, ACPI, a 7.2.11
distro kernel with the linux-surface patches), forcing them with a
test-only hook: an unknown INFO id, and a failed INFO read. Without your
patch, each failed probe hit the WARN_ON(regulator->enable_count) in
_regulator_put(), reported as regulator_put() because it is inlined
there, and the (dummy) supply's num_users stayed one higher. With your
patch, neither happened. An equivalent change in my tree also runs fine
through the normal path, including runtime and system suspend.

Reviewed-by: Chris Simpson <chris@nilk.net>
Tested-by: Chris Simpson <chris@nilk.net>

The patch still applies cleanly to the media-committers next branch.

Thanks,
Chris

Made with AI assistance. Written by Claude Opus 5.5 (drafting), with
review by Claude Fable 5.1 and testing by Claude Opus 5.5, under the
direction of Chris Simpson <chris@nilk.net>, who reviewed and approved
it.
