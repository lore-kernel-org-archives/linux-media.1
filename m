Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793818924;
	b=cuE2n9wbxoQz+GAszl3sCEIuRdbhPkWC/Qj1bPqod7jnJAl3y4SnFNTqErf5XG/iVXky
	 AW64OR0KmuYTDuSIDYEph6tHS36I73YP+5v/7Bh/xyIJ8vtIPaDpq4u6SzD/R4Ao+l+jN
	 JvnayfhW85ZPSV0rJDSk98nhOOLd9J2vl+1mNxBFDzCz5WmjV6ffZUs3PP6mZ7LaX/O6y
	 t1o/rOkspA2Jwz/eu++l/OigbUu7vWP6osa1d9fsDn9zmfCPmyLQfMooW4mTYQwxZFOQh
	 Bz2C4HYDoAj1p/B4sPpPC4fAiI4mkEgTyT7uS9wY61GmUNyanYRI+903nDh0f4UXn9w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818924;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=oafn2hCqm7HTSzGstliyGNOlBVNP4XwTG5bffvWvqGc=;
	b=i5KseJ+3I7ucnwsJsU/a/edPFtiw0In1CXFcpXdZxu1o4bWau5Qpb3dgLeAXgA4teeSR
	 5A8dChovHD/MtGyKSyz5YRo5c+K6BMLFni8ogC8rv+4rOESdlrIKmjrRT7hGtbtKiwhBY
	 mgoUiqAVyaB6xmIL8FVbXLG0jKwDV1c6iz4x212JljYaZLzY6aUACOyamp7R8P83em+PG
	 AQw3hRhm2d4MrmLY+a/u8iQ4OQ51YpWywtKBmLskMrKFPXz0ESqWPwbJ2fh++AxgHQHXF
	 UyNg9gev1pBBBONTbrbC86VbAYcJkpfhZIx5LeiYC3ypLkZepr00JzMyKCSnak61FMg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eqTCOfeH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83084606A32D
	for <linux-media@vger.kernel.org>; Wed,  4 Nov 2026 19:02:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83084606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eqTCOfeH
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a4dc547987so5880615e9.0
        for <linux-media@vger.kernel.org>; Wed, 04 Nov 2026 11:02:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793818923; cv=none;
        d=google.com; s=arc-20260327;
        b=RnegV+tCd9Dk6YgADekmTIrhr0SSkiEZm9blDx9Os1o932niFR6L6iqanPuRnsvhPA
         OhccsubPsmQqAON3uKiupcObUVqSd+lQ0Fk9SOLk5wlPqUQMh9cXs+wJSb8uorZNndfy
         zSSbr9ypCnt9F+sIjxH16LdRuu65eSHoKYsIFvbMkg+AAKBOwfWo8hIZ8wghdxQkahNq
         fbisLOXBmER70J72eWacYg0zHm1wrIxZrOI9qh6xAlicqRqOB0Vf1902pdsDin1TFuTs
         Nx79IogSbgIGRxPTuyLQoflj7wREKq4QGIfG0evttIJ9QxGPBpW6L5Kpqy4i0EAbVu94
         b6lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oafn2hCqm7HTSzGstliyGNOlBVNP4XwTG5bffvWvqGc=;
        fh=zbQxOyBTxcgIeUYNkUen7Lb65RFG0DWVoHgk5i0BDZY=;
        b=iwm/OBJbknpUj1qFhDkKoUX1dZQSdhupb01YWi2ssKpA4RnJ4CjBIJvHKMSTH3sz/X
         dcRjufB/qaRy4Z5ULN8TIKEpy8AKHtFmdYzurJX1odiHcG7Fx0MWh3VrGqxHiRJn7b+y
         +DwUZgMeTHKr68ZgqNAp3zb8teJhfCY7Zlsh1zE/j/jMg71TsNDbRGe2uCWMDxYaf2rA
         mJUraGge2jdh88AqitGk+THHmsnasraWpReMGeenjTi6qCUzWo6ENjc3I5CII+bWUi7c
         rP7ysOHYG5sYOL/7CU2TKyK1GKB04LNPDScYYaTuKNX9HP/EBeCQ66rLLNlkxuIVem7p
         DCFA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793818923; x=1794423723; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oafn2hCqm7HTSzGstliyGNOlBVNP4XwTG5bffvWvqGc=;
        b=eqTCOfeHKe3l/56+nB+NKmRz+SQ2Uh2SxG3yy5zShuOF7qJgXjlby62RNT2NdNWDKV
         xWYdzvYrJqktNSr+ev7IYg2iP7D2PKmWEkcFVmfqRlzEi4hP+Fm0ir1E+cu3t598FiRu
         kpVN4/6B/47P1p/emIG7ZsA1B3PFz7A9cEjQety4hgfAtIXj+1iyhkNIaZL9KZcyvEw7
         nOHJE0X2qtEmE1qIxarLgkTZemtv6NeHjn+TYM7V5FDx/3d0FerOS19sd1mSPQ2Kc1Ch
         g/MDLT+dveL7jWzB08rgYkXhPpSj5Z4pVxAVP6zybFOfOu9M5Rx6xBA/r6h2Ax6xNPpz
         FJIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793818923; x=1794423723;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oafn2hCqm7HTSzGstliyGNOlBVNP4XwTG5bffvWvqGc=;
        b=hm4KIsZmmiw1TCSGp1DOsQ8h49bst24jNPdvnzxiblK8VowMvB6MrBja1hQU+slkMR
         AMrSDXmJyPIG/7cc6K35eBXWlgi3CNKNZH0yqbY1PX1/XVcBCIa1NWzG9Jf3AvqrV/6s
         jap58XJagpLc4xC3cjDXmSkMxGT93IYGpgUAx5H3BCTsOic0A6yi3b9N3KtU+6W1Y0nt
         x3uuRT+OSazs0oPkL2TX09rQFeVbbWtDz1BVTh7e33DIBt0HgssWk6Q2bdna9sFgS1Wn
         SGvqoaOF21p0hOs9i+/+nckkI/nMgiNcM1qaPnk9aH+QQ9OvCtJ/a+EuFkNNA923rPed
         PuWQ==
