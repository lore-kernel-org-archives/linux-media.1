Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793270980;
	b=FJACW8QCCDYwQFd4kJTb6QyggHadV1/lxPblZHFjye0NFPR7Rtw+OCjKaBAtihXIn+Zi
	 TGhnY8ivMQOcb5ip5T/D1pdPkdC1R5Ds5kLGBf5VSsrw04tkwu2BnPFe+zC9pJpSpGNSw
	 0f9bIZzhMFFqvpj/Yr8BRgNmRlLB7DZnIS0kg2SYUOdnQ+k7LUz/TVbTc5WKoZ7T9+5Eg
	 Tqie1SXpvxeAKt861kICSDxIVUoD6ZuF0AAcW04gLR0D+AlAs8A4W/qolgNI8zwncvH4d
	 2cPGLSWtHpHmTN1OMkohmvcwLEqb5BALtJrtRmRtzO2ECDXxnwMtPcaf15yPEgjuoLQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793270980;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=9qiy9zdhbsi6WXhBHFrb6irWdIc0ZrNSbRSCZa4miaE=;
	b=ByJnTDu7K4PHqg4UAtEZ7+pEE+iAWuw9manNQPPvnTIYEa44IyGnrEokr87nMUNJhfyu
	 AYdy/8oMnKma9AnpnNX/s25n3pPRTCGrVX2L4bi9wYYE5Ds1SP3GQQkEiDLhIXUwkzfkI
	 uw0+6mbGyiOupeYUC24gYxGqqjnMwQalRJwlz7EohcHI+vPAv21xxMn4npicfI4hJF6T2
	 DHJnYl2LrAXh3Ocu7BMVSZX+OixyI1IL6u6T7SmcUOK87sI7klu8GkY8urhxpK9G3ZtY0
	 xiS8MDFXMp3HJ4QF0W3sQ1p/kFDatICkougElDb0pFZtZ7Jut6Ya0ObiLaun7MoxCXg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HqiLR8Ur;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91ABD606A31A
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 10:49:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91ABD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HqiLR8Ur
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c38ac26cc5dso320017266b.2
        for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 03:49:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793270979; cv=none;
        d=google.com; s=arc-20260327;
        b=PcBntecHD74JlUMUSTIcsdMSfj7ZBv8gFOh4K3RHEgx+YA3p6K5uP8j1YN/taNXMEB
         tISUfwu3nDUYmnSqHJc1efjsdq5X3LHe+mBFE3Hl3uiz1HH8a3Pp7qBCOAFRYy8s43cM
         aITcUyEnJcVieHeMn4bb3KxkWvE1mYjKxDvSp8Ax7hjJ5bS4525A73GEC5AeGnSbk9Z5
         8JyJ3mqRyl2VsNzl1VSZcuuziMKavXbrGYJVUoypOzAM8A/eLzC1ZzyX2Ufu+43irSWr
         Q3SUUGbXhuij76P/rSoe5n/pt7aTEQUQ95oxNuKkgAIrnt3SygWmhmsDpw1S6nBAeqte
         0giA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9qiy9zdhbsi6WXhBHFrb6irWdIc0ZrNSbRSCZa4miaE=;
        fh=b9xnAV/TL4uS1p6CA3GIab0RmD+0UZpk5QwUJXAJ0GA=;
        b=n9h28Sx0bHsLskK+7noDHPW7Wu9PGbI1WS54yR/gYQtGd++GTCS8VRdC/17SAbLlMK
         i3YwK47XeRgkN986bmpVMNdWotZ8WM3uc4ShIWqsaU26ktKnHd95Xuopo0XEt9rCL7t2
         wPKYyKwS02ez8rzf8LA475+mVevNKHPmgbwz7eEIkgb7zZFPW2kYUUMossn6pSnYLBbd
         fIGSeaIIoSquLSaWCQTQ84Sbx09uhZIxnahfLx91PH+gEk4Cjc0m/1Oqfp5aLNGSa+YU
         GR6suLF+xBCDE2Dop3zQh4osxkdVaH2aC8oSHnKiRrBFLYC2YlMviW7tJKgUT8sioTwC
         IotA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793270979; x=1793875779; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9qiy9zdhbsi6WXhBHFrb6irWdIc0ZrNSbRSCZa4miaE=;
        b=HqiLR8UrU2qo/+GBxobAzJ0YlmWyPLuy7//J0d0nFyN51n3h83Ij5rk/MSCBaSA3YM
         x+Qw8+BuoJdjR42+kuOZy7xMZS1L14xBJzvbM9z0Dbtu9uYAJSpCw16l7mZeu4jRF5Q7
         DYqK5S0jhXbbWJIuI8Wb330QdAO9WZuABU/m6l8izsFNCI/uJPj7vYfHTHpQ6fOF7oJG
         GparQkNvQYRakzIz5EfiNK0yoHEGMJLXFw9qWs9tIp4cuLIYU7ifHdCbzwM/RtWocC7q
         Pgd5ZptgpMUVcDBFTnG0pwAfazPm67uOW/riUdgOQIreQhtFHUgPE7DaEgeTXrvFtbk3
         NZsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793270979; x=1793875779;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9qiy9zdhbsi6WXhBHFrb6irWdIc0ZrNSbRSCZa4miaE=;
        b=SfihBpIBhnZxjCa9NmHoi5dTz98cybYHqOR671GlLBdUjKo9jQB+5s0zT+fOj/rmQ2
         JfTwg72TUdBflOyh9m10ifuBPrpZix73xgydffIyOLze8GVtngaQ8GnonfGWD+jieIjx
         RYBN/DHRnnvKjxznWVtYCcbr9TfPJjxEPV5WK61rhmo1VHDjRnf7hnGC/l81NTSXbkXT
         uKiNU6K19Vgiz4vgKZXollqvQJE1+v/AK9BdHaiZkWSSsxuS1rb5y5b64JYTk1NKXHOH
         m2atcHBvtos9DJzs8Bb6aFg3dnsLE3c+8vUHvhIbG7Xwx+A0Lpi6VxDFLbNVK/G11RGY
         QdJA==
