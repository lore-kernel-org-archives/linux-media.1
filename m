Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DF4446C00
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 19:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784142914; cv=none; b=oBjmYN8vrz51GqobRTtYg66uvmYgmBX7oT+qsdNzi13a3HnCLl9Yxk9oOlSfk30P4JX7gkVhdggXwIlnjUyRHilQOlYK1i7+VxKYnNdPzIrX06/c7fYkky1Q3iKJp0H7vKx6K4+by+EhVE2OTZP9QnSKkcab/wOGBkCMA7eihtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784142914; c=relaxed/simple;
	bh=XQWidDhwOatIOdg4naY+mdRJJIUMa32iaO6TQENvg5M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z201EQoAtWuFq7H3NWoOMCiD6z6SWwlO3UCRzaFbrwzKgXhJSguR8oCcO1Bq5bljEKLbv/AdojHInUMYuFZNMHXhjAc+as87NnQFyOwYb5fkLmZszPu7OUTNjQs6saloQBgn4IsekcmwgFdS8HO+5wNQuxIlGvfEw+6uI3CrigM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DHme7ppV; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DHme7ppV"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-69a5ecbbfb2so4137063a12.2
        for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 12:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1784142905; x=1784747705; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5c+HPc/WiiFRZlK3DtEGHqnt1AShEszgTa4sld+nLck=;
        b=DHme7ppVLR1iOyYRmN52uSNlbH857vLjcsgGNVL6yPue1UVjwGVguKyY7Ym59KaIll
         RyF7VE5mpzjjujN3O5xIzM3R8Sr8TvxM5AcW8OOgzfrB2tGPuv3HDc9rzOcQlS5nKi2p
         KoYU2IxsNvn//bamHbwhRp8Fq1DcH3bci4YCU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784142905; x=1784747705;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5c+HPc/WiiFRZlK3DtEGHqnt1AShEszgTa4sld+nLck=;
        b=RCGU7aCMDvtNDDnR2hBHiwr9cyL5t/mOAVOIHqziNO6tkPy6ULSdlgmFmxsMmk5SzQ
         sPQjJr482DHQJHIPKDtVgovU47HyJjpTC1hLMuZEOoBbrJRxLJFiQ5A5gIE63uHv6OuZ
         hfX5REV3ptbQaq5e+/pRNmkNFwkOwACIhWPb7/s6uAHP1nx2Krbeyb0Y1YvUZycpqK/f
         FHb4VbE0kfUZ/mavWtyZtROdzZwjG1vSBntExYFHaD5Hry2YnECmSf8xHraiYULd/5xj
         uam5HZGl53rBBfiMwSFJMGYYo0qmMd6gt2p7Z3RY0uQOj7CoFY2rP3wILfAFbvEPnSwa
         tHYA==
X-Forwarded-Encrypted: i=1; AHgh+RriNdBOhR75ozwRm/VskIUJAd5KV/hxFGafiAWuFJUYPeWEW8cSmP1fhEuG3CD5YKJh1tgwGvYKPjQ1Kg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz2dg8vi3VPI/FQVty8dVOes0ySIysOV+u8FNUb5pZfAJJI+wP
	8ppNA1ag7hdztmaVmlFXy+p+XK6FIZT4VVKzweUD3WnBlsq6mH+DSdEUdbyHNzkTjWEDtnkYJff
	vXQRPp5w=
X-Gm-Gg: AfdE7ckYCEXKToW78+8htd11bTSbeP5wQldogiEfCSHPgB+M3fXsKq/2ONq/zzg93fB
	tWxLB3ojfm5MjfpjmeIbERlQkOxLTB90eeToD97wCvgtwnTy/Hs+8XLZi8togX5xcFTV15LdJtV
	MQc4177unIHa/oCNe+FSoitiYjyrZc/0Fnnyx5EF+Gcjpj1Qs8ziS/jyg0cGFl2SIm/d6SpAb7z
	YWLpQhSzgiL7iEHdZdt07dZJFadCMmEDsWhuIWXRfhJkbWHQso5MFPodKVAG2RAAuXVtWXEFHDz
	ND/PDwe/JgtqpQwjUm8n923H+xM2TQiya/yW0N7d8H5m7+JMHmQXq9PtxLvKIBkrYd7NJVpBVHl
	YV0eATmeaNYPVYowszr2KUQvoXhml0WJAhYNbUD5bmGhkCX0gtwTOe2kI4F2CJBUaUG2ksvigZg
	XcKvBRWkJ6be6IBF9oip1AQYQTh5FEg3Tc6RZyurVtmoBjMkJba/G/EpHM5ynw
