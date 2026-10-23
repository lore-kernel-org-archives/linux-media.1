Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792772233;
	b=hMZ/mkQGUayzdH+O3pRLvvvgwUGSOBUEitkQFFU6FlP5mwSNC4S3vS+I+4VtWxzh/MT4
	 qR5LAYDQOkrcoru83uZPvepFUjUb7HKnfEL9wjCIwcS7jpKaEioZgFCBHT8rwR+sHFUym
	 BqNaXuc8OtGgjwR4SiyS/Pr9BYXDO1nrlH5OvQTqDw1oP9JNMjkm8ovz025MR5fpBGmLm
	 opLQO8jtNAvEJtQR65ZhEl4eEEc7ddWdqEwa12ISA383la0rfaiwUyLesdzaFsUw28mxH
	 A+csex2bAz2dChafgVIBqrcAmt7qwOo6Sbf8xvKwj3QOTodK0AEg3m8Er4MzaJ9nSdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792772233;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=BzEMw2qyVRDMO4EXZ9qN4crrCxVYQEBm0VZTnBXODc4=;
	b=w2E608vi8cQ7GoAAuFdQ6nvyxWveo/OrBCXc+VPpnsQT0iKwovIF2iqbqTOxhwcAXwon
	 cgSYbC33yUusVK3sZmAlYTRyW+B3WyDqYuSM2sAk1i8ZADQ3yLl5j8J5q99ok4JSKXC9y
	 OO8frZ5CRXl4iAvjwRCiLB5oP6tE1MlBou+rwpEre/BMrGidmwFf0XFHdCZflQjKe7s0R
	 WPQiXQYxwEoegrYChYsXvlqRnPkd6T2sTCSBhMsyPyaFMCYTxSfxCLRTUqRLfto+Eg7Vk
	 PJMrlvJlW91/R3H/hEq6NMhJS3tKyYPN5vkxhJ8iU7iuJjAT26Ej10Vh+44eTkMAZ+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gdBTei++;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82A6606A31E
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 16:17:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A82A6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gdBTei++
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so5674565e9.3
        for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 09:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792772231; x=1793377031; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BzEMw2qyVRDMO4EXZ9qN4crrCxVYQEBm0VZTnBXODc4=;
        b=gdBTei++O3Tyttcxc7jhIVqtqfAxPonidYibGhNlmpv6JEvYke6DFlNV8qVgLDpDOM
         xSAiZp0TnwEc2MG8RxFw7nWGw7vy2/4wpxNEB0QGGGfKXKEbUze+6ag0MeeAJGR0MOrs
         f7GQ+iUVNZVx0yF+6IoouMVPUEZkstlWyaSK/1uKilenrsU8ikh0R550EA/K7ZDe9mbT
         yCyZ4e6LpJW7qUj2dbAYUIkdtuLEcXeL8ue6/qalRmNBVav1rQ/cneLKHWNQoJy9tk0H
         CieX8akdyk5ylZ/lEHpz3Wv92EaSIfyoRj8Wp8ISA/b+yLW7IuiUwUOcINssxxPW9O1X
         MDdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792772231; x=1793377031;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BzEMw2qyVRDMO4EXZ9qN4crrCxVYQEBm0VZTnBXODc4=;
        b=IH18DzekvTIpRoKx5sLRxnbMS4i1US6R/nZDlpSiZ/9MEIZvhby3O78o2ukckhQD5g
         jpHhSyvR6/Z0Db2dVSUxhWpq1iYS4VDYAKjf+nJoaDs6TLmFepcUEaVQu+Z4zBCb+3bR
         PwVkpA1SifJx/ILGeVKSOT28I8u5ZPc4MNOmas+Z2gX7MJ8Y+08RdV43EKCgoG2ij3FE
         jLq4aLDQYD0gfCJl27vfDJdMwc87jy6vsSg/4XE2gXY2xd5nIGYuBYV7MNpXaRuk+bKx
         t8QycsZhPeDJYIAXqbacn2dzgGfGMEiVVNyWja/l4qjZ55EMXGM1bqEyCI9unArBAEni
         MZ+Q==
