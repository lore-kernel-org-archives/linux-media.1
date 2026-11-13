Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794534610;
	b=MqUujUIOdxI6+uWFPGa1BqSk71FdzYwhMhFQAGu51tyPvqUKQHd9RDdY22+n6BdJYX8Y
	 8PrD20AZtVgrVBJItA4F53xlYoxeWgCAtIPAknAwRvn+BXjUGLb6HzoSKSK48dXWbT36B
	 TTOLfqPN6M58U51nGL8XNGRs8ZgV1g6V1gKkmfzopLUd9BxGgKvQHvVaDhF4WernmWDyH
	 +M5fm4jdDSLPE14VqSsrmvRz1XQrLGjLRx6X0TcrfRTftYyEws3+hyHqVvvK6umGWebnW
	 nmuWWB7JBN9uK/88GrImIYo0apwvnnCDtzOr0yCooqNlBZJuY0Wmti7lIoYj7tZB5iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794534610;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=QzinTeqzEqx9VDWaxVqJ4vfjVAjHu7CF3CCxvyfyEck=;
	b=NZTjxSnYmkyo1fR9omsOHCDIdsFlr62FiI0CicC8Uxix2oppzBuQJDfx+80DKbwhGJiA
	 3fDWFegosDUNtRC4D5Ye1p9WpOEdz5cYjuORTJcbQvZ7omq0ENr2S/GGd3xlCofsIJO10
	 a3GIrQAEYR3OnHLp8bPPmMdDSJsd1uEgXe6TMv1fuMblnqPHZAExnVm+L1thlIxcy8647
	 KvUFcp4QGUXVK6J7MZ08pksmhNVhisHLmf+kgvVqx7IpuZdW1fH4r6rM62lN8MiBPdYN7
	 vsg3gaKgkFhn7YRr+PwdpZdogEJq0E7+N0sEGw7GmBoD0+DRYyqh0TpbIPdJEl4fKPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=nilk.net;
	spf=none smtp.mailfrom=nilk.net;
	dkim=pass header.d=nilk.net header.i=@nilk.net header.a=rsa-sha256 header.s=nilk header.b=tWp0rI71;
	arc=none smtp.remote-ip=74.125.231.135
