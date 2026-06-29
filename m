Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA1C6212548;
	Mon, 29 Jun 2026 13:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782740576; cv=none; b=hpqFIDd8GcKtxzOu2fmlynYSUQW59T2eD2Xs2FkcPTGncd+IFzTKDo1QAHTxJuYWBQ842MCyBrCg7eARVtKKgo+NhsSbgu7pMWY4f6JX8W1LL7xcGlKhvZh1USG10lXZ9zlGDzbLEd60W2puTHwAnZqW8kkCKxk9wrsGUQyfaro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782740576; c=relaxed/simple;
	bh=Qkjwc/qFZl/xhpKxVBQ3qQJ3n3vR+wKqmGSpvni+V6A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nfp3Plf/YjDVZnbbZHNxR+MhN8qv565i1FdhEIvTYi1BNN0ooX1u7a1/s3gtKWLdaEWdEtpWj2NrinYhPpgCGv++T/rvJohtX+37/lrSACK+zPbqb9ymArB14/NAUW054xh9Q5Qi+HuHog1iK5FmFHnhdi5slhp+/c8f5ZhvJ7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=O1Wvkfk7; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="O1Wvkfk7"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 97B131A00;
	Mon, 29 Jun 2026 06:42:49 -0700 (PDT)
Received: from [192.168.7.252] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A6A623F673;
	Mon, 29 Jun 2026 06:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782740574; bh=Qkjwc/qFZl/xhpKxVBQ3qQJ3n3vR+wKqmGSpvni+V6A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=O1Wvkfk7DyrjfM2Orks/JQ9DtzmpTHQwB8wltjZsFgs3ogzxj38yGxlX2PmbmJRSi
	 B7tn8eAa1Oq67LunLtuNy+tekan+uwMyDcpfqSM7Rs/ue+5eQzsZxQImNfy39OrH+r
	 eD8tAm96oDaxQ6Kn29riXr2GsPVlX7ZpiqbbsV6o=
Message-ID: <6e2207d7-e7a1-493d-9908-b8312740903f@arm.com>
Date: Mon, 29 Jun 2026 14:42:51 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] media: mali-c55: Implement CCM block validation
Content-Language: en-GB
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Nayden.Kanchev@arm.com,
 Konstantin Babin <Konstantin.Babin@arm.com>,
 Anthony McGivern <anthony.mcgivern@arm.com>, linus.walleij@arm.com,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
References: <20260627-mali-c55-ccm-gamma-v3-0-113584c05174@ideasonboard.com>
 <20260627-mali-c55-ccm-gamma-v3-2-113584c05174@ideasonboard.com>
 <20260629095732.GC3054459@killaraus.ideasonboard.com>
 <34de3262-3e3a-4b93-90a0-bf662162dd10@arm.com>
 <20260629120552.GE3054459@killaraus.ideasonboard.com>
 <f4380f3d-8e75-4c9c-8e56-599b4b203369@arm.com>
 <20260629133209.GG3054459@killaraus.ideasonboard.com>
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
In-Reply-To: <20260629133209.GG3054459@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Laurant,

On 29/06/2026 14:32, Laurent Pinchart wrote:
> That's my expectation at least 🙂 That's what we aimed for when
> designing the API. The expectation may not have always been voiced
> clearly though.

Makes sense. Do not worry, now I know :)

-- 
Regards,
Vincenzo

