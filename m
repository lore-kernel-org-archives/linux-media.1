Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25043B3C0D
	for <linux-media@vger.kernel.org>; Wed,  1 Jul 2026 10:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782903579; cv=none; b=HUBZxg4bleJXV4pIleJqCMaQRtncfmp1uux2YEZxrlLtLDRfX+mxMLpNb1OFuSvx8qZtmgW//E9SepFhWQ5O/d3YxqCOKYJ5WboOBvdKUEGz9Zw5bJltU8tD8L+0mdw6VuKUFG0UNfz9J7yc7vpISewIkpGw2eW8OJshihbtCpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782903579; c=relaxed/simple;
	bh=wUWsyZ6Rlg/4W/TRYf2gTQgIn7mNgEaty1XPSL+sD5g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EWMkUYNgNyYTp/98AYzH9e0QrhdAVpXIx/CD0MODlkMTB8w6BLsPS/pYfTHYv/hxRBm0TWnO1A5sbgInehE/B/p78Y1Y/Dcim42+OcI3uBMDwGcsvPRcNIVa2/Agjv//W6BgXNIHzXHNa8q+ggod1x16sFkTc0PQpyjCmRrpRDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JunAZSUT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JunAZSUT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5890A1F000E9
	for <linux-media@vger.kernel.org>; Wed,  1 Jul 2026 10:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782903578;
	bh=wUWsyZ6Rlg/4W/TRYf2gTQgIn7mNgEaty1XPSL+sD5g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=JunAZSUTPhUTBiTAC55+YbXJX+NSJtOY/zF+fQCkIX5qR+/QVxslB0bHfnm6MsxhT
	 i9D9LGoxAXUBNoRxO8h7IZcSdDDBZWqhA7DG5MZdeWyU/RP0wvjUFQvj0s3du7tVFg
	 KtWffWthqOiITB8zd1cT/vqgo01w5UTPOjIGI847OuJHcVGkSg5yFTsGxUDYg8Dp7q
	 /aVVgjSf0qsprmVtF4CPne1Ko2vmFSmeOjmeK32F2IFKVnw/xjtOc1TJGnbFauf552
	 Q4isZkgWVbM/GQOUymDJpob1k8Y84BkujZ3W5j5twVzmOm/Z5OsD808g3ahzJs9Ud9
	 2djNm0Mb1hliw==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5aebd77cbb4so359445e87.2
        for <linux-media@vger.kernel.org>; Wed, 01 Jul 2026 03:59:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Roonou4iYbe4AG47g2EHB4pDHzymqBXxBrLWNO9y6Zv8cwRy4lOXT8KcQUaykny8bRMAlvIUu52QRLOLA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkjvOHvW/7bLUS5UINvNistUyxZ294mPdTDSBZHwIj3S5I86G6
	r3+NmBG9fYxjucb6Duy65f/cY5Rn3skBwJ+VGsan6gMw9ai6jmG0UwL26qCsca/OfJslWALqvlS
	ucbZ9nMtwKFdjg1VFWAf+fc8MyapkQs8=
X-Received: by 2002:a05:6512:838b:b0:5ae:b2d9:ffd4 with SMTP id
 2adb3069b0e04-5aec6797904mr208920e87.11.1782903577193; Wed, 01 Jul 2026
 03:59:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260701-v4l2-doc-v1-1-9cce64b7a1c2@kernel.org> <440e969e-425a-4ed1-9aaa-85addb332278@kernel.org>
In-Reply-To: <440e969e-425a-4ed1-9aaa-85addb332278@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 1 Jul 2026 12:59:24 +0200
X-Gmail-Original-Message-ID: <CAD++jLmzWMWjV4-MThJe+30TqF0f=EmdMka=8eTPOagHWAsXUA@mail.gmail.com>
X-Gm-Features: AVVi8CclEPs7CF1IHZmdcUIniBkpisxQYpJaJlG3j_c5A_hqRow-roEIan702zI
Message-ID: <CAD++jLmzWMWjV4-MThJe+30TqF0f=EmdMka=8eTPOagHWAsXUA@mail.gmail.com>
Subject: Re: [PATCH] media: v4l2-ctrls: document expected validation scope
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Nayden Kanchev <nayden.kanchev@arm.com>, Konstantin Babin <Konstantin.Babin@arm.com>, 
	Daniel Scally <dan.scally@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hans,

thanks for clarifying!

On Wed, Jul 1, 2026 at 11:03=E2=80=AFAM Hans Verkuil <hverkuil+cisco@kernel=
.org> wrote:

> The main change here is that it explicitly states that S_EXT_CTRLS implie=
s
> a call to TRY_EXT_CTRLS is called. Something that was never clearly state=
d
> before, but it's important to know this. Because of this change the TRY_E=
XT_CTRLS
> and S_EXT_CTRLS paragraphs are swapped since S_EXT_CTRLS now refers to
> TRY_EXT_CTRLS.
>
> And the TRY_EXT_CTRLS documentation already says that: "It is up to the d=
river
> whether wrong values are automatically adjusted to a valid value or if an=
 error is
> returned."

This works for me, I missed that because I'm a rookie at this.

For the above diff (I guess you want to send the patch? Else
I can make it):
Acked-by: Linus Walleij <linusw@kernel.org>

> I just saw Jacopo's reply that the discussion was for parameter buffers, =
not
> for extended controls, but the reasoning is the same: the driver must val=
idate
> at some point (ideally when the buffer is queued up so userspace gets the=
 error
> immediately), and ensure there are no security or stability issues. But i=
f there
> are, then that's just a driver bug.

I get it, thanks!

Yours,
Linus Walleij
