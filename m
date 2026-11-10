Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794301260;
	b=xPLpTQgoIkkFMTKIWr4S2/16Cy8J9ZfXCEcFjmAXAENbYLkcUMhP2+wBPyGVUq4LftzO
	 7wugHmyRMKb9rN/QNzeWaHMZniBfdqHkQD+6Fle+UtkdihXbtHSy8/1H3w8b2o9P47+J1
	 BGIKWYWXQeSP0IQXz/EUM0ZwuvZwP0oDMmNvAseqcifcEYZEWWdpX9vMRw/xSk4019Kd6
	 VH2IpHy5GJuNLGmX8hOFPbkd3SuWAS4dcolnfRaAutsKFFHUkX68auONr7LigN9aherS4
	 Tv5NZoj6HCLggvYbk52ny5uS+EUCIgTfJA1JJDO+BsbQnm8VlRq2i1Y7xieZTi1Lnsg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794301260;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=D/l1DG9pW0EG2fGxLRQvmW7PF5RxeWs5LWhd8jRdOqg=;
	b=e+9HeVlleDQZ+QRP4LvvvtqjQPeekINAgda04Es8oRLagJk40hl1LVx1nkcmWSo8NV7j
	 Zvxt32Z6zP/1bAMcOOGxn5NWFLFdObhGQjmcdBrVTS8YoMToADVkD/DSwOZQ9BiSns4qw
	 nE01eDopXGNR/pTIoIbScXI6bgLUlvfrcevd/GNZV158dj8mnaISD8au9qrmlabm8A7QQ
	 9EAGP9CmAS4id8+JKFXTDSxHY0VNRahcLvSJ/32SDsEaJaoDb+L+3rT38Y2JLjSSIjmuk
	 CTJ4/VhhbguTzsIBEd2fPklTez7Nn4zW4Kv936c4/Bp7aVRuFx6Wj8EXi5QT/iPG1Lg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GJvzQyop;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E02E606A32A
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 09:01:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E02E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GJvzQyop
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b31ca7e0bcso19015557b3.0
        for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 01:01:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794301259; cv=none;
        d=google.com; s=arc-20260327;
        b=BnVCLll1qdQeZWXIB4NkSVGfutVdVAVO9nkE5uGkMbnHyLNINrtkGddL+sje5CjM9i
         N/NFENKHq5bAckAHwvN9clGKY2Uv3p8U3ETh0xrAan3Yx59U+WNOwHlVyYaBrYGP7A6B
         uhbzH2sPdWVatTrPDOKxf4goLohwWrpYizDLGeMlYesFC+OWSmNHw61L5WuTht6JflSH
         TEpj1N0xVSWYARdyZI3M68MF9m6Pc6IyiXRIbqMmhk5jpWcqePjs3iqKDzYqQR2Nta/R
         z3E+9HdMc/0etHFf+dMF3e5S/wemLYLBVAIc/EAj67rUFcHa1IUv/MdYBsoHhpxW2u10
         WKZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D/l1DG9pW0EG2fGxLRQvmW7PF5RxeWs5LWhd8jRdOqg=;
        fh=EsTV9iOgbXIcf/HZtbMRantZyaFs8iykxu6423qNoLU=;
        b=B9KmNgo6zEETQk+Q3bB0JqQWlB86aRAnt5L8zxqbQ6UcwdBueRmCu9azhV/iL/0gUK
         RsDphPolDzavzQpaUWB4AYWeND7r3IPS1Irj4pzYKkfrCoyUIJkhgAJhkjEzNPtzQ7zi
         oU+9g1WV0ccXnwUOWtAAmdSXfQKczynTprmSuqhMO+Tkhs9Ln/8x/cyz05DAL14Bn2mh
         1LXc/3lFj65+KzyHUtHTuL+VN98bVb3lAmhxlD+cjow9ASn7oNI/tX001R5MqLqfc/aT
         lYwsqBi05A4Opcleck5ZojbhfX05zHOBbzuzXxhlqV79LgKyU4taXEt+oa4Y7oyQ66ub
         jcUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794301259; x=1794906059; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D/l1DG9pW0EG2fGxLRQvmW7PF5RxeWs5LWhd8jRdOqg=;
        b=GJvzQyoptkDCdPCZ/sPVeyL8ENbjQKHTUh8dYiC5dwW1lpWOq3vZJPAcL0nA3xN0wD
         HbetLjWQUco9N2S2KtXvPNSBvo8w4PmIWY3YjQBndMuG11972LQegMYFBdC5tba5aZWv
         3MydGcVu0/PbzwXeuk30zI+dUwGEkHMTKsC+IXh+qMQC+NcFUvW/H8BMEhRViju7F4tE
         +cyoepPvuIb63LxOMgvZjQa27IapA877VS+A/QC8d40Vz7kFy0IM5g7612xi0QCAiz2I
         9f1OMoP7yR5r4ubfkuovT5BWdpGJNCIv0HUV9EW2+toxW7VckmVW12cq4wON+pOoCmRh
         vt1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794301259; x=1794906059;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D/l1DG9pW0EG2fGxLRQvmW7PF5RxeWs5LWhd8jRdOqg=;
        b=dz2/lwjcTwAnXhk40P2KgMnnsKf2h5vcA7X1DGcrD6wMPool7Uc6Kof+lnhi9ORKmF
         pbmZw21+UDgBcdy5geKKm1FwCDA5pbRRzgJEIRvFLBJrEnQtm1eX1l88cXM+sGkO0SG3
         urrT3B0HadHwEQiQ5iWl6NoRt7GGuc7dqzbB1ZYkzdtIEmyauPtGNFqhrVJcSNYIfB0S
         E2IzTcblFtOKnf+Xij5tCv/hJlPniwppShfN5k0zQX2ZfRXb3AJjWxzdpIlDgKKzXa/A
         YvF+DIMOp3pFUmRdA6F0pDwPgwYW1NT1H033vY1DjOtqBqfZC2ls6C7Yav6LGpx4D1rM
         3cJg==
