Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393E445C704
	for <linux-media@vger.kernel.org>; Thu,  1 Oct 2026 07:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790838761; cv=pass; b=Bsfa8RH4gq/PB+XVSRJQSc6vET8EhJEpxBWwU7xPTMZaU+YlidID+KXfL5U3RM++MZP1ANrjMoylLGBiOR0Le/Ru4n+VWZZ2fdT1o22Lk31qY0XZ2aveI6zgnM/Kgz5pnmXnFdP7Htg2e+xNBFXJkLV/SOQXOf+vk0O28iRTbgM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790838761; c=relaxed/simple;
	bh=z11zyB6mWvopoccvN08N8XJ9Z/JRd4Uobh1SMRMe0Ls=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B+nsAleGWCl1sG6m+brtJuWYbK8P/uzGAZCsR76vKuBeYY9EXnHonIgE8yfuj1+/5XtzNv4H2DHa9IDWwLEtPRpU0EAh0Wgr+e3BHKsL2dKQkzn9wqu/KFgB+G+6Ri4FjDvZiws4C9SRah0qFaHLjnVuf0cV+ksu5wU0AP5xN4g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HPQOPO3p; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=bx1i1n8E; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HPQOPO3p";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="bx1i1n8E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790838746;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3ASU4zlSFilfsQ+xY3A9WZo+WEZLrQoBczm2hVvM//E=;
	b=HPQOPO3pLG790DyYG0O8hAQWDYpWefEGoO/nSHKBAEE5KCG3j65XJiN7ub1tYMOl1/qRyw
	nrtYSd7qVu3ju0BgnZWIh9oSscjHbn+XMr4QdBNvefMWSIPwWZko+PtalueAQ5ZANQRICi
	o5w2qKBjhN74jnNNlD/s9PxAHmSPoH0=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-144-Ahrz190dMxmVu6jLQhFtxg-1; Thu, 01 Oct 2026 03:12:25 -0400
