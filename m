Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794235493;
	b=p6zpOxjYrnqDCj12gJca0goYYuywhiVFBWdWko4M900tsAj/dO49EERIxhJXmGAllpvK
	 JpmKTAcxP6GJ/aYCU23V1g7i8ULDxs0Dou5NiHT2bZ/S6+TXkoDCLgMEpRhFmmChBPqns
	 6cvxcGMny7YcYpzSRe+IpKfZbhfoYEA2BihWFvqVxR584VkkiCsHxqDXaUoMwxgPebwcl
	 Tk2YBg/rC195QtIM0YuCvmVMfPGIL+zmk9MA4JE8mTh/o7EkZCEcCkyxBtiNz+csEZBwD
	 o/crewvtHTZlCoKSuEwNEXjcU2bFn7XNZr8ilyB+T5O33g4//abR8YMLwl6FkuraLww==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794235493;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=E5X0aK4lGSvPrdX7cpb6XEojnCQxm1GC3dItr8iBnTo=;
	b=WDVeQtSuwkurq9jjKHHG6eKYAI+EELcU1lAzrhk3GB0zL3vDa8yG7WUIVosp5VbQ581q
	 3j7PuUIVcdsUTzKBCzC0yi8ax4aPSK/dzAuDLrwaC811jdJzJPXk26Ysb9VRa0YWmfvO0
	 RP3s80OanJaqOZUCk2zgQRXkSBfCMhKbOsX6KPVvKl4vo6At/8/7JpSEuqt/G3aYsUYhj
	 3EW3mhdd24XAbE/PCPft+E5eM2MRO/UirD7gMOjJJJtZEZuBfej/Kqr+j18hV7VFeyg0Z
	 Byqlaib8cyuRC9fX9n9wD3cVhSWWHNJMjBnKiq4s1CaL0n2S4J0b4g7esIcgRlxEK+A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mm5tqw4H;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D07606A31C
	for <linux-media@vger.kernel.org>; Mon,  9 Nov 2026 14:44:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98D07606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mm5tqw4H
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c4c9abc1824so140204466b.1
        for <linux-media@vger.kernel.org>; Mon, 09 Nov 2026 06:44:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794235492; cv=none;
        d=google.com; s=arc-20260327;
        b=qMnPEhUBM4tzlPge/Yr12NAFwsqh3Tqk/KE53ai85J8DXfNEr6UE2BwCy57Bao0u4a
         qYm/B7jMGqiJMhH6M3dWZCz57Tp+d/7pAzGNWjjDtKccz62QIon+9Dx+96Xdff+tsej0
         e2JIVOV8NYVyWOYud4UYIovbheKt2U5OWYERNZLz/qvvu0uBrM43cOsriS9k9Kng2uQ+
         Bh83CzFCF7mzktstpFUIU3V+8zSWCpxFbqCZggUxiqENjVzPPkqFFz7fa7EsEu/8g4if
         WyLOsLiyO5qfRs5XKWOd4CVnGNmxIwRHXWyPodiw3wobhapLSP9D7rXGCAPB9Ev++uYp
         Ljmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=E5X0aK4lGSvPrdX7cpb6XEojnCQxm1GC3dItr8iBnTo=;
        fh=IoObdFk+DCwz2uQFNcLLbspuf6oVFri+uXigX1ZSzrU=;
        b=PyqaXP+5FHqGdO0SKo3oz4tPl85eWsXBknJXPXDmPTPgQfM2uXqT1lZKR8LBjU1ZoZ
         xK7TabXDiyU41uxxxguJ3tUR4TkXDaCNibAwmhJo/tQjRUMm14L1TeKb8UPL+3aSJgRc
         8rxqrexnlNVlvbi9NCMZDWkaruZL0+joz2yUEV5qGx1fWjctuiXsEWPnQtfDRS/G2ACP
         CQ5Bb4jmJeAzSZD+ofLJeO/ZKCrO6OOQffyyLqUrNZLRpzWbWlYPC+BMP0iPw7eZSrhd
         zHNPxkfzIJpd4ChfSPaI7BSsqcNgnuwmKnakMe6YeN8ri9D+rD5t9KqpzZCUJn5lzRi7
         p0Kw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794235492; x=1794840292; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E5X0aK4lGSvPrdX7cpb6XEojnCQxm1GC3dItr8iBnTo=;
        b=mm5tqw4HLkEAYwxkVAGFQdiUaORFmvkuPw9UB87sNNk3i6lMxavweuisPZYUK/CT1h
         KOjPo7pgnd8LN272URm3edqqk21fIGQ/4oM0cCV750lM2e8gBpArAPcSoVwR18z79Fhd
         ranHton6NsqSWJNQA3K2AQWvyJbfI6xn+4aozez/H0VnZDTGdpPHTXoqtt8gg9pFhdc9
         KL30xPY+CzT9eFaH3CFtdvPBFoaNUQXaWY454pRdG1p2CeuIA7AxGWd5eGUXaugqaTHf
         Usup3xbkT/xTWPaEnufMlIeCAIZSxPz8k7/9wjDrEPrt72uG3+eRH+k3oBjFYjDhvH1S
         Ca3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794235492; x=1794840292;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=E5X0aK4lGSvPrdX7cpb6XEojnCQxm1GC3dItr8iBnTo=;
        b=iq3qEL2V9kWOCxqcuOTebcHNYRLj5NRKbAoMZdbcyYNAxoMHzqzHeKWoLCkABDWrI1
         x/8RLLnKTenKiTw2qs1GwkIgdtmYEhIo4ECzu8Um6LmFmRq4mkKUIop5vaLjaRciO7LY
         iakyUYJKinYWJl+t2JHpc2S7P6CglWkcAgcGo0QCyxEFsCYRVsvRNiblHjHn97BLpSGK
         ruzrq+6ZzjMZ//h9F8gPZJcvnbgBEWNxfGWbePiUWf0rn4ttc+k7oArcwukzJi0BttOS
         8+h6Spt5VEOXxT1lCnsbWQ/aS4zyPMgWJqE2MCUeAtf4iC6FrCyBl66Z7AxchBt/pQE+
         LW0Q==
