Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF463E9286
	for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 11:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787223704; cv=pass; b=RP3cpgNEhve5GKYnwuNBK38DBsXSEGfEaE6jX6PPGbMLQE3ON1ilkJWquqGZL8fwooRcYcWA/iIFw/rc8gm9wbqKs1MqF7OMEqXhjd70ofl4EbIbj2xpXRZkeakrw7XGJz0nC8CntZmiesdfE9jg3pwephYvakkXO779BE5pnYs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787223704; c=relaxed/simple;
	bh=Mppk5ZXJosUbteMgajqGBc2VAGMn5uqrFyWclwD/ltI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XQrLYVE4uS8X428iqv8veoa1Lvyk+LrtrRlG3ffucO3jOyE/5HbE2/T2nZNUMvSexb22LDLljdKmwIcWfz47q3fRMye7wt/yBCQ6Mcrk+Nm5u2COUV5XSQRGeOkJFJd9IgvpnBBgSlHXWzlSktLJHrkPIfMQjZnRNEEiWjJllGM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KtwyRD+P; arc=pass smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KtwyRD+P"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b2a22c52c1so2194207e87.3
        for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 04:01:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787223701; cv=none;
        d=google.com; s=arc-20260327;
        b=CGtqZIP0v/+Rn2MqIZoxBDzFwVoA17TJGNRt3AmOBG1soahVfo6w+o071eSmpIy0VW
         eyW7pWNsiQ85APkMyFtqEdpuOdeIX5hI3fsgCfnJpt0ATViGGLCh4fSP9lbmhwLoJehk
         s0DLmhXahbY6IWq5Vsg90BOdZdDcjIlT7Xg2F0sx+rWWxBrmdFzNvT6JblvMY3AfH+Hz
         dXH+pH42NLdn9jUqXNg7axiM70+U/Y6pIMNAnPkgp/dVatvz1qyfNX4cheMWpwZHltND
         BueZ0CWH8T+8WkTl1b3ctiCoSxe326LyvgcdZ4c+P1a3Y3Pdb+sfbCprqLH/6cwW1msx
         iJoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PJQNgfDfgJSpyFAYgIx2wGk3qwXBPIOtM4RqPO3UbgU=;
        fh=N/+zJfCQpg64IhHbly7YG8Y660QR1Dwem7ykAgOo6Uk=;
        b=ObCDu/dXTFNPlqjLLL2u9g79cvgW+feOCL2quxUbPAJ+RXSI3dclWC+4P0vT5FtHFA
         3fPuvcBZ/ikg8PMbtkCRTajPT1GfWkKI4oCAsfADz/25Bh5r01y4THJeHKHUxTLhjrys
         SFJA/gIIM9uy6c6C/O49sMxT/NBJ9uGwZ1N+n2/yjEhSKxMXDsUaOUlXm7OebaB9Ah54
         7doiQ1WdOy/L6MOtCZDX+/yGHcC4/jznnkOm1kxKcjKM8UuI5zkRyJKqr2oBzEJnQ0OM
         5h1w9PrU2QNYeADiUS0UmimspGSq9Pjn28iZ+Jc7oYjt8g4xPYwZmO4td8sjje5c/iCv
         3NAA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787223701; x=1787828501; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PJQNgfDfgJSpyFAYgIx2wGk3qwXBPIOtM4RqPO3UbgU=;
        b=KtwyRD+PxYbw9iQkzhjk7USSBgWFRY6ryi8CCjNgEuWE1oCfGjoU96bUrnZ3PHJjNd
         vfFm2YWz3iaK7rfwBxAGVf8jcXPM9+NXUfxIwupgTX6zNTWW+7Z7RpwK2Q7MrqqjBwo2
         C21ucIJ8+hWUOOscaDYp1EJ7ZgvKJcolr6skeeaCy+0A4nQ9l5fendfvvRJfjTqi7qIB
         I9SZjnslg3ERMiZoJWSNsXzv87xNOyRBm18L8ZV33M7HhC3xF3qezpBX7UWJXZFPIDSX
         HlsQJPb9o7sYt8pOi8d9MsT/EfBE2tUSnZVl6SzI5CYjb0+mgJIluFbK2D7g1qn4CNW+
         r5cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787223701; x=1787828501;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PJQNgfDfgJSpyFAYgIx2wGk3qwXBPIOtM4RqPO3UbgU=;
        b=Bp6b7BUa4P6wz8aDYfOFXiQrRoGySG/U/QHnmi4STi0bx0nm1/7ETgSPET0BGERSWj
         BcFvfsjefjn+5nGyBalh4+sQutWMAjaPYIv+Klg2eCz9d5ipTFM1Zztvg4oFLTH+ytDS
         iVnH/V7hE5BwcxFvaF5KHUTrhNniZlXRfAw+WxBjDmOsLU7RLu685AkqVt9xef7OQPCL
         HqdFuS9QRnHBORZmuMR01+2t3iRWyhjLP4f1w0gvAjpk5jsP/abscZxo5pQGoedDNIdt
         szMBKSV8Vu/1P5TLnC1aPawGxwcvoQ5ilusKvqpoyaQMXKQjy40VQdkSAg7VIX7OpwUo
         vbPg==
X-Forwarded-Encrypted: i=1; AHgh+RosHzNZAfje+VmSENgPg2tYtp6Pahgo6zp7WONtHCofj2QtxqtvJzQpfIxUteJEgXX+fRMBn34kpHE9JQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyboODXSsCN0uVlKUE+OtQl3O6IM4esz2JCTgIB2gnjGdIRio06
	2VzS1T+TjgPSOJ63FTr6r1s2n9E55Zdv4MIn/KVop1S0SIAETOjfILoAAsU4VcLpahVR1KTAkVO
	7D037j/G67UGirnZOYR7aH1UIM0sM4wI=
