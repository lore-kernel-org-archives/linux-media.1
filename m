Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA14343E076
	for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 12:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787228453; cv=none; b=D2pM+enlpyYm5VoFI6Shqk9BgMohW9UVzKIiUw47RnuyN+TsYC8FhLHi/8ltDmQI/uy9NdJzhonKrBjeSeMg9UBu9YjORoWnrm31OHqxdd6kypgt60mrgeRyz4N7vP/I1AOZPgixQNF2Opnkhq7uwzJciko/Xx8xn/dBPPNPd44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787228453; c=relaxed/simple;
	bh=IcoMuhjZIaAv716kXMsE3tELwfUGT8S9drXzA3a9OEM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dLjoPGTknR9z5WXWGPsuACnO+bq61kKgpqqLID1vlpGMXkbkGBv1WftzjTLyYjC0yg5ER1B8HpfHObzjhBgRg+xV4TkKCGCodo23D9E6DcG0FYEHpdpZx370YGufwnyMlv15bljm8UHbrXC28DUD941jLxW/EPNDeJYZiIDMYHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=GJyiDdb3; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="GJyiDdb3"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8f0e5e36912so14829906d6.2
        for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 05:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1787228450; x=1787833250; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CFAD3PPmyEYBnRQoyhozco7Gx3OsZl5eV5ORNG74mm8=;
        b=GJyiDdb3FVlkK1gGlB7M0Xegdj9gEsDfiZvwU138KP2+QEHbwTvHdb2x//rb4RfVWF
         VHGcxosJDdu+RAclJx+40ZTxA4/3hCOGrXfq8BoburP9xRdfoB9hHjzuYpSjABA/qKY0
         tpch8YuyIX4jttHK9YykXWviTjRkEK/2CzHRGFA+5/WLKISuKQ8Vkg3MiGqVoOKXi96O
         GJXm5cUN7q3/gBVUrWHMf0dSLKzO88agNNme33MpqgZ0SmzhBbk/dp5+Fbx7FOZQ5Veq
         fPBzgM/4lSliQtxRTng1in+IjIPS+nt535GiH97I+yJg9LR0ySf7SkRNT83Bir/ocpky
         yHhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787228450; x=1787833250;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CFAD3PPmyEYBnRQoyhozco7Gx3OsZl5eV5ORNG74mm8=;
        b=fHXHxaLTi4Yg6pYbeAKfgK5r9XJlQzTwiOyvQQDnJFZsiDEJvCqiM6rHScasvURNK2
         qMd2LOCUiAyBp2b/lDb4Htfex8Dq6dvQ6RJU4M/nnBA+Ky7WlJg+sB6Bmkrn4ZmUkldX
         uFgI1YWXCurudlyjwD3Kg21Ep2X9JQWFVUUc1jpfjAuWv2WeK2mOBeSNHJmRBgUArYis
         TIG5G6AhKMiWIqQQVtyRHg5LbEum1IISgxUM/n+Qv8VXbE08NzDGgpsW2S+CrQd3jBuV
         SoU9R5ijBd3XF/gW5ZJOCP0pG5hlYuZsoOZAwZ2YTZB53Jv73u5FInHlALROkCmlUug5
         7dMA==
X-Forwarded-Encrypted: i=1; AHgh+RpBZfc7XPdKB2G/+G7XaJLDZp1Lth/M4zwK/uVK3ka47nHkE9LT4TRo0gEPkV+6s78wGPxLN33Bny/smg==@vger.kernel.org
X-Gm-Message-State: AFuF++mnAw2UTbvZwtlFF7drmWGAP7lFLwMikGHI62XbUgTRwwuHO8N3
	C57+FEigsXnEfxMzNDm7Kk/58OLUCjZxW92+3QiDvCtsYmGx6S71mNXjp44iD45mtUg=
X-Gm-Gg: AR+sD13MBaaBimM8igbzSanVH+VWNmpCuLomKWuHpyp3UiD+mSpB0OtHaxmr2rl2D/Z
	oyjD+/wzY+vFBVO5qriGVEyRWYFcempeHjKtDpa89FdaBAvLP1oVE6drzj9Ql/+dRCB+TmQji4m
	GRRlT+ybctG1tOZ1rqZbGzNRT6y8U2m9n5jkZAUfeomoRME9vevjli3wcMfTNg/m42uyk8wWh+v
	WxUqJHCrWJe1X/Mfkptiru7D0Dy024DJ96SRIBei6/vcNJfBYgTGiQcB20zzwOoUZT44jEgGajm
	CUvaOLugAH3uUc59UYYZV7/eITJ/6gH2J1BQStwwI2rzbbDn9MoxVZHWNfr07oF+N4J/U7Mt77R
	I1dB9CoyKHbZpzakhPlTMEsQCLjT8hw9e2Bcf2+0Jq7PKaUu2QATzWeRIe4Sm6ViavjoLlrptF3
	IOH/XX4yvlMETtYQdPa67vx5aQi2zXj25j29WNY2to+h40p3Oc+KOjzOHwjZK20NHv/A5+6WFPY
	5N+oFoj2I/m2xI5gwh5SJcnwSqT2Nmud59qilV9XZ/7xw==
X-Received: by 2002:a05:6214:124a:b0:908:92e3:a37 with SMTP id 6a1803df08f44-90c5eaf245amr114579506d6.32.1787228450436;
        Thu, 20 Aug 2026 05:20:50 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c5f2b1f39sm36591756d6.41.2026.08.20.05.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 05:20:49 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wx1lI-00000003bNC-36dR;
	Thu, 20 Aug 2026 09:20:48 -0300
Date: Thu, 20 Aug 2026 09:20:48 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Steven Price <steven.price@arm.com>
Cc: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Marc Zyngier <maz@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Thomas Gleixner <tglx@kernel.org>,
	"T.J. Mercier" <tjmercier@google.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, Jiri Pirko <jiri@resnulli.us>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: Re: [PATCH 0/2] Clear shared pages after private-to-shared conversion
Message-ID: <20260820122048.GB18100@ziepe.ca>
References: <20260820105026.53208-1-steven.price@arm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260820105026.53208-1-steven.price@arm.com>

On Thu, Aug 20, 2026 at 11:50:23AM +0100, Steven Price wrote:
> Arm CCA includes "Memory Encryption Contexts" (MEC) which allows the
> private and shared data accessible to a guest to have different memory
> encryption keys. Consequently when converting memory to shared, the
> memory encryption key used to access the physical page will change.
> 
> Both the GICv3 ITS driver and the system_cc_shared dma-buf heap
> currently allocate memory with __GFP_ZERO and then decrypt it. With MEC
> the zeroing is done with the wrong encryption key and the data visible
> after decryption may be ciphertext. The RMM is required to scrub the
> data, but may perform this scrub with a different encryption key to the
> eventual key that will be used for shared access.
> 
> Fix these two sites by avoiding the __GFP_ZERO during the allocation and
> performing a clear_pages() call after the decryption.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

This whole set_memory_decrypted() API is awful. It really should be improved.

alloc_pages_decrypted() ?

Jason
