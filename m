Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795610263;
	b=t8zYv877dk92pcAlJhYI/vDd7E1pGviPiFT2sl+9PIw72yplRVzJukR1TepETsL7jbfZ
	 VAUF6efAx9LuhYz3/o3umxdz9gUY8s3GVqpap2vFHj6ZxMrhIdoxfahp+WsqLqIS6b6Rb
	 QR8iWZHbA8r1m8FA5WX2tvG1YjaQUvd0WaTv0FIottwRuvyqN/E+wcgejd+joaPbxV3PB
	 mlj9nA66CCjbDjBHH15xeX08EfZYexGKqWkMfU/5Ianu1aduS02u75ubKZzzIy/3+taM+
	 8spvTLLvP4lpdjBpr6rCEfKAMVPKBcH1XjHuRfEmmHluc+NA3NFSCRSkeL6Zl8xaV2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795610263;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=G7AsAEDdOBnVd9KUjVpeq3cjk4Ls80bxfCH/t3XgpMg=;
	b=dt6HI4MWvQRLrAuT8nmSEJTy5QIlbMyZENXHLoSDLzb6WYdO7D6Ax1U+Kjnn+JlXTVyG
	 lQQrjkMo53082hswBufD4oZMsiuI5D4Oo36UpNIn4aFnPg8hewkDO4KBnrKhor/WYnX1C
	 8Gu5fJfzWxYRtUBtTJIf/ahomkIRlReA1ZKvFOQUhEBgx8YVYpF7fOYNKGtxxS0uB64O1
	 1W4D3Jd3FM4MUbqIBmdEot5n3ygZgx2fQMWRpGWoGBqGSORP0YlCchjCfJ56yR6Hp5wqg
	 cvNV7JA82HPPkhtP9KjXfqLjWOPR0A1yyoMZ7edA06UANEBmnUrbn6pzkV8Wi5uPaSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=UbdeepJf;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED2AA606A321;
	Wed, 25 Nov 2026 12:37:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED2AA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=UbdeepJf
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 540672F;
	Wed, 25 Nov 2026 04:37:39 -0800 (PST)
Received: from [10.2.201.43] (e140322.arm.com [10.2.201.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A9A3C3F86C;
	Wed, 25 Nov 2026 04:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795610262; bh=G7AsAEDdOBnVd9KUjVpeq3cjk4Ls80bxfCH/t3XgpMg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UbdeepJf2a97ZoRIAuLhvBknVVrSLrfFM/ZbdGmv+Jxof+CrvN+c9LMzpN6MLGAss
	 n19b0Ywfr3OekQkNeGhPjMwt1iBizh+6wMGUBDYF6PfD/ZoDloOreQ98MusyRVfXqv
	 nCIPt9GDEHoo1WJg/YAY6zibre2mqMZs+bZgbeDA=
Message-ID: <d28fbb7a-7d8f-4073-966b-a4627d55718a@arm.com>
Date: Wed, 25 Nov 2026 12:37:39 +0000
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 07/28] media: mali-vpu: implement TRY_FMT and S_FMT
 ioctls
To: Nicolas Dufresne <nicolas@ndufresne.ca>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Rathinavel Sankaralingam <rath.sankaralingam@arm.com>,
 Shobhit Pandey <shobhit.pandey@arm.com>
References: <20261119153758.1426673-1-charvi.mehta@arm.com>
 <20261119153758.1426673-8-charvi.mehta@arm.com>
 <3415e7b52c3d05214ec125b2b4f8612129c53ae0.camel@ndufresne.ca>
 <162bf4ec-c23a-49c6-ad7d-7485a5cce2b7@arm.com>
 <87e98f2bca7ceb60fe0b786a2bf63711ada2572c.camel@ndufresne.ca>
Content-Language: en-US
From: Charvi Mehta <charvi.mehta@arm.com>
In-Reply-To: <87e98f2bca7ceb60fe0b786a2bf63711ada2572c.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/24/26 17:39, Nicolas Dufresne wrote:
>>> This is suspicious, the vb queue already do some locking in most of the vidioc
>>> call.
>> Both queues assign `&sess->vq_lock` to `vb2_queue::lock`, but
>> `video_device::lock`
>> is unset. The V4L2 core acquires it for queue-management ioctls marked
>> INFO_FL_QUEUE, but not for G_FMT, TRY_FMT or S_FMT.
>>
>> video_device::lock is unset, as this driver uses per-session locking and
>> format ioctls are not required to be serialized among different sessions.
>> The explicit locks therefore protect format access against queue operations
>> and asynchronous firmware updates, which use the same mutex. They do not
>> reacquire a lock already held by the ioctl core.
> I missed that in the review, please document carefully your locking somewhere in
> text.
The session mutex is already documented in mali-vpu-session.h. I’ll expand
that description to cover format state and asynchronous firmware updates.

Regards,
Charvi