X-MC-Unique: Ahrz190dMxmVu6jLQhFtxg-1
X-Mimecast-MFC-AGG-ID: Ahrz190dMxmVu6jLQhFtxg_1790838745
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-80a79b0de9eso14080138a34.2
        for <linux-media@vger.kernel.org>; Thu, 01 Oct 2026 00:12:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790838745; cv=none;
        d=google.com; s=arc-20260327;
        b=ZnC03llnjAy4ltt3As/EJ9FT/9FnXYfdom3Yn3YlJ6iERuSH7U90IgXpLR/K+hc777
         3TKRVBzJuo/qI1ErPGjC76LJ6NHsG7PpYSnWdlDLezIszhTTe3GRTVq6+Xt2/O2Hl7J/
         tD9XeR2jBa3q1tT7+RO1N86s0cUvsufWxGN7xHZmF/I9Icz2Cs1FrvKa7lmVGnwYQQ+n
         94wDSG1ahRe505IfLRkCmM1xJDLzdHkfqL3rHglSzAkNGAZQonz0Z9dtGf6nWfYuzkbv
         O5hojw0V+zNCwWhaRU8iFrkYmNP+6v+2dHrQXns/wT1Zfxp3Ttxp6Fv1rmEJV65Pycdj
         oVIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3ASU4zlSFilfsQ+xY3A9WZo+WEZLrQoBczm2hVvM//E=;
        fh=Zf/zsHt2bdefL67UkiX0QctC4c0Dul7fnMfnjoan5/E=;
        b=LyVoyG3SYHtJMng8dAc0CNNlcIvs5kzf07OXIe94Hg4rqv/tEJ48lEo/nG4y+BHjfi
         6v+laWYeGA1VMFoIGiPWBH2j8nGhfOWR6Y5wX/MdQ+Qk9U7WzrU635BLqY64+BcBWF6E
         Oue/IELX3bNS1XdXAASwpzcHPQ+L7lJy1jUevPMLX+5r8q/QNT3Qfyb8/ZuA+XnHYD2I
         3M02TXhOTTAxNHAa8Ir6MmwmBKBaT5pZS5b1pSGBcWqj6S6aRPQDa+ZFob+RZRvUlHAS
         TAVFWUO2BPGAUvHNeZEVCmEyxQKZp04Anfc62iLCT5HIHqRZVaHmBkOrhCOURubtjQb9
         3o8Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790838745; x=1791443545; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3ASU4zlSFilfsQ+xY3A9WZo+WEZLrQoBczm2hVvM//E=;
        b=bx1i1n8E+WtGc7jVB55Tuqzml/PXXsO3maF4UOaqnQdmJ1tABCPZ1i1Bnj4VhG67PR
         KmZbjNtCbEZ4W0Oz9ChDS7lodCsLoPL/EsXWhvI8X+C0tuzbgdFMBZv8NvLf1rZvf5rf
         6fF1OMQk18T+STWvGY6d21bnW8qApYpwZ2iNlU4iC1QbSRYEYHNX0Z1FjX8lIod6wxxU
         1pVn4AZWCckMdUVgEtRGPrI+hAzL+PZn9vX/ZC9hjn0k+1TRLCjzYxT1xszuEwMr6ODG
         dftGapiGRuZDQ8TAQgCmWYxmzzAWnk9asI6iTPGkZ5fGyWsFprvVkmpqTW7J4wHXuapV
         F7lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790838745; x=1791443545;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3ASU4zlSFilfsQ+xY3A9WZo+WEZLrQoBczm2hVvM//E=;
        b=hUoWq7KUwRNqhZGAJzmDEW/JstHY7UdPKGZPtJIWkwlNR4yU+gnv0UY09v3pPSK5/G
         WqcGEQ2gKj6leK7zt2AQcoj4ZrzzWEFMpJ6tbsWoBFqnuHSavL0nl4Y1vC1IbiIrkfVS
         HQDxzrzWR12sH6RNRKlyJgFq/GW9ZaLJ0j84eDEYKgoBHzkNwUMZDRxbQh+Fn/oJV4X3
         87F7+BOeBPpL9WNuEoPpFyJzPk9VqWp9NCE1whgnOodfhleGhwXJpOPaoB+8iwZ2T8Ck
         qKSCEriYBzDnRHnpssTb7ctD4LBJozKkEKE1bXl4yYf1OWtHst0y3Mo8QrkgfDS/hTqr
         s4rg==
X-Forwarded-Encrypted: i=1; AKwUvBxWH/5x49R9IU+LQoVmKx0ud1S4R8tSkBY8mt/HUItyJzfVh3bv6q9dF2BsaWW6nD8WKszbZZgfhWmR9A==@vger.kernel.org
X-Gm-Message-State: AFuF++l6aeYL8MochfmdHUAvUi+xp6TfIzgM6mzblMy6oojf6ob0rkgr
	tnDk/CYdAMt1zuPw8sU1AOyGnrAdIBOHESdMtrEIB4VrP3RzP/3KiXqtbxaVyyP1Sjbpb5aTLn3
	l1FIKX7CMtp6sjC6AHYylFeCDKgsH2xTDxm8FlYA7t1isK/ZLwEOoF7Yt/J3q03y2u/stRQTg5h
	M6fFJ7HbjpUYcgZx8OYLmiCaAhxIa559OO7eKCp1UEN2R7Osd9ow==
X-Gm-Gg: AYBFou2loGxuPnWbqXl8i5he13I8fExVvZ4mHHAVggjXUSuofmF0xP+5uzNXb/+B90U
	NmFaM8De21VFbfkZ5yPJ5PKtl6vxFmICt4vhSFizUjbMajKndDuhbS+9QUxu671jFJ4bjQalfWT
	TGwO9X5WTEeuFKaFu1k+c/bsNpPvKRD0dJUNaUaXiykmk2rZdkzhylsF1Q
X-Received: by 2002:a05:6820:4ccc:b0:6c7:7668:a2a9 with SMTP id 006d021491bc7-6dcf4559f85mr3980925eaf.26.1790838744591;
        Thu, 01 Oct 2026 00:12:24 -0700 (PDT)