Received: from mail-oo2-f7.google.com (mail-oo2-f7.google.com [74.125.231.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B76606A323
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 01:50:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9B76606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nilk.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=nilk.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nilk.net header.i=@nilk.net header.a=rsa-sha256 header.s=nilk header.b=tWp0rI71
Received: by mail-oo2-f7.google.com with SMTP id 46e09a7af769-8615bd716c4so221245a34.1
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 17:50:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nilk.net; s=nilk; t=1794534609; x=1795139409; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QzinTeqzEqx9VDWaxVqJ4vfjVAjHu7CF3CCxvyfyEck=;
        b=tWp0rI719UU142KQhb1yPGUl22F17Sh1JUxpA4NsFc6kEp0tYVQHnx5pXkb/LVfX1f
         apiUvZt7erHl1d1SZQPcXchXhdJwr031RgMcmeLjD2AqxA/cjX+tXAMgMye2C4J01kmW
         4VCNg4tNBzaeV2/xYB+XAyTMxKM8cJPuALGzU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794534609; x=1795139409;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QzinTeqzEqx9VDWaxVqJ4vfjVAjHu7CF3CCxvyfyEck=;
        b=Kyv3yjGduiK1waoUVd54d3kUmJrL6a3d8HQIm1Wx6KvMot9TW8CEQ5u8SifnIpmy0m
         qrLcABe/49Dt6sM0771SkyQKmdI6NJgZPZ4hkE/c28Ng5QmfoG60d2RNmzpXpOzaxCn8
         z/een4XgcqXxNIlrPlkImy2hMeduWuK9CWB0tCagAelarYeqDHjmqtAGacLW4MgduKYR
         TXmX8YcioDulIEXAqVE3dWVd2Aj4QkMXfkENgAAJ3riRxakgw7tGK3qxg52yMOzc+5RE
         JwS9WXjYRhroBFG6lixaWpPlYK6wtiNHPrrOMJBZXum2moqO+WCthioIvyTlYcEQBgca
         QnwA==
X-Forwarded-Encrypted: i=1; AL+hErGWiwB9y0Iz+2gGcr1Ipkb9xzSMjOlwtqTVQilD0kNK/g/oaJFCFV111qrBQqGpvjQSmOu+M2Ch68nZhA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+fNi5WJBv6Fp/H8bSfhXYfi7qvUvVZQRSbEKIGYnTWCJ0fQioj
	rgfFCytF0FWBajU79BiXz2inPA44p24PWcT+c/hCpoOcRHL9oR2KvrfXb5sGh89k7It43wLupKU
	+XY6gDE3Dr50=
X-Gm-Gg: AYBFou3ripYC6hQMCxZBUiInBrLM+vFEiMCY6RwTPy65In9W3l3q4MafRkR/xq6HwmF
	bOdxkbi3mtDz3tWpw5ph/VHO7RJloGah8WLqli70n7/a/AK2DroURx/EUEzUH3XUxCnbRte10EI
	r+DOEHRf1MUuRJOnMKUjDhrgPbuH3MNIfajRLvwJOPjq9bZlSTPQQeO5EGyod+XU/b3LbZwhjNA
	4jD+SIAROyhBAjpbQqeDzEjkL9RSNC16voWkdD+EBSsKHNwLS1JZyZIjUaQbXLwbtUM3jOqmDbr
	Iyp0wMEGWAvUCvtmivEOsgYIGZ8xtdkLtfq6OXWjKJp2FP1yet1IEqbobvpIWor42vdRW3W6S6W
	zoPYFUQv8d2Uprd1u8VwCvLUJQLtr1Be3AvRxvrPtpmKp83B+7BK245awq8n//n80tdZ223Q8+b
	Knd6oCjC3XWF4Mz77v2fe3DEV7nmxErAmF+EISL5UPl+fUDXjd8h5FDToOPHIjr/qCifdLPVhG/
	Z7sp3vJez5dFTe9XHm3aIJbaY2ZxW5mh54Fwo5fd30dUALHtyIh1KURqxuu0XiLT2a7sMFvgqtV
	FWxrA3ATobAeY5pPSTXh3wNrTDp/+8FSh/EzjoxYNLutG1gEOGglK+HY4wHWADmVk0YvUe/u4KH
	Rr3d3jjUd+LIJfWvYAEXv/+3Fg+wboTV6K/kEolAznqiDHZ2g0XaVZEqJ2cHVze2lTEfcNturYw
	Gh46NvlDiIH2ZPMXFERQqTIvI47mzO9ea/p6zHTdZtpXTSTo31zul9JXPG8QdNr/C67fvkCIspj
	7pjp/+T
X-Received: by 2002:a05:6808:23d3:b0:4f1:a873:6efc with SMTP id 5614622812f47-56e65a25c0dmr969736b6e.64.1794534608616;
        Thu, 12 Nov 2026 17:50:08 -0800 (PST)
Received: from [192.168.0.45] ([187.14.251.153])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e7044690dsm811902b6e.9.2026.11.12.17.50.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 17:50:06 -0800 (PST)
Message-ID: <3e1c4b83-9eeb-4425-8231-216bf6c96038@nilk.net>
Date: Thu, 12 Nov 2026 18:50:04 -0700
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
Subject: Re: [PATCH] media: ipu6: Keep psys out of direct-complete on system
 suspend
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Antti Laakso <antti.laakso@linux.intel.com>,
 "Sapre, Sarang" <sarang.sapre@intel.com>,
 Divyamani Tripathi <divyamani.tripathi@intel.com>,
 Manik Bajpai <manik.bajpai@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>, linux-media@vger.kernel.org,
 linux-pm@vger.kernel.org, driver-core@lists.linux.dev,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261017-psys-ipu6-v1-1-56e333f6ed04@nilk.net>
Content-Language: en-US
From: Chris Simpson <chris@nilk.net>
In-Reply-To: <20261017-psys-ipu6-v1-1-56e333f6ed04@nilk.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Sat, Oct 17, 2026 at 04:13:38PM -0600, Chris Simpson wrote:
> Since commit a1fa010b3c9f ("driver core: auxiliary bus: Drop
> auxiliary_dev_pm_ops"), the auxiliary bus has no dev_pm_ops. The psys
> auxiliary device has no driver in mainline, and its PM domain,
> ipu6_bus_pm_domain, has only runtime PM callbacks. So
> device_pm_check_callbacks() now sets power.no_pm_callbacks for psys,
> and device_prepare() puts it in direct-complete.

[...]

Hi Sakari,

Gentle ping on this one. It fixes a regression since v7.1, still
applies cleanly to v7.4-rc2 and to media-committers next, and the code
it touches is unchanged in both. Please let me know if you'd like any
changes or a resend.

Thanks,
Chris
