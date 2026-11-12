Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794473261;
	b=pPMR+1UWlILSHpPMXPXBxGN8hw6qparUMrQbrDYLxtp2Vcb0J+3EWaMg7XSgDKAzNYlk
	 LvJH6fB8b+aw6jM9AzAZ72EU7ghj6cGmFiTm/R9vvmcYHHc2tSLNiYE+ugYsLTzoXAS8c
	 re8b5NhiP28WrSdRhod4ySuLbXGDDynXN0t8D/lhZXwBf0tyyB1MGmL7r5SBt3w4RASPQ
	 7wEdiEDne2yLX62lMjJlyHD6MhR0H5EvJ+fJTOtCzlysnN3cedXidelhmXndMpxrjvUSQ
	 Y3m/7wM83/QoqkweRE4OEKXMMVY+knPQiZUDDm+2gnQU9PBleu6s+DxocrJdaKtlS4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794473261;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:From:
	 Subject:To:Cc:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=kn0hPiw0/KLhVXqEAUFpOoUSzx7da8C4FLLbBCPQ5vE=;
	b=e8POHDU3KnxYL6X0C7Z7VMR/c51q9f1emouZvgMB9bvCN2dHSYdHYZRMBsh8DRvnfV4O
	 5iQWkwywRMfgheNdvHRQHFHhJm66wf5TCZf6Cy2kFpxF5yHU0bndIODRzIwRwNL4hV0gn
	 u52W0HVVBPLXUH2O8peao4dfrnjBf4zYgrXC70UlkAsYDPNg5id/5afDgA7um5N42KD06
	 5nBak8+AlX0/M2Dj6DCHiInokF6CZHJ7i6I17VjFjHb+u1xhJo7UT2UFdngYbyeGh4wYt
	 Y7NT26PvKzIaomJhwM7RwV9Q0nQwBBaN92FXGTrrGF3zAXfPnFMqHb3ZNmVVYSpEf0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bRKEgUTk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03119606B247
	for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 08:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bRKEgUTk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94B5A1F00A05;
	Thu, 12 Nov 2026 08:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794473260;
	bh=kn0hPiw0/KLhVXqEAUFpOoUSzx7da8C4FLLbBCPQ5vE=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=bRKEgUTkWXuL4jvKUs+9DUmiTtoAoowZx1RTjcCHkhwwmYVsekpZcSqUqMCOdBnWo
	 N34TH83RXSrg+F3nR7lRKdopWCtmAgbN68iEcLdcTh18Eaf+/uYTm1hMCfzWW8h4rq
	 nTty5crb5w/oJm7AWQARWvd6VzavkbpaOU74RVKyJusNnNHPH94uK+Xl5NTZfMPQOG
	 LFETxWPgS+ockpviiQ9E4Q0fzkuRwfowtskKP7m/NEiEOwyl6HBfu2SsrxAHYipVgO
	 /YP9CeJ3qpN/kZUFvy/kh4ueFDYx6nn8CoYK5ripvxnta8giHVBtpCjogq+Nixr+TQ
	 8/dcKfIq4SFLg==
Message-ID: <9becc07b-774d-4f01-8347-964eacd389de@kernel.org>
Date: Thu, 12 Nov 2026 09:47:38 +0100
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
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [GIT PULL FOR 7.5] AMS-OSRAM Mira220 and Mira016 drivers
To: Sakari Ailus <sakari.ailus@iki.fi>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Philippe Baetens <philippebaetens@gmail.com>, linux-media@vger.kernel.org
References: <avSh-mkOAZpq6swU@zed> <avV5GnrkrOIKQOT3@valkosipuli.retiisi.eu>
Content-Language: en-US, nl
In-Reply-To: <avV5GnrkrOIKQOT3@valkosipuli.retiisi.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/11/2026 09:30, Sakari Ailus wrote:
> Hi Jacopo,
> 
> On Wed, Nov 11, 2026 at 06:15:13PM +0100, Jacopo Mondi wrote:
>> Hi Hans, Sakari, Mauro
>>
>> The following changes since commit a083812f66fa52c59fb0ee25377180a645e5970d:
>>
>>   staging: media: av7110: remove commented-out code in av7110_hw.c (2026-11-11 15:21:53 +0100)
>>
>> are available in the Git repository at:
>>
>>   https://gitlab.freedesktop.org/linux-media/users/jmondi.git tags/pr-mira-for-7.5
>>
>> for you to fetch changes up to 62b600ba608740f3acf56b201387d210bd7d150b:
>>
>>   media: i2c: mira016: Add driver for Mira016 (2026-11-11 17:52:49 +0100)
>> ----------------------------------------------------------------
>> CI pipeline:
>> https://gitlab.freedesktop.org/linux-media/users/jmondi/-/pipelines/1790534
>>
>> libcamera support for Mira016 (Mira220 has been merged already)
>> https://patchwork.libcamera.org/project/libcamera/list/?series=6344
>> ----------------------------------------------------------------
>> Jacopo Mondi (2):
>>       dt-bindings: media: i2c: Add Mira016 image sensor
>>       media: i2c: mira016: Add driver for Mira016
>>
>> Philippe Baetens (2):
>>       dt-bindings: media: i2c: Add mira220 image sensor
>>       media: i2c: Add driver for AMS-OSRAM Mira220
> 
> I'll just pick these from LMML if that's ok, I have other sensor drivers to
> merge as well.
> 

So I should ignore this PR? Just to confirm...

Regards,

	Hans