X-Forwarded-Encrypted: i=1; AL+hErHl0Wf84FyIXeDXerP6T1YEBdj7j3jZup+GlKuzWGNo7AaYd0/TxHT/+Rc/jUPjWQ8N1cQpKuIkopxJ7g==@vger.kernel.org
X-Gm-Message-State: APuU4Z9DPgEHE6HzQ6CSG8klvSMy4VwdOmhkXVtC+dZGXNrB9Ygy8gi2
	Gz3mx+8jbhNAwsCeDr8MyX4958Ki45oVy6xszFP5B0YpZbuE0QtaprEzkF2F5kRHoZaA1Vt7Ymp
	ehMCmrZHZXmksDbEWQW3j9KQEwEUpXQo=
X-Gm-Gg: AYBFou1oa4joqTnQVehIifpfn70sSyiwzfpQWWd6YldEI4vaeL9GqSNOi9XkfbjGPel
	y4N9gYwicSuiNoF3+G8l8aaXaqPVe8As1UroiCUlCEpzQsRjQRJ5gq99KWX+ft98Sr11k7hrJT7
	8JvbXvGsSiP58T1Eb+Jq5TdwV1DTZdnt+nnfKwqe02eP+95ExNrMw7f1JUhd+ZdCPIrziOJE1eK
	3an+DpreI4Q9h6nmcKudw8cJjZgwlzAVKRvqokNn7ohdrZdp276Xl3ww1zXLBuG/5f9NnPnvDb+
	D/KMWV7pUrQaTOHjBiolVbDWmQwz4COQfFCRTOZpb6x2lElUVhw6Krx2i28ZV+Bhg85u86cBjx4
	Lj2WwgUo04eZ3y1Tw4O8//Jjxu4+pHLPK+g5U1BVFKdFL97ZTha1vlYCFKGghrIMyQAJB/UT8dX
	QMz+fTLOIgjq5o+HhDqtvXdgfXHh+zdXC5RL+EpaHqKro8qwdiRgQok1T638BCc7LU7Qzt4/3t0
	+CgxKJV9EOVBCF6Mgd6Jgykd5hZXOOu3N65Px67N9UiUZ5jr3wgaT15PPdEsR0=
X-Received: by 2002:a05:690c:6e83:b0:8af:1843:a9e5 with SMTP id
 00721157ae682-8b3929e7519mr14686337b3.23.1794301258389; Tue, 10 Nov 2026
 01:00:58 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110050448.69521-1-patelshivani2283@gmail.com>
In-Reply-To: <20261110050448.69521-1-patelshivani2283@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 10 Nov 2026 11:00:21 +0200
X-Gm-Features: AclHuK9lhRV4tkWDS8XhwM4LHpotMMW9vXUbmZoMQV9ygME13b4eHzMp8NHQLR4
Message-ID: <CAHp75Ve3E7qCXOQi_q9SmTkwhfSnPdWZy1cse0G=BFJ0FBoptg@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: Fix leading space indentation
To: Shivani Patel <patelshivani2283@gmail.com>
Cc: outreachy@lists.linux.dev, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	linux-staging@lists.linux.dev, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 7:05=E2=80=AFAM Shivani Patel
<patelshivani2283@gmail.com> wrote:
>
> Replace spaces at the beginning of the line with a tab in
> atomisp_find_in_fmt_conv_by_atomisp_in_fmt() function parameter list
> to conform to the Linux kernel coding style.

Nice try! But, sorry, no.

...

>  const struct atomisp_in_fmt_conv *atomisp_find_in_fmt_conv_by_atomisp_in=
_fmt(
> -    enum atomisp_input_format atomisp_in_fmt)
> +       enum atomisp_input_format atomisp_in_fmt)

The whole format of this prototype is broken (in v4l2 is a strong
requirement to follow the 80 character per line rule). On top of that
is it really the only issue of a kind?

>  {

...

Also note, this kind of patch for _this_ driver will be ignored, it's
not a priority for it *at all*. Try something better like [1].

[1]: https://lore.kernel.org/linux-media/20261027230807.2407261-1-vladurare=
s@gmail.com/

--=20
With Best Regards,
Andy Shevchenko
