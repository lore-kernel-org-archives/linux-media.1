Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6F2495028
	for <linux-media@vger.kernel.org>; Thu, 13 Aug 2026 17:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786641820; cv=none; b=HqPuKOdw62RkgH2c8z++gN8IvdqQbzm6UGAh4bWNXs/LDQDcask+VbL8zuTaYW06Fl/NogapROtn9UQUhHRAyo6kGMVOKHUMEKsyR/xune3Krs0acLVWJo5DxLLnk7w+kMPOJUteMdFG0COV8JigE9pd1Ul2nEhZbRRQDIhhBx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786641820; c=relaxed/simple;
	bh=uG0tHnepocVnkylL8AFXFuZuw+YH0IhFJtcA46V/1EU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WVT11ToQXwhO+lfIn0iE+IICKk7Nfy0Z4uktTlF8RPhHUUslEiybWJJZ22w+v0s5Yf4/R3Z5/E4ruDJWR/W6jwi1SgkIxOln4n8/qgJhlCCd6F+Qn70DzPHSMYTmZYP0rzL5o2i0N3KZUc02beicQNOAa7Sr3XoQli6S8qHWR/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qZo9OUkl; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qZo9OUkl"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5aea0fff535so29814e87.3
        for <linux-media@vger.kernel.org>; Thu, 13 Aug 2026 10:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786641817; x=1787246617; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jbA8z1rdNkDHr3lYrwN4B7BO4VGGhl6jzy9WNKUTJ/c=;
        b=qZo9OUkllVmB0rDr81SRW6PuGjLrhofBrf26n/3FbRxSfZKdTyfsYy0abZuKCOfqxk
         GuWqbFaau55P/Q9eL5SQ+YQ9OBfdjDhIpiz/d1cXWtN0S53gpeglpfxpeVIu7Ghsi8dY
         nkxHHeAbVNuoubtrxj5zb5r3/2epH7iQ8QPBUTvh4hObrMIhOkcYVdSwB4AYPsmx7DeX
         3OUAhsJxl2zRdJfV1tjbJuvuY+x2L709Y1Cy4m+vPg8W216p1+bV+Rsc/Txcu9hqMlCd
         ef91TBsgvuLHFb9H6hRgodKXismIhYbZJqgPfuLfVwggxuOZvrW+McRgKopkbSN5ObwT
         zaDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786641817; x=1787246617;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jbA8z1rdNkDHr3lYrwN4B7BO4VGGhl6jzy9WNKUTJ/c=;
        b=pk/Up/U1xE7bQZJNHW9/UoLo9FIazJM72KclewymiB0DBIxgOiPd9dfSkcB95X60fQ
         Pe0VZA64DTR/pk7nNp/Js7At8yun3ZpNSWVB7/xpGYzrOSXB3LwHYmmDru6AF49cAvzl
         JXihHnW/nZ3DrO6Evo8Qt6rytXP09WTtmkv5u/JZCuGC5VziDN0hljIWWSuw3GxLVW03
         9Ph6t3SYfJTHZws8vfmEOpWfoWG2iGFbigSfHVzy+EWGV6CH81v8LQTQd0lMtwXHwkzd
         9MoZB2C+sJ9BghRxCLm0hlqL5eNLSKDbGQcagYyaS07XaD0Cf3fjwaocjuCYSCsC3mVJ
         okCg==
X-Forwarded-Encrypted: i=1; AHgh+Rq8zGu1Xa2UbuXwE0p5vHNQU8IkRJ2nsfI9YzkbUM9UIH/LYFGPiCKtebP1jL/9SeGo4qLVyEwOifinCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4s0M++LcAKs8XWVIs+1e71Lvsl7xJMREFKLP7QuKx1AoU88tx
	g6T1sgvFuVwgRLLTzd3q+PMIZsUn4OsHnb+1zfUpl/kFCCCXbDfYz5zF
X-Gm-Gg: AR+sD138yehBMiHcBxAkHhpZJpmBOel1g+/6eB7fATN7gxN7Bq12b/YDfAh8N+lDGVW
	AUSYIvX8Z1ANO75z5g8p3C8HBvvkvi88Tjzr0xoMVyI2GpkCNEg3Gb5LAv2zn+yIosNNSTE2wHB
	XOhOnPtK/vS9L/E/hWXi3cCQUXq4DfiqPT+lfsiLWtxWQtCIuYxee4ukFUM4zfsJfHGK9QLsmX3
	c547xKawXqltGdsYFDdkm4pHNBHmQN6hb0OXNPSkT4K3vkQJVrjGXgSAp9qlWHGzQBl6bLH3iFk
	ztchp7/p9lkb/023JxAV7EMv1G86S9uQeJPHHbXk/GheESG9WFEiPdB/Zh57tMlh0rLE6+UC7aB
	qVsV9+wp5/QKnxnT2jbRWauDWTyvigEdss0BrvIBZ4iz7WHfTHU9E15faLvjl99qma06iL2OVUN
	l7aUWsOKqhCi9RZq+kgrZFMIheE73xNPG+tVGqHxlq1NagTco3QabvykYegbI=
X-Received: by 2002:a05:6512:1444:10b0:5ae:bfd6:1bc1 with SMTP id 2adb3069b0e04-5b453f47e75mr997626e87.14.1786641816655;
        Thu, 13 Aug 2026 10:23:36 -0700 (PDT)
Received: from archlinux ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b458c00945sm15213e87.63.2026.08.13.10.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 10:23:36 -0700 (PDT)
Date: Thu, 13 Aug 2026 20:23:32 +0300
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/5] staging: media: atomisp: cleanup pci/hmm/ code
Message-ID: <an39lHmSRfuEzU4b@archlinux>
References: <20260812205429.39181-1-nikolayof23@gmail.com>
 <an2KI4rsL9tkA_4M@ashevche-desk.local>
 <an2KlPmaXYxyVMEX@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <an2KlPmaXYxyVMEX@ashevche-desk.local>

On Thu, Aug 13, 2026 at 12:12:52PM +0300, Andy Shevchenko wrote:
> On Thu, Aug 13, 2026 at 12:11:04PM +0300, Andy Shevchenko wrote:
> > On Wed, Aug 12, 2026 at 11:51:33PM +0300, Nikolay Kulikov wrote:
> > > This series removes unused functions and replaces obscure
> > > variable-checking macros with clear conditional statements.
> > 
> > I believe I gave tags to some patches in v2. I don't see either.
> > What's going on?
> 
> For _this_ time, please reply yourself to the patches I already tagged with my
> Rb tags placed on a dedicated line.
> 
> > > Changes in v3:
> > > 	- Split the last patch into two (inlining macros and removing
> > > 	  the file).
> > > 	- Replace variable initialization with assignment, followed
> > > 	  immediately by a check.
> > > Changes in v2:
> > > 	- Squashed the function removals in pci/hmm/hmm.c and
> > > 	  pci/hmm/hmm_bo.c into a single commit.
> > > 	- Add commits to cleanup macros from include/hmm/hmm_common.h,
> > > 	  as suggested by Andy Shevchenko.
> > 
> > Also two process hints:
> > - add --base when prepare patches
> > - add links (URLs to lore.kernel.org) for the previous versions.
> 
> Same here, just reply to your cover letter with these URLs, and for this time
> just refer what the base was in a free form.

Sorry, I think I should have used b4 from the start.
I will send the new version with all the fixes.


Thanks,
Nikolay
