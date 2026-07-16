Received: from mail-wm2-f10.google.com (mail-wm2-f10.google.com [74.125.225.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45963D9542
	for <linux-media@vger.kernel.org>; Thu, 16 Jul 2026 15:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784214617; cv=none; b=HEhRWJO4Qlwc0AX9VaQi9tMZASDRo5r4PihtyEUMv4ZTJ7qcCEQuWBpTD75IUScj11gDO6EZ5vTVH7fCanUBeGJz8EkOhl0mEwxAk+f0O5hYEUy/SMdGJftaseOqxFK6E3nRdpop5hrM/xWOm43AvdNe5LbBq1cYeFFn9kDzX1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784214617; c=relaxed/simple;
	bh=cx28Ylx6Y46tf1Vv+y87AWDpybZbGIVNAky2AdLm1Uw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NGE9w2PZPlgOWvL/x5Fqf1L6G/6sGMCaT8TF06zvAiglvKc7GAsxkfVPbWQrAH2toqHCA3bk8tmmIJer+BV76r/g1Mup/ETrjCDNM7yjxVIBRyv+AGxU/dnkaOnKGZ8gboyBaCHEB7gy0m5vBKntZq+DVh1gxrtZCKEUH+/TlgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BXf0AiXC; arc=none smtp.client-ip=74.125.225.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BXf0AiXC"
Received: by mail-wm2-f10.google.com with SMTP id 5b1f17b1804b1-495459712d2so952395e9.1
        for <linux-media@vger.kernel.org>; Thu, 16 Jul 2026 08:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784214614; x=1784819414; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=cx28Ylx6Y46tf1Vv+y87AWDpybZbGIVNAky2AdLm1Uw=;
        b=BXf0AiXCeAyBoesKtSDbSbowR8kTp2FfxDNDXSX21sO0acZ1+WVB1Oi7+c/nK+u3R+
         ef8jDRzCgodru9Fj3UoftDlAHaBEYDJklanMhE88reKvXzCTFGOyIGwB8bjpzyeRMKXj
         mvHzcV6wjJv2mBAwTTwiQ727JHvsjpndLsHsrU8N1K32l9A0NqyLxxYPxNmLIdmJCf2h
         zwPztqO93NbFnnSu7mzHVvGymm6hforMSmHGBVrrK934usAe8Ehwc9+r/lvPnpRObUpa
         Xr4Rdvs5FLjj/AlK704ioF+o0VdEJhC8lUr6oGdtNci/c3+gRrs3OafGR+Dr49T4q4eA
         KeOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784214614; x=1784819414;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cx28Ylx6Y46tf1Vv+y87AWDpybZbGIVNAky2AdLm1Uw=;
        b=rzYoMNcJ+Gw3o9TaImVJnnqrCy5Bd84O3eidE6M3EekxOOkz0DDoP7D4Nd7nN8KSmX
         gf0G6xLuVipSikxcFawp/okeAcHjSSj9sV/663klfiSY1RPMLWKEcEbBUBgl9Qgv+tmM
         cRfn047OqSRcYWALVF1Rdle0cFnwYZ03ltGALBCMUO1rzPq1wxSfhyh/T1C+7KivKxDV
         2OFwbQDdDtoZHKie39pulLa3JRKF+QWm4d5JFnt75q+ZWovvJ2fvUm0PtzBbST6cnnTC
         Ap0zUrCLaNVrNnPtcdAR8/8zLzJ6OYdoJWHzjI40K5Msoo7pwgQbvHMGAcRfjtYt7eKW
         4BtA==
X-Forwarded-Encrypted: i=1; AHgh+Rr/rveAD1IPE5ijbZ4zzMzhHZprZdd5wLixw4vr67drxPLS0pq2iRV6ONDj75XAV/oZhHvnbMkbtVPDow==@vger.kernel.org
X-Gm-Message-State: AOJu0YyL+Glxzc8Oa2gwSVcN+vYvk7R+Sdd2sw0FIopSTA2DFaGEOWfv
	xbhSRLVg+mkE11710aYteJq9Bm6AcslZQSrCFgXdDvtQMBDMKTfVftV6
X-Gm-Gg: AfdE7ckBDjQSTMBsv/+Y4YtOXESKEKPrn7mWIkKzOMhN3wFyQsy15MsJXTkPYuXmVaF
	FbMjFy7hGC9qCwcg9UYHFW3en1be/Ov5lObBZgVUfNAfEr+oJdCYd17z3aq9jSwK4AgMng0v6k7
	fhe4b2yEj8y+rCsXeilvdLNv2AtMK7zPxdNVMxU/CblS5RMWgZ6jCUD0SwbQHNgKGtTUCnF6FDn
	7EUa2JBFPEHh9pZwfelNr/Q0/wYPAhf1MZ+QEsMOjY0cMWc15E8n5qbZTml8szukvwYjQVQZRyG
	FkACR7FN3ms86uczbqQ1fayKRIhS6x9oXCRam8AfQGOqOxn0JcUPh8F+o8k+l86m0MVXwGF93Hp
	i4OZx3X/DW/GRSERZJKmzplyd3Ep3Go/Pv9ulCU51kYPyg3kA1ViXaEfCWuNVdE8VT7bJmJ4xwd
	JusNtxNt47YMHhPq8ReGXGm8sXWiTU
X-Received: by 2002:a05:600c:1382:b0:495:3de8:33a6 with SMTP id 5b1f17b1804b1-4953de834e4mr78060125e9.16.1784214613685;
        Thu, 16 Jul 2026 08:10:13 -0700 (PDT)
Received: from [10.1.0.100] (62-178-209-45.cable.dynamic.surfer.at. [62.178.209.45])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4953c6fe0c6sm118119835e9.1.2026.07.16.08.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 08:10:12 -0700 (PDT)
Message-ID: <eab30fce0d18137800ce7a77ee1083f11aa1a770.camel@gmail.com>
Subject: Re: Linking Patchwork with Sashiko?
From: August Zeller <augzeller@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: users@kernel.org, Linux Media Mailing List <linux-media@vger.kernel.org>
Date: Thu, 16 Jul 2026 17:10:11 +0200
In-Reply-To: <20260715201301.GB1824265@killaraus.ideasonboard.com>
References: <20260713220427.582b28bf@foz.lan>
	 <7ia4mrvtrxjl.fsf@castle.c.googlers.com>
	 <20260715005909.GF1656185@killaraus.ideasonboard.com>
	 <alcBvuIMEGSjAD1R@mit.edu>
	 <20260715161111.GC1778116@killaraus.ideasonboard.com>
	 <ale45QPntcwA-aLB@mit.edu>
	 <20260715174138.GI1778116@killaraus.ideasonboard.com>
	 <CAHk-=wiL7kFVWNtvE5S9A4iqXYat66NaUqX1+gZT0QCndi4eQw@mail.gmail.com>
	 <20260715185141.GJ1778116@killaraus.ideasonboard.com>
	 <CAHk-=wi7KN9_DYdmaE2chC92EhTrO=Wtx1bPBER-EQfAZ8FREg@mail.gmail.com>
	 <20260715201301.GB1824265@killaraus.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

The frustrating part of this situation is how everyone arguing on both
sides is right in some way.

1. The tools work, yes. This used to be up for debate until recently,
but now it's clear that AI can enhance contributor *and* maintainer
productivity in the kernel if used correctly.

2. On the other hand, it is also true that LLMs and derived tools are a
comprehensive manifestation of the problems of the industry and there
are valid ethical concerns regarding access discrimination, copyright,
workload externalization, job loss, etc.

3. However, a "no AI used" policy is unenforcible. Many people would
use these tools regardless without announcing it, which is the worse
outcome. If we're transparent about our AI usage, then at least
everyone is aware and can treat the affected code with the right level
of scrutiny.

4. Moreover, a "no AI used" policy isn't the best thing to do
technically, as AI has proven to be very useful to catch bugs, review
code, and even write some new code. Some critical bugs that we could've
caught with AI *will* slip under the radar if we refuse to use those
tools, while bad actors will gladly use the newest models to find
exploits.

Overall, even though I've been known as a great AI skeptic in the past,
I'm with Linus on this issue. *Accepting and embracing AI may not be a
desirable thing to do, but the alternative is even worse.*

- August