X-Received: by 2002:a05:6820:4ccc:b0:6c7:7668:a2a9 with SMTP id
 006d021491bc7-6dcf4559f85mr3980912eaf.26.1790838744105; Thu, 01 Oct 2026
 00:12:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <35240e45-c73b-4425-923a-c1026386ed3c@slotpi17m12>
In-Reply-To: <35240e45-c73b-4425-923a-c1026386ed3c@slotpi17m12>
From: Kate Hsuan <hpa@redhat.com>
Date: Thu, 1 Oct 2026 15:12:12 +0800
X-Gm-Features: AclHuK_XG6SBJbnpRz-Lld8mZ6nawyUD6qaeAIFFu-9e81eyEzxNeCFmOWMVY8o
Message-ID: <CAEth8oFgWH2TOauDyK404G6yDphNm3EGAfmh4n+djJE5ZeYf0A@mail.gmail.com>
Subject: Re: imx471: frame timing ~10% off & digital gain only affects Gr
To: Thomas Drake-Brockman <thomas@drake-brockman.id.au>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

Thank you for your findings.

On Wed, Sep 30, 2026 at 4:42=E2=80=AFPM Thomas Drake-Brockman
<thomas@drake-brockman.id.au> wrote:
>
> Hi Kate,
>
> I found two issues with the imx471 driver while tuning libcamera on a Thi=
nkPad X1 Carbon Gen 14 (21V7, IPU7) and Fedora's 7.1.10-200.fc44 kernel.
>
> I've been doing this with a fair amount of assistance from Claude Code, b=
ut testing things by hand. Hopefully this is helpful.
>
> 1. Frame timing doesn't match V4L2_CID_PIXEL_RATE and V4L2_CID_HBLANK
>
> The driver reports pixel_rate =3D 160M (link frequency based) and hblank =
=3D llp - width =3D 2328 - 1928 =3D 400. With those values, userspace compu=
tes the frame rate as pixel_rate / ((width + hblank) * (height + vblank)). =
Measured rates from buffer timestamps, raw stream, 1928x1088 mode, 130 fram=
es each:
>
> `  vblank   measured    predicted from 160M / 2328
>    220     57.817 fps  52.54 fps
>   1433     29.998 fps  27.26 fps
> `

The detailed fix plan can be found in
https://lore.kernel.org/linux-media/20260904075113.125751-1-hpa@redhat.com/
I'll propose hblank control to set the hblank and line length PCK.
In this, I made an incorrect calculation for pixel rate. The result is
the data rate not the pixel array speed.
Regarding the pixel rate, since we were calculating it based on PLL
configurations and ext frequency, the discussion can be found at
https://lore.kernel.org/linux-media/CAEth8oHj1Jon9m_4aFzRGoKcdopUMym+MyV0Jx=
To6F+AUFOLoQ@mail.gmail.com/

> Both give a real rate of 176.1M "pixels" per second at llp 2328, so every=
 exposure and frame duration derived from these controls is ~10% long.
>
> 2. V4L2_CID_DIGITAL_GAIN only changes the Gr channel
>
> Changing digital_gain scales only the Gr pixels in the raw output. R, Gb =
and B stay unchanged.
>
> The init code enables global digital gain with
>
> `  #define IMX471_REG_DPGA_USE_GLOBAL_GAIN  CCI_REG16(0x3ff9)
>   cci_write(sensor->regmap, IMX471_REG_DPGA_USE_GLOBAL_GAIN, 1, NULL);
> `

This is my fault, I'll fix it shortly. Thank you :)

> Thus puts 0x00 in 0x3ff9 and 0x01 in 0x3ffa. imx319 uses the same registe=
r and writes it as a single byte (imx319_write_reg(..., IMX319_REG_DPGA_USE=
_GLOBAL_GAIN, 1, 1)), and imx355 declares its equivalent as CCI_REG8(0x3070=
). So I suspect it should be CCI_REG8(0x3ff9).
>
> I'm happy to test patches on this machine if that would help.
>
> Cheers,
> Thomas
>


--=20
BR,
Kate

