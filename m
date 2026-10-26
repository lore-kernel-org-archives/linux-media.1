Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793040807;
	b=YHWYBpHjZkg9bM2kfBk9ISXSc5lNbwkglzgZHZm6gptJKVEKVX060KkOin+rbltPN/Rc
	 mYMc98Jf/HxTTrpghvOyi/jS0eUM1jqnopyP0dFARJyfQuoNXRLGXPHajPb2b+rt+hGCQ
	 hlwCsifQqmYOitdw13jwBD5Cu2iXNmkOHDHZKw6hudoZLZ1YmbidCstK0CZGWj1ttwyy3
	 Nd+E51cOfnamKwOpWxta1kJYCUqAncqmc6Eit+GZObjVOM5qjjA/ZNgS20dEWBgfgsmHH
	 xuiyv5ItLoWl3u1sHfqf1BkL4o/F0NTaOAD+irbHELsoXaIeCl8Dld4sldB6fnNjfqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793040807;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=o5NLvHyayaKTthbgjkTC6jcIWBDJBQQe45RTaipv8Ko=;
	b=TepwJOBv1YRxkRJlmC6bX9SAvx/Lmj9/9gFb9LaJ7DIdFa+2UMj00MwDvHpnZcc6sCit
	 zokMiBgC4ak4uDjpb1mlWHFHfOVFwz5IQ+oQ3TsVrOh9UxtO72TtziCBIV4PWWWDf103v
	 M05x76psSl1V+Dbh/uug/CbF4B3RJN6hMpPbBR4MHOtDqslTKINSIA3mZqD3H3y949Xib
	 W/fYrDu7/kdr7wP6Oi0tuWB0zwTiMg3s+u5tzbWiyDmQtrGYN4zUb8/IR0p7yoqcXbjqq
	 9gwq/+9J4/cYrCThEoggKmbZTSB/H8p5cd6Xf29ptR7u1w5mKeZHgGYCFiYxQbW6kig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=Wkzy88xo;
	arc=none smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E106606A31D
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 18:53:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E106606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=Wkzy88xo
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6ae305e3bd9so5796998a12.0
        for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 11:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1793040805; x=1793645605; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o5NLvHyayaKTthbgjkTC6jcIWBDJBQQe45RTaipv8Ko=;
        b=Wkzy88xoh3nKXld5wCIX3oC6PIm1RMJPNeh0lJRvxXGSozwQehTTLcJGzFKOcWVKJd
         PT0wihWO91zQ2Q5PojGCxcxR7+iEjGGbwgmJuRIzgu++ByF++DPBrFtEVxo1gGXVxDnO
         K/4B1xQe1X7m3sHpWQymZM1NgXRyquVRUnI9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793040805; x=1793645605;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=o5NLvHyayaKTthbgjkTC6jcIWBDJBQQe45RTaipv8Ko=;
        b=XKUBZ+j6lIg+wXi+eZ9ekqSuXpH+m5qzUhQ9tFc7pfGV8PqDq922WzGZbEswWo/Lau
         wX90ovLb3UMkSMTg6qmn5XMofkzJ8ClsVP4zvou4AWcX0LnX7QarCb6g6oEYO218jPaf
         X4Rvo+ybQm4ekhuBf7A+iEv64YHwklruYPefvK1nFH5E04rQLX1TF7Cg0Z3D/q/r9ocQ
         b3hV2ZnywpiEMpGRwZbqVMc7caIsWmAJNvv6TJvYnIqAeKa7ikURzJisulCMbRS8hbfI
         /A7oxiSwZ/h47gNI94qde4H+5VdVolxBM1SV/rIoaJhFWX9HRc0QP4LyyZK6lEtLQuZh
         gf2Q==
X-Forwarded-Encrypted: i=1; AKwUvByehWyJUdXFa/6BonSbjYdMW31oayhMn/IO5pVWS+RSieoi9j5l/9IrenUjdtoJw8aXsG4icl/z/HWH2g==@vger.kernel.org
X-Gm-Message-State: AFq9FYIOOlpA+tA7Sg785qhg+xi7Kr9mUzc/wPAfVd5dERWe6wGKxpVJ
	Ykkt4REUjTFi3b96obsicKt36U/6KNfFkLE610gP0DvRixvQpTMYH4rIkusPvyWFotT+kf95HvP
	VT8/CULk=
