Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794553383;
	b=MY5JQ5sZ3yqRDNOvI+RzblpQDooUSgP+QH3H3grv6tOc3GjVnG2rYuqYuIHlf/v3Hq9p
	 GfFDyTt1I4Xz8oX5MV9U3ksuq10Kh5/2gbII+kLODUzcl2JDzlShvqcENiopGEEV6eMC9
	 xMPl4brXxP1HdMdpzZxP8pcCGvYpeModB89QsCefJZNaYatu9w92k+RFqFgHYyjhYkgau
	 NFiOZ4TBaBofH7///qjq/Ojam6HJCdM6CGRfSb0z/DFLieMh03wfNq9WSC7UjnLd3wh4v
	 5YxxCQyaN6dqoeeud+Mkml3GRm8zHhqD7HvTh/NFT0Go2B1SHeLZzsIMoCocJ0M4NJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794553383;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=8lKZhgPqGIDS3tA84DXa+DV9jh51BEaNRmgTxoQ2hEE=;
	b=BCayytpXqkqdROrYI/ffBCNVb8AubfXipKGflAxtJdVUo6scM+SDvrSs2ptwraLPqaJx
	 1jnd8a+heWeD2vV0DIpTZszI6B6ESBEYjjUtr1iWTrLkAFvaO7RaEGyAZ37b+FVyu3tzA
	 JnFWsQRH/lg3CKpw4ymQnifU1d4viw/DHeJgYNkYEJG8ltwAFpkEbtjcQUDAXeVOpqexO
	 r6qUKo8J1x/SUCuvyzM7bosCA5te0bl4cmMhpdrhsuW8bgZrUbHPyYgKS8iwDEZfhSUiY
	 ys4bPgkgiFqbsgRVg9YTOcO4C+NtlG08vFEsfiJzYhsADcbsXoi9vCDLoE7eYaxj8Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=AnUG9xVT;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E029606A31C
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 07:03:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E029606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=AnUG9xVT
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49d05d51553so2514575e9.2
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 23:03:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794553381; x=1795158181; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8lKZhgPqGIDS3tA84DXa+DV9jh51BEaNRmgTxoQ2hEE=;
        b=AnUG9xVTLdG2KCI3LTlfqZ+EW0SHNF99nSSjPoEu/sbiQEVi8DDr8uDF6zuVL8LKEA
         a1DRif7EJExOV0daUciEEPgknP12dTcHPBYHwatKcOjUIm0BjagdkdO9hGkhK/7kDWRk
         /dA3EzD2qs78u5QpShlHqnHCCNIck+YhC+Z80=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794553381; x=1795158181;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8lKZhgPqGIDS3tA84DXa+DV9jh51BEaNRmgTxoQ2hEE=;
        b=V/dyAaxRILRToCRRIE/jpOCubGYGSovy5A3RdKHkIRI61YDu8roARGDrMwJF50D48V
         UxQ1VKh3HEHa6NjJ7EWXGGzzwSARRBNgjO2ntUpFw0bf/6UbxHRAvZdvNq+3je2VsI+O
         sVYJaJJSGmpP4lCyGn102SiCNXfwHyJa9N2ktWM3Srg39+PccKkVKAOxcjEIW9IlN7Za
         jWXK40OwnRMHhkRHMNIs9qnwaoZCz54O9nRMi0UaDbQWG6nsdR1F1ez4/TBiBt19AdNV
         gQbIx+ApG4tWA9xJGtMxF3lQBY5XKnWzVOcXjEgvNVtKLSrfvbmwzfHBxrRM/JZVLu2z
         cDNw==
X-Gm-Message-State: APuU4Z+DGYXPl6SlfE+eOJx8TzmoIJlm7PqTWEv8BQ6O8BqOBPTpBY1B
	zrom1/k2jjQe/43BtQGWvHDP4KaJpYQTSEE1U5e/5dkyvENX+TqzLxx3I4nNCnw+xo2HsAEiVV7
	CTTkwBg==