X-Gm-Gg: AR+sD11WWzl9753+7v6tykAv+ci0yshV+fGuLJ7FDMhP65enIb4unhLPjydu+hiKhFc
	d/hY6V22Li3OTY7YGrBsq25BMCUP4WN5HHQm530HeAhQO4cOdpH1gtGM/xBNTAeZDBddN99ezw0
	ChQkiqFrPh9HKmiVBGn++Ec9QOtucPFO0sM/K9G5ec//LhAPAtXKlADETzn5+0+XPzOfOrNHKRi
	X5re37Xm5D2FJvSnZ3vQbz+Zis9Ejbjq1DR7oVmkC+0Gd5OIoTXF0lB2RxA1EJQ9fJzEVTTpmBX
	CKWiKygt9QVr3LnbJTaU5+pstu3viYwV9M52iEjZtEw7Zf6z6ZhoTG8=
X-Received: by 2002:a05:6512:3f0a:b0:5b1:5451:d969 with SMTP id
 2adb3069b0e04-5b478b9e3b4mr3955798e87.25.1787223700900; Thu, 20 Aug 2026
 04:01:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260820104724.191119-1-natalie.klaus@runtimeverification.com>
In-Reply-To: <20260820104724.191119-1-natalie.klaus@runtimeverification.com>
From: Noam Ben <noambs2999@gmail.com>
Date: Thu, 20 Aug 2026 14:01:56 +0300
X-Gm-Features: AcwNN1XnbWIeNLkVQ1pDDxYOl-fdyEVYXu4lmDf-llGz6kWPbiZz6cmc0phSEqw
Message-ID: <CA+toCPfdvaCWjjG3DUZu6MAcQWUQbBNP+2vgyLTfnjn5zunz6w@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] media: uvcvideo: harden the frame buffer size computation
To: Natasha Klaus <natalie.klaus@runtimeverification.com>
Cc: laurent.pinchart@ideasonboard.com, hansg@kernel.org, mchehab@kernel.org, 
	ribalda@chromium.org, david.laight.linux@gmail.com, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Natasha,

I tested v2 of the series on a UVC gadget over dummy_hcd.

One uncompressed format at 32 bpp with three frames: 40000x40000
(6400000000 bytes, over U32_MAX), 0x480 (zero size), and 640x480
(which is valid). Both bad frames are skipped and the parsing
continues to the good one:

  uvcvideo 1-1:1.0: Found format YUYV little-endian (0x56595559)
  uvcvideo 1-1:1.1: UVC non compliance: FRAME 1 computed buffer size
overflows (40000x40000, 32 bpp), skipping it.
  uvcvideo 1-1:1.1: UVC non compliance: FRAME 2 has zero size (0x480,
32 bpp), skipping it.
  uvcvideo 1-1:1.0: - 640x480 (30.0 fps)
  uvcvideo 1-1:1.0: Found UVC 1.10 device UVC series test (1d6b:0104)

My original standalone patch, on a comparable descriptor, discarded
the whole streaming interface, so 1/3's return convention does what
it is meant to :)

My build was clean with W=1.

Tested-by: Noam Ben Shimon <noambs2999@gmail.com>

I did not cover the -ENODATA truncated-descriptor path, nor the
32-bit code generation for DIV_ROUND_UP_ULL - x86_64 only here.

On Thu, 20 Aug 2026 at 13:47, Natasha Klaus
<natalie.klaus@runtimeverification.com> wrote:
>
> uvc_parse_frame() recomputes dwMaxVideoFrameBufferSize for uncompressed
> formats from three descriptor fields that nothing validates. The product
> is evaluated in 32-bit signed arithmetic, so it wraps, and the driver
> stores a size that is usually far too small and sometimes exactly zero.
>
> Noam Ben Shimon reported and fixed the overflow. Reviewing it surfaced a
> second route to a zero size, and Ricardo Ribalda asked for a series
> rather than two independent patches, so the two cases are not handled
> inconsistently.
>
>   1/3  changes the return convention of uvc_parse_frame() so it can
>        report "skip this frame descriptor" separately from a fatal
>        error. Suggested by Ricardo.
>   2/3  Noam's overflow check, adapted to skip rather than reject, with
>        DIV_ROUND_UP_ULL and the operand values in the diagnostic per David
>        Laight's review.
>   3/3  the zero-size case.
>
> On stable: 1/3 carries Cc: stable with no Fixes: tag of its own. It is a
> prerequisite, since 2/3 and 3/3 need -EINVAL to mean "skip". Backporting
> 2/3 without 1/3 is not broken, it reverts to discarding the streaming
> interface, but the commit message would then describe something the
> backport does not do. Both or neither, please.
>
> Carrying 2/3 on Noam's behalf, with his agreement on the list.
>
> Build tested on x86_64 only, no hardware and no UVC gadget.
>
> Changes in v2:
> - 1/3: check -ENODATA before counting the frame (Ricardo Ribalda)
> - 2/3: DIV_ROUND_UP -> DIV_ROUND_UP_ULL (Ricardo Ribalda)
> - Reviewed-by from Ricardo Ribalda added to all three
>
> Natasha Klaus (2):
>   media: uvcvideo: Let uvc_parse_frame() report a skipped frame
>   media: uvcvideo: Skip frame descriptors with a zero computed size
>
> Noam Ben Shimon (1):
>   media: uvcvideo: Fix integer overflow in frame buffer size calculation
>
>  drivers/media/usb/uvc/uvc_driver.c | 52 ++++++++++++++++++++++--------
>  1 file changed, 39 insertions(+), 13 deletions(-)
>
> --
> 2.34.1
>
