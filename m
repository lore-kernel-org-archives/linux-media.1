Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5F717993
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 00:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785457083; cv=none; b=puo0XgatJEy+h9z9wHgY3ctbWKztxzd5R3o2jtq+7aHL5HyWgWNe6rWcAv0Xsn62gwn5sDlLqESXalF4J9Ux9Q0md5iCj/vj6c/pGzKnUTMED4bPmnB4sl9/FvpKWw9lXjGecw0s2nSKYKcj1/P2aWH+c9GgJEV9Q3QT/7hEexA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785457083; c=relaxed/simple;
	bh=szGFnTCsakcmVQdQfLLQUpOJjjCAEkdLGZEZAc2bHME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vGnLZq5n1G2am26lFxXwKZMj/hrvaeG30zhLLiKXqhg7wSHUOC0PieR1Qd5WJcotZUIyhY7F5UvqIeplQW+9lMM2KSUCR4HmmcajH9KmdjOHYTM/F99c1jhw/OASoqWhwz0DGtJ+qLB7C2TAiOGaJj8IMTSI/icXD4GjrKJdYPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wv6zoMeH; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wv6zoMeH"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ce87c7e3bbso3555475ad.1
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 17:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785457079; x=1786061879; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LBitaL1RUUQqXSfqSECtyVEDWdgVsoCHsw/mJvM7Qu8=;
        b=Wv6zoMeHF+IhWXRw8nHC9HMzFWrtIHGy/ISdE7yIGDPSRfEUQrXXTmmb3b+n/Zr7RX
         IC56t6eFGPlBdh2maiUx1VESxsvy0a9EFzzgvfBnRwfz3OgaUVVwU4SE63RTD1KtSjnx
         8J9Dnip4cmvzMDTVa0dbrmPFzcaoy+HB8btQdyic0uTGjcLcOd6cf/8HyeQtyJBWZ9Em
         x/Lxzx4pq3BvBqignqnUbo25NKyDMi8o2Xu1SVAzFgDtkYb1KW9enJFh+h9hEwsjIjy5
         IrzKoO/ETSWai9oCAwVv9fgZWIFfQCaFqmMcvk2OhSo/SFLYTZRroLHiEUga86Rot5Na
         VfIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785457079; x=1786061879;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LBitaL1RUUQqXSfqSECtyVEDWdgVsoCHsw/mJvM7Qu8=;
        b=I/SOryPw7145NFWnktMga5beZKDTbjRUiF3pH7h0CwpA1c8iV4e+vxw70Q6AW1G8pQ
         akn0C65EQVhnCkEAmKgmDGvvCC7/5R06wSl3WhbjPDPC1FSJp1cEp/kwgMyp8l6uricg
         KpLmhIa69fRZBAdQADtf3M2UAPcEE+RduLzDSG02wqHkDXCJY8s7jYYrbf3RQq3TBY7B
         8sCtcHwMmYUYSPJXH85JCU77Bc2jFw8LXJxm8zWCk/x+LtVwutqAh4huOL8sM87P0h4Q
         3A7mYBkT194NDr4qvrR2RhfUHJBIAtqEC/hgQ4yrmelSmmBBP3WnljgCVVdMcLWSAfCk
         LxuA==
X-Forwarded-Encrypted: i=1; AHgh+RriKKGei+9eFN2Hw93TN3P01PkrEFAs3dfOMgNZGy/Qr46PqmF4GgUSJjAQ1BnOJ0ybmmW32FuVZnHcig==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1hDjLZnVKmQ9xhqr5QKvvk6B6/NyWbaMl6wXfQBtR0auNTFAO
	SKragDnLi5B8jZ4Yjz8uoSBhay2a2ooBVvqbCV7eG43vYFN2edAvlj4p
