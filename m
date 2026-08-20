Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4496535DA68
	for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 17:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787248065; cv=none; b=H77Kcd9TOsxjTN9aUjA3I5AnJMgDJLG1tyLVcykK291yGpC6QqWgSHbo/LNJe7xHBwNNtaWas0KaOh/3UoCeHiF0UNFI4p9cd8D0+TyFLgAgLVmYQvlLce3Y4nqtPut+1zbhs1OjJLcDbtTto4Kk0UwPPHDswPYgkIeG3F6v7bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787248065; c=relaxed/simple;
	bh=7bZhKXDFYfZ99I/SGINR5Nc/mrdyDC5qKrF46f5SR+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TiAzr9CFcsD8gFS7kAxVt9hg/XGpDSqNOj8kpzGSScYmtDbjnpYZY51z6vy4stxwH9TPTE43olBFq9WW2YbMWSAUGbekLGvrK+FMiEFfXyqjujIz6RqSx6uOdaqEj00x8mDSA/xy0FF5KE1bNJBfI4Q5dLbkk4HUsNmsXF7c4u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=AtlMwP6L; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="AtlMwP6L"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-92e50a650a0so3763985a.1
        for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 10:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1787248061; x=1787852861; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nhC4gcMj6qZbqU/PjOfQzYKyx+7NDJFZ4HXjtdF8h8k=;
        b=AtlMwP6LSkIjHKjCpXqGHS5rZ3q2A6D5splILK2YKs5AoRSNsaB+By7yMMrSfOmn9O
         57EHjiVa4nuHkqvKLxZreLCh3/oDHSmlE9fda3EVTlWuswSTwNb3S6UUb9N1THw3ozKE
         rAm4l8VmsJOjPEUXkLio9MHisH2/wt0QvqeV8vXVy/RLIrK0IaWD5rwXFfzDdMrp1XSN
         9PETFP0ETO0asMZhTcfEH7v0J1Ub9rZRX47sRo5+35iXuGBWKO04PJphWBB8DklBJRsn
         ANZGQ6T0bvYM3j4CEHcgRGVH818lJKHZvNKOnB5RFgR9mhjoOWPNoRmPW4LJVNObVmoc
         /ZRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787248061; x=1787852861;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nhC4gcMj6qZbqU/PjOfQzYKyx+7NDJFZ4HXjtdF8h8k=;
        b=e6mHfVP6MeihsfmDNvR9TQwoWoqhgx1Gh0rA7YMp8+dT4IyHNrZzqV5Y+Ec5UcnSD3
         FQ0CJetjlG46aVgjBxH++ZknkOddDw34mg2K9Wq6Q5kFqpwCNagMdlMm+jX6pHhUN8Xu
         7hVc29FR3MQFoZK1dX0wafd8uWA7rCyGMTAxeFaIDkU/vCUVEriC4Olj3JWKUqVsMF+U
         4zIPeKodncZsAFqNj3eO7Z2j19j4icud3Z2m9rlptXHGxqodbAD+czYnAGG/TZ8lO4xP
         4xg9C/26NA7VTGTUR4MrVDYw0MFgd1ZuKNGmu1wc/LD4OF1+m8K1lQeOff02TFo8R4BJ
         PQYA==
X-Forwarded-Encrypted: i=1; AHgh+RqL7qS5z0lCZWetpuSWPaxczWi0SzG1uK60YY0MkUmQ1Fq1o+/oRBodhJJNJ6okTnNWKhi14CgPLpP8vQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyggiZxZGTy4SJY8DyT3gUb4hLC5UsP4tvQvjKSttsVnPxLgYgR
	G0angPFQi4/20yOGmzeA4ND32MK37DhSnGFUzi29cqWqZW86xGezIGvPDuq0b6utmEY=
X-Gm-Gg: AR+sD12mIXe8wxXe5MrFVJ0JHR9NNUA9GWSpIiGJkPvzSgjQARxOtAn+O8COWYXK6Nu
	ZB9FvlBi6WBlIJothce8NBKNFg4rZRGs7hrx0caMYeGW2841LvUp1SLGK2yvhBNYJtntmjdMDgv
	iQ3qbHKdMRMfX9nH0qt8dTkZ5DHwgpacIkjKm1JDeCurVrsbeTpUSZM8k5OpIWYXMObmYhWbKAP
	gX1zZA3hKX7AM94rUWYIIRF6JBC44ilvogz+SjqqIgajuMlTgFA2D12mlB5keYzFX+TTFtVjUmJ
	tHNbOOTksXmUqlUiP5QUYS9qC9l+fH54G+ewyCiIGmOAnTkc0h7E1V6t9mG372slUSMpOMtbSHQ
	G2v/8oK475Oeh4HSmzm+/1T9Hm137mzGy3aQXVyUStSy9OZSyivqZCkkYWs5ier2TezfA0NVD0h
	HGzMmDLaZlXUWMSCcXDIccahIjMTaqKS55pHIn77ux2U0Eb5zKb5PvUvDiCVBf8Q20AfT9Z+/+S
	qqAFBHL+4+hDUO65l5FY4U8l062cnpcM53nOPbtWbJ+hA==
X-Received: by 2002:a05:620a:3712:b0:936:9f47:e908 with SMTP id af79cd13be357-9371e259c99mr1294064585a.19.1787248060787;
        Thu, 20 Aug 2026 10:47:40 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93720493f40sm418053785a.1.2026.08.20.10.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 10:47:40 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wx6rb-00000004ADY-1Cil;
	Thu, 20 Aug 2026 14:47:39 -0300
Date: Thu, 20 Aug 2026 14:47:39 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Steven Price <steven.price@arm.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
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
Subject: Re: [PATCH v2 1/4] irqchip/gic-v3-its: Zero shared pages after
 conversion
Message-ID: <20260820174739.GA981928@ziepe.ca>
References: <20260820150034.88729-1-steven.price@arm.com>
 <20260820150034.88729-2-steven.price@arm.com>
 <aoc9CyxGPHPKFH1N@arm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aoc9CyxGPHPKFH1N@arm.com>

On Thu, Aug 20, 2026 at 06:44:43PM +0100, Catalin Marinas wrote:
> On Thu, Aug 20, 2026 at 04:00:30PM +0100, Steven Price wrote:
> > diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
> > index 6f5811aae59c..a055837832bc 100644
> > --- a/drivers/irqchip/irq-gic-v3-its.c
> > +++ b/drivers/irqchip/irq-gic-v3-its.c
> > @@ -213,16 +213,18 @@ static gfp_t gfp_flags_quirk;
> >  static struct page *its_alloc_pages_node(int node, gfp_t gfp,
> >  					 unsigned int order)
> >  {
> > +	bool want_zero = gfp & __GFP_ZERO;
> >  	struct page *page;
> >  	int ret = 0;
> >  
> > -	page = alloc_pages_node(node, gfp | gfp_flags_quirk, order);
> > +	page = alloc_pages_node(node, (gfp & ~__GFP_ZERO) | gfp_flags_quirk,
> > +				order);
> 
> I don't think pKVM does any scrubbing on set_memory_decrypted(), so it
> potentially exposes confidential guest data before it reaches
> clear_pages() below.

IMHO that has got to be handled in the arch code implementing set
memory decrypted.

Further pointing that maybe we should have an alloc decrypted so we
can at least try to minimize the number of times we write to this
memory. :(

Jason