X-Received: by 2002:a17:907:1b1d:b0:c12:6ad6:6398 with SMTP id a640c23a62f3a-c161e9908bamr930698466b.34.1784142905538;
        Wed, 15 Jul 2026 12:15:05 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1687166b94sm78291266b.17.2026.07.15.12.15.03
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 12:15:04 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-697cee2eb6dso2783947a12.0
        for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 12:15:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rot4wguFsskMteTfG9QWscWfBzG0a1y76mhk7hzmcPImjDyk/iAwnSlKnUPy3WabgEGxeLJs5iJPxn+zg==@vger.kernel.org
X-Received: by 2002:a17:907:948e:b0:c16:6429:a689 with SMTP id
 a640c23a62f3a-c166429cc7amr516277566b.29.1784142903559; Wed, 15 Jul 2026
 12:15:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260713095538.3d5e86f1@foz.lan> <20260713094120.GD1127719@killaraus.ideasonboard.com>
 <20260713220427.582b28bf@foz.lan> <7ia4mrvtrxjl.fsf@castle.c.googlers.com>
 <20260715005909.GF1656185@killaraus.ideasonboard.com> <alcBvuIMEGSjAD1R@mit.edu>
 <20260715161111.GC1778116@killaraus.ideasonboard.com> <ale45QPntcwA-aLB@mit.edu>
 <20260715174138.GI1778116@killaraus.ideasonboard.com> <CAHk-=wiL7kFVWNtvE5S9A4iqXYat66NaUqX1+gZT0QCndi4eQw@mail.gmail.com>
 <20260715185141.GJ1778116@killaraus.ideasonboard.com>
In-Reply-To: <20260715185141.GJ1778116@killaraus.ideasonboard.com>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Wed, 15 Jul 2026 12:14:47 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi7KN9_DYdmaE2chC92EhTrO=Wtx1bPBER-EQfAZ8FREg@mail.gmail.com>
X-Gm-Features: AUfX_myqDD_feRUeS7Ku0H_AjydQX8yFNswyzPS-AXjb3NscZkOsvEfwEseosl8
Message-ID: <CAHk-=wi7KN9_DYdmaE2chC92EhTrO=Wtx1bPBER-EQfAZ8FREg@mail.gmail.com>
Subject: Re: Linking Patchwork with Sashiko?
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Theodore Tso <tytso@mit.edu>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Derek Barbosa <debarbos@redhat.com>, 
	Matthieu Baerts <matttbe@kernel.org>, Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Steven Rostedt <rostedt@goodmis.org>, users@kernel.org, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, Stephen Finucane <stephenfin@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Jul 2026 at 11:51, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> I consider that, today, there's no ethical justification for the use of
> generative AI in FOSS development.

So this is where the discussion ends.

As I mentioned, Linux has never been a social warrior project.

If you don't have technical reasons, you don't have reasons.

You can choose not to use AI, but that's your PERSONAL choice.

It has absolutely no impact on anybody else, and you should not expect
it to have any.

Put another way: if you are vegetarian because you think meat is
murder, that's perfectly fine. I know for a fact we have several vegan
kernel developers, and I'm sure they have varied reasons for it. Maybe
they just don't like the taste, maybe they have social or religious
reasons for it. Lots of perfectly valid reasons, possibly driven by
ethics.

But they don't expect the rest of the kernel community to become
vegetarian because of their personal ethical standpoint, do they?

This is absolutely no different.

And yes, I feel very strongly about this, not because I feel strongly
about AI per se, but because we have a long history interacting with
the FSF.

They have their "ethical" reasons too, and use them as a weapon, and
as a way to drive away sane people.

It's why Linux is *not* GNU/Linux, and why we call things "open
source" instead of "Free Software".

So keep your ethics where they belong - in your personal life. Don't
try to enforce your ethics on others.

                Linus