X-Gm-Gg: AYBFou14f1tJv4zyzpYar/kpefwu4ol7j5Vvnoz1x1YATJlySF4kaQDwNFcJHBguYDd
	02ugNyMzgxcVBfXhHMKvce8GNsCFSAAW993kATWm4G//hfw2Y4hISRqsrk+cFnce346VqezFq0C
	WkJM4NQZJGbWv+uSvJ8sYMCyKopMmLmwJNkOUaas4uL2c/PJ02vyrsoXrhuqoSbeKEwpl3dsiMU
	hXIo4yy1yUIWbWT1HhAIsalcYa3xiArvXWqJxMrtj8wo5CiB4tttJOVy7PUZebMBbDmnK+e1cyX
	ZeU60bRX0MP0W5q2nBdad1aDZ/3NeousZoYl8mnN9ap1cp/NFB2cnGuuhDurEw2DVYlY7uZQjwS
	2yRYMxGBu+QM4BwGcr83aZCGxGU/CEFDGThWNME8bZD7AJgygpjoaiEIcJ/ZAHzWlF/ml142U65
	zF1NzExoIZGwVp+JCFhRNN+V6HQ3zEIk6rWc9NzhOxv4XBSZ2JZ4hf4xsFSejRSYCbgaTSgw0GB
	0ASO3mGr4imnlY/FM4rh3K55ldlO+/PwW5uMixJm0IhIPPQsnoYluctzS9Sz0sYddZCegbxFh7N
	RTQ09iq+5MXXy8v2fXM+oJJF+4TdYqbuS7UPnGdvpw+5krvqd00X2ZLZURVOSh9N
X-Received: by 2002:a05:600c:840e:b0:4a5:a5ca:de1d with SMTP id 5b1f17b1804b1-4bb55a92bd1mr35063555e9.30.1794553380852;
        Thu, 12 Nov 2026 23:03:00 -0800 (PST)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55af2a9bsm41027315e9.14.2026.11.12.23.02.59
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 23:03:00 -0800 (PST)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b71ee00f0dso5635a12.1
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 23:02:59 -0800 (PST)
X-Received: by 2002:aa7:c704:0:b0:6b3:f12d:7405 with SMTP id
 4fb4d7f45d1cf-6b7c82e1e32mr41179a12.14.1794553379045; Thu, 12 Nov 2026
 23:02:59 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105070828.1992653-1-tfiga@chromium.org> <028d9a3b-8de0-4a98-b3d1-07d83143361a@kernel.org>
In-Reply-To: <028d9a3b-8de0-4a98-b3d1-07d83143361a@kernel.org>
From: Tomasz Figa <tfiga@chromium.org>
Date: Fri, 13 Nov 2026 16:02:41 +0900
X-Gmail-Original-Message-ID: <CAAFQd5D4c0aBrubQFdL0Q_WsY0rnK-5kGSngQRNwh5QTEwnT_Q@mail.gmail.com>
X-Gm-Features: AclHuK_f2bS4LODsYEBXcxmWe1_Ak54T63B6HHOldzdYHUE2j129hx3qcA3QKcA
Message-ID: <CAAFQd5D4c0aBrubQFdL0Q_WsY0rnK-5kGSngQRNwh5QTEwnT_Q@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Remove Tomasz from VIDEOBUF-2
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 9:21=E2=80=AFPM Hans Verkuil <hverkuil+cisco@kernel=
.org> wrote:
>
> Hi Tomasz,
>
> On 05/11/2026 08:08, Tomasz Figa wrote:
> > I've been working on other parts of the kernel for quite some time and
> > haven't had enough time to follow the development of the Media
> > Subsystem, including the videobuf2 framework.
> >
> > Please accept my apologies and let me step away from the maintainer
> > role, so that someone with more time available for it can take care.
>
> Thank you so much for all your efforts w.r.t. the vb2 framework. You made
> major contributions to it, and you'll be missed.

Thank you and everyone in the Media community as well. Hope I'll be
back some day. :)

Best,
Tomasz

>
> Best regards,
>
>         Hans
>
> >
> > Signed-off-by: Tomasz Figa <tfiga@chromium.org>
> > ---
> >  MAINTAINERS | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 93abbb315065..af302622c849 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -29512,7 +29512,6 @@ S:    Maintained
> >  F:   drivers/media/platform/video-mux.c
> >
> >  VIDEOBUF2 FRAMEWORK
> > -M:   Tomasz Figa <tfiga@chromium.org>
> >  M:   Marek Szyprowski <m.szyprowski@samsung.com>
> >  L:   linux-media@vger.kernel.org
> >  S:   Maintained
>