X-Gm-Message-State: AFq9FYK8jITSCeH920Nx6zQIWA4NgOiqr533Xz0gEM+2z1smZuiQzNuq
	JDbYXqYT26N5dMR1firUQpiBhWaS8fHfRe7Yl7OdjqHmL92GQby9eXgqYJ9e0aOihoREgipz10b
	cYNOuBXVtkbEI0bIJ2T+vKQ436GSTKpmHVrdm
X-Gm-Gg: AYBFou3fyZ/BkasNeNMs8IyMHYbJDZQiJTw3lz5KVdmecrQUUYvrFoatl02e/Xta83L
	NwfnG7eCFXf+5oxxdtSPhQCGzhjU7/W+vBdUn5W/zwmDO0DQ3WUMDMfuYX+TOGOljWfxvJi3xze
	LMfRsxys0Z/nfLBcjGY+dhttp4l3hwkO3AxaK2NMgqbZIpTIMQ2FKxQG4s9IL2vD5StNUS72Qsr
	yHd00OZuWNfncgqFJmtKSyBfVHt9lrlRaUVv70vtwlqABcsqq1TdpQRXwuO0WxAOm4Gb6M62/RH
	vGTexJRTmjHl1D+1bFeuS824fiNojEQeTH0gPraBz9GJINhKKJWxASAO17XlKGcNE4wLJCQ8+XU
	uW4Z+Ee4K5U6MY9Hqvl5AqWnRx0beEHjSYK2uRtoNqWRk7XjjIN16bvuzG5w7Bx5wPXsctE9jpx
	ZqD3fGw18FU+MjxPjSlXCkjm/yByI=
X-Received: by 2002:a17:906:d54a:b0:c40:bbd2:62f6 with SMTP id
 a640c23a62f3a-c49bdf68924mr435652666b.19.1793270978650; Thu, 29 Oct 2026
 03:49:38 -0700 (PDT)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027230807.2407261-1-vladurares@gmail.com> <6ae1a457.73f9ae50.2bcffe.ca59@mx.google.com>
In-Reply-To: <6ae1a457.73f9ae50.2bcffe.ca59@mx.google.com>
From: Vladu Rares <vladurares@gmail.com>
Date: Thu, 29 Oct 2026 12:49:27 +0200
X-Gm-Features: AclHuK8d9l5aYLdhgMk_NFJuVRWz15Mq3jRxz1XACoOt6aNWVA_r5gSLgYv_lLc
Message-ID: <CALr6u6L4db5GJ4tZjnC4wMRDbLYBXgRE5ZAgD6ReD2=8Wmu_dw@mail.gmail.com>
Subject: Re: [v4,0/5] media: atomisp: remove the circbuf library
To: linux-media@vger.kernel.org
Cc: Linux Media CI <media-ci@linuxtv.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Oct 28, 2026 at 09:29, Media CI robot wrote:
> # Test checkpatch:./0004-media-atomisp-queue-move-circbuf-types-and-helpe=
rs-t.patch checkpatch
> WARNING: do not add new typedefs

These typedefs are not new: patch 4 moves ia_css_circbuf_desc_t and
ia_css_circbuf_elem_t unchanged from ia_css_circbuf_comm.h, which is
deleted in patch 5. Dropping them would mean touching all their users,
which I think is better done separately.

> # Test checkpatch:./0005-media-atomisp-remove-unused-circbuf-library.patc=
h checkpatch
> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

MAINTAINERS only lists drivers/staging/media/atomisp/ as a whole and
has no entries for the deleted files, so no update is needed.

Both are also mentioned in the cover letter.

Thanks,
Rare=C8=99