X-Gm-Gg: AR+sD11N+pFwq7rJeqS4MiQwG40/xbJ3EoHgf3618Q6dWxEvYA0TDu2tA//9lk867mD
	BrEEJsi58IhCTA9blaCFhs561m5gR9UAtN5GaycKv+YhwIpzCAVdv2lXvrpj6OOV+ajk4Ty9AUv
	12UWrwIhNdwqdIR3CefZzn3dNMh4A1i6gbfXpa+fx4K7MbchCOTh7UZgybmYLSMlwfFmJzXLi8R
	XDti01poF10+MORC+2Q2wY6muRGJOJtihCyZlUy6ILp/m/TPENFABXbAvXuiplvof+Pv+OSUkKB
	ztUTB7jq7slGgxGJ8ZrhFcoirEsNdPn5wMznoe2eYatWmPM4ShPhIqAn132cR+HAaneqdImpArz
	IVMih9WrOtAXnbDmU+EIcZ3TzXfwzAdMz61GzAv0n62SMMcL7ULQozK+hh0+poBNRuE/kTdZ0ax
	hctMoUKajzwhmEDbE2jqMtHetJ6f05HOyfYNSrVFQFmBLfuK84hA5FY+8lY3tptZ/PKHkmGtunH
	VuQs0ZoHtw=
X-Received: by 2002:a17:903:4585:b0:2cf:bfbb:61e2 with SMTP id d9443c01a7336-2d046eadd5emr478805ad.39.1785457079096;
        Thu, 30 Jul 2026 17:17:59 -0700 (PDT)
Received: from devvm29614.prn0.facebook.com ([2a03:2880:ff:70::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022c8b9aasm32885005ad.50.2026.07.30.17.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 17:17:57 -0700 (PDT)
Date: Thu, 30 Jul 2026 17:17:55 -0700
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Donald Hunter <donald.hunter@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
	linux-kselftest@vger.kernel.org, sdf@fomichev.me,
	razor@blackwall.org, daniel@iogearbox.net, almasrymina@google.com,
	matttbe@kernel.org, skhawaja@google.com, dw@davidwei.uk,
	Joe Damato <joe@dama.to>, Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next v6 3/3] selftests/net: devmem.py: add
 check_rx_large_niov
Message-ID: <amvps7AAHxjvxbhQ@devvm29614.prn0.facebook.com>
References: <20260724-tcpdm-large-niovs-v6-0-7975f62cdfbb@meta.com>
 <20260724-tcpdm-large-niovs-v6-3-7975f62cdfbb@meta.com>
 <20260729191649.55ab7942@kernel.org>
 <amvEJVio9XtCn+YT@devvm29614.prn0.facebook.com>
 <20260730151433.6f71258e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730151433.6f71258e@kernel.org>

On Thu, Jul 30, 2026 at 03:14:33PM -0700, Jakub Kicinski wrote:
> On Thu, 30 Jul 2026 14:39:37 -0700 Bobby Eshleman wrote:
> > Poking around, it looks like 231.1.167.0 and above should support
> > everything, so fw should be okay AFAICT.
> > 
> > Looks like the config is missing CONFIG_NET_DEVMEM and CONFIG_UDMABUF?
> 
> Ah, damn, you're right. I grepped for DEVMEM and didn't look closely on
> a hit. Turns out there's a non-NET DEVMEM, too.

Ha yeah, I kind of did the same at first too, had to grep for
CONFIG.*DEVMEM in net/ to convince myself.

> 
> Could you send a patch to add the missing config options to 
> tools/testing/selftests/drivers/net/hw/config ?
> 
> Can be separate or part of this series, doesn't matter.

SGTM.

> 
> > Sorry, took me a while... was certain it was a bug in my code.
> > 
> > Not the failure here, but wondering if this was on ARM led to seeing
> > that 16K hardcoded rx_page_size in run_rx_large_niov() may fail on ARM
> > with 64K pages because it will fail the IS_ALIGN(16K, 64K) check...
> 
> Ah, good thought. We've been meaning to get an ARM64 server for NIPA
> (our current server supplier is out). If it's not too hard could be nice
> to guard against that. But also not a huge deal for HW tests if they
> fail instead of skipping.

Sounds good, I'll throw in a skip into require_devmem() if rx_page_size
is passed in and doesn't pass the alignment check.

Best,
Bobby