X-Forwarded-Encrypted: i=1; AKwUvBzgBb+3mCbB22a5qXc0IcHtL7KHCQ++D9OCW670J3MEgyeYXz3s7ZtrBwdKFCbU1E/WRZV6lSeu8SFD5g==@vger.kernel.org
X-Gm-Message-State: APuU4Z+L8qKO+PrV0X6t3DSrDuvt4tvc5i+CPToLcFKaRcgdBa3L91ZJ
	r7Dj9+wbCJ4HJ5Wg6v/DGgvgdToZB/HTk57l5gCrkMSXzZsaL7mybOAChGafPS+DyW3PpRIzkNi
	vVCsNMApn+8M/PM4rWDKokjMApcMeTSw=
X-Gm-Gg: AYBFou3U4W0gjouglvGGIB2qpI+M9F3bOYWDv7EmsME/C8bmuYPaZ+CMszonbQ1jiw9
	WsXaS9mHfAVhBEbsWIMpy0eSd5SPS9P7JyVWNMaJMXT9lfRlWc6w9d55oze3mDUz4OYU7r+Y6l7
	xrHimFP5yGJLn7vXc/1MhIgUQti66eOsa8TYtzBvZrqiPvv304ni6iT6tNPYg08S5PQiW4VGlye
	Ddqu1tPY0N6Iy3Q0wcrFDiCZ4YRAT8ozHrI5xPtAefJFRUPPlJdYKOmkq6W1ICLvY+cdbyLsAIo
	sf/XKFGcX8T4aOHu7nVlRGTAuFREgbzpxraQDE7bdQYw8rxo0d4XkxDiZT81wDFtq9YZtSFtBfz
	DM+R98x+EqFvAXAuy7e3NXII858Gjtmev40/0b1fPUKxy6oE4lYiWr6fbVMZ/HnlhXO8iFEvR