X-Forwarded-Encrypted: i=1; AKwUvByBk3RvhToYlz5uaUPqYHlFlAqRRLxWCAwg6aFbJepdWtUID5eSmH1qQYXZ4plRoVlhjfA/EsAEISW0EQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIdq7zhVkgCsTztyb7VMMoPOnTjevIhf1HzPeRDaYi4zFd/lNwC
	ECmAiZeXH2b9tCHt6jZ4rHKibUEK/TMyqDyr0Z7rmCgCa0IMi/TpDTJf
X-Gm-Gg: AYBFou1Y73LqeaM6blP3/+3pm0B3Wuxiz70PYFGoi2TPTFz1x7qKBVvMBtDexyQG/9b
	d1lBruthCUPJX2LHk5E1Kz3AuCJMj38gMR8ePtbHZ+/ezfN9M+p3wX6p0lWW8DP5KNQiw1PLJa2
	h04B1N74c2hJo+sS+McE3F4zO9K7ShgDWLD9msMAnBf1ncDL6A469t/mGxWbeIydGW8TuPlPEVv
	TDPgwc1vzspD/LMwo5tJMmw5I5GdO/RjvKZxyQTKVoAdSZdgRqMDHGdb57MFeAHrAKSDctykpnX
	s3nIm77ESGegB0dKTyTKPv+zOqDUru22JXKo8Plnx2dguXw+prXQfyEN/xMVVQvjBV22UjRT+nn
	S+Dvo0/AUPlvA6xF/JSHFmakiIy9aG/3T2r9tydizXpT6uygt5zGx+4wsMi+POQUBocwJfKj1PM
	WVgI/FW1kkjyi0yCiQ2HVYKPjuVbKl4vcE6vjQ5TLz2JapTqvEgNn1u/8EAxN7dvKZoJNC0M1x0
	f5NxtD7kuYavh2g/rtaxLll0NdNXEaYjZfnFRuli+MxaefknR7u
X-Received: by 2002:a05:600c:1d07:b0:4a2:267:25b3 with SMTP id 5b1f17b1804b1-4a211ecec0emr46659165e9.35.1792772230469;
        Fri, 23 Oct 2026 09:17:10 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2958bf25dsm20075165e9.2.2026.10.23.09.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 09:17:09 -0700 (PDT)
Date: Fri, 23 Oct 2026 19:17:06 +0300
From: Dan Carpenter <error27@gmail.com>
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	Lorena Tanase <tanaselorena3@gmail.com>, hansg@kernel.org,
	mchehab@kernel.org, andy@kernel.org, gregkh@linuxfoundation.org,
	sakari.ailus@linux.intel.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: media: atomisp: Fix double blank line
Message-ID: <atuIgtYbgUsmfgkp@stanley.mountain>
References: <20261023123158.6176-1-tanaselorena3@gmail.com>
 <attnVU9A2GvgYuy9@ashevche-desk.local>
 <09d70600-10cb-4626-88ab-f9e10f4dcdf7@nxp.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <09d70600-10cb-4626-88ab-f9e10f4dcdf7@nxp.com>

On Fri, Oct 23, 2026 at 05:09:55PM +0300, Daniel Baluta wrote:
> On 10/23/26 16:55, Andy Shevchenko wrote:
> > On Fri, Oct 23, 2026 at 03:31:58PM +0300, Lorena Tanase wrote:
> >> Removed blank line to ensure linux kernel coding style. Found using
> >> checkpatch.pl script.
> > 
> > Cool, but is this the only problem in the driver?
> 
> Not the only problem but as a first patch for a newcomer we want
> to learn the process of submitting a simple patch so we keep it simple.
> 
> Then will expand to send patchseries. 
> 
> > 
> >> Cc: Daniel Baluta <daniel.baluta@nxp.com>
> > 
> > Please, put the Cc list after the '---' line, so it won't pollute commit
> > message.
> 
> Didn't know about this rule, there are thousands of patches in the Linux kernel log
> with the Cc field added there. 

It's the more modern trend.  It's was never clear to me what the Cc tag
was there fore...

regards,
dan carpenter

