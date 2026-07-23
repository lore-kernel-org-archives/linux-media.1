Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2813323AE62
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 05:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784785024; cv=none; b=WhyOCzqz/ZrqR+fZ7GyLuyaBESwBS4Tkc+aqpqn0IPM3mIqgXhP5/8gLarLBLcJS2jB2R4ifCK+4eyKppEi3pw0UhMcR9GmliK3IxMtecB6clIVTrSIsbLKEI9e8jz6tLqzOTgPFCfR55bI/wKWjNmH6KJnaN4sU79bRTNDyZSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784785024; c=relaxed/simple;
	bh=2llFuoSXMc+5N3m+Dp2VOx15PRZRc26NMu/GNqR+xQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dI1/x9ysohfzu2/c1mknTbTzL2vB2pkCiw+ZBthyPgg9/Q0IQ6cK9gvYqO4EG2+oftUPb84Q4xrpODlgqSWpHkvjJO5iW2eAummJhQqVYtMYQdt9pnbmvABp+ZDvvOFbCBij9+mLoSHvMVUYoYMpfN3dHjE0+YQwBKf/mEMW9wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lCrP61o4; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lCrP61o4"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b159850b16so230137e87.3
        for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 22:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784785021; x=1785389821; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bVtvnDjA9INjIyx6/YBhe+VDRG08P0PWnal5Do81yec=;
        b=lCrP61o4AnFyfIj3bJwitzS4gp8vsK9BWcfZlvnn3LdIxmQabtct8MHoj4cmfs01ea
         DOHvEX+RbIhWDiwhHXkQfijSgYXS0p3MShHt2D5nDaawIzkaQPCVD8Q5vGR2cL0cxcM/
         HEg+jvR0YWOGXm0pgfL9ZOAyx4H6ZK9jCTFeSbB1HZUG/0eZm6ISFf7pC3ADYL+F36Ho
         fAMT39pW0SxVYBI21zScCECbpnkVde8pmoGf3nPEVasoIAlk4wFq5ZT6p6w17AR8ioHK
         jTo7MNIvOm5ZNlIhL1OOQVM2ZgG37buhQlKoLlpNwmBF19XskBi8yIhXgXvMCA8Oqdh1
         23gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784785021; x=1785389821;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bVtvnDjA9INjIyx6/YBhe+VDRG08P0PWnal5Do81yec=;
        b=bat2pm72KbH6MPuq5XRzPmi1uzG9+VQmSh3NhzzzTVPCQB4Vw24b6SFrOCrsLYfVyo
         b6ZcDvObD8jLqgCPHdcSADv/ymyfgpuFonWVxabRhEsJL/zbbxNHDn4ttyJWzpXkjMti
         vp8u5HlT3+RItw95qumvaSK/9AuNa/f+HvtofQUA9SaWKwE0AwqDJgjRm0gnDsJn05f2
         NaD3hAQyAayGPXXscmDZfdjIx552QoOi+HSyY3D27G1eAfYfWAVgxolVzMhohLhaw4hi
         iUouGOSPtY7HTpxLmXyS+IM/w46TTd6MS/JWve20hsc0Aj+xQqAdDUstzV9Ote+YbXiw
         be9A==
X-Forwarded-Encrypted: i=1; AHgh+Roy4tbs03ZW0biV92oDDVrXKGbzvQP3L39Ruzx43uTOCZ2mKwAh2sRlcNLRa+xKvxa8Upn5mwEdfb7tag==@vger.kernel.org
X-Gm-Message-State: AOJu0YznPWE0DfbeDdngdRl9YwX3+22VOjVd7ys9hlzk0aaSjdQIQcCC
	ctmUxBEREB1jvDQaCAM9s6q0ol68IVfC440IZKS8bR5lIsUXmuapdKpw
X-Gm-Gg: AR+sD11/1V9HiuTEupUNJYuAxFH5YHbB3U8eV4RoczjwhTdmW+DuFFoOJeIJ2IlbZTL
	JwOonNVgMTq66injc0+IXoeDLGLzL+lidIhDwJ+0Qjxsd3wKq+VQLBr25GFjQeL9goihe4NTTnd
	AHbmqJtbgY9umL7kbITVwt0oOriLwD8dLgaEPoRHskhBmA/8XbR75S4dHi0I9MjTwM/x0Q6n0n2
	w5O4gHvrTe9+smBoYXbD7i+96Gz9O1P+NOGQXqg21yU6t1EKP3U5BOnbhJ+nA9pQHsna1WYy7rv
	mIYuGfrfwrEPjOrAjsPURMhzRlqvI+QieXdm0eUJWMJZGxgFs1Ouq5bDrDEN9+ayGtE/NEEj3e5
	92/b5y2grL3OF9omwcONYi8kwxGOYETZpvAbyaAG4CVuahVbtFSCIyMBvPutHuWaUO0m1eg7ol6
	E=
X-Received: by 2002:a05:6512:1249:b0:5ae:b135:64de with SMTP id 2adb3069b0e04-5b2b2f6c5admr293217e87.31.1784785020898;
        Wed, 22 Jul 2026 22:37:00 -0700 (PDT)
Received: from archlinux ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9d42fc1sm843939e87.58.2026.07.22.22.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 22:37:00 -0700 (PDT)
Date: Thu, 23 Jul 2026 08:36:56 +0300
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] staging: media: atomisp: remove unused functions
Message-ID: <amGoePnbFT5LmbiZ@archlinux>
References: <20260721214238.840406-1-nikolayof23@gmail.com>
 <CAHp75VdoH_WCR+erV6rm-LohUYacJN91XsmbNN1JmJDCxi-xtQ@mail.gmail.com>
 <CAHp75Vc-TaNLkQnck=OFonuWMWgdaxP+cVh7Oo+RjUeOWLfZEA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75Vc-TaNLkQnck=OFonuWMWgdaxP+cVh7Oo+RjUeOWLfZEA@mail.gmail.com>

On Wed, Jul 22, 2026 at 08:08:38AM +0300, Andy Shevchenko wrote:
> On Wed, Jul 22, 2026 at 7:58 AM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Wed, Jul 22, 2026 at 12:42 AM Nikolay Kulikov <nikolayof23@gmail.com> wrote:
> > >
> > > This series removes functions in pci/hmm/ that are declared and defined
> > > but never called.
> >
> > Don't do it per file, squash these changes as it seems not so many of
> > them (I assume you checked the entire driver, right?).

Yes, the entire driver. I usually use 'git grep' from its root.

> 
> Note, if you want to make a useful contribution, try to clean up the
> below header
> 
> include / hmm / hmm_common.h
> 
> It has some ugly macros, instead this code should go to the users and
> then be propagated to each level and refactored.

I'll add this to v2.


Thanks,
Nikolay

> 
> -- 
> With Best Regards,
> Andy Shevchenko