X-Received: by 2002:a05:600c:8b85:b0:49f:e8bf:8f9b with SMTP id
 5b1f17b1804b1-4ac14fbdcf7mr351103275e9.4.1793818922672; Wed, 04 Nov 2026
 11:02:02 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104090239.311074-1-nikitash.mariiaw@gmail.com> <ausVkYs1-3rJ5Fj0@devuan>
In-Reply-To: <ausVkYs1-3rJ5Fj0@devuan>
From: Mariia Nikitash <nikitash.mariiaw@gmail.com>
Date: Wed, 4 Nov 2026 11:01:49 -0800
X-Gm-Features: AclHuK9UdU3dwq1JUXXL7zxhwPl3JamlIpuYEG9TvgYAG08j28_4tj64jKv1xfo
Message-ID: <CAPDEY+XgvNEfMNLH9YgJLZGF_bfDFC9kTe58ssxyq=joYYzQtA@mail.gmail.com>
Subject: Re: [PATCH] media: siano: Replace strlcat() with snprintf() in sms_ir_init()
To: Alejandro Colomar <alx+linux-hardening@kernel.org>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	kees@kernel.org, justinstitt@google.com, morbo@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 3:25=E2=80=AFAM Alejandro Colomar
<alx+linux-hardening@kernel.org> wrote:
>
> Hi Mariia,

Hi Alejandro,

>
> > Date: 2026-11-04 01:02:39-0800
> > From: Mariia Nikitash <nikitash.mariiaw@gmail.com>
> >
> > In preparation for removing the deprecated strlcat() API[1],
> > replace the strscpy() and strlcat() calls with a single snprintf()
> > call to construct the IR device path.
> >
> > Both the source and destination buffers have the same capacity,
>
> The line above seems irrelevant, and potentially confusing.
> The size of the input is not important, because since we're appending
> stuff after it, truncation may actually happen.

Agreed. I've removed the statement about buffer capacities from the
commit message in v2. No code changes.


>
> > and the return values are unused. This preserves the resulting
> > string, including truncation behavior.
> >
> > Link: https://github.com/KSPP/linux/issues/370 [1]
> > Signed-off-by: Mariia Nikitash <nikitash.mariiaw@gmail.com>
>
> Except for the small comment above,
>
> Reviewed-by: Alejandro Colomar <alx@kernel.org>
>

Thanks for the review!

>
> Cheers,
> Alex
>

Best,
Mariia


> > ---
> >  drivers/media/common/siano/smsir.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/common/siano/smsir.c b/drivers/media/common/=
siano/smsir.c
> > index 283770d583d5..636ff228108b 100644
> > --- a/drivers/media/common/siano/smsir.c
> > +++ b/drivers/media/common/siano/smsir.c
> > @@ -55,8 +55,8 @@ int sms_ir_init(struct smscore_device_t *coredev)
> >       snprintf(coredev->ir.name, sizeof(coredev->ir.name),
> >                "SMS IR (%s)", sms_get_board(board_id)->name);
> >
> > -     strscpy(coredev->ir.phys, coredev->devpath, sizeof(coredev->ir.ph=
ys));
> > -     strlcat(coredev->ir.phys, "/ir0", sizeof(coredev->ir.phys));
> > +     snprintf(coredev->ir.phys, sizeof(coredev->ir.phys),
> > +              "%s/ir0", coredev->devpath);
> >
> >       dev->device_name =3D coredev->ir.name;
> >       dev->input_phys =3D coredev->ir.phys;
> > --
> > 2.43.0
> >
> >
>
> --
> <https://www.alejandro-colomar.es>
