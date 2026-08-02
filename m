Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF83C8EB
	for <linux-media@vger.kernel.org>; Sun,  2 Aug 2026 18:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785695172; cv=none; b=YwGgdIhooSPYxEAmDL3TaWtPFQ6SpnBVTt0yQjGv8eXbKAoR96wOpB6WvWU/VewCPShLMKaKN9eeVBHgbNNwXyKtHYAABcQ3JzZjiELLXK23ZUKHlYVtB1I81n/rNKItfuu+tTOEciUz9ZH1zbIfW+C821NfDjQSwAlLY5PuWwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785695172; c=relaxed/simple;
	bh=NcgeiwU7XtP+X2N/eIMpr5wojeooUp+d4m1LkY64UIM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SZoGwmHbl8h1zmnMwy4le3gKR/qm+DzZVJOROU7OAC0H8bVeQQJ1wX+Geoi9maq/uZfQDHsX9fUTnhVBDp7eqGU25l2CDAjGVnqSYX9gRQzWanOpMj+yYjBJwm1tpBNenfQ/RPiQc91XJRSGFw2P+1eow+rglNFQbFPxOApP3U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TvivUZPt; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TvivUZPt"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-39f9d4bed90so2100341fa.0
        for <linux-media@vger.kernel.org>; Sun, 02 Aug 2026 11:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785695169; x=1786299969; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4aT1GV4BpO2FLXf9Q+ITvU4YQjpIH2TSzUI5akvyW+E=;
        b=TvivUZPtiP+g4w+RUUCK5WbHFd0S3+SnegygjoWEiPWm27Yh60/tv0RrkMa3g+hE6D
         nFgeQlksuXjf4wrlMP7ROy3rxAzNZwjokccaWiCScx5bbJVcItlG2sfjeUJo2dkO5gq/
         2RjkqGDXsedTQjUZUmQ/xcAlwfizKLJyt9YeMNDJyd7R5SKsT+NrXPl+NnOKpWvofKmR
         N6Tah1e3+3h2/GduodgGYdwvjWCn+Q2rgFiWONfnGVKtvcR1bIt93ePrvjeuhGRIt6EC
         w3Wi4qVBQFuLh4E/YQi8b5/26ao/rfvt4o3IvJIIWSFTfK5D5mVAPj+3DsiSbCBH2IiA
         PBCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785695169; x=1786299969;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4aT1GV4BpO2FLXf9Q+ITvU4YQjpIH2TSzUI5akvyW+E=;
        b=kExNf7Z9441W2u4dIQJNpwZuAfDzKdAw3DQFuO55fbn/hHrKHRmPm/Z9y8Y7i6FQ5c
         dvy+X3anptHwEW9AzsHIfbeS3YrCv1NS8ADS6gIH5hNRvOpFdnQ3Fa9OBxtAnR86rqhQ
         s4YCZ2ibz9dbH29sdp2Ven4xzGvAR75VxnCZ6dAlupaK57EWsZwTxaLOboTnhNyQOhKO
         g2FQJZYORQ57YchPp63Hm4Ec0PGIO7iZiVY2fMpNJ9cdruBIGvA9Cbbd81SnJHeNV5f4
         afaYtOOlbA4ZIS7F5YbbNMDCzAKk1oVu5Vgp6fUQXdn81Ee3n56aIILFRNp77Az8Mf5s
         gW2w==
X-Forwarded-Encrypted: i=1; AHgh+Rp7vFwlVbJUI9mhW1MnAJdE7uAyk2TgRDAhyimaEcyjGpkn/37fpBFqcXhncdm1E1NeoKer6VM969sH1g==@vger.kernel.org
X-Gm-Message-State: AOJu0YybMBOCU/zPrnKSE1ydOohPc3nN/OeIG+Wv5lVLVG06OAmbet2Y
	9FCpZbW+YhunpA/IC6+NhK/e8OsRvZ/j72SStu3yXRjYpQlAraQEt6x9NBvw0Fo87nqWEg==