X-Gm-Gg: AYBFou0gyxGRLtqMnNDToBiFdC++JL8Yyd7X3TwZaxRHQDLt4B1KKPB6CiEx/1cyLvV
	+blIGe5tCrfyXgbmUoxmt3RcYXudWvXez/Xli4EXaq1jcUSdR961ApL+s9AFwTnoSua2b5dgk5N
	XHCVTmsh8KD6KseWUBEcs9JDVHbB0GvDCR/tQPkyNGi/6xz69eOnmCfAvLzpLl//EIiaQVZJbvO
	VwnAMO9BVPdlyk7hEPZi4z86+nMI0YVaR3d7tSKIP/i+MGBQdZK+2R9C2zis+2l5zHe6yszHA0M
	kCokRNhM9kZmSNsslfxeM21i/y4DN9I9XqdFDVkwwMzZBMYiSuQaUzjXSqvye6eXB1L2bYoSxjX
	Qfo8rmzB4ytlSLOl+Y0Y+5ZHYYcu5hVGDVkCGzTQfmBAgTfUlfNszvyZ+i/cQstpR22l+f8TsyA
	bLCQWLk76U7QhX90YzhC1bUF15TZZi40RCbPHqw4Jah0PRCB8ihebC5SBeA+bF7VdHtsj4Kl8DS
	PxbIE34PYfh/TJcRg1o+iot4L10+q7nUCUXspDTccbD0aeJRUXqMzeTyG0IW5/nasRWseUhM4az
	R3ENEBLuHQ0aYXaUyN2Kaw0m1ppQow==
X-Received: by 2002:a05:6402:c502:10b0:6b1:c6ad:ae3f with SMTP id 4fb4d7f45d1cf-6b442ff6f87mr6192240a12.35.1793040804621;
        Mon, 26 Oct 2026 11:53:24 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b47a2cedbbsm291859a12.4.2026.10.26.11.53.23
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 11:53:24 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b47c1a3c74so202116a12.3
        for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 11:53:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByrxw+/hPYl00THuLldYpdXpiwZe8nJFXfVdbrhb5/dMO3lUIM/3EpwgU+2bFC7/zrz4n9uFYLA8Qb30g==@vger.kernel.org
X-Received: by 2002:a17:906:9c86:b0:c40:dfec:50c6 with SMTP id
 a640c23a62f3a-c46bde12b55mr849392166b.21.1793040803209; Mon, 26 Oct 2026
 11:53:23 -0700 (PDT)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024185058.20410953@foz.lan> <CAHk-=whVSx-=wUbY7e79bgW-C+m27+ON+HLm13mKHJBfBgUqOg@mail.gmail.com>
 <at-a-2wTtf7bJQwU@kekkonen.localdomain>
In-Reply-To: <at-a-2wTtf7bJQwU@kekkonen.localdomain>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 26 Oct 2026 08:53:07 -1000
X-Gmail-Original-Message-ID: <CAHk-=wiVxA+1x-eNCp3-e4=emCKXUw9HnSg-ng5A_Ndf6-3mxA@mail.gmail.com>
X-Gm-Features: AclHuK_noOhKvajafCF6Y4vLLjiCQi1lIip37NTkzc_fA8PG6fPCuM1fAW3-Gms
Message-ID: <CAHk-=wiVxA+1x-eNCp3-e4=emCKXUw9HnSg-ng5A_Ndf6-3mxA@mail.gmail.com>
Subject: Re: [GIT PULL for v7.4] media updates
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hans Verkuil <hans@jjverkuil.nl>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 26 Oct 2026 at 08:25, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> The patch in question puts camera sensors and related chips in line with
> how the rest of the drivers are selected elsewhere.

.. and other places could probably be improved too, I agree.

But this made things *worse*. Much worse.

The thing is, at least hide them behind some "embedded camera options"
that in turn is hidden behind "EXPERT" or something like that.

Don't make *normal* people who build their own kernels have to see or know.

Let's say that you have a laptop or something that actually uses one
of these sensors for a webcam, then it STILL does not help to ask a
user

 "Do you want a driver for the Analog Devices ADV7170 video encoder"

Because (a) that chip legacy and likely not in any laptop anyway and
(b) even if it was, no laptop user is going to *know* that.

See what I'm saying? You literally make things worse. Don't do that.
You're making the kernel Kconfig script ask insane questions. They are
insane because you cannot reasonably expect people to actually know
the answer to the questions.

In other words: don't ask questions that you know the user cannot answer.

There was a REASON why those menus were hidden.

                  Linus