X-Forwarded-Encrypted: i=1; AL+hErHYukQ/5ltR5hJds8fgtKmX//CV5YhifqxJ8gSj0qI2OSBKLqXdzOlNj+csZfj3vv2wFnRRryY2CvRqOQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8YcUYL97ohYpC/ffrx3V3oT2O5XSUwMwbGDYypg37/EAGxp4Zo
	8z2AWLPIA4sqwFWwYq33FwQWMDn3OuATbCeA8h3C1edIC6qJOaePyZARkfjZSBOKaCXdqtBuVIS
	dsBefXCElj89ptNmkuVnjG0Ffq0iqsXw=
X-Gm-Gg: AYBFou1LJQMYCLCyEdxkgSXpOBGXXWskk9/00A+ptZTnv/yL8gVhrux2ylDl4wI2xge
	uQcVuByNKq8M1CuV0eyC11z1SgIOUNhatxOo6cNkCxeVXiwVL4JSmjmjXvBmoTCGlDt5pp3shVg
	+bmmagkpIBFKIpbRBUi8OtK8BF/UovBya9Gs0kx5KIHGCwCgFg9Vr8AUxbrNp/2KSSKo4poIvzC
	UxiJdnZmqFhEUKpelIVkNibZ1jMg6TIJ7+vE2noS3Og6RJz5srRUNCpIW60V21QowmVeuT860cx
	ATWx80eV/2kWTXArU4S+JBUcwz8Y8/qXbrpd/vCaG8Tgd6nvNNl4nW9nL+ADSOP1DYfDnXfWSml
	jRvzbUg6pDl9IOcgXitrZzIZDiWPb0QTRy/RW
X-Received: by 2002:a17:907:844:b0:c29:f5d8:9c82 with SMTP id
 a640c23a62f3a-c4d6db58c84mr325111966b.49.1794235491848; Mon, 09 Nov 2026
 06:44:51 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261017-ov9734-ipu6-v1-0-86eab22ae258@gmail.com>
 <20261017-ov9734-ipu6-v1-2-86eab22ae258@gmail.com> <avG8ZgDPVWCr1pja@kekkonen.localdomain>
In-Reply-To: <avG8ZgDPVWCr1pja@kekkonen.localdomain>
From: Tin Posavec <tin.posavec04@gmail.com>
Date: Mon, 9 Nov 2026 15:44:38 +0100
X-Gm-Features: AclHuK_PHfWehNIYSFaUtvinypIscMfmjsHD97Wco3q2H8fRNHwkYNi4pk5IzQ4
Message-ID: <CAOJcTPXBQTFRR_m2S2ZrwXbZdMLHHz0DGG7=2BtFsv1ouY3Tog@mail.gmail.com>
Subject: Re: [PATCH 2/3] media: i2c: ov9734: Add power on/off sequencing support
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Bingbu Cao <bingbu.cao@amd.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	afonso.figuinha@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Sakari,

On Mon, Nov 09, 2026 at 02:28:22PM +0200, Sakari Ailus wrote:
> > +     if (ov9734->reset || ov9734->powerdown) {
> > +             /*
> > +              * Keep reset/powerdown asserted for at least 2 ms on a
> > +              * back-to-back off-on cycle.
> > +              */
>
> The comment isn't useful. Please drop it.

I'll drop it in v2.

> > +             fsleep(2 * USEC_PER_MSEC);
> > +             gpiod_set_value_cansleep(ov9734->powerdown, 0);
> > +             gpiod_set_value_cansleep(ov9734->reset, 0);
>
> The sensor appears to need a single GPIO (xshutdown). I wonder what's the
> other one.

There isn't one that I know of. I based the GPIO handling on ov01a10,
which requests both a reset and a powerdown GPIO. On the NUC M15 the
INT3472 provides neither of them, and on the Surface Laptop 1 it
provides the reset GPIO, as Afonso reported. I'll keep only the reset
GPIO in v2.

> > +     /* Give the sensor time to start up before accessing it */
>
> Ditto.

I'll drop this one too.

> > +     fsleep(20 * USEC_PER_MSEC);
>
> 8192 external clock cycles are required for this.

I'll wait for 8192 external clock cycles in v2.

Thank you for the feedback.

Regards,

Tin Posavec