X-Gm-Gg: AR+sD12DjVdGThp0WY4It2nPqiofRy2MMsMNnxOB5apgdm1z83hOPX4iBRoxbeAUM78
	Lapr4lOdQONQQcEF4tzNN8gpSdeoRNbwQ9xOV4y0IGAtduardJUGoYaomQlCgco7qG+FrFwZw96
	t3i1/wCrdCtKaAiuNccXwKPFAO8T8qKY2caWfmxSAlO/NvRDZy4eU1VoaX24b/jrnSTNDFFFBEg
	+8cYAEWnAKlKpgw0y9km98wSNlLqT4Xc0kvTdMHYsGnAkDCVtREhEqbuM6/LlPl1fIDqxLUXPXO
	PGtvpsQ+YZ092Q/Q55y7jLJBRKOzNn+plvgEEq6WqE8lFbMrSjjgqfMWmCLCC+hTX17m3+gRUhZ
	97rXoya5QZ3cQ1Mfb2dTD0M3qxD821t0RzBudwPpQC6tbS4LwoAnVi20wcRyPBmxzJmjzWG0SYk
	b00hXL8qscIIOCt7amaGyp8C9gPS+XSzy2mHR+VSKRdI+/g0wlEaHZR2ECQuotqS1w72zWYc7yn
	x0OU8COsS8XXGhCtHSU4w==
X-Received: by 2002:a05:6512:688c:10b0:5ae:b6cf:c745 with SMTP id 2adb3069b0e04-5b2e4f3e92amr639235e87.17.1785695168806;
        Sun, 02 Aug 2026 11:26:08 -0700 (PDT)
Received: from localhost ([77.237.184.74])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2e23c46ebsm1578827e87.10.2026.08.02.11.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 11:26:08 -0700 (PDT)
Date: Sun, 2 Aug 2026 21:55:58 +0330
From: Ali Nasrolahi <a.nasrolahi01@gmail.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mchehab@kernel.org
Subject: Re: [RFC] Discussion: VIDEO_NUM_DEVICES limit in v4l2-dev.c
Message-ID: <am-KtTBaHCshGpeb@zephyr>
References: <am7LpodognguIZN5@zephyr>
 <20260802125734.198631b5@foz.lan>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260802125734.198631b5@foz.lan>

On 26/08/02 12:57PM, Mauro Carvalho Chehab wrote:
> On Sun, 2 Aug 2026 08:24:29 +0330
> Ali Nasrolahi <a.nasrolahi01@gmail.com> wrote:
> > I'm working on a project involving high density video processing on a
> > single server using a large number of v4l2 loopback devices to route
> > virtual video streams to tenants.
> > 
> > While doing so, I ran into the hard limit imposed by `VIDEO_NUM_DEVICES`
> > (currently 256) in `drivers/media/v4l2-core/v4l2-dev.c`. Looking through
> > the code and git history, this limit has been there for quite a long time.
> > However, after searching the mailing list archives, I couldn't find any
> > previous discussion regarding this limitation.
> > 
> > May I ask:
> > 
> > 1. Is there any internal design constraint that requires limiting the
> >    number of V4L2 devices to 256 on modern kernels?
> 
> There was a constraint at the very beginning due to the way minors
> were generated. If I'm not mistaken, this was long gone.
> 
> Still, having a maximum limit is desirable as there is a hard limit
> in terms of the memory.
> 
> > 2. Has this limit been discussed previously, or is there any relevant
> >    discussion that I may have missed?
> 
> Probably, but likely very years ago. I can't recall last time we
> discussed this particular limit.
> 
> > If the current limit is no longer intentional and there's no historical
> > context that I might've missed, I'd be happy to work on a patch series to
> > address it, and I would appreciate any guidance on the preferred direction.
> 
> What is the maximum limit your hardware has? Can you provide some
> documentation related to it?

Assuming I understood your question correctly, because the workloads run
on a server, theoretically, there is no fixed limit on the number of
virtual video devices that could be used. As long as there is enough cpu
power, memory, and i/o bandwidth available, it is beneficial to be able
to add devices and, consequently, run more workloads.

That being said, to give some rough numbers, I think supporting at least
1000 to 2000 devices would likely cover most practical cases.

This is why I was wondering whether making this limit dynamically
allocated or at least configurable might be beneficial, so, for example,
mahcines with limited memory would not have to reserve an unnecessarily
large array, while systems with more resources could scale accordingly.

For some additional context, the video streams are received over the
network from various sources such as cameras and WebRTC. These streams
are then routed to v4l2loopback devices, which are used by the workloads
for processing.

Regards,
-Ali
